using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using FanNetWorld.Data;
using System.Media;

namespace WHRawManager
{
    public partial class FormC2_2 : Form
    {
        DbHelper db = new DbHelper();
        SoundPlayer player = new SoundPlayer();
        FormC2 frmparent = null;
        public bool needrefresh = false;

        public FormC2_2()
        {
            InitializeComponent();
            lblinfo.Text = "";
        }

        public FormC2_2(FormC2 frm)
        {
            InitializeComponent();
            lblinfo.Text = "";
            frmparent = frm;
        }

        private void FormC2_2_Load(object sender, EventArgs e)
        {
            ShowData();
        }

        public void ShowData()
        {
            this.dgv.SetDataGridViewTheme2(true, false, "No", false, false, 32, 25, true, false, false);
            this.dgv.AllowUserToOrderColumns = false;
            this.dgv.AllowUserToResizeColumns = false;
            this.dgv.AllowUserToResizeRows = false;
            this.dgv.ReadOnly = true;

            string sql = @"with tbc02 
                            as
                            (
	                            select Code, YearID, Lot, 
				                             Case Line when 'A' then '自动线'
						                               when 'M' then '手动线'
				                             end as Line,
				                             PackID, DelivID,Rawsheet as Material, Qty as Qty, NeedQty, UserID, Convert(varchar(100),ScanTime,23) as Date
				                             from C02
                            ),
                            tbstore
                            as
                            (
	                            select Rawsheet as Material, Isnull(sum(Qty),0) as Qty 
		                                     from Store a 
				                             where Rawsheet in (select distinct Rawsheet from C02)
				                             group by Rawsheet
                            )
                            select  case when a.Qty>Isnull(b.Qty,0) then '库存不够'
					                     when a.Qty<=Isnull(b.Qty,0) then '正常'
					                     else '需要定义'
				                    end as Status,
                                    Code,YearID,Lot,a.Line,
				                    PackID,DelivID, a.Material,a.Qty, Isnull(a.NeedQty,a.Qty) as NeedQty,Isnull(b.Qty,0) as StoreQty, UserID, a.Date
			                        from tbc02 a left join tbstore b
				                    on a.Material = b.Material";
            DataTable dt = db.GetDataTable(sql);
            lblqty.Text = dt.Compute("Sum(Qty)", "").ToString();
            dgv.DataSource = dt.DefaultView;
            if(this.dgv.Rows.Count > 0)
            {
                dgv.CurrentCell = this.dgv[1, 0];
            } 
        }

        private void dgv_CellFormatting(object sender, DataGridViewCellFormattingEventArgs e)
        {
            if (this.dgv.Columns[e.ColumnIndex].Name == "Status")
            {
                string cv = this.dgv[e.ColumnIndex, e.RowIndex].Value.ToString();
                if (cv.IndexOf("正常") >= 0)
                {
                    this.dgv[e.ColumnIndex, e.RowIndex].Style.BackColor = Color.Green;
                }
                else
                {
                    this.dgv[e.ColumnIndex, e.RowIndex].Style.BackColor = Color.Red;
                }
            }
        }

        //过账
        private void button2_Click(object sender, EventArgs e)
        {
            if(this.dgv.Rows.Count==0)
            {
                ShowError("无货可收!");
            }
            else
            {
                string sql0 = @"insert into Store(Code,Line,YearID,DelivID,Lot,Rawsheet,Qty,PackID,NeedQty,InputTime,UserID)
		                                        select Code,Line,YearID,DelivID,Lot,Rawsheet,-1*Qty,PackID,-1*NeedQty,ScanTime,UserID from C02";
                string sql1 = @"Insert into StoreBar2(YearID,Lot,Line,PackID,DelivID,Bar2ID)
			                                    select YearID,Lot,Line,PackID,DelivID,Bar2ID from C02Temp";
                string sql2 = @"delete from C02";
                string sql3 = @"delete from C02Temp";

                bool result = db.TransactionDataBase(new List<string>
                        {
                            sql0,
                            sql1,
                            sql2,
                            sql3
                        });
                if (result)
                {
                    ShowInfo("操作成功!");
                }
                else
                {
                    ShowError("操作失败!");
                }

                ShowData();
                frmparent.RefreshForm();
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

        private void dgv_CellDoubleClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.RowIndex != -1)
            {
                string sql = string.Format(@"select YearID, Lot, case Line when 'A' then '自动线'
                                                                           when 'M' then '手动线'
                                                                 end as Line,
                                                                 PackID, DelivID, 0 as chkcol,Bar2ID from [dbo].[C02Temp]
                                                                 where YearID={0} and DelivID={1}",
                                                                 dgv["YearID", e.RowIndex].Value.ToString(),
                                                                 dgv["DelivID", e.RowIndex].Value.ToString());
                new FormC2_Pack(this, "发料扫描项删除", sql).Show();
            }
        }

        private void FormC2_2_FormClosing(object sender, FormClosingEventArgs e)
        {
            if (needrefresh == true)
            {
                frmparent.RefreshForm();
            }
        }
    }
}
