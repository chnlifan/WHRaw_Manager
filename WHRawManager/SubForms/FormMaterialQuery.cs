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
using FanNetWorldDataGridViewEx;

namespace WHRawManager
{
    public partial class FormMaterialQuery : Form
    {
        DbHelper db = new DbHelper();

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

        public FormMaterialQuery()
        {
            InitializeComponent();
            LoadRawType();
        }

        private void LoadRawType()
        {
            string sql = "select distinct Mtype as rawtype from Raw order by MType";
            DataTable dt = db.GetDataTable(sql);

            DataRow dr = dt.NewRow();
            dr["rawtype"] = "--全部--";
            dt.Rows.InsertAt(dr, 0);

            this.cbrawtype.DataSource = dt.DefaultView;
            this.cbrawtype.DisplayMember = "rawtype";
            this.cbrawtype.ValueMember = "rawtype";
            this.cbrawtype.SelectedIndex = 0;
        }

        private string GetMaterialsList()
        {
            string list = string.Empty;
            foreach(string item in txtraw.Lines)
            {
                if(!string.IsNullOrEmpty(item.Trim()))
                {
                    if(string.IsNullOrEmpty(list))
                    {
                        list = "'" + item.ToString() + "'";
                    }
                    else
                    {
                        list = list + ",'" + item.ToString() + "'";
                    }
                }
            }
            return "(" + list + ")";
        }

        //库存查询
        private void button1_Click(object sender, EventArgs e)
        {
            List<string> wherelist = new List<string>();

            if(!string.IsNullOrEmpty(this.txtraw.Text))
            {
                wherelist.Add("a.Rawsheet in " + GetMaterialsList());
            }
            
            if(this.cbrawtype.Text != "--全部--")
            {
                wherelist.Add("b.MType='" + this.cbrawtype.Text.Trim() + "'");
            }

            string wherestr = "";
            if (wherelist.Count > 0)
            {
                wherestr = " where " + string.Join(" and ", wherelist.ToArray());
            }

            string sql = string.Format(@"select a.Rawsheet as Material, sum(Qty) as Qty, b.Description,b.Length, b.Width, b.Thick, b.MType
	                                                               from Store a left join Raw b
	                                                               on a.Rawsheet=b.Rawsheet
                                                                   {0}
	                                                               group by a.Rawsheet, b.Description, b.Length, b.Width, b.Thick, b.Mtype
	                                                               order by a.Rawsheet", wherestr);
            ShowDataInDataGridView(sql, this.dgv);

        }

        //负库存查询
        private void button3_Click(object sender, EventArgs e)
        {
            List<string> wherelist = new List<string>();

            if (!string.IsNullOrEmpty(this.txtraw.Text))
            {
                wherelist.Add("a.Rawsheet in " + GetMaterialsList());
            }

            if (this.cbrawtype.Text != "--全部--")
            {
                wherelist.Add("b.MType='" + this.cbrawtype.Text.Trim() + "'");
            }

            string wherestr = "";
            if (wherelist.Count > 0)
            {
                wherestr = " where " + string.Join(" and ", wherelist.ToArray());
            }

            string sql = string.Format(@"select a.Rawsheet as Material, sum(Qty) as Qty, b.Description,b.Length, b.Width, b.Thick, b.MType
	                                                               from Store a left join Raw b
	                                                               on a.Rawsheet=b.Rawsheet
                                                                   {0}
	                                                               group by a.Rawsheet, b.Description, b.Length, b.Width, b.Thick, b.Mtype
                                                                   having sum(Qty)<0
	                                                               order by a.Rawsheet", wherestr);
            ShowDataInDataGridView(sql, this.dgv);
        }

        //规格查询
        private void button2_Click(object sender, EventArgs e)
        {
            List<string> wherelist = new List<string>();

            if (!string.IsNullOrEmpty(this.txtraw.Text))
            {
                wherelist.Add("Rawsheet in " + GetMaterialsList());
            }

            if (this.cbrawtype.Text != "--全部--")
            {
                wherelist.Add(" MType='" + this.cbrawtype.Text.Trim() + "'");
            }

            string wherestr = "";
            if (wherelist.Count > 0)
            {
                wherestr = " where " + string.Join(" and ", wherelist.ToArray());
            }

            string sql = string.Format(@"select Rawsheet as Material, Description, Length, Width, Thick, Mtype from Raw {0} order by Rawsheet ", wherestr);
            ShowDataInDataGridView(sql, this.dgv);
        }
        
        private void ShowDataInDataGridView(string sql, DataGridViewEx mydgv)
        {
            mydgv.SetDataGridViewTheme2(true, false, "No", false, false, 32, 25, true, false, false);
            mydgv.DefaultCellStyle = DataCellStyle1;
            mydgv.AllowUserToOrderColumns = false;
            mydgv.AllowUserToResizeColumns = false;
            mydgv.AllowUserToResizeRows = false;
            mydgv.ReadOnly = true;

            DataTable dt = db.GetDataTable(sql);
            mydgv.DataSource = null;
            mydgv.DataSource = dt.DefaultView;
            mydgv.CurrentCell = null;
        }

        private void pictureBox2_Click(object sender, EventArgs e)
        {
            MainForm.formsdic.Remove(this.Name);
            this.Close();
        }

        private void button4_Click(object sender, EventArgs e)
        {
            this.txtraw.Clear();
        }
    }
}
