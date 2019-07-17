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
using WHRawManager.Controls;

namespace WHRawManager
{
    public partial class FormTodayStatus : Form
    {
        DbHelper db = new DbHelper();
        Dictionary<string, VendorStatus> vsdic = new Dictionary<string, VendorStatus>();
        Panel parentpanel = null;
        bool IsMax = false;

        public FormTodayStatus()
        {
            InitializeComponent();
            chartpanel.Visible = false;
            flowLayoutPanel1.Visible = true;
        }

        private void SetMarkColor()
        {
            markok.BackColor = Color.FromArgb(192, 255, 192);
            markpart.BackColor = Color.FromArgb(255, 242, 0);
            markno.BackColor = Color.FromArgb(255, 174, 201);
            marklate.BackColor = Color.Red;
         }
        
        private void FormTodayStatus_Load(object sender, EventArgs e)
        {
            UpdateStatus();
        }

        private void FormTodayStatus_Resize(object sender, EventArgs e)
        {
            UpdateStatus();
        }

        public void UpdateStatus()
        {
            SetMarkColor();
            string todaystr = DateTime.Now.ToString("yyyy-MM-dd");
            DataTable dt = GetStatusTable(todaystr);
            DrawStatus(dt);
            DrawPieStatus(dt);
        }

        private DataTable GetStatusTable(string datetimestr)
        {
            string sql = string.Format(@"with 
                                    tbplan as
                                    (
	                                    select PurchDoc as PO,Item,Vendor,Material,sum(Qty) as Qty from Purdoc
																    where datediff(day, '{0}', [交付日期])=0   
																    group by PurchDoc,Item,Vendor,Material
                                    ),
                                    tbstore as
                                    (
	                                    select PO,Item,Rawsheet as Material,Sum(Qty) as Qty from Store 
																    where Code='C01' and 
																    datediff(day, '{0}', InputTime)=0 
																    group by PO,Item,Rawsheet
                                    ),
									tbtotal as  --PO数量
									(
										select a.PO,a.Item,a.Vendor,a.Material,a.Qty,Isnull(b.Qty,0) as Qty1
																	from tbplan a left join tbstore b 
																	on a.PO=b.PO and a.Item=b.Item
									),
									tbtotal2 as  --KM数量
									(
										select Vendor,Material,Sum(Qty) as Qty, Isnull(Sum(Qty1),0) as Qty1,
																	case when Sum(Qty)<=Isnull(Sum(Qty1),0) then 'finish'
																		 when Sum(Qty)>Isnull(Sum(Qty1),0) and Isnull(Sum(Qty1),0)>0 then 'part' 
																		 else 'none'
																	end as Status
												                    from tbtotal 
																	group by Vendor,Material
									)
									select Vendor, count(Status) as totalKM, 
												   count(case Status when 'finish' then Status end) as finishKM,
												   count(case Status when 'part' then Status end) as partKM,
												   count(case Status when 'none' then Status end) as noneKM,
												   Datediff(SECOND,Convert(varchar(100),getdate(),24), Isnull(b.GreenTime,'23:59:59')) as Secondfromgreen
												   from tbtotal2 a left join VendorList b
														on a.Vendor = b.Descript
												   group by Vendor,b.GreenTime",
                                                   datetimestr);

            DataTable dt = db.GetDataTable(sql);
            return dt;
        }


        //            Vendor           totalKM   finishKM   partKM    noneKM     Secondfromgreen
        //浙江物产金属集团有限公司	       9	       7	      1	        1	     -4292
        private void DrawStatus(DataTable dt)
        {
            int ControlWidth, ControlHeight;

            //每个控件的尺寸;
            VendorControlSize(dt.Rows.Count, out ControlWidth, out ControlHeight);

            foreach (DataRow dr in dt.Rows)
            {
                if(vsdic.ContainsKey(dr["Vendor"].ToString()))
                {
                    VendorStatus vst = vsdic[dr["Vendor"].ToString()];
                    vst.UpdateLayout((int)dr["totalKM"], (int)dr["finishKM"], (int)dr["partKM"] + (int)dr["noneKM"], ControlWidth, ControlHeight, ((int)dr["Secondfromgreen"]) > 0 ? false : true);
                }
                else
                {
                    VendorStatus vst = new VendorStatus(dr["Vendor"].ToString(), (int)dr["totalKM"], (int)dr["finishKM"], (int)dr["partKM"] + (int)dr["noneKM"], ControlWidth, ControlHeight, ((int)dr["Secondfromgreen"]) > 0 ? false : true);
                    this.flowLayoutPanel1.Controls.Add(vst);
                    vsdic.Add(dr["Vendor"].ToString(), vst);
                }
            }
        }

        private void DrawPieStatus(DataTable dt)
        {
            double finishnum = 0;
            double waitnum = 0;
            double delaynum = 0;
            double finp = 0;
            double waitp = 0;
            double delayp = 0;

            foreach(DataRow dr in dt.Rows)
            {
                finishnum += (int)dr["finishKM"];
                if ((int)dr["Secondfromgreen"] > 0)
                {
                    waitnum += (int)dr["partKM"] + (int)dr["noneKM"];     //待交货
                }
                else
                {
                    delaynum += (int)dr["partKM"] + (int)dr["noneKM"];   //延期
                }
            }

            if (finishnum + waitnum + delaynum >0)
            {
                finp = Math.Round(finishnum / (finishnum + waitnum + delaynum), 2)*100;
                waitp = Math.Round(waitnum/(finishnum + waitnum + delaynum), 2)*100;
                delayp = 100 - finp - waitp;
                chart1.Visible = true;
            }
            else
            {
                chart1.Visible = false;
                return;
            }

            List<string> xData = new List<string>() { "当日已交付种类", "当日待交付种类", "当日已延期种类"};
            List<double?> yData = new List<double?>() { finp == 0 ? (double?)null : finp, waitp==0 ? (double?)null : waitp, delayp==0 ? (double?)null : delayp };

            chart1.Series[0].CustomProperties = "DoughnutRadius=60, PieLabelStyle=Disabled, PieDrawingStyle=SoftEdge";
            chart1.Series[0]["PieLabelStyle"] = "Outside";//将文字移到外侧
            chart1.Series[0]["PieLineColor"] = "Black";//绘制黑色的连线。

            chart1.Series[0].Label = "#PERCENT{P}";  //显示百分比
            chart1.Series[0].LegendText = "#VALX";   //显示X名称

            chart1.Series[0].Points.DataBindXY(xData, yData);
            chart1.Series[0].Points[0].Color = Color.FromArgb(192, 255, 192);
            chart1.Series[0].Points[1].Color = Color.FromArgb(255, 174, 201);
            chart1.Series[0].Points[2].Color = Color.Red;
        }


        //每个Vendor控件的尺寸;
        private void VendorControlSize(int qty, out int mywidth, out int myheight)
        {
            int miniqty = 6;   //最少4个 2行
            if (qty > miniqty)
            {
                if (qty % 2 >0)
                {
                    miniqty = qty + 1;
                }
                else
                {
                    miniqty = qty;
                }               
            }

            int colnum = miniqty / 2; //每列的数量

            mywidth = (this.flowLayoutPanel1.Width - (colnum*2)*12)/colnum;
            myheight = (this.flowLayoutPanel1.Height - 4 * 12) / 2;

            return;
        }


        //防止闪烁
        /*protected override CreateParams CreateParams
        {
            get
            {
                CreateParams cp = base.CreateParams;
                cp.ExStyle |= 0x02000000; // Turn on WS_EX_COMPOSITED 
                return cp;
            }
        }*/

        private void pictureBox2_Click(object sender, EventArgs e)
        {
            MainForm.formsdic.Remove(this.Name);
            this.Close();
        }

        private void pictureBox3_Click(object sender, EventArgs e)
        {
            UpdateStatus();
        }

        //最大化
        private void label1_DoubleClick(object sender, EventArgs e)
        {
            parentpanel = this.Parent as Panel;

            this.Parent = null;
            this.TopLevel = true;
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.None; // 设置边框为 None
            this.WindowState = FormWindowState.Maximized; // 最大化
            this.TopMost = true; // 置顶
            this.KeyPreview = true;
            this.pictureBox2.Visible = false;
            this.pictureBox3.Visible = false;

            MainForm.formsdic.Remove(this.Name);

            IsMax = true;
        }

        //取消最大化
        private void FormTodayStatus_KeyUp(object sender, KeyEventArgs e)
        {
            if (IsMax && (e.KeyCode == Keys.Escape)) //“Esc” 按键退出全频
            {
                this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle; 
                this.WindowState = FormWindowState.Normal;
                this.TopMost = false; // 置顶                
                this.pictureBox2.Visible = true;
                this.pictureBox3.Visible = true;
                ShowForm(this, parentpanel);
                IsMax = false;
                timer1.Enabled = false;
                timer1.Enabled = true;
            }
        }

        private void ShowForm(Form frm, Panel ParentPanel)
        {
            if (MainForm.formsdic.ContainsKey(frm.Name))
            {
                frm.BringToFront();
                frm.Show();
            }
            else
            {
                frm.TopLevel = false;
                frm.FormBorderStyle = FormBorderStyle.None;
                frm.Dock = DockStyle.Fill;
                frm.Parent = ParentPanel;
                ParentPanel.Controls.Add(frm);
                MainForm.formsdic.Add(frm.Name, frm);
                frm.BringToFront();
                frm.Show();
            }
        }

        private void label1_Click(object sender, EventArgs e)
        {
            timer1.Enabled = true;
            timer2.Enabled = true;
        }

        private void timer1_Tick(object sender, EventArgs e)
        {
            UpdateStatus();
        }

        private void timer2_Tick(object sender, EventArgs e)
        {
            if(flowLayoutPanel1.Visible)
            {
                flowLayoutPanel1.Visible = false;
                markok.Visible = false;
                markpart.Visible = false;
                marklate.Visible = false;
                markno.Visible = false;
                chartpanel.Visible = true;
            }
            else
            {
                flowLayoutPanel1.Visible = true;
                markok.Visible = true;
                markpart.Visible = true;
                marklate.Visible = true;
                markno.Visible = true;
                chartpanel.Visible = false;
            }
        }
    }
}
