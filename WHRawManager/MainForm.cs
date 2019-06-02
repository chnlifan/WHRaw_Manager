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

namespace WHRawManager
{
    public partial class MainForm : Form
    {
        string title = string.Empty;
        FormC1 frmc1 = null;
        FormC2 frmc2 = null;
        FormC1Query frmc1query = null;
        FormTodayStatus frmtoday = null;
        FormC2Query frmc2query = null;
        FormMaterialQuery frmmaterial = null;
        FormDataMaintain frmdatamaintain = null;
        FormRightSetting frmrightsetting = null;
        public static Dictionary<string, Form> formsdic = new Dictionary<string, Form>();

        public MainForm()
        {
            InitializeComponent();
        }
        
        private void MainForm_Load(object sender, EventArgs e)
        {
            title = this.Text;
            this.Text = title + " - 未登录";
        }

        //能看见一个所有的窗体显示
        private void ShowForm(Form frm, Panel ParentPanel)
        {
            if (formsdic.ContainsKey(frm.Name))
            {
                frm.BringToFront();
                frm.Show();
                if(frm is FormC1)
                {
                    (frm as FormC1).txtc1.Focus();
                }
                else if (frm is FormC2)
                {
                    (frm as FormC2).txtc1.Focus();
                }
            }
            else
            {
                frm.TopLevel = false;
                frm.FormBorderStyle = FormBorderStyle.None;
                frm.Dock = DockStyle.Fill;
                frm.Parent = ParentPanel;
                ParentPanel.Controls.Add(frm);
                formsdic.Add(frm.Name, frm);
                frm.BringToFront();
                frm.Show();
                if (frm is FormC1)
                {
                    (frm as FormC1).txtc1.Focus();
                }
                else if (frm is FormC2)
                {
                    (frm as FormC2).txtc1.Focus();
                }
            }
        }

        //只能看见一个窗体显示,其他隐藏
        private void ShowForm2(Form frm, Panel ParentPanel)
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

        //登录
        private void buttonlogo_Click(object sender, EventArgs e)
        {
            FormLog frmlog = new FormLog(this);
            frmlog.Left = this.Left + (this.Width - frmlog.Width) / 2;
            frmlog.Top = this.Top + (this.Height - frmlog.Height) / 2;
            frmlog.ShowDialog();
            if(!string.IsNullOrEmpty(User.UserID))
                this.Text = title + " - " + User.UserID;
        }

        //修改密码
        private void buttonpwd_Click(object sender, EventArgs e)
        {
            FormPwdChange frmchangepwd = new FormPwdChange(this);
            frmchangepwd.Left = this.Left + (this.Width - frmchangepwd.Width) / 2;
            frmchangepwd.Top = this.Top + (this.Height - frmchangepwd.Height) / 2;
            frmchangepwd.ShowDialog();
            if (!string.IsNullOrEmpty(User.UserID))
                this.Text = title + " - " + User.UserID;
        }
        
        //收货库位
        private void buttonc1_Click(object sender, EventArgs e)
        {
            if(frmc1 == null || frmc1.IsDisposed)
            {
                frmc1 = new FormC1();                
            }
            ShowForm(frmc1, this.panel1);
        }

        //收货查询
        private void buttonc1query_Click(object sender, EventArgs e)
        {
            if (frmc1query == null || frmc1query.IsDisposed)
            {
                frmc1query = new FormC1Query();
            }
            ShowForm(frmc1query, this.panel1);
        }

        //今日状态
        private void buttonc1today_Click(object sender, EventArgs e)
        {
            if (frmtoday == null || frmtoday.IsDisposed)
            {
                frmtoday = new FormTodayStatus();
            }
            ShowForm(frmtoday, this.panel1);
        }

        private void toolStripButton1_Click(object sender, EventArgs e)
        {
            if (frmc2 == null || frmc2.IsDisposed)
            {
                frmc2 = new FormC2();
            }
            ShowForm(frmc2, this.panel1);
        }

        private void buttonc2query_Click(object sender, EventArgs e)
        {
            if (frmc2query == null || frmc2query.IsDisposed)
            {
                frmc2query = new FormC2Query();
            }
            ShowForm(frmc2query, this.panel1);
        }

        private void toolStripButton1_Click_1(object sender, EventArgs e)
        {
            if (frmmaterial == null || frmmaterial.IsDisposed)
            {
                frmmaterial = new FormMaterialQuery();
            }
            ShowForm(frmmaterial, this.panel1);
        }

        private void toolStripButton1_Click_2(object sender, EventArgs e)
        {            
            if (frmdatamaintain == null || frmdatamaintain.IsDisposed)
            {
                frmdatamaintain = new FormDataMaintain();
            }
            ShowForm(frmdatamaintain, this.panel1);
        }

        private void toolStripButton1_Click_3(object sender, EventArgs e)
        {
            if (frmrightsetting == null || frmrightsetting.IsDisposed)
            {
                frmrightsetting = new FormRightSetting(this.toolStrip1);
            }
            ShowForm(frmrightsetting, this.panel1);
            
        }

        //应用权限
        public void ApplyMenusRight(string userid)
        {
            DbHelper db = new DbHelper();
            //this.buttonrightsetting.Enabled = true;
            
            string sql = string.Format(@"select ControlName as itemname, Isright from [UserRights] where UserID = '{0}' and ControlTag<>'管理员'", userid);
            DataTable dt = db.GetDataTable(sql);

            foreach(DataRow dr in dt.Rows)
            {
                string name = dr["itemname"].ToString();
                bool Isright = Convert.ToBoolean(dr["Isright"]);

                this.toolStrip1.Items[name].Enabled = User.IsAdmin ? true : Isright;
            }        
        }
    }
}
