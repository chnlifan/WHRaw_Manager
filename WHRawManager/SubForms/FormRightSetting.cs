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
    public partial class FormRightSetting : Form
    {
        DbHelper db = new DbHelper();
        DataTable StructDt = null;

        //需要设定权限的工具条
        private ToolStrip tbstrip = null;
        private Dictionary<string, string> RightTagNamedic = new Dictionary<string, string>();

        static public readonly DataGridViewCellStyle DataCellStyle1 = new DataGridViewCellStyle
        {
            Alignment = DataGridViewContentAlignment.MiddleLeft,
            BackColor = Color.WhiteSmoke,
            Font = new Font("微软雅黑", (float)(13F), FontStyle.Regular, GraphicsUnit.Point),
            ForeColor = SystemColors.WindowText,
            SelectionBackColor = Color.FromArgb(155, 187, 89),
            SelectionForeColor = SystemColors.HighlightText,
            WrapMode = DataGridViewTriState.False
        };

        public FormRightSetting(ToolStrip tb)
        {
            InitializeComponent();
            tbstrip = tb;
            GetRightNameDic();
            CreateRightDatatable();
            ShowuserIDinTree(this.tv1, "操作人员");
        }

        private void GetRightNameDic()
        {
            RightTagNamedic.Add("管理员", "no");

            foreach (ToolStripItem tsb in tbstrip.Items)
            {
                if (tsb.GetType() == typeof(ToolStripButton))
                {
                    ToolStripButton tb = tsb as ToolStripButton;
                    if(tb.Tag.ToString() != "修改密码" && tb.Tag.ToString() != "登录")
                    {
                        RightTagNamedic.Add(tb.Tag.ToString(), tb.Name);
                    }                    
                }
            }            
        }

        //建立基本的权限表格
        private void CreateRightDatatable()
        {
            StructDt = new DataTable();
            StructDt.Columns.AddRange(new DataColumn[]
            {
                new DataColumn("菜单",typeof(string)),
                new DataColumn("权限",typeof(bool))
            });

            //添加主键
            StructDt.PrimaryKey = new DataColumn[]{ StructDt.Columns["菜单"]};

            foreach(string key in RightTagNamedic.Keys)
            {
                StructDt.Rows.Add(key, false);
            }

            DataRow dr = StructDt.NewRow();
        }

        //显示用户名在Treeview中
        private void ShowuserIDinTree(TreeView tv, string rootName)
        {
            TreeNode rootNode = null;
            TreeNode childNode = null;

            tv.Nodes.Clear();
            tv.ImageList = imgList;                                
            rootNode = new TreeNode();
            rootNode.Tag = null;
            rootNode.Text = rootName;

            rootNode.ImageIndex = 0;
            rootNode.SelectedImageIndex = 1;
            try
            {
                string sql = "select UserID from Users";
                DataTable dt = db.GetDataTable(sql);
                //从ds的表集合中取出指定名称的DataTable对象
                foreach (DataRow row in dt.Rows)
                {
                    childNode = new TreeNode();                     
                    childNode.Text = row["UserID"].ToString();      
                    childNode.Tag = row["UserID"].ToString();
                    childNode.ImageIndex = 0;                       
                    childNode.SelectedImageIndex = 1;               
                    rootNode.Nodes.Add(childNode);              
                }
                tv.Nodes.Add(rootNode);                         
                tv.ExpandAll();                                 
            }
            catch (Exception ex)
            {
                this.lblinfo.Text = ex.Message;
            }
        }
                
        private void pictureBox2_Click(object sender, EventArgs e)
        {
            MainForm.formsdic.Remove(this.Name);
            this.Close();
        }

        //选择一个节点
        private void tv1_AfterSelect(object sender, TreeViewEventArgs e)
        {
            if(this.tv1.SelectedNode != null)
            {
                if(this.tv1.SelectedNode.Tag != null)     //非根节点
                {
                    DataTable tempdt = StructDt.Copy();   //克隆一个datatable

                    string userid = this.tv1.SelectedNode.Text;
                    string sql = "select ControlTag as MenuName, Isright  from [dbo].[UserRights] where UserID='" + userid + "'";
                    DataTable qt = db.GetDataTable(sql);
                    if(qt.Rows.Count > 0)
                    {
                        foreach(DataRow dr in qt.Rows)
                        {
                            string menuname = dr["MenuName"].ToString();
                            bool isright = Convert.ToBoolean(dr["Isright"]);

                            DataRow dkr = tempdt.Rows.Find(menuname);
                            dkr["权限"] = isright;
                        }
                    }
                    this.dgv.DataSource = null;
                    this.dgv.DataSource = tempdt;
                    this.dgv.SetDataGridViewTheme2(true, false, "NO", false, false, 32, 30, true, false, false);
                    this.dgv.DefaultCellStyle = DataCellStyle1;
                    this.dgv.CurrentCell = null;
                }
            }
        }

        //保存权限设定
        private void button1_Click(object sender, EventArgs e)
        {
            if((this.tv1.SelectedNode == null) || (this.tv1.SelectedNode.Tag == null))
            {
                this.lblinfo.Text = "不能保存!";
                return;
            }

            string userid = this.tv1.SelectedNode.Text;
            DataTable dt = this.dgv.DataSource as DataTable;

            if (dt == null) return;

            try
            {
                foreach (DataRow dr in dt.Rows)
                {
                    string itemtag = dr["菜单"].ToString();
                    bool Isright = Convert.ToBoolean(dr["权限"]);

                    //更新数据库权限表
                    string sql = string.Format(@"select count(*) from UserRights where UserID='{0}' and ControlTag='{1}'",
                                                                                                            userid, itemtag);
                    if (Convert.ToInt16(db.GetSingleObject(sql)) == 0) //没有这一项，需要添加
                    {
                        sql = string.Format(@"Insert into UserRights(UserID,ControlTag,ControlName,Isright) Values('{0}','{1}','{2}',{3})",
                                                    userid, itemtag, RightTagNamedic[itemtag], Isright ? 1 : 0);
                        db.ExecuteNonQuery(sql);
                    }
                    else  //需要更新
                    {
                        sql = string.Format(@"Update UserRights set Isright={0} where UserID='{1}' and ControlTag='{2}'",
                                             Isright ? 1 : 0, userid, itemtag);
                        db.ExecuteNonQuery(sql);
                    }
                }
                ShowInfo(userid + "权限保存成功!");
            }
            catch(Exception ex)
            {
                ShowError(ex.Message);
            }

        }


        private void ShowError(string msg)
        {
            this.lblinfo.ForeColor = Color.Red;
            this.lblinfo.Text = msg;
        }

        private void ShowInfo(string msg)
        {
            this.lblinfo.ForeColor = Color.Yellow;
            this.lblinfo.Text = msg;
        }

    }
}
