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

namespace WHRawManager
{
    public partial class FormC1 : Form
    {

        DbHelper db = new DbHelper();
        SoundPlayer player = new SoundPlayer();
        FormRackLayout frmlayout1 = null;
        FormRackLayout frmlayout2 = null;
        FormRackLayout frmcurrent = null;
        Dictionary<string, FormRackLayout> mapdic = new Dictionary<string, FormRackLayout>();
        bool IsPlaySound = true;

        Panel parentpanel = null;
        bool IsMax = false;

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

        public FormC1()
        {
            InitializeComponent();       
            SetStyle(ControlStyles.UserPaint | ControlStyles.AllPaintingInWmPaint | ControlStyles.OptimizedDoubleBuffer, true);

            if(Convert.ToInt16(db.GetSingleObject("select count(*) from C01")) ==0)
            {
                MaxTempID = 1;
            }
            else
            { 
                DataTable dt = db.GetDataTable("select distinct Rawsheet, TempID from C01 order by TempID");
                foreach (DataRow dr in dt.Rows)
                {
                    RawOrderdic.Add(dr["Rawsheet"].ToString(), Convert.ToInt16(dr["TempID"]));
                }

                MaxTempID = Convert.ToInt16(db.GetSingleObject("select Max(TempID) from C01"))+1;
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
            this.dgv.SetDataGridViewTheme2(false, false, "No", false, false, 32, 25, false, true, false);
            this.dgv.DefaultCellStyle = DataCellStyle1; //主要用于不要显示选中单元格的底色（其他的方法试过，在这里不起作用)
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
            Thread.Sleep(100);
            this.BeginInvoke(new Action(ShowLayout2));
            this.BeginInvoke(new Action(ShowLayout1));
            this.BeginInvoke(new Action(ShowFirstLayout));
        }

        private void ShowFirstLayout()
        {
            DataTable  dt = db.GetDataTable("select top 1 RackID from C01 where RackID is not null");
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
                frmlayout1 = new FormRackLayout("Layout1", "原材料仓库布局图","C01")
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
                frmlayout2 = new FormRackLayout("Layout2", "余料仓库布局图","C01")
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
            if(orderarr[0] == "C01" || orderarr[0]=="C05" || orderarr[0] == "C07")
            {
                string orderid = order;
                string code = "";
                string po = "";
                string item ="";
                string raw ="";                
                string packid = "";
                string billid = "";
                string yearid = "";
                int Qty = 0;

                if (orderarr[0] == "C01")
                {
                    if (orderarr.Length != 6)
                    {
                        ShowError("无效的订单格式！");
                        return;
                    }

                    //订单是否重复（C01|4525811654|30|KM51107451|80|3/3）
                    int count = Convert.ToInt16(db.GetSingleObject(string.Format("select count(*) from Store where ID='{0}'", orderid)));
                    if (count > 0)
                    {
                        ShowError(orderid + Environment.NewLine + "此条码早已收货完毕了,不能重复收货!");
                        return;
                    }

                    //送货的订单中是否条码重复了
                    count = Convert.ToInt16(db.GetSingleObject(string.Format("select count(*) from C01 where ID='{0}'", orderid)));
                    if (count > 0)
                    {
                        ShowError(orderid + Environment.NewLine + "送货中发现重复订单条码,不能重复收货!");
                        return;
                    }

                    code = orderarr[0].Trim();
                    po = orderarr[1].Trim();
                    item = orderarr[2].Trim();
                    raw = orderarr[3].Trim();
                    Qty = Convert.ToInt16(orderarr[4]);
                    packid = orderarr[5].Trim();
                    int tempid;
                    if (RawOrderdic.ContainsKey(raw))
                    {
                        tempid = RawOrderdic[raw];
                    }
                    else
                    {
                        tempid = MaxTempID++;
                        RawOrderdic.Add(raw, tempid);
                    }

                    string sql = string.Format(@"Insert into C01(ID, Code, PO, Item, Rawsheet, Qty, PackID, UserID, TempID) Values 
                                                        ('{0}', '{1}', '{2}', '{3}', '{4}', {5} , '{6}', '{7}', {8})",
                                                                orderid, code, po, item, raw, Qty, packid, User.UserID, tempid);

                    int rows = db.ExecuteNonQuery(sql);
                    if (rows == 1)
                    {
                        ShowInfoAndSound(orderid + Environment.NewLine + "扫描成功!");
                    }

                    //收货库位标注
                    MarkRackPosition(raw, orderid);
                }
                else if(orderarr[0] == "C05" || orderarr[0] == "C06")     //如何定义唯一性
                {
                    //"C05|C0520190513000|19|KM11217|10" - "C05|单据号|19|KM11217|10"
                    if (orderarr.Length != 5)
                    {
                        ShowError("无效的订单格式！");
                        return;
                    }

                    code = orderarr[0].Trim();
                    billid = orderarr[1].Trim();
                    yearid = orderarr[2].Trim();
                    raw = orderarr[3].Trim();
                    Qty = Convert.ToInt16(orderarr[4]);

                    //检查单据号是否重复
                    int count = Convert.ToInt16(db.GetSingleObject(string.Format("select count(*) from Store where ID='{0}'", billid)));
                    if (count > 0)
                    {
                        ShowError(billid + Environment.NewLine + "单据号重复,不能重复收货!");
                        return;
                    }

                    //送货的订单中是否条码重复了
                    count = Convert.ToInt16(db.GetSingleObject(string.Format("select count(*) from C01 where ID='{0}'", billid)));
                    if (count > 0)
                    {
                        ShowError(billid + Environment.NewLine + "单据号重复,不能重复收货!");
                        return;
                    }

                    int tempid;
                    if (RawOrderdic.ContainsKey(raw))
                    {
                        tempid = RawOrderdic[raw];
                    }
                    else
                    {
                        tempid = MaxTempID++;
                        RawOrderdic.Add(raw, tempid);
                    }

                    string sql = string.Format(@"Insert into C01(ID, Code, YearID, Rawsheet, Qty, UserID, TempID) Values 
                                                               ('{0}', '{1}', {2}, '{3}', {4}, '{5}', '{6}')",
                                                                billid, code, yearid, raw, Qty, User.UserID, tempid);

                    int rows = db.ExecuteNonQuery(sql);
                    if (rows == 1)
                    {
                        ShowInfoAndSound(orderid + Environment.NewLine + "扫描成功!");
                    }

                    //收货库位标注
                    MarkRackPosition(raw, billid);
                }

                txtc1.Clear();
                txtc1.Focus();

                //更新扫描信息
                ShowInfoInDataGridView();
            }
            else
            {
                ShowError("无效的订单格式！");
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
        private void MarkRackPosition(string raw, string orderid)
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

                //更新C01 RackID字段
                db.ExecuteNonQuery(string.Format("Update C01 set RackName='{0}',RackID='{1}',RowNo={2},ColumnNo={3} where ID='{4}'", rackname, rackid, rowno, colno, orderid));

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

        private void SetDataGridViewBase(DataGridView dgv)
        {
            dgv.AllowUserToOrderColumns = false;
            dgv.AllowUserToResizeColumns = false;
            dgv.AllowUserToResizeRows = false;
            dgv.Columns[0].FillWeight = 50;
            dgv.Columns[1].FillWeight = 30;
            dgv.Columns[2].FillWeight = 20;
        }

        //显示扫描的信息
        private void ShowInfoInDataGridView()
        {
            string sql = "select Rawsheet as raw, RackID as rack, Sum(Qty) as qty from C01 group by Rawsheet, RackID, TempID order by TempID";
            DataTable dt = db.GetDataTable(sql);
            this.dgv.DataSource = null;
            this.dgv.DataSource = dt;

            this.dgv.Columns["raw"].FillWeight = 55;
            this.dgv.Columns["rack"].FillWeight = 25;
            this.dgv.Columns["qty"].FillWeight = 20;

            this.lblqty.Text = (db.GetSingleObject("select IsNull(sum(Qty),0) from C01")).ToString();
            this.lblpackqty.Text = (db.GetSingleObject("select count(Qty) from C01")).ToString();
        }

        //刷新数据
        public void RefreshForm()
        {
            ShowInfoInDataGridView();

            //更新货架的选中状态
            frmlayout1.RefreshShowRacks();
            frmlayout2.RefreshShowRacks();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            FormC1_2 frm = new FormC1_2(this);
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
            }
        }

        private void pictureBox2_Click(object sender, EventArgs e)
        {
            MainForm.formsdic.Remove(this.Name);
            this.Close();
        }        

    }
}
