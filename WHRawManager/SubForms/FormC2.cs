using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Threading;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Configuration;
using FanNetWorld.Data;
using System.Media;
using FanNetWorldDataGridViewEx;
using FanNetWorld.IO;

namespace WHRawManager
{
    public partial class FormC2 : Form
    {

        DbHelper db = new DbHelper();
        SoundPlayer player = new SoundPlayer();
        FormRackLayout frmlayout1 = null;
        FormRackLayout frmlayout2 = null;
        FormRackLayout frmcurrent = null;
        bool IsPlaySound = true;
        int FirstBarID = -1;
        int CurrentID = -1;
        Panel parentpanel = null;
        bool IsMax = false;
        bool Issingleshow = false;
        int maxrow = Convert.ToInt16(ConfigurationManager.AppSettings["SingleShowMaxRowNum"]);

        //用于查询物料位置
        DataTable querydt = null;
        
        Dictionary<string, int> RawOrderdic = new Dictionary<string, int>();  //物料输入次序辅助用于显示
        int MaxTempID = 0;

        static public readonly DataGridViewCellStyle DataCellStyle1 = new DataGridViewCellStyle
        {
            Alignment = DataGridViewContentAlignment.MiddleLeft,
            BackColor = Color.WhiteSmoke,
            Font = new Font("微软雅黑", (float)(10.0F), FontStyle.Bold, GraphicsUnit.Point),
            ForeColor = SystemColors.WindowText,
            SelectionBackColor = Color.WhiteSmoke,
            SelectionForeColor = SystemColors.WindowText,
            WrapMode = DataGridViewTriState.False
        };

        static public readonly DataGridViewCellStyle DataCellStyle2 = new DataGridViewCellStyle
        {
            Alignment = DataGridViewContentAlignment.MiddleLeft,
            BackColor = Color.WhiteSmoke,
            Font = new Font("微软雅黑", (float)(10.0F), FontStyle.Bold, GraphicsUnit.Point),
            ForeColor = SystemColors.WindowText,
            SelectionBackColor = Color.WhiteSmoke,
            SelectionForeColor = SystemColors.WindowText,
            WrapMode = DataGridViewTriState.False
        };

        public FormC2()
        {
            InitializeComponent();       
            SetStyle(ControlStyles.UserPaint | ControlStyles.AllPaintingInWmPaint | ControlStyles.OptimizedDoubleBuffer, true);
            Issingleshow = chksingleshow.Checked;

            if (Convert.ToInt16(db.GetSingleObject("select count(*) from C02")) ==0)
            {
                MaxTempID = 1;
            }
            else
            { 
                DataTable dt = db.GetDataTable("select distinct Rawsheet, TempID from C02 order by TempID");
                foreach (DataRow dr in dt.Rows)
                {
                    RawOrderdic.Add(dr["Rawsheet"].ToString(), Convert.ToInt16(dr["TempID"]));
                }

                MaxTempID = Convert.ToInt16(db.GetSingleObject("select Max(TempID) from C02"))+1;
            }

            CreateQueryTable();
        }
        
        private  void CreateQueryTable()
        {
            if(querydt == null)
            {
                querydt = new DataTable();
                querydt.Columns.AddRange(new DataColumn[]
                {
                    new DataColumn("layid", typeof(string)),
                    new DataColumn("rackname", typeof(string)),
                    new DataColumn("rackid", typeof(string)),
                    new DataColumn("row", typeof(int)),
                    new DataColumn("column", typeof(int))
                });
            }
        }

        private void FormC1_Load(object sender, EventArgs e)
        {
            if(Issingleshow)
            {
                SetSingleShowFormatforDataGridView();
            }
            else
            {
                this.dgv.SetDataGridViewTheme2(false, false, "No", false, false, 32, 25, false, true, false);
                this.dgv.DefaultCellStyle = DataCellStyle1;
            }

            SetDataGridViewBase(this.dgv);
            ShowInfoInDataGridView();

            ShowInfo("正在加载货架地图,请等待...");
            //异步加载地图
            (new Thread(AddMapAsync)).Start();

            txtc1.Focus();
        }

        //异步加载地图
        private void AddMapAsync()
        {
            Thread.Sleep(200);
            this.BeginInvoke(new Action(ShowLayout2));
            this.BeginInvoke(new Action(ShowLayout1));
            this.BeginInvoke(new Action(ShowFirstLayout));
        }

        private void ShowFirstLayout()
        {
            DataTable  dt = db.GetDataTable("select top 1 RackID from C02 where RackID is not null");
            if (dt.Rows.Count>0)
            {
                object layout = db.GetSingleObject(string.Format("select LayID from RackRaw where RackID='{0}'", dt.Rows[0][0].ToString()));
                if(layout != null)
                {
                    if(layout.ToString() == "Layout1")
                    {
                        ShowLayout1();
                    }
                    else if(layout.ToString() == "Layout2")
                    {
                        ShowLayout2();
                    }
                }
            }
            ShowInfo("");
        }

        private void ShowLayout1()
        {
            if (frmlayout1 == null || frmlayout1.IsDisposed)
            {
                frmlayout1 = new FormRackLayout("Layout1", "原材料仓库布局图","C02", Issingleshow)
                {
                    MarkBackColor = Color.FromName(ConfigurationManager.AppSettings["RackMarkBackColor"]),
                    MarkForeColor = Color.FromName(ConfigurationManager.AppSettings["RackMarkForeColor"]),  //KnownColor枚举值
                    QueryMarkBackColor= Color.FromName(ConfigurationManager.AppSettings["QueryRackMarkBackColor"]),
                    QueryMarkForeColor = Color.FromName(ConfigurationManager.AppSettings["QueryRackMarkForeColor"])
                };
            }
            frmcurrent = frmlayout1;
            ShowForm(frmcurrent, this.panelMap);
            frmcurrent.BringToFront();
            frmcurrent.ShowRacks();
        }

        private void ShowLayout2()
        {
            if (frmlayout2 == null || frmlayout2.IsDisposed)
            {
                frmlayout2 = new FormRackLayout("Layout2", "余料仓库布局图","C02", Issingleshow)
                {
                    MarkBackColor = Color.FromName(ConfigurationManager.AppSettings["RackMarkBackColor"]),
                    MarkForeColor = Color.FromName(ConfigurationManager.AppSettings["RackMarkForeColor"]),  //KnownColor枚举值
                    QueryMarkBackColor = Color.FromName(ConfigurationManager.AppSettings["QueryRackMarkBackColor"]),
                    QueryMarkForeColor = Color.FromName(ConfigurationManager.AppSettings["QueryRackMarkForeColor"])
                };
            }
            frmcurrent = frmlayout2;
            ShowForm(frmcurrent, this.panelMap);
            frmcurrent.BringToFront();
            frmcurrent.ShowRacks();
        }

        private void ShowForm(Form frm, Panel ParentPanel)
        {
            if (ParentPanel.Controls.Count == 1)
            {
                if (ParentPanel.Controls[0] == frm) return;
            }

            ParentPanel.Controls.Clear();
            frm.TopLevel = false;
            frm.FormBorderStyle = FormBorderStyle.None;
            frm.Dock = DockStyle.Fill;
            frm.Parent = ParentPanel;
            ParentPanel.Controls.Add(frm);
            frm.Show();
        }

        //订单处理
        private void txtc1_KeyDown(object sender, KeyEventArgs e)
        {
            if ((int)e.KeyCode == 13)
            {
                e.SuppressKeyPress = true;
                string order = this.txtc1.Text.Trim();
                if (order.Length > 0)
                {
                    ImportOrderToDB(order);
                }
                this.txtc1.Clear();
                this.txtc1.Focus();
            }
        }

        //把数据导入数据库
        private void ImportOrderToDB(string order)
        {
            bool Isonlydisplay = this.chkonlydisplay.Checked;   //备料的特殊需求, 扫描物料不入账, 只显示
            if(Isonlydisplay == true)
            {
                ImportOrderToDBonlyonlyshow(order);
                return;
            }

            if(string.IsNullOrEmpty(order))
            {
                return;
            }

            string[] orderarr = order.Split('|');

            //可能是物料查询库位置
            if (orderarr.Length == 1)
            {
                //删除上次查询的库位的颜色
                RemovePreviousQueryCellColor();

                DataTable dt = db.GetDataTable(string.Format("select * from RackRaw where Rawsheet='{0}'", order));
                if (dt.Rows.Count > 0)    //如果一个材料在多个库位， 只显示一个库位
                {
                    string layid = dt.Rows[0]["LayID"].ToString();
                    string rackname = dt.Rows[0]["RackName"].ToString();
                    string rackid = dt.Rows[0]["RackID"].ToString();
                    int rowno = Convert.ToInt16(dt.Rows[0]["RowNo"]);
                    int colno = Convert.ToInt16(dt.Rows[0]["ColumnNo"]);

                    if (Convert.ToInt16(dt.Rows[0]["FlexibleID"]) == 1) //弹性库位
                    {
                        DataTable tempdt = db.GetDataTable(string.Format("select * from RackRaw where RackID='{0}' and UniqueID=1", rackid));
                        if(tempdt.Rows.Count>0)
                        {
                            rowno = Convert.ToInt16(tempdt.Rows[0]["RowNo"]);
                            colno = Convert.ToInt16(tempdt.Rows[0]["ColumnNo"]);
                        }
                    }

                    if (layid == "Layout1")
                    {
                        if (frmcurrent != frmlayout1)
                        {
                            ShowLayout1();
                        }
                    }
                    else
                    {
                        if (frmcurrent != frmlayout2)
                        {
                            ShowLayout2();
                        }
                    }

                    frmcurrent.MarkQueryRackPosition(rackname, rackid, rowno, colno);

                    if(querydt.Rows.Count > 0)
                    {
                        querydt.Rows.Clear();
                    }
                    querydt.Rows.Add(layid, rackname, rackid, rowno, colno);

                    ShowInfoAndSound(string.Format("{0}库位查询成功!", order));
                }
                else
                {
                    ShowError(string.Format("{0}在库位表中没有此原材料的配置信息", order));
                }
                return;
            }
             
            //订单格式是否有效
            if (orderarr[0] == "C02" || orderarr[0] == "C03" || orderarr[0] == "C04" || orderarr[0] == "C06")
            {
                string orderid = order;
     
                //发料时如何定义重复扫描及后补发的料
                //C02|M|1/8|19|33+A+1|KM51107451|80|33+A+1|ZK11177|100|33+A+1|KM50316504|10                
                int count = Convert.ToInt16(db.GetSingleObject(string.Format("select count(*) from StoreBar2 where Bar2ID='{0}'", orderid)));
                if (count > 0)
                {
                    ShowError("此条码早已发料完毕了,不能重复发料!");
                    return;
                }

                //送货的订单中是否条码重复了
                count = Convert.ToInt16(db.GetSingleObject(string.Format("select count(*) from C02Temp where Bar2ID='{0}'", orderid)));
                if (count > 0)
                {
                    ShowError("发现重复发料条码,不能重复扫描!");
                    return;
                }

                //导入C02临时表中
                string code = orderarr[0].Trim();
                string line = orderarr[1].Trim();
                string packid = orderarr[2].Trim();
                int yearid  = Convert.ToInt16(orderarr[3].Trim());
                string lot0 = string.Empty;
                string currentmsg = packid + "  " + (line=="A" ? "自动线":"手动线");

                //寻找临时的识别号
                if (FirstBarID == -1)
                {
                    if (Convert.ToInt32(db.GetSingleObject(string.Format("select count(*) from C02Temp where YearID={0}", yearid))) == 0)
                    {
                        FirstBarID = Convert.ToInt32(db.GetSingleObject(string.Format("select IsNull(Max(DelivID),0) from StoreBar2 where YearID={0}", yearid))) + 1;
                    }
                    else
                    {
                        FirstBarID = Convert.ToInt32(db.GetSingleObject(string.Format("select IsNull(Max(DelivID),0) from C02Temp where YearID={0}", yearid))) + 1;
                    }
                    CurrentID = FirstBarID;
                }

                //检查格式是否正确
                if(code == "C03")
                {
                    if (((orderarr.Length - 4) % 4) != 0)
                    {
                        ShowError("发料条码格式错误!");
                        return;
                    }
                }
                else
                {
                    if (((orderarr.Length - 4) % 3) != 0)
                    {
                        ShowError("发料条码格式错误!");
                        return;
                    }
                }

                const string sqlversion = "2005";
                const int numpergroup = 50;
                int indexingroup = 0;
                StringBuilder groupstr = new StringBuilder();
                List<string> rawlist = new List<string>();

                //导入临时表
                if (code == "C03")
                {
                    for (int i = 4; i < orderarr.Length; i = i + 4)
                    {
                        string lot = orderarr[i].ToString();
                        string raw0 = orderarr[i + 1].ToString();
                        int qty = Convert.ToInt16(orderarr[i + 2].ToString());
                        int needqty = Convert.ToInt16(orderarr[i + 3].ToString());

                        lot0 = lot;

                        if (rawlist.IndexOf(raw0) == -1)
                        {
                            rawlist.Add(raw0);
                        }

                        int tempid;
                        if (RawOrderdic.ContainsKey(raw0))
                        {
                            tempid = RawOrderdic[raw0];
                        }
                        else
                        {
                            tempid = MaxTempID++;
                            RawOrderdic.Add(raw0, tempid);
                        }

                        if (sqlversion != "2005") //以下适用于SQL SERVER >2005
                        {
                            groupstr.AppendFormat("('{0}','{1}','{2}', {3}, {4}, '{5}', '{6}', {7} , {8}, '{9}', '{10}'),", code,line,packid, yearid, FirstBarID, lot, raw0, qty, needqty, User.UserID, tempid);
                            indexingroup = indexingroup + 1;

                            if (indexingroup >= numpergroup)
                            {
                                string sql0 = groupstr.ToString().TrimEnd(',');
                                ImportSqlToTempDB("Insert into C02(Code, Line, PackID, YearID, DelivID, Lot, Rawsheet, Qty, NeedQty, UserID, TempID) ", " Values " + sql0);
                                groupstr.Clear();
                                indexingroup = 0;
                            }
                        }

                        if (sqlversion == "2005")  //以下适用于SQL SERVER 2005
                        {
                            groupstr.AppendFormat("select '{0}','{1}','{2}', {3}, {4}, '{5}', '{6}', {7} , {8}, '{9}', '{10}' union all ", code, line,packid,yearid, FirstBarID, lot, raw0, qty, needqty, User.UserID, tempid);
                            indexingroup = indexingroup + 1;
                            if (indexingroup >= numpergroup)
                            {
                                string sql0 = groupstr.ToString();
                                sql0 = sql0.Substring(0, sql0.Length - 10);
                                ImportSqlToTempDB("Insert into C02(Code, Line, PackID, YearID, DelivID, Lot, Rawsheet, Qty, NeedQty, UserID, TempID) ", sql0);
                                groupstr.Clear();
                                indexingroup = 0;
                            }
                        }
                    }

                    if (sqlversion != "2005") //以下适用于SQL SERVER >2005
                    {
                        if (groupstr.Length > 0)
                        {
                            string sql0 = groupstr.ToString().TrimEnd(',');
                            ImportSqlToTempDB("Insert into C02(Code, Line, PackID, YearID, DelivID, Lot, Rawsheet, Qty, NeedQty, UserID, TempID) ", " Values " + sql0);
                            groupstr.Clear();
                        }
                    }

                    //以下适用于SQL SERVER 2005
                    if (sqlversion == "2005")
                    {
                        if (groupstr.Length > 0)
                        {
                            string sql0 = groupstr.ToString();
                            sql0 = sql0.Substring(0, sql0.Length - 10);
                            ImportSqlToTempDB("Insert into C02(Code, Line, PackID, YearID, DelivID, Lot, Rawsheet, Qty, NeedQty, UserID, TempID) ", sql0);
                            groupstr.Clear();
                        }
                    }
                }
                else
                {
                    for (int i = 4; i < orderarr.Length; i=i+3)
                    {
                        string lot = orderarr[i].ToString();
                        string raw0 = orderarr[i + 1].ToString();
                        int qty = Convert.ToInt16(orderarr[i + 2].ToString());

                        lot0 = lot;

                        if (rawlist.IndexOf(raw0) == -1)
                        {
                            rawlist.Add(raw0);
                        }

                        int tempid;
                        if (RawOrderdic.ContainsKey(raw0))
                        {
                            tempid = RawOrderdic[raw0];
                        }
                        else
                        {
                            tempid = MaxTempID++;
                            RawOrderdic.Add(raw0, tempid);
                        }

                        if (sqlversion != "2005") //以下适用于SQL SERVER >2005
                        {
                            groupstr.AppendFormat("('{0}','{1}','{2}', {3}, {4}, '{5}', '{6}', {7} , '{8}', '{9}'),", code, line,packid, yearid, FirstBarID, lot, raw0, qty, User.UserID, tempid);
                            indexingroup = indexingroup + 1;

                            if (indexingroup >= numpergroup)
                            {
                                string sql0 = groupstr.ToString().TrimEnd(',');
                                ImportSqlToTempDB("Insert into C02(Code, Line, PackID, YearID, DelivID, Lot, Rawsheet, Qty, UserID, TempID) ", " Values " + sql0);
                                groupstr.Clear();
                                indexingroup = 0;
                            }
                        }

                        if (sqlversion == "2005")  //以下适用于SQL SERVER 2005
                        {
                            groupstr.AppendFormat("select '{0}','{1}','{2}', {3}, {4}, '{5}', '{6}', {7} , '{8}', '{9}' union all ", code, line, packid, yearid, FirstBarID, lot, raw0, qty, User.UserID, tempid);
                            indexingroup = indexingroup + 1;
                            if (indexingroup >= numpergroup)
                            {
                                string sql0 = groupstr.ToString();
                                sql0 = sql0.Substring(0, sql0.Length - 10);
                                ImportSqlToTempDB("Insert into C02(Code, Line,PackID, YearID, DelivID, Lot, Rawsheet, Qty, UserID, TempID) ", sql0);
                                groupstr.Clear();
                                indexingroup = 0;
                            }
                        }
                    }

                    if (sqlversion != "2005") //以下适用于SQL SERVER >2005
                    {
                        if (groupstr.Length > 0)
                        {
                            string sql0 = groupstr.ToString().TrimEnd(',');
                            ImportSqlToTempDB("Insert into C02(Code, Line, PackID, YearID, DelivID, Lot, Rawsheet, Qty, UserID, TempID) ", " Values " + sql0);
                            groupstr.Clear();
                        }
                    }

                    //以下适用于SQL SERVER 2005
                    if (sqlversion == "2005")
                    {
                        if (groupstr.Length > 0)
                        {
                            string sql0 = groupstr.ToString();
                            sql0 = sql0.Substring(0, sql0.Length - 10);
                            ImportSqlToTempDB("Insert into C02(Code, Line, PackID, YearID, DelivID, Lot, Rawsheet, Qty, UserID, TempID) " , sql0);
                            groupstr.Clear();
                        }
                    }                  

                }

                //插入数据到C02Temp
                string sql = string.Format(@"Insert into C02Temp(YearID,Line,PackID, DelivID, Bar2ID,Lot) Values({0},'{1}','{2}',{3},'{4}','{5}')", yearid, line, packid, FirstBarID, orderid,lot0);
                db.ExecuteNonQuery(sql);               

                txtc1.Clear();
                txtc1.Focus();

                if(Issingleshow)
                {
                    //把以前的颜色恢复到默认 
                    frmcurrent.ResetRackCellsDefaultColor("all");
                }

                //收货库位标注
                foreach(string raw in rawlist)
                {
                    MarkRackPosition(raw, yearid, FirstBarID);
                }

                CurrentID = FirstBarID;

                //更新扫描信息
                ShowInfoInDataGridView();                

                FirstBarID++;

                currentmsg = lot0 + "  " + currentmsg;
                ShowInfoAndSound(currentmsg + " 扫描成功!");
            }
            else
            {
                ShowError("无效的订单格式！");
                return;
            }
        }

        private void ImportSqlToTempDB(string operasql, string ordersql)
        {
            string sql = operasql + ordersql;
            int rownum = db.ExecuteNonQuery(sql);

            if (rownum < 1)
            {
                ShowError(string.Format("{0}- 操作失败!", sql));
                return;
            }
        }

        private void RemovePreviousQueryCellColor()
        {
            if (querydt.Rows.Count > 0)
            {
                string layout = querydt.Rows[0]["layid"].ToString();
                string rackname = querydt.Rows[0]["rackname"].ToString();
                string rackid = querydt.Rows[0]["rackid"].ToString();
                int row = Convert.ToInt16(querydt.Rows[0]["row"]);
                int col = Convert.ToInt16(querydt.Rows[0]["column"]);
                
                if(layout == "Layout1")
                {
                    frmlayout1.MarkRemoveQueryRackPosition(rackname, rackid, row, col);
                }
                else if(layout == "Layout2")
                {
                    frmlayout2.MarkRemoveQueryRackPosition(rackname, rackid, row, col);
                }
            }
        }

        //库位标注
        private void MarkRackPosition(string raw, int yearid, int delivid)
        {
            string sql = string.Format("select * from RackRaw where Rawsheet='{0}'", raw);
            DataTable dt = db.GetDataTable(sql);            
            if(dt.Rows.Count > 0)    //如果一个材料在多个库位， 只显示一个库位
            {
                string layid = dt.Rows[0]["LayID"].ToString();
                string rackname = dt.Rows[0]["RackName"].ToString();
                string rackid = dt.Rows[0]["RackID"].ToString();
                int rowno = Convert.ToInt16(dt.Rows[0]["RowNo"]);
                int colno = Convert.ToInt16(dt.Rows[0]["ColumnNo"]);

                if (Convert.ToInt16(dt.Rows[0]["FlexibleID"]) == 1) //弹性库位
                {
                    DataTable tempdt = db.GetDataTable(string.Format("select * from RackRaw where RackID='{0}' and UniqueID=1", rackid));
                    if (tempdt.Rows.Count > 0)
                    {
                        rowno = Convert.ToInt16(tempdt.Rows[0]["RowNo"]);
                        colno = Convert.ToInt16(tempdt.Rows[0]["ColumnNo"]);
                    }
                }

                //更新C02 RackID字段
                db.ExecuteNonQuery(string.Format("Update C02 set RackName='{0}',RackID='{1}',RowNo={2},ColumnNo={3} where YearID={4} and DelivID={5} and Rawsheet='{6}'", rackname, rackid, rowno, colno, yearid, delivid, raw));

                if(layid == "Layout1")
                {
                    if (frmcurrent != frmlayout1)
                    {
                        ShowLayout1();
                    }
                }
                else
                {
                    if (frmcurrent != frmlayout2)
                    {
                        ShowLayout2();
                    }
                }

                frmcurrent.MarkRackPosition(rackname, rackid, rowno, colno);
            }
        }

        private void ShowError(string msg)
        {
            this.lblinfo.ForeColor = Color.Red;
            this.lblinfo.Text = msg;
            //声音提示
            if (IsPlaySound)
            {
                PlaySound(Application.StartupPath + "\\Sound\\no.wav");
            }
        }
        
        private void ShowInfo(string msg)
        {
            this.lblinfo.ForeColor = Color.Green;
            this.lblinfo.Text = msg;
        }

        private void ShowInfoAndSound(string msg)
        {
            this.lblinfo.ForeColor = Color.Green;
            this.lblinfo.Text = msg;
            //声音提示
            if (IsPlaySound)
            {
                PlaySound(Application.StartupPath + "\\Sound\\ok.wav");
            }
        }

        private void PlaySound(string filename)
        {
            player.SoundLocation = filename;
            player.Load(); //同步加载声音
            player.Play(); //启用新线程播放
            //player.PlayLooping(); //循环播放模式
            //player.PlaySync(); //UI线程同步播放
        }

        private void SetDataGridViewBase(DataGridView dg)
        {
            dgv.AllowUserToOrderColumns = false;
            dgv.AllowUserToResizeColumns = false;
            dgv.AllowUserToResizeRows = false;
            dgv.Enabled = false;
            dgv.ReadOnly = true;
            dgv.Columns[0].FillWeight = 55;
            dgv.Columns[1].FillWeight = 25;
            dgv.Columns[2].FillWeight = 20;
        }

        //显示扫描的信息
        private void ShowInfoInDataGridView()
        {
            string sql = string.Empty;
            if (Issingleshow)
            {
                sql = string.Format("select Rawsheet as raw, RackID as rack, Sum(Qty) as qty from C02 where DelivID={0} group by Rawsheet, RackID, TempID order by TempID", CurrentID);
            }
            else
            {
                sql = "select Rawsheet as raw, RackID as rack, Sum(Qty) as qty from C02 group by Rawsheet, RackID, TempID order by TempID";
            }
            
            DataTable dt = db.GetDataTable(sql);
            this.dgv.DataSource = dt;

            dgv.Columns[0].FillWeight = 55;
            dgv.Columns[1].FillWeight = 25;
            dgv.Columns[2].FillWeight = 20;

            dgv.CurrentCell = null;
            dgv.ClearSelection();
            dgv.Enabled = false;
            dgv.ReadOnly = true;

            this.lblqty.Text = (db.GetSingleObject("select IsNull(sum(Qty),0) from C02")).ToString();
        }

        //刷新数据
        public void RefreshForm()
        {
            ShowInfoInDataGridView();

            //更新货架的选中状态
            if(Issingleshow)
            {
                frmlayout1.ResetRackCellsDefaultColor("all");
                frmlayout2.ResetRackCellsDefaultColor("all");
            }
            else
            {
                frmlayout1.RefreshShowRacks();
                frmlayout2.RefreshShowRacks();
            }
        }

        private void button2_Click(object sender, EventArgs e)
        {
            FormC2_2 frm = new FormC2_2(this);
            txtc1.Focus();
            frm.ShowDialog(this);
        }

        private void chksound_CheckedChanged(object sender, EventArgs e)
        {
            IsPlaySound = this.chksound.Checked;                
        }
        
        //最大化
        private void label1_Click(object sender, EventArgs e)
        {
            if(this.Parent is Panel)
            {
                parentpanel = this.Parent as Panel;
            }
            
            this.Parent = null;
            this.TopLevel = true;
            this.TopMost = true; // 置顶         
            this.KeyPreview = true;
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.None; // 设置边框为 None
            this.WindowState = FormWindowState.Maximized; // 最大化   
            this.Show();
            this.txtc1.Focus();

            IsMax = true;

            SetSingleShowFormatforDataGridView();
        }

        //取消最大化
        private void FormC1_KeyUp(object sender, KeyEventArgs e)
        {
            if (IsMax && e.KeyCode == Keys.Escape) //“Esc” 按键退出全频
            {
                this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle;
                this.WindowState = FormWindowState.Normal;
                this.TopMost = false; // 置顶   
                IsMax = false;               
                ShowForm(this, parentpanel);
                SetSingleShowFormatforDataGridView();
            }
        }

        private void pictureBox2_Click(object sender, EventArgs e)
        {
            MainForm.formsdic.Remove(this.Name);
            this.Close();
        }

        private void chksingleshow_CheckedChanged(object sender, EventArgs e)
        {
            Issingleshow = chksingleshow.Checked;
            SetSingleShowFormatforDataGridView();
        }

        //为单显设置datagridview的字体大小
        private void SetSingleShowFormatforDataGridView()
        {
            if(this.chkbigfont.Checked)
            {
                int panelw = 0;
                int f1w = 0;
                int f2w = 0;
                int f3w = 0;
                int fh = dgv.Height - 32;
                int ffcw = 1000;
                fh = (int)(fh/ maxrow);      //单显时控制最大行数为10

                dgv.SetDataGridViewTheme2(false, false, "No", false, false, 32, fh, false, true, false);

                int fontsize = (int)CoolFont.FitStringRect("KM500094471", dgv.DefaultCellStyle.Font, dgv.CreateGraphics(), new Rectangle(0, 0, ffcw, fh));
                DataCellStyle2.Font = new Font("微软雅黑", fontsize, FontStyle.Bold, GraphicsUnit.Point);
                dgv.DefaultCellStyle = DataCellStyle2;

                SizeF sf = CoolFont.GetStringSize("KM500094479", dgv.DefaultCellStyle.Font, dgv.CreateGraphics());
                f1w = (int)sf.Width+5;
                sf = CoolFont.GetStringSize("YL-18-2", dgv.DefaultCellStyle.Font, dgv.CreateGraphics());
                f2w = (int)sf.Width+5;
                sf = CoolFont.GetStringSize("500", dgv.DefaultCellStyle.Font, dgv.CreateGraphics());
                f3w = (int)sf.Width+5;

                panelw = f1w + f2w + f3w;
                this.splitContainer1.SplitterDistance = panelw+20;
                this.panel3.Width = panelw + 18;
                dgv.Width = panelw + 17;

                SetDataGridViewBase(this.dgv);
                ShowInfoInDataGridView();
            }
            else
            {
                this.splitContainer1.SplitterDistance = 284;
                this.dgv.SetDataGridViewTheme2(false, false, "No", false, false, 32, 25, false, true, false);
                this.dgv.DefaultCellStyle = DataCellStyle1;
                SetDataGridViewBase(this.dgv);
                ShowInfoInDataGridView();
            }
        }

        private void panel3_SizeChanged(object sender, EventArgs e)
        {
            lblqty.Top = label2.Top;
            lblqty.Left = label2.Right + 20;
        }

        //只显示数据, 不入账
        private void ImportOrderToDBonlyonlyshow(string order)
        {
            int FirstBarIDonlyshow;

            if (string.IsNullOrEmpty(order))
            {
                return;
            }

            //清空上一次的清单
            db.ExecuteNonQuery("delete from C02onlyshow");

            string[] orderarr = order.Split('|');

            //可能是物料查询库位置
            if (orderarr.Length == 1)
            {
                //删除上次查询的库位的颜色
                RemovePreviousQueryCellColor();

                DataTable dt = db.GetDataTable(string.Format("select * from RackRaw where Rawsheet='{0}'", order));
                if (dt.Rows.Count > 0)    //如果一个材料在多个库位， 只显示一个库位
                {
                    string layid = dt.Rows[0]["LayID"].ToString();
                    string rackname = dt.Rows[0]["RackName"].ToString();
                    string rackid = dt.Rows[0]["RackID"].ToString();
                    int rowno = Convert.ToInt16(dt.Rows[0]["RowNo"]);
                    int colno = Convert.ToInt16(dt.Rows[0]["ColumnNo"]);

                    if (Convert.ToInt16(dt.Rows[0]["FlexibleID"]) == 1) //弹性库位
                    {
                        DataTable tempdt = db.GetDataTable(string.Format("select * from RackRaw where RackID='{0}' and UniqueID=1", rackid));
                        if (tempdt.Rows.Count > 0)
                        {
                            rowno = Convert.ToInt16(tempdt.Rows[0]["RowNo"]);
                            colno = Convert.ToInt16(tempdt.Rows[0]["ColumnNo"]);
                        }
                    }

                    if (layid == "Layout1")
                    {
                        if (frmcurrent != frmlayout1)
                        {
                            ShowLayout1();
                        }
                    }
                    else
                    {
                        if (frmcurrent != frmlayout2)
                        {
                            ShowLayout2();
                        }
                    }

                    frmcurrent.MarkQueryRackPosition(rackname, rackid, rowno, colno);

                    if (querydt.Rows.Count > 0)
                    {
                        querydt.Rows.Clear();
                    }
                    querydt.Rows.Add(layid, rackname, rackid, rowno, colno);

                    ShowInfoAndSound(string.Format("{0}库位查询成功!", order));
                }
                else
                {
                    ShowError(string.Format("{0}在库位表中没有此原材料的配置信息", order));
                }
                return;
            }

            //订单格式是否有效
            if (orderarr[0] == "C02" || orderarr[0] == "C03" || orderarr[0] == "C04" || orderarr[0] == "C06")
            {
                string orderid = order;

                //导入C02临时表中
                string code = orderarr[0].Trim();
                string line = orderarr[1].Trim();
                string packid = orderarr[2].Trim();
                int yearid = Convert.ToInt16(orderarr[3].Trim());
                string lot0 = string.Empty;
                string currentmsg = packid + "  " + (line == "A" ? "自动线" : "手动线");

                //寻找临时的识别号
                FirstBarIDonlyshow = -1;

                //检查格式是否正确
                if (code == "C03")
                {
                    if (((orderarr.Length - 4) % 4) != 0)
                    {
                        ShowError("发料条码格式错误!");
                        return;
                    }
                }
                else
                {
                    if (((orderarr.Length - 4) % 3) != 0)
                    {
                        ShowError("发料条码格式错误!");
                        return;
                    }
                }

                const string sqlversion = "2005";
                const int numpergroup = 50;
                int indexingroup = 0;
                StringBuilder groupstr = new StringBuilder();
                List<string> rawlist = new List<string>();

                //导入临时表
                if (code == "C03")
                {
                    for (int i = 4; i < orderarr.Length; i = i + 4)
                    {
                        string lot = orderarr[i].ToString();
                        string raw0 = orderarr[i + 1].ToString();
                        int qty = Convert.ToInt16(orderarr[i + 2].ToString());
                        int needqty = Convert.ToInt16(orderarr[i + 3].ToString());

                        lot0 = lot;

                        if (rawlist.IndexOf(raw0) == -1)
                        {
                            rawlist.Add(raw0);
                        }

                        int tempid=1;

                        if (sqlversion != "2005") //以下适用于SQL SERVER >2005
                        {
                            groupstr.AppendFormat("('{0}','{1}','{2}', {3}, {4}, '{5}', '{6}', {7} , {8}, '{9}', '{10}'),", code, line, packid, yearid, FirstBarIDonlyshow, lot, raw0, qty, needqty, User.UserID, tempid);
                            indexingroup = indexingroup + 1;

                            if (indexingroup >= numpergroup)
                            {
                                string sql0 = groupstr.ToString().TrimEnd(',');
                                ImportSqlToTempDB("Insert into C02onlyshow(Code, Line, PackID, YearID, DelivID, Lot, Rawsheet, Qty, NeedQty, UserID, TempID) ", " Values " + sql0);
                                groupstr.Clear();
                                indexingroup = 0;
                            }
                        }

                        if (sqlversion == "2005")  //以下适用于SQL SERVER 2005
                        {
                            groupstr.AppendFormat("select '{0}','{1}','{2}', {3}, {4}, '{5}', '{6}', {7} , {8}, '{9}', '{10}' union all ", code, line, packid, yearid, FirstBarIDonlyshow, lot, raw0, qty, needqty, User.UserID, tempid);
                            indexingroup = indexingroup + 1;
                            if (indexingroup >= numpergroup)
                            {
                                string sql0 = groupstr.ToString();
                                sql0 = sql0.Substring(0, sql0.Length - 10);
                                ImportSqlToTempDB("Insert into C02onlyshow(Code, Line, PackID, YearID, DelivID, Lot, Rawsheet, Qty, NeedQty, UserID, TempID) ", sql0);
                                groupstr.Clear();
                                indexingroup = 0;
                            }
                        }
                    }

                    if (sqlversion != "2005") //以下适用于SQL SERVER >2005
                    {
                        if (groupstr.Length > 0)
                        {
                            string sql0 = groupstr.ToString().TrimEnd(',');
                            ImportSqlToTempDB("Insert into C02onlyshow(Code, Line, PackID, YearID, DelivID, Lot, Rawsheet, Qty, NeedQty, UserID, TempID) ", " Values " + sql0);
                            groupstr.Clear();
                        }
                    }

                    //以下适用于SQL SERVER 2005
                    if (sqlversion == "2005")
                    {
                        if (groupstr.Length > 0)
                        {
                            string sql0 = groupstr.ToString();
                            sql0 = sql0.Substring(0, sql0.Length - 10);
                            ImportSqlToTempDB("Insert into C02onlyshow(Code, Line, PackID, YearID, DelivID, Lot, Rawsheet, Qty, NeedQty, UserID, TempID) ", sql0);
                            groupstr.Clear();
                        }
                    }
                }
                else
                {
                    for (int i = 4; i < orderarr.Length; i = i + 3)
                    {
                        string lot = orderarr[i].ToString();
                        string raw0 = orderarr[i + 1].ToString();
                        int qty = Convert.ToInt16(orderarr[i + 2].ToString());

                        lot0 = lot;

                        if (rawlist.IndexOf(raw0) == -1)
                        {
                            rawlist.Add(raw0);
                        }

                        int tempid=1;

                        if (sqlversion != "2005") //以下适用于SQL SERVER >2005
                        {
                            groupstr.AppendFormat("('{0}','{1}','{2}', {3}, {4}, '{5}', '{6}', {7} , '{8}', '{9}'),", code, line, packid, yearid, FirstBarIDonlyshow, lot, raw0, qty, User.UserID, tempid);
                            indexingroup = indexingroup + 1;

                            if (indexingroup >= numpergroup)
                            {
                                string sql0 = groupstr.ToString().TrimEnd(',');
                                ImportSqlToTempDB("Insert into C02onlyshow(Code, Line, PackID, YearID, DelivID, Lot, Rawsheet, Qty, UserID, TempID) ", " Values " + sql0);
                                groupstr.Clear();
                                indexingroup = 0;
                            }
                        }

                        if (sqlversion == "2005")  //以下适用于SQL SERVER 2005
                        {
                            groupstr.AppendFormat("select '{0}','{1}','{2}', {3}, {4}, '{5}', '{6}', {7} , '{8}', '{9}' union all ", code, line, packid, yearid, FirstBarIDonlyshow, lot, raw0, qty, User.UserID, tempid);
                            indexingroup = indexingroup + 1;
                            if (indexingroup >= numpergroup)
                            {
                                string sql0 = groupstr.ToString();
                                sql0 = sql0.Substring(0, sql0.Length - 10);
                                ImportSqlToTempDB("Insert into C02onlyshow(Code, Line,PackID, YearID, DelivID, Lot, Rawsheet, Qty, UserID, TempID) ", sql0);
                                groupstr.Clear();
                                indexingroup = 0;
                            }
                        }
                    }

                    if (sqlversion != "2005") //以下适用于SQL SERVER >2005
                    {
                        if (groupstr.Length > 0)
                        {
                            string sql0 = groupstr.ToString().TrimEnd(',');
                            ImportSqlToTempDB("Insert into C02onlyshow(Code, Line, PackID, YearID, DelivID, Lot, Rawsheet, Qty, UserID, TempID) ", " Values " + sql0);
                            groupstr.Clear();
                        }
                    }

                    //以下适用于SQL SERVER 2005
                    if (sqlversion == "2005")
                    {
                        if (groupstr.Length > 0)
                        {
                            string sql0 = groupstr.ToString();
                            sql0 = sql0.Substring(0, sql0.Length - 10);
                            ImportSqlToTempDB("Insert into C02onlyshow(Code, Line, PackID, YearID, DelivID, Lot, Rawsheet, Qty, UserID, TempID) ", sql0);
                            groupstr.Clear();
                        }
                    }
                }

                txtc1.Clear();
                txtc1.Focus();

                if (Issingleshow)
                {
                    //把以前的颜色恢复到默认 
                    frmcurrent.ResetRackCellsDefaultColor("all");
                }

                //收货库位标注
                foreach (string raw in rawlist)
                {
                    MarkRackPositionlyshow(raw, yearid, FirstBarIDonlyshow);
                }

                //更新扫描信息
                ShowInfoInDataGridViewonlyshow();
                ShowInfoAndSound("只显示, 不入账！！！");
            }
            else
            {
                ShowError("无效的订单格式！");
                return;
            }
        }

        private void MarkRackPositionlyshow(string raw, int yearid, int delivid)
        {
            string sql = string.Format("select * from RackRaw where Rawsheet='{0}'", raw);
            DataTable dt = db.GetDataTable(sql);
            if (dt.Rows.Count > 0)    //如果一个材料在多个库位， 只显示一个库位
            {
                string layid = dt.Rows[0]["LayID"].ToString();
                string rackname = dt.Rows[0]["RackName"].ToString();
                string rackid = dt.Rows[0]["RackID"].ToString();
                int rowno = Convert.ToInt16(dt.Rows[0]["RowNo"]);
                int colno = Convert.ToInt16(dt.Rows[0]["ColumnNo"]);

                if (Convert.ToInt16(dt.Rows[0]["FlexibleID"]) == 1) //弹性库位
                {
                    DataTable tempdt = db.GetDataTable(string.Format("select * from RackRaw where RackID='{0}' and UniqueID=1", rackid));
                    if (tempdt.Rows.Count > 0)
                    {
                        rowno = Convert.ToInt16(tempdt.Rows[0]["RowNo"]);
                        colno = Convert.ToInt16(tempdt.Rows[0]["ColumnNo"]);
                    }
                }

                //更新C02 RackID字段
                db.ExecuteNonQuery(string.Format("Update C02onlyshow set RackName='{0}',RackID='{1}',RowNo={2},ColumnNo={3} where YearID={4} and DelivID={5} and Rawsheet='{6}'", rackname, rackid, rowno, colno, yearid, delivid, raw));

                if (layid == "Layout1")
                {
                    if (frmcurrent != frmlayout1)
                    {
                        ShowLayout1();
                    }
                }
                else
                {
                    if (frmcurrent != frmlayout2)
                    {
                        ShowLayout2();
                    }
                }

                frmcurrent.MarkRackPosition(rackname, rackid, rowno, colno);
            }
        }

        private void ShowInfoInDataGridViewonlyshow()
        {
            string sql = string.Empty;
            if (Issingleshow)
            {
                sql = string.Format("select Rawsheet as raw, RackID as rack, Qty as qty from C02onlyshow");
            }
            else
            {
                sql = "select Rawsheet as raw, RackID as rack, Qty as qty from C02onlyshow";
            }

            DataTable dt = db.GetDataTable(sql);
            this.dgv.DataSource = dt;

            dgv.Columns[0].FillWeight = 55;
            dgv.Columns[1].FillWeight = 25;
            dgv.Columns[2].FillWeight = 20;

            dgv.CurrentCell = null;
            dgv.ClearSelection();
            dgv.Enabled = false;
            dgv.ReadOnly = true;

            this.lblqty.Text = (db.GetSingleObject("select IsNull(sum(Qty),0) from C02onlyshow")).ToString();
        }

        private void chkbigfont_CheckedChanged(object sender, EventArgs e)
        {
            SetSingleShowFormatforDataGridView();
        }
    }
}
