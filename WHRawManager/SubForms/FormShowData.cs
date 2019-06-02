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
    public partial class FormShowData : Form
    {
        DbHelper db = new DbHelper();
        string sql = string.Empty;

        public FormShowData()
        {
            InitializeComponent();
        }

        public FormShowData(string title, string sql0)
        {
            InitializeComponent();
            this.Text = title;
            sql = sql0;
        }

        private void FormShowData_Load(object sender, EventArgs e)
        {
            this.dgv.SetDataGridViewTheme2(true, false, "No", false, false, 32, 25, true, true, false);
            this.dgv.AllowUserToOrderColumns = false;
            this.dgv.AllowUserToResizeColumns = false;
            this.dgv.AllowUserToResizeRows = false;
            this.dgv.ReadOnly = true;

            ShowDataInDataGridView(this.dgv, sql);
            this.dgv.CurrentCell = null;
        }

        private void ShowDataInDataGridView(DataGridViewEx dgv, string sql)
        {
            DataTable dt = db.GetDataTable(sql);
            //dgv.DataSource = null;
            dgv.DataSource = dt.DefaultView;
        }

    }
}
