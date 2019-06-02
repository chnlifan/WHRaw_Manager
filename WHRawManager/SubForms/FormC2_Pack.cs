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
    public partial class FormC2_Pack : Form
    {
        DbHelper db = new DbHelper();
        FormC2_2 frm = null;
        string sqlquery = string.Empty;

        public FormC2_Pack()
        {
            InitializeComponent();
        }

        public FormC2_Pack(FormC2_2 frmparent, string title, string sql)
        {
            InitializeComponent();
            sqlquery = sql;
            this.Text = title;
            frm = frmparent;

            this.dgv.SetDataGridViewTheme2(true, false, "No", false, false, 32, 25, true, false, false);
            this.dgv.AllowUserToOrderColumns = false;
            this.dgv.AllowUserToResizeColumns = false;
            this.dgv.AllowUserToResizeRows = false;
         
            ShowDataInDataGridView(this.dgv, sqlquery);

        }

        private void ShowDataInDataGridView(DataGridView dgv0, string sql)
        {
            DataTable dt = db.GetDataTable(sql);
            dt.Columns["chkcol"].ReadOnly = false;
            dgv0.DataSource = dt.DefaultView;
            dgv0.CurrentCell = null;
        }

        private void button2_Click_1(object sender, EventArgs e)
        {
            StringBuilder sql = new StringBuilder();

            foreach (DataGridViewRow gr in this.dgv.Rows)
            {
                if (!Convert.IsDBNull(gr.Cells["chkcol"].Value))
                {
                    if (Convert.ToBoolean(gr.Cells["chkcol"].Value))
                    {
                        if (string.IsNullOrEmpty(sql.ToString()))
                        {
                                sql.AppendFormat(" YearID='{0}' and DelivID='{1}' ", gr.Cells["YearID"].Value.ToString(), gr.Cells["DelivID"].Value.ToString());
                        }
                        else
                        {
                                sql.AppendFormat("or YearID='{0}' and DelivID='{1}' ", gr.Cells["YearID"].Value.ToString(), gr.Cells["DelivID"].Value.ToString());
                        }
                    }
                }
            }
            if (!string.IsNullOrEmpty(sql.ToString()))  //需要更新
            {
                string wherestr = sql.ToString();
                if (this.dgv.Rows.Count > 0)
                {
                    string sql1 = string.Format("delete from C02 where {0}", wherestr);
                    string sql2 = string.Format("delete from C02Temp where {0}", wherestr);

                    bool result = db.TransactionDataBase(new List<string>
                    {
                        sql1,
                        sql2
                    });

                    ShowDataInDataGridView(this.dgv, sqlquery);

                    //更新父窗体体的数据
                    frm.ShowData();
                    frm.needrefresh = true;
                }
            }
        }
    }
}
