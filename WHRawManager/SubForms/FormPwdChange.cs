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
    public partial class FormPwdChange : Form
    {
        private MainForm mfrm = null;

        public FormPwdChange(MainForm fm)
        {
            InitializeComponent();
            mfrm = fm;
        }

        private void FormPwdChange_Load(object sender, EventArgs e)
        {
            txtuser.Text = Environment.UserName;
        }

        private void button1_Click(object sender, EventArgs e)
        {
            if(string.IsNullOrEmpty(txtoldpwd.Text))
            {
                MessageBox.Show("旧密码不能为空!");
                return;
            }
            if(string.IsNullOrEmpty(txtnewpwd.Text))
            {
                MessageBox.Show("新密码不能为空!");
                return;
            }

            string user = txtuser.Text;
            string oldpassword = txtoldpwd.Text;
            string newpassword = txtnewpwd.Text;
            string oldpwd = MD5Helper.Md5Encrypt(oldpassword);
            string newpwd = MD5Helper.Md5Encrypt(newpassword);

            //检查旧密码是否正确
            DbHelper db = new DbHelper();
            if(User.UserID == "guest")  //还没有更改过密码
            {
                if (Convert.ToInt16(db.GetSingleObject(string.Format("select count(*) from Users where UserID='{0}' and Password='{1}'", "guest", oldpwd))) == 1) //旧密码正确
                {
                    db.ExecuteNonQuery(string.Format("Insert into Users(UserID, Password) Values('{0}','{1}')", user, newpwd));
                    User.UserID = user;
                    mfrm.ApplyMenusRight(User.UserID);
                    this.Close();
                }
                else
                {
                    MessageBox.Show("旧密码错误!");
                    return;
                }

            }
            else  //已经有自己账号了
            {
                if (Convert.ToInt16(db.GetSingleObject(string.Format("select count(*) from Users where UserID='{0}' and Password='{1}'", user, oldpwd))) == 1) //旧密码正确
                {
                    db.ExecuteNonQuery(string.Format("Update Users set Password='{0}' where UserID='{1}'", newpwd, user));
                    mfrm.ApplyMenusRight(User.UserID);
                    this.Close();
                }  
                else
                {
                    MessageBox.Show("旧密码错误!");
                    return;                    
                }
            }

        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}
