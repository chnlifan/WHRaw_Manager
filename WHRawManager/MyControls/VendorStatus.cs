using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Configuration;
using FanNetWorld.IO;

namespace WHRawManager.Controls
{
    public partial class VendorStatus : UserControl
    {
        string Venodrstr = string.Empty;

        public VendorStatus()
        {
            InitializeComponent();   
        }

        public VendorStatus(string vendor, int total, int finish, int nofinish, int width1, int height1,bool delay = false)
        {
            InitializeComponent();
            Venodrstr = vendor;
            Vendorlab.BackColor = Color.FromArgb(0, 128, 128);

            this.Margin = new Padding(10);

            Vendorlab.Text = vendor;

            UpdateLayout(total, finish, nofinish, width1, height1, delay);

        }

        public void UpdateLayout(int total, int finish, int nofinish, int width1, int height1,bool delay = false)
        {
            this.Width = width1;
            this.Height = height1;

            lbltotalkmqty.Text = total.ToString();
            lblfinishkmqty.Text = finish.ToString();
            lblnofinkmqty.Text = nofinish.ToString();

            //设置各控件的大小
            int titleH = Convert.ToInt16(height1 * 1/6);
            int templayH = Convert.ToInt16(height1 * 5/6/3);
            int tempW = width1 * 5/8;
            int tempR = width1 * 3/8;

            Vendorlab.Height = titleH;

            lbltotalkm.Top = titleH ;
            lbltotalkm.Height = templayH;
            lbltotalkm.Width = tempW;

            lbltotalkmqty.Top = titleH;
            lbltotalkmqty.Left = tempW;
            lbltotalkmqty.Height = templayH;
            lbltotalkmqty.Width = tempR;

            lblfinishkm.Top = titleH + templayH;
            lblfinishkm.Height = templayH;
            lblfinishkm.Width = tempW;

            lblfinishkmqty.Top = titleH + templayH;
            lblfinishkmqty.Left = tempW;
            lblfinishkmqty.Height = templayH;
            lblfinishkmqty.Width = tempR;

            lblnofinkm.Top = titleH + templayH*2;
            lblnofinkm.Height = templayH;
            lblnofinkm.Width = tempW;

            lblnofinkmqty.Top = titleH + templayH*2;
            lblnofinkmqty.Left = tempW;
            lblnofinkmqty.Height = templayH;
            lblnofinkmqty.Width = tempR;

            float fontsize = CoolFont.FitStringRect("0" + Venodrstr + "0", Vendorlab.Font, Vendorlab.CreateGraphics(), new Rectangle(0, 0, width1, titleH));
            Vendorlab.Font = new Font("微软雅黑", fontsize, FontStyle.Bold, GraphicsUnit.Point);

            fontsize = CoolFont.FitStringRect("KM种类数量_总数总数", this.lbltotalkm.Font, this.lbltotalkm.CreateGraphics(), new Rectangle(0, 0, tempW, templayH));
            lbltotalkm.Font = new Font("微软雅黑", fontsize, FontStyle.Bold, GraphicsUnit.Point);
            lblfinishkm.Font = new Font("微软雅黑", fontsize, FontStyle.Bold, GraphicsUnit.Point);
            lblnofinkm.Font = new Font("微软雅黑", fontsize, FontStyle.Bold, GraphicsUnit.Point);

            fontsize = CoolFont.FitStringRect("99", this.lbltotalkmqty.Font, this.lbltotalkmqty.CreateGraphics(), new Rectangle(0, 0, tempR, templayH));
            lbltotalkmqty.Font = new Font("微软雅黑", fontsize, FontStyle.Bold, GraphicsUnit.Point);
            lblfinishkmqty.Font = new Font("微软雅黑", fontsize, FontStyle.Bold, GraphicsUnit.Point);
            lblnofinkmqty.Font = new Font("微软雅黑", fontsize, FontStyle.Bold, GraphicsUnit.Point);

            Setbackcolor(total, finish, nofinish, delay);
        }

        //设置背景色
        private void Setbackcolor(int total, int finish, int nofinish, bool delay)
        {
            //完成  -绿色
            if(total == finish)
            {
                this.BackColor = Color.FromArgb(192, 255, 192);
            }
            else if ((total > finish) && (finish >0)) //部分完成
            {
                this.BackColor = Color.FromArgb(255,242,0);
            }
            else if (total == nofinish) //未交付
            {
                if(delay == true)
                {
                    this.BackColor = Color.Red;   //延时 -- 红色
                }
                else
                {
                    this.BackColor = Color.FromArgb(255,174, 201);   //没有延时 -- 粉色
                }                
            }

        }
        
        //防止闪烁
        protected override CreateParams CreateParams
        {
            get
            {
                var parms = base.CreateParams;
                parms.Style &= ~0x02000000; // Turn off WS_CLIPCHILDREN 
                return parms;
            }
        }


    }
}
