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
    public partial class FormC2Query : Form
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

        public FormC2Query()
        {
            InitializeComponent();
            this.datepickfrom.Value = DateTime.Now;
            this.datepickto.Value = DateTime.Now;
            this.txtyear.Text = DateTime.Now.Year.ToString().Substring(2, 2);
        }

        private void button1_Click(object sender, EventArgs e)
        {
            string cat = "";
            if(radioButton1.Checked)
            {
                cat = "('C02')";
            }
            else if(radioButton2.Checked)
            {
                cat = "('C03')";
            }
            else if (radioButton3.Checked)
            {
                cat = "('C04')";
            }
            else if (radioButton4.Checked)
            {
                cat = "('C06')";
            }
            else if (radioButton5.Checked)
            {
                cat = "('C02','C03','C04','C06')";
            }

            string sql = string.Format(@"select YearID as Year, Code, Lot,
					                            case Line when 'A' then '自动线'
					                                      when 'M' then '手动线'
					                            end as Line, 
					                            PackID, Rawsheet as Material, -Qty as 发货量, Isnull(-NeedQty,-Qty) as 实需量, Convert(varchar(100), InputTime, 23) as Date, UserID
					                            from Store 
					                            where Code in {0} and 
						                              DateDiff(day, '{1}', InputTime)>=0 and 
					                                  DateDiff(day, InputTime, '{2}')>=0 
					                            order by YearID,Code,Lot,Line,PackID,Material",
                                                cat, datepickfrom.Value.ToString("yyyy-MM-dd"), datepickto.Value.ToString("yyyy-MM-dd"));

            ShowDataInDataGridView(sql, this.dgv);
        }

        //汇总查询
        private void button2_Click(object sender, EventArgs e)
        {
            string cat = "";
            if (radioButton1.Checked)
            {
                cat = "('C02')";
            }
            else if (radioButton2.Checked)
            {
                cat = "('C03')";
            }
            else if (radioButton3.Checked)
            {
                cat = "('C04')";
            }
            else if (radioButton4.Checked)
            {
                cat = "('C06')";
            }
            else if (radioButton5.Checked)
            {
                cat = "('C02','C03','C04','C06')";
            }

            string sql = string.Format(@"select YearID as Year, Code,Rawsheet as Material, sum(-Qty) as 发货量, Isnull(sum(-NeedQty),sum(-Qty)) as 实需量
					                                from Store 
					                                where Code in {0} and 
						                                  DateDiff(day, '{1}', InputTime)>=0 and 
					                                      DateDiff(day, InputTime, '{2}')>=0 
                                                    group by YearID,Code,Rawsheet
					                                order by YearID,Code,Rawsheet",
                                                    cat, datepickfrom.Value.ToString("yyyy-MM-dd"), datepickto.Value.ToString("yyyy-MM-dd"));

            ShowDataInDataGridView(sql, this.dgv);
        }

        private void ShowDataInDataGridView(string sql, DataGridViewEx mydgv)
        {
            mydgv.SetDataGridViewTheme2(true, false, "No", false, false, 32, 25, true, false, false);
            mydgv.DefaultCellStyle = DataCellStyle1;
            mydgv.AllowUserToOrderColumns = false;
            //mydgv.AllowUserToResizeColumns = false;
            mydgv.AllowUserToResizeRows = false;
            mydgv.ReadOnly = true;

            DataTable dt = db.GetDataTable(sql);
            mydgv.DataSource = null;
            mydgv.DataSource = dt.DefaultView;
            mydgv.CurrentCell = null;
        }


        //批次发料查询
        private void button4_Click(object sender, EventArgs e)
        {

            if (string.IsNullOrEmpty(this.txtyear.Text) || string.IsNullOrEmpty(this.txtlot.Text))
            {
                MessageBox.Show("年度和批次框不能为空！");
                return;
            }

            string lotstr = "";
            if(rdlot1.Checked)
            {
                lotstr = string.Format(@" like '{0}%' ", this.txtlot.Text.Trim());
            }
            else
            {
                lotstr = string.Format(@"='{0}' ", this.txtlot.Text.Trim());
            }
            string sql=string.Format(@"select YearID as Year, Code, Lot,
					                            case Line when 'A' then '自动线'
					                                      when 'M' then '手动线'
					                            end as Line, PackID,
					                            Rawsheet as Material, -Qty as 发货量, Isnull(-NeedQty, -Qty) as 实需量, Convert(varchar(100), InputTime, 23) as Date, UserID
					                            from Store 
					                            where lot {0} and
					                                  YearID = {1} and
						                              Code in ('C02','C03','C04','C06')
					                            order by YearID,Code,Lot,Line,PackID,Rawsheet",
                                                lotstr, this.txtyear.Text);
            ShowDataInDataGridView(sql, this.dgv);
        }
        

        //批次查询汇总
        private void button3_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(this.txtyear.Text) || string.IsNullOrEmpty(this.txtlot.Text))
            {
                MessageBox.Show("年度和批次框不能为空！");
                return;
            }

            string lotstr = "";
            if (rdlot1.Checked)
            {
                lotstr = string.Format(@" like '{0}%' ", this.txtlot.Text.Trim());
            }
            else
            {
                lotstr = string.Format(@" = '{0}' ", this.txtlot.Text.Trim());
            }
            string sql = string.Format(@"select YearID as Year, Code, Lot, Rawsheet as Material, sum(-Qty) as 发货量, Isnull(sum(-NeedQty),sum(-Qty)) as 实需量
					                            from Store 
					                            where lot {0} and
					                                  YearID = {1} and
						                              Code in ('C02','C03','C04','C06')
                                                group by YearID,Code,Lot,Rawsheet
					                            order by YearID,Code,Lot,Rawsheet",
                                                lotstr, this.txtyear.Text);
            ShowDataInDataGridView(sql, this.dgv);
        }


        private void pictureBox2_Click(object sender, EventArgs e)
        {
            MainForm.formsdic.Remove(this.Name);
            this.Close();
        }
    }
}
