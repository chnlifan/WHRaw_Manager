using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using FanNetWorld.Crypt;
using FanNetWorld.Data;

namespace WHRawManager
{
    public partial class FormLog : Form
    {
        private MainForm mfrm = null;

        public FormLog(MainForm fm)
        {
            InitializeComponent();
            mfrm = fm;
        }

        private void FormLog_Load(object sender, EventArgs e)
        {
            txtuser.Enabled = false;
            txtuser.Text = Environment.UserName;
        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            if(string.IsNullOrEmpty(txtpassword.Text))
            {
                MessageBox.Show("密码不能为空!");
                txtpassword.Focus();
                return;
            }
            string user = txtuser.Text;
            string password = txtpassword.Text;
            string pwd = MD5Helper.Md5Encrypt(password);

            DbHelper db = new DbHelper();
            if (Convert.ToInt16(db.GetSingleObject(string.Format("select count(*) from Users where UserID='{0}'",user)))==1)  //发现用户名
            {
                if (Convert.ToInt16(db.GetSingleObject(string.Format("select count(*) from Users where UserID='{0}' and Password='{1}'", user, pwd))) == 1)
                {                    
                    User.UserID = user;
                    //查询是否是管理员
                    string s1 = string.Format(@"select count(*) from [UserRights] where UserID='{0}' and ControlTag='管理员' and Isright=1", User.UserID);
                    if (Convert.ToInt16(db.GetSingleObject(s1))>0)
                    {
                        User.IsAdmin = true;
                    }
                    else
                    {
                        User.IsAdmin = false;
                    }

                    this.Close();
                    mfrm.buttonpwd.Enabled = true;

                    //根据权限,定义菜单的使用
                    mfrm.ApplyMenusRight(User.UserID);
                }
                else
                {
                    MessageBox.Show("密码错误,请重新输入!");
                    txtpassword.Focus();
                    txtpassword.Clear();
                }
            }
            else  //没有此用户名,用初始密码
            {
                if(Convert.ToInt16(db.GetSingleObject(string.Format("select count(*) from Users where UserID='{0}' and Password='{1}'", "guest", pwd))) == 1)
                {
                    User.UserID = "guest";
                    User.IsAdmin = false;
                    this.Close();
                    mfrm.buttonpwd.Enabled = true;
                    mfrm.ApplyMenusRight(User.UserID);
                    MessageBox.Show("临时密码, 请立即更改密码!");                   
                }
                else
                {
                    MessageBox.Show("密码错误,请重新输入!");
                    txtpassword.Focus();
                    txtpassword.Clear();
                }
            }
        }
    }
}
