using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using FanNetWorld.Common;
using FanNetWorld.Data;
using FanNetWorldDataGridViewEx;

namespace WHRawManager
{
    public partial class FormDataMaintain : Form
    {
        CommClass cs = new CommClass();
        string tablename = string.Empty;

        static public readonly DataGridViewCellStyle DataCellStyle1 = new DataGridViewCellStyle
        {
            Alignment = DataGridViewContentAlignment.MiddleLeft,
            BackColor = Color.WhiteSmoke,
            Font = new Font("微软雅黑", (float)(11F), FontStyle.Regular, GraphicsUnit.Point),
            ForeColor = SystemColors.WindowText,
            SelectionBackColor = Color.FromArgb(155, 187, 89),
            SelectionForeColor = SystemColors.HighlightText,
            WrapMode = DataGridViewTriState.False
        };

        public FormDataMaintain()
        {
            InitializeComponent();
        }

        private void pictureBox2_Click(object sender, EventArgs e)
        {
            MainForm.formsdic.Remove(this.Name);
            this.Close();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            string wherestr = string.Empty;
            string sqlstr = string.Empty;

            if (this.rdtable1.Checked)
                tablename = "VendorList";
            else if (this.rdtable2.Checked)
                tablename = "Rack";
            else if (this.rdtable3.Checked)
                tablename = "RackLayout";
            else if (this.rdtable4.Checked)
                tablename = "RackRaw";
            else if (this.rdtable5.Checked)
                tablename = "Raw";
            else if(this.rdtable6.Checked)
            {
                tablename = "Stroe";
                sqlstr = "select KeyID, Code, Rawsheet as Material, Qty, InputTime, UserID from [dbo].[Store] ";
                wherestr = string.Format(" where Code='C100' and UserID='{0}' and DateDiff(day,[InputTime],'{1}')=0",User.UserID,DateTime.Now.ToString("yyyy-MM-dd"));
            }

            if (!string.IsNullOrEmpty(tablename))
            {
                ShowDataInDataGridView(tablename, this.dgv, wherestr,sqlstr);
            }
        }

        private void ShowDataInDataGridView(string sql, DataGridViewEx mydgv,string wherestr, string sqlstr)
        {
            mydgv.SetDataGridViewTheme2(true, false, "No", true, true, 32, 22, true, false, false);
            mydgv.DefaultCellStyle = DataCellStyle1;
            mydgv.AllowUserToOrderColumns = false;
            //mydgv.AllowUserToResizeColumns = false;
            mydgv.AllowUserToResizeRows = false;

            DataTable dt = cs.GetDataTable(sql, wherestr, sqlstr);

            this.bindingSource1.DataSource = dt;
            mydgv.DataSource = null;
            mydgv.DataSource = this.bindingSource1;
            mydgv.CurrentCell = null;
            if (this.rdtable6.Checked)
            {
                dt.TableName = "AdjustQty";
                mydgv.Columns["KeyID"].ReadOnly = true;
                mydgv.Columns["Code"].ReadOnly = true;
                mydgv.Columns["InputTime"].ReadOnly = true;
                mydgv.Columns["UserID"].ReadOnly = true;
                mydgv.Columns["KeyID"].Visible = false;
                mydgv.Columns["Code"].Visible = false;
                mydgv.Columns["InputTime"].Visible = false;
                mydgv.Columns["UserID"].Visible = false;
            }
        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.dgv.EndEdit();
            this.bindingSource1.EndEdit();
            DataTable dt = this.bindingSource1.DataSource as DataTable;
            for(int i = dt.Rows.Count-1; i>=0; i--)
            {
                bool rowempty = true;
                if(dt.Rows[i].RowState != DataRowState.Deleted)
                {
                    for (int j = 0; j < dt.Columns.Count; j++)
                    {
                        if (!Convert.IsDBNull(dt.Rows[i][j]))
                        {
                            rowempty = false;
                        }
                    }
                    if (rowempty)
                    {
                        dt.Rows.RemoveAt(i);
                    }
                }
            }

            if (this.rdtable6.Checked)
            {
                foreach (DataRow dr in dt.Rows)
                {
                    if (dr.RowState != DataRowState.Deleted)
                    {
                        if (Convert.IsDBNull(dr["Code"]))
                        {
                            dr["Code"] = "C100";
                        }
                        if (Convert.IsDBNull(dr["InputTime"]))
                        {
                            dr["InputTime"] = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
                        }
                        if (Convert.IsDBNull(dr["UserID"]))
                        {
                            dr["UserID"] = User.UserID;
                        }
                    }
                }
            }

            if(dt.Rows.Count == 0)
            {
                this.lblinfo.ForeColor = Color.Red;
                this.lblinfo.Text = "无数据需要保存";
                return;
            }
            try
            {
                if (this.dgv.DataSource == null) return;
                if(cs.Commit(this.dgv, this.bindingSource1) == true)
                {
                    this.lblinfo.ForeColor = Color.Green;
                    this.lblinfo.Text = tablename + "表数据保存成功!";
                }                
                else
                {
                    this.lblinfo.ForeColor = Color.Red;
                    this.lblinfo.Text = tablename + "表数据保存是发生异常!";
                }                    
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }

            if (this.rdtable6.Checked)
            {
                string tablename = "Stroe";
                string sqlstr = "select KeyID, Code, Rawsheet as Material, Qty, InputTime, UserID from [dbo].[Store] ";
                string wherestr = string.Format(" where Code='C100' and UserID='{0}' and DateDiff(day,[InputTime],'{1}')=0", User.UserID, DateTime.Now.ToString("yyyy-MM-dd"));
                ShowDataInDataGridView(tablename, this.dgv, wherestr, sqlstr);
            }
        }

        //Paste数据从剪贴板
        private void dgv_KeyDown(object sender, KeyEventArgs e)
        {
            if (Control.ModifierKeys == Keys.Control && e.KeyCode == Keys.V)
            {
                if (sender != null && sender.GetType() == typeof(DataGridViewEx))
                {
                    datagridview_PasteData(this.dgv);
                }
            }
        }

        /// <summary>
        /// 实现粘贴功能，将剪贴板中的内容粘贴到DataGridView中
        /// </summary>
        /// <param name="dgv_Test"></param>  
        private void datagridview_PasteData(DataGridView mydgv)
        {
            try
            {
                string clipboardText = Clipboard.GetText(); //获取剪贴板中的内容
                if (string.IsNullOrEmpty(clipboardText))
                {
                    return;
                }
                int colnum = 0;
                int rownum = 0;
                for (int i = 0; i < clipboardText.Length; i++)
                {
                    if (clipboardText.Substring(i, 1) == "\t")
                    {
                        colnum++;
                    }
                    if (clipboardText.Substring(i, 1) == "\n")
                    {
                        rownum++;
                    }
                }
                //粘贴板上的数据来源于EXCEL时，每行末尾都有\n，来源于DataGridView是，最后一行末尾没有\n
                if (clipboardText.Substring(clipboardText.Length - 1, 1) == "\n")
                {
                    rownum--;
                }
                colnum = colnum / (rownum + 1);
                object[,] data; //定义object类型的二维数组
                data = new object[rownum + 1, colnum + 1];  //根据剪贴板的行列数实例化数组
                string rowStr = "";
                //对数组各元素赋值
                for (int i = 0; i <= rownum; i++)
                {
                    for (int j = 0; j <= colnum; j++)
                    {
                        //一行中的其它列
                        if (j != colnum)
                        {
                            rowStr = clipboardText.Substring(0, clipboardText.IndexOf("\t"));
                            clipboardText = clipboardText.Substring(clipboardText.IndexOf("\t") + 1);
                        }
                        //一行中的最后一列
                        if (j == colnum && clipboardText.IndexOf("\r") != -1)
                        {
                            rowStr = clipboardText.Substring(0, clipboardText.IndexOf("\r"));
                        }
                        //最后一行的最后一列
                        if (j == colnum && clipboardText.IndexOf("\r") == -1)
                        {
                            rowStr = clipboardText.Substring(0);
                        }
                        data[i, j] = rowStr;
                    }
                    //截取下一行及以后的数据
                    clipboardText = clipboardText.Substring(clipboardText.IndexOf("\n") + 1);
                }

                DataTable mydt = (mydgv.DataSource as BindingSource).DataSource as DataTable;
                int rowIndex = mydgv.CurrentCell.RowIndex;
                int colIndex = mydgv.CurrentCell.ColumnIndex;

                int addrownum = rowIndex + rownum + 1 - mydt.Rows.Count;
                for (int i = 0; i < addrownum; i++)
                {
                    mydt.Rows.Add(mydt.NewRow());
                }

                for (int i = 0; i <= rownum; i++)
                {
                    for (int j = 0; j <= colnum; j++)
                    {
                        mydt.Rows[i + rowIndex][j + colIndex] = data[i, j];
                    }
                    if(mydt.TableName == "AdjustQty")
                    {
                        mydt.Rows[i + rowIndex]["Code"] = "C100";
                        mydt.Rows[i + rowIndex]["InputTime"] = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
                        mydt.Rows[i + rowIndex]["UserID"] = User.UserID;
                    }
                }

                //this.bindingSource1.DataSource = mydt;
            }
            catch
            {
                MessageBox.Show("粘贴区域大小不一致数据类型不一致");
                return;
            }
        }
    }
}
