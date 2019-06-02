using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Configuration;
using FanNetWorld.Data;
using System.Media;

namespace WHRawManager
{
    public partial class FormC1_2 : Form
    {
        DbHelper db = new DbHelper();
        SoundPlayer player = new SoundPlayer();
        FormC1 frmparent = null;
        public bool needrefresh = false;
        string receiverule = ConfigurationManager.AppSettings["ReceiveRule"];

        public FormC1_2()
        {
            InitializeComponent();
            lblinfo.Text = "";
        }

        public FormC1_2(FormC1 frm)
        {
            InitializeComponent();
            lblinfo.Text = "";
            frmparent = frm;
        }

        private void FormC1_2_Load(object sender, EventArgs e)
        {
            ShowCompare();
            if(this.dgv2.Rows.Count>0)
            {
                this.dgv2.CurrentCell = this.dgv2[1, 0];
            }
        }

        public void ShowCompare()
        {
            //总数量, 总包数
            this.lblqty.Text = (db.GetSingleObject("select IsNull(sum(Qty),0) from C01")).ToString();
            this.lblpackqty.Text = (db.GetSingleObject("select count(Qty) from C01")).ToString();

            this.dgv2.SetDataGridViewTheme2(true, false, "No", false, false, 32, 25, true, true, false);
            this.dgv2.AllowUserToOrderColumns = false;
            this.dgv2.AllowUserToResizeColumns = false;
            this.dgv2.AllowUserToResizeRows = false;
            this.dgv2.ReadOnly = true;

            string sql = @"with tbplan
	                        as
	                        (   ---没有完成的订单
		                        select a.Vendor, a.PurchDoc as PO, a.Item, a.Material, CONVERT(varchar(100), a.[交付日期], 23) as [交付日期], sum(Qty) as Qty 
													                        from PurDoc a 
													                        where DateDiff(day, a.[交付日期],'{0}')>=0 and Status is null
													                        group by a.Vendor,a.PurchDoc,a.Item,a.Material,CONVERT(varchar(100), a.[交付日期], 23)
	                        ),
                            tbstore
	                        as
	                        (  ---没有完成的订单中已部分收货数量
		                        select a.PO, a.Item, a.Rawsheet as Material, sum(a.Qty) as Qty
												                         from Store a 
												                         where a.Code='C01' and (a.PO + '-' + a.Item in (select PurchDoc + '-' + Item from Purdoc where DateDiff(day,[交付日期],'{0}')>=0 and Status is null )
																		 ---or DateDiff(day,a.InputTime,'{0}')=0   ---非计划收货	
																			)
												                         group by a.PO, a.Item, a.Rawsheet
	                        ),
	                        tb1
	                        as
	                        (
		                        select a.Vendor as Vendor, Isnull(a.PO,b.PO) as PO, Isnull(a.Item,b.Item) as Item, Isnull(a.Material,b.Material) as Material,a.[交付日期],a.Qty as Qty,b.Qty as Qty1
													                        from tbplan a full join tbstore b
												                            on a.PO=b.PO and a.Item=b.Item and a.Material=b.Material
	                        ),
	                        tb2
	                        as
	                        (
		                        select Code,PO,Item,Rawsheet as Material,sum(Qty) as Qty from C01 group by Code,PO,Item,Rawsheet
	                        )
	                        select a.Vendor, Isnull(a.PO,b.PO) as PO, Isnull(a.Item,b.Item) as Item, Isnull(a.Material,b.Material) as Material,a.[交付日期],
								                        a.Qty as Qty, a.Qty1 as Qty1, b.Qty as Qty2, 
								                        case when b.Code='C05' or b.Code='C07' then '退料待收' 
                                                             when a.Vendor is null then '非计划'
									                         when Isnull(b.Qty,0)=0 and (a.Qty - isnull(a.Qty1,0) - Isnull(b.Qty,0)=0)  then '已全部收货'
									                         when Isnull(b.Qty,0)=0 and Isnull(a.Qty1,0)>0 and (a.Qty - isnull(a.Qty1,0) - Isnull(b.Qty,0)<0)  then '已超量收货'
									                         when Isnull(b.Qty,0)=0 and Isnull(a.Qty1,0)>0 and (a.Qty - isnull(a.Qty1,0) - Isnull(b.Qty,0)>0)  then '已部分收货'
									                         when Isnull(b.Qty,0)=0 and Isnull(a.Qty1,0)=0 then '未送货'
									                         when Isnull(b.Qty,0)>0 and (a.Qty - isnull(a.Qty1,0) - Isnull(b.Qty,0)=0) then '待全部收货'								 
									                         when Isnull(b.Qty,0)>0 and (a.Qty - isnull(a.Qty1,0) - Isnull(b.Qty,0)>0) then '待部分收货('+ Convert(varchar(10),Isnull(b.Qty,0))+')'
									                         when Isnull(b.Qty,0)>0 and (a.Qty - isnull(a.Qty1,0) - Isnull(b.Qty,0)<0) then '超量('+ Convert(varchar(10),isnull(a.Qty1,0)+Isnull(b.Qty,0)-a.Qty) +')'
									                         else '需定义'
								                        end as VS,
								                        case when Isnull(b.Qty,0)>0 and (a.Qty - isnull(a.Qty1,0) - Isnull(b.Qty,0)>=0) then 1
									                            else 0
								                        end as chkcol
								                        from tb1 a full join tb2 b 
								                        on a.PO=b.PO and a.Item=b.Item and a.Material=b.Material 
								                        order by a.[交付日期], VS desc";
            DataTable dt = db.GetDataTable(string.Format(sql, DateTime.Now.ToString("yyyy-MM-dd")));  //DateTime.Now.ToString("yyyy-MM-dd")

            //可收货数量
            string temp = dt.Compute("sum(Qty2)", "chkcol=1").ToString();
            if (receiverule == "on")
                this.lblokqty.Text = string.IsNullOrEmpty(temp) ? "0" : temp;
            else
                this.lblokqty.Text = this.lblqty.Text;

            if (string.IsNullOrEmpty(temp))
            {
                this.lblokqty.ForeColor = Color.Red;
            }
            else
            {
                this.lblokqty.ForeColor = Color.Blue;
            }

            //dt.Columns["chkcol"].ReadOnly = false;
            this.dgv2.DataSource = dt.DefaultView;
            ShowDataInDgv2();

            this.dgv2.Columns["Vendor"].FillWeight = 15;
            this.dgv2.Columns["PO"].FillWeight = 12;
            this.dgv2.Columns["Item"].FillWeight = 6;
            this.dgv2.Columns["Material"].FillWeight = 15;
            this.dgv2.Columns["交付日期"].FillWeight = 9;
            this.dgv2.Columns["Qty"].FillWeight = 7;
            this.dgv2.Columns["Qty1"].FillWeight = 7;
            this.dgv2.Columns["Qty2"].FillWeight = 7;
            this.dgv2.Columns["VS"].FillWeight = 11;
            this.dgv2.Columns["chkcol"].FillWeight = 5;
            this.dgv2.CurrentCell = null;
        }

         private void dgv2_CellFormatting(object sender, DataGridViewCellFormattingEventArgs e)
        {
            if(this.dgv2.Columns[e.ColumnIndex].Name == "VS")
            {
                string cv = this.dgv2[e.ColumnIndex, e.RowIndex].Value.ToString();
                if (cv.IndexOf("已")>=0)
                {
                    this.dgv2[e.ColumnIndex, e.RowIndex].Style.BackColor = Color.Green;
                }
                else if(cv.IndexOf("待")>=0)
                {
                    this.dgv2[e.ColumnIndex, e.RowIndex].Style.BackColor = Color.Orange;
                }
                else
                {
                    this.dgv2[e.ColumnIndex, e.RowIndex].Style.BackColor = Color.Red;
                }                
            }
        }
        
        //收货
        private void button2_Click(object sender, EventArgs e)
        {
            StringBuilder sql = new StringBuilder();
            StringBuilder Statussql = new StringBuilder();

            foreach (DataGridViewRow gr in this.dgv2.Rows)
            {
                if (!Convert.IsDBNull(gr.Cells["chkcol"].Value))
                {
                    if (Convert.ToBoolean(gr.Cells["chkcol"].Value))
                    {   
                        //可以收货项
                        if (string.IsNullOrEmpty(sql.ToString()))
                        {
                            if(!Convert.IsDBNull(gr.Cells["Qty2"].Value))
                            {
                                sql.AppendFormat(" PO='{0}' and Item='{1}' ", gr.Cells["PO"].Value.ToString(), gr.Cells["Item"].Value.ToString());
                            }                            
                        }
                        else
                        {
                            if (!Convert.IsDBNull(gr.Cells["Qty2"].Value))
                            {
                                sql.AppendFormat("or PO='{0}' and Item='{1}' ", gr.Cells["PO"].Value.ToString(), gr.Cells["Item"].Value.ToString());
                            }                                
                        }

                        //是否是待全部收货
                        if(gr.Cells["VS"].Value.ToString() ==  "待全部收货")
                        {
                            if (string.IsNullOrEmpty(Statussql.ToString()))
                            {
                                if (!Convert.IsDBNull(gr.Cells["Qty2"].Value))
                                {
                                    Statussql.AppendFormat(" PurchDoc='{0}' and Item='{1}' ", gr.Cells["PO"].Value.ToString(), gr.Cells["Item"].Value.ToString());
                                }                                   
                            }
                            else
                            {
                                if (!Convert.IsDBNull(gr.Cells["Qty2"].Value))
                                {
                                    Statussql.AppendFormat("or PurchDoc='{0}' and Item='{1}' ", gr.Cells["PO"].Value.ToString(), gr.Cells["Item"].Value.ToString());
                                }
                            }

                        }
                    }

                }
            }

            this.lblinfo.Text = "";
            string wherestr = string.Empty;

            if (receiverule == "on")  //  严格收货
            {
                if (string.IsNullOrEmpty(sql.ToString()))
                {
                    ShowError("无货可收!");
                    return;
                }
                else
                {
                    wherestr = sql.ToString();
                }
            }
            else //all 收货
            {
                wherestr = "1=1";
            }

            
            if (this.dgv2.Rows.Count > 0)
            {
                string sql1 = string.Format(@"insert into Store(ID,YearID,Code,PO,Item,Rawsheet,Qty,PackID,InputTime,UserID) 
                                                select ID,YearID,Code,PO,Item,Rawsheet,Qty,PackID,ScanTime,UserID from C01 where {0}",
                                                wherestr);
                string sql2 = string.Format("delete from C01 where ({0})", wherestr);

                //更新订单状态 (全部收货)
                string sql3 = string.Empty;
                if (!string.IsNullOrEmpty(Statussql.ToString()))
                {
                    sql3 = string.Format("Update Purdoc set Status='finish' where ({0}) and Status is null", Statussql.ToString());
                }

                bool result = false;
                if (!string.IsNullOrEmpty(sql3))
                {
                    result = db.TransactionDataBase(new List<string>
                    {
                        sql1,
                        sql2,
                        sql3
                    });
                }
                else
                {
                    result = db.TransactionDataBase(new List<string>
                    {
                        sql1,
                        sql2
                    });
                }

                if (result)
                {
                    ShowInfo("操作成功!");
                }
                else
                {
                    ShowError("操作失败!");
                }

                //刷新界面
                ShowCompare();
                frmparent.RefreshForm();                    
            }
            else
            {
                ShowError("无货可收!");
            }

        }
        
        private void ShowError(string msg)
        {
            this.lblinfo.ForeColor = Color.Red;
            this.lblinfo.Text = msg;
            PlaySound(Application.StartupPath + "\\Sound\\no.wav");
        }

        private void ShowInfo(string msg)
        {
            this.lblinfo.ForeColor = Color.Yellow;
            this.lblinfo.Text = msg;
            PlaySound(Application.StartupPath + "\\Sound\\ok.wav");
        }

        private void PlaySound(string filename)
        {
            player.SoundLocation = filename;
            player.Load(); //同步加载声音
            player.Play(); //启用新线程播放
            //player.PlayLooping(); //循环播放模式
            //player.PlaySync(); //UI线程同步播放
        }

        //显示收货信息的方式
        private void chkshouhuo_Click(object sender, EventArgs e)
        {
            ShowDataInDgv2();
        }

        public void ShowDataInDgv2()
        {
            DataView dt = this.dgv2.DataSource as DataView;
            if (this.chkshouhuo.Checked)
            {
                dt.RowFilter = "Qty2 is not null";
            }
            else
            {
                dt.RowFilter = "";
            }
        }

        private void dgv2_CellDoubleClick(object sender, DataGridViewCellEventArgs e)
        {
            if(e.RowIndex != -1 && dgv2.Columns[e.ColumnIndex].Name == "VS")
            {
                string sql = "select ID, PO, Item, Rawsheet as Material, Qty, PackID, CONVERT(varchar(100), ScanTime, 23) as Date, 0 as chkcol from C01 order by PackID";
                new FormC1_Pack(this, "扫描的包装项", sql).Show();
            }

        }

        private void FormC1_2_FormClosing(object sender, FormClosingEventArgs e)
        {
            if(needrefresh == true)
            {
                frmparent.RefreshForm();
            }
        }
    }
}
