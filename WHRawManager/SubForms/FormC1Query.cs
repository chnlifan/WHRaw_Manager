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
    public partial class FormC1Query : Form
    {
        DbHelper db = new DbHelper();
        bool QueryExcept = false;
        

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

        public FormC1Query()
        {
            InitializeComponent();
            this.datepickfrom.Value = DateTime.Now;
            this.datepickto.Value = DateTime.Now;
        }

        private void button1_Click(object sender, EventArgs e)
        {
            QueryExcept = false;
            string sql = "";
            if(this.radioButton1.Checked)
            {                
                sql = string.Format(@"select PurchDoc as PO, Item, Vendor, Material, ShortText, Qty, Unit, CONVERT(varchar(100), Delivdate, 23) as Delivdate,
																	 CONVERT(varchar(100), [交付日期], 23) as 交付日期,[计划确认人] as 确认人,
																	 CONVERT(varchar(100), [发送日期], 23) as 发送日期, 
																	 Status as 状态 
																	 from [dbo].[Purdoc]
																	 where DateDiff(day, '{0}', [交付日期])>=0 and 
																		   DateDiff(day, [交付日期], '{1}')>=0",
                                                                     this.datepickfrom.Value.ToString("yyyy-MM-dd"), this.datepickto.Value.ToString("yyyy-MM-dd"));
            }
            else if(this.radioButton2.Checked)
            {
                sql = string.Format(@"select Code, PO, Item, Rawsheet as Material, Qty, PackID, CONVERT(varchar(100), InputTime, 23) as Date, UserID  from [dbo].[Store]
																	 where Code='C01' and 
                                                                           DateDiff(day, '{0}', InputTime)>=0 and 
																	  	   DateDiff(day, InputTime, '{1}')>=0
																     order by CONVERT(varchar(100), InputTime, 23), PO, Item, PackID",
                                                                     this.datepickfrom.Value.ToString("yyyy-MM-dd"), this.datepickto.Value.ToString("yyyy-MM-dd"));
            }
            else if(this.radioButton3.Checked)
            {
                QueryExcept = true;
                sql =string.Format(@"with 
                                    tbplan as
                                    (
	                                    select  CONVERT(varchar(100), [交付日期], 23) as [交付日期],PurchDoc as PO,Item,Vendor,Material,ShortText,sum(Qty) as Qty from Purdoc
																                                     where datediff(day, '{0}', [交付日期])>=0 and  
																	                                       datediff(day, [交付日期], '{1}')>=0
																                                     group by CONVERT(varchar(100),[交付日期], 23),PurchDoc,Item,Vendor,Material,ShortText
                                    ),
                                    tbstore as
                                    (
	                                    select Code, CONVERT(varchar(100), InputTime, 23) as [收货日期],PO,Item,Rawsheet as Material,Sum(Qty) as Qty from [dbo].[Store] 
																                                    where Code='C01' and 
																                                    datediff(day, '{0}', InputTime)>=0 and
																                                    datediff(day, InputTime, '{1}')>=0
																                                    group by Code, CONVERT(varchar(100), InputTime, 23),PO,Item,Rawsheet
                                    )
                                    select 	case when a.Vendor is null then '非计划'
												 when Isnull(a.Qty,0)>Isnull(b.Qty,0) then '部分'
												 when Isnull(a.Qty,0)<Isnull(b.Qty,0) then '超量'
                                                 end as VS,
                                                 b.Code,
                                                 IsNull(a.PO,b.PO) as PO,IsNull(a.Item,b.Item) as Item,a.Vendor,IsNull(a.Material,b.Material) as Material,a.ShortText,a.[交付日期],IsNull(a.Qty,0) as 计划数量,IsNull(b.Qty,0) as 收货数量,b.[收货日期]
																                                    from tbplan a full join tbstore b 
																                                    on a.[交付日期]=b.[收货日期] and a.PO=b.PO and a.Item=b.Item and a.Material=b.Material
																                                    where IsNull(a.Qty,0)<>IsNull(b.Qty,0)
																                                    order by PO,Item",
                                                                                                    this.datepickfrom.Value.ToString("yyyy-MM-dd"), this.datepickto.Value.ToString("yyyy-MM-dd"));
            }
            else if(this.radioButton4.Checked)
            {
                sql = string.Format(@"select ID, Code, Rawsheet as Material, Qty, CONVERT(varchar(100), InputTime, 23) as Date, UserID 
                                                                     from [dbo].[Store]
																	 where Code in ('C05','C07') and 
                                                                           DateDiff(day, '{0}', InputTime)>=0 and 
																	  	   DateDiff(day, InputTime, '{1}')>=0
																     order by Code, CONVERT(varchar(100), InputTime, 23)",
                                                                     this.datepickfrom.Value.ToString("yyyy-MM-dd"), this.datepickto.Value.ToString("yyyy-MM-dd"));
            }
            ShowDataInDataGridView(sql, this.dgv);
        }

        //汇总查询
        private void button2_Click(object sender, EventArgs e)
        {
            QueryExcept = false;
            string sql = "";
            if (this.radioButton1.Checked)
            {
                sql = string.Format(@"select Vendor, Material, ShortText, sum(Qty) as 计划总量 
                                                                from Purdoc 
                                                                where DateDiff(day, '{0}', [交付日期])>=0 and 
																	  DateDiff(day, [交付日期], '{1}')>=0                    
                                                                group by Vendor, Material, ShortText order by Vendor, Material, Sum(Qty) desc",
                                                                this.datepickfrom.Value.ToString("yyyy-MM-dd"), this.datepickto.Value.ToString("yyyy-MM-dd"));

            }
            else if (this.radioButton2.Checked)
            {
                sql = string.Format(@"select Code, a.Rawsheet as Material, b.Description, Sum(Qty) as 收货总量
                                                                 from Store a left join Raw b on a.Rawsheet = b.Rawsheet 
																 where a.Code='C01' and 
                                                                       DateDiff(day, '{0}', InputTime)>=0 and 
																 	   DateDiff(day, InputTime, '{1}')>=0
                                                                 group by Code, a.Rawsheet, b.Description order by Sum(Qty) desc",
                                                                 this.datepickfrom.Value.ToString("yyyy-MM-dd"), this.datepickto.Value.ToString("yyyy-MM-dd"));
            }
            else if (this.radioButton3.Checked)
            {
                sql=string.Format(@"with 
                                    tbplan as
                                    (
	                                    select  CONVERT(varchar(100), [交付日期], 23) as [交付日期],PurchDoc as PO,Item,Vendor,Material,ShortText,sum(Qty) as Qty from Purdoc
																                                     where datediff(day, '{0}', [交付日期])>=0 and  
																	                                       datediff(day, [交付日期], '{1}')>=0
																                                     group by CONVERT(varchar(100),[交付日期], 23),PurchDoc,Item,Vendor,Material,ShortText
                                    ),
                                    tbstore as
                                    (
	                                    select Code, CONVERT(varchar(100), a.InputTime, 23) as [收货日期],b.Vendor,a.PO,a.Item,a.Rawsheet as Material,Sum(a.Qty) as Qty 
																									from Store a left join Purdoc b on a.PO=b.PurchDoc and a.Item=b.Item 
																                                    where Code='C01' and 
																                                    datediff(day, '{0}', a.InputTime)>=0 and
																                                    datediff(day, a.InputTime, '{1}')>=0
																                                    group by Code, CONVERT(varchar(100), a.InputTime, 23),a.PO,a.Item,a.Rawsheet,b.Vendor
                                    ),
									tbtotal as
									(
										select Code, Isnull(a.Vendor,b.Vendor) as Vendor, count(*) as Totalcount
																									from tbplan a left join tbstore b 
																									on a.[交付日期]=b.[收货日期] and a.PO=b.PO and a.Item=b.Item and a.Material=b.Material
																									group by Code, Isnull(a.Vendor,b.Vendor)
									),
									tbexcept as 
									(
										select Isnull(a.Vendor,b.Vendor) as Vendor, count(*) as Exceptcount
																									from tbplan a full join tbstore b 
																									on a.[交付日期]=b.[收货日期] and a.PO=b.PO and a.Item=b.Item and a.Material=b.Material
																									where IsNull(a.Qty,0)<>IsNull(b.Qty,0)
																									group by Isnull(a.Vendor,b.Vendor)																											
									)
									select a.Code, a.Vendor, a.Totalcount as 总次数, IsNull(b.Exceptcount,0) as 异常次数, Convert(varchar(10),ROUND(Convert(float,IsNull(b.Exceptcount,0))/Convert(float,a.Totalcount),4)*100)+'%' as 异常百分比  
											                                                        from tbtotal a left join tbexcept b
																									on a.Vendor = b.Vendor",
                                                                                                    this.datepickfrom.Value.ToString("yyyy-MM-dd"), this.datepickto.Value.ToString("yyyy-MM-dd"));
            }
            else if (this.radioButton4.Checked)
            {
                sql = string.Format(@"select Code, Rawsheet as Material, sum(Qty) as 总数量
                                                                     from [dbo].[Store]
																	 where Code in ('C05','C07') and 
                                                                           DateDiff(day, '{0}', InputTime)>=0 and 
																	  	   DateDiff(day, InputTime, '{1}')>=0
                                                                     group by Code,Rawsheet
																     order by Code,Rawsheet",
                                                                     this.datepickfrom.Value.ToString("yyyy-MM-dd"), this.datepickto.Value.ToString("yyyy-MM-dd"));
            }

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
        
        private void dgv_CellDoubleClick(object sender, DataGridViewCellEventArgs e)
        {
            if(QueryExcept == false)
            {
                return;
            }

            if(e.RowIndex != -1 )
            {
                this.txtpo.Text = this.dgv["PO", e.RowIndex].Value.ToString();
                this.txtitem.Text = this.dgv["Item", e.RowIndex].Value.ToString();

                if (QueryExcept)
                {
                    string sql = string.Format(@"select PO, Item, Rawsheet as Material, Qty, PackID, CONVERT(varchar(100), InputTime, 23) as Date from Store where PO = '{0}' and Item = '{1}' order by PackID",
                                                                                                                                                                    dgv["PO", e.RowIndex].Value.ToString(),
                                                                                                                                                                    dgv["Item", e.RowIndex].Value.ToString());
                    new FormShowData("已收货项", sql).Show();
                }
            }

        }

        //PO 计划查询
        private void button3_Click(object sender, EventArgs e)
        {
            QueryExcept = false;

            if (string.IsNullOrEmpty(this.txtpo.Text) || string.IsNullOrEmpty(this.txtitem.Text))
            {
                MessageBox.Show("PO和Item框不能为空！");
                return;
            }

            string sql = string.Format(@"select PurchDoc as PO,Item,Vendor,Material,ShortText,Qty,Unit,CONVERT(varchar(100),Delivdate,23) as Delivdate,
                                                CONVERT(varchar(100),[交付日期], 23) as 交付日期,计划确认人,CONVERT(varchar(100),[发送日期], 23) as 发送日期,
                                                FromFile,Status from Purdoc
                                                where PurchDoc='{0}' and Item='{1}'",
                                                this.txtpo.Text, this.txtitem.Text);
            ShowDataInDataGridView(sql, this.dgv);
        }

        //PO 收货查询
        private void button4_Click(object sender, EventArgs e)
        {
            QueryExcept = false;

            if (string.IsNullOrEmpty(this.txtpo.Text) || string.IsNullOrEmpty(this.txtitem.Text))
            {
                MessageBox.Show("PO和Item框不能为空！");
                return;
            }

            string sql=string.Format(@"select PO,Item,Rawsheet as Material,Qty,PackID,CONVERT(varchar(100),InputTime,23) as 收货日期,UserID as 操作员
                                                from [dbo].[Store]
                                                where PO='{0}' and Item='{1}'",
                                                this.txtpo.Text, this.txtitem.Text);
            ShowDataInDataGridView(sql, this.dgv);
        }

        private void pictureBox2_Click(object sender, EventArgs e)
        {
            MainForm.formsdic.Remove(this.Name);
            this.Close();
        }

        //今日没有完成的订单
        private void button5_Click(object sender, EventArgs e)
        {
            QueryExcept = true;

            string sql = string.Format(@"with tbplan
	                        as
	                        (   ---没有完成的订单
		                        select a.Vendor, a.PurchDoc as PO, a.Item, a.Material, CONVERT(varchar(100), a.[交付日期], 23) as [交付日期], sum(Qty) as Qty 
													                        from PurDoc a 
													                        where DateDiff(day, a.[交付日期],'{0}')=0 and Status is null
													                        group by a.Vendor,a.PurchDoc,a.Item,a.Material,CONVERT(varchar(100), a.[交付日期], 23)
	                        ),
                            tbstore
	                        as
	                        (  ---没有完成的订单中已部分收货数量
		                        select a.PO, a.Item, a.Rawsheet as Material, sum(a.Qty) as Qty
												                         from Store a 
												                         where a.Code='C01' and (a.PO + '-' + a.Item + '-' + a.Rawsheet in (select PurchDoc + '-' + Item + '-' + Material from Purdoc where DateDiff(day,[交付日期],'{0}')=0 and Status is null )
																		 ---or DateDiff(day,a.InputTime,'{0}')=0   ---非计划收货	
																			)
												                         group by a.PO, a.Item, a.Rawsheet
	                        ),
	                        tb1
	                        as
	                        (
		                        select a.Vendor as Vendor, Isnull(a.PO,b.PO) as PO, Isnull(a.Item,b.Item) as Item, Isnull(a.Material,b.Material) as Material,a.[交付日期],a.Qty as Qty,b.Qty as Qty1
													                        from tbplan a full join tbstore b
												                            on a.PO=b.PO and a.Item=b.Item and a.Material=b.Material
	                        ),
	                        tb2
	                        as
	                        (
		                        select PO,Item,Rawsheet as Material,sum(Qty) as Qty, CONVERT(varchar(100),ScanTime,23) as 扫描日期 from C01 group by PO,Item,Rawsheet,CONVERT(varchar(100),ScanTime,23)
	                        )
	                        select a.Vendor, Isnull(a.PO,b.PO) as PO, Isnull(a.Item,b.Item) as Item, Isnull(a.Material,b.Material) as Material,a.[交付日期],
								                        a.Qty as 计划数量, a.Qty1 as 已收数量, b.Qty as 扫描数量, b.扫描日期, 
								                        case when a.Vendor is null then '非计划'
									                            when Isnull(b.Qty,0)=0 and (a.Qty - isnull(a.Qty1,0) - Isnull(b.Qty,0)=0)  then '已全部收货'
									                            when Isnull(b.Qty,0)=0 and Isnull(a.Qty1,0)>0 and (a.Qty - isnull(a.Qty1,0) - Isnull(b.Qty,0)<0)  then '已超量收货'
									                            when Isnull(b.Qty,0)=0 and Isnull(a.Qty1,0)>0 and (a.Qty - isnull(a.Qty1,0) - Isnull(b.Qty,0)>0)  then '已部分收货'
									                            when Isnull(b.Qty,0)=0 and Isnull(a.Qty1,0)=0 then '未送货'
									                            when Isnull(b.Qty,0)>0 and (a.Qty - isnull(a.Qty1,0) - Isnull(b.Qty,0)=0) then '待全部收货'								 
									                            when Isnull(b.Qty,0)>0 and (a.Qty - isnull(a.Qty1,0) - Isnull(b.Qty,0)>0) then '待部分收货('+ Convert(varchar(10),Isnull(b.Qty,0))+')'
									                            when Isnull(b.Qty,0)>0 and (a.Qty - isnull(a.Qty1,0) - Isnull(b.Qty,0)<0) then '超量('+ Convert(varchar(10),isnull(a.Qty1,0)+Isnull(b.Qty,0)-a.Qty) +')'
									                            else '需定义'
								                        end as VS
								                        from tb1 a full join tb2 b 
								                        on a.PO=b.PO and a.Item=b.Item and a.Material=b.Material 
								                        order by a.[交付日期], VS desc",
                                                        DateTime.Now.ToString("yyyy-MM-dd"));
            ShowDataInDataGridView(sql, this.dgv);
        }

        private void dgv_CellFormatting(object sender, DataGridViewCellFormattingEventArgs e)
        {
            if (this.dgv.Columns[e.ColumnIndex].Name == "VS")
            {
                string cv = this.dgv[e.ColumnIndex, e.RowIndex].Value.ToString();
                if (cv.IndexOf("已") >= 0)
                {
                    this.dgv[e.ColumnIndex, e.RowIndex].Style.BackColor = Color.Green;
                }
                else if (cv.IndexOf("待") >= 0)
                {
                    this.dgv[e.ColumnIndex, e.RowIndex].Style.BackColor = Color.Orange;
                }
                else
                {
                    this.dgv[e.ColumnIndex, e.RowIndex].Style.BackColor = Color.Red;
                }
            }
        }

        //所有没有完成的订单
        private void button6_Click(object sender, EventArgs e)
        {
            QueryExcept = true;

            string sql = string.Format(@"with tbplan
	                        as
	                        (   ---没有完成的订单
		                        select a.Vendor, a.PurchDoc as PO, a.Item, a.Material, CONVERT(varchar(100), a.[交付日期], 23) as [交付日期], sum(Qty) as Qty 
													                        from PurDoc a 
													                        where DateDiff(day, a.[交付日期],'{0}')>=0 and Status is null
													                        group by a.Vendor,a.PurchDoc,a.Item,a.Material,CONVERT(varchar(100), a.[交付日期], 23)
	                        ),
                            tbstore
	                        as
	                        (  ---没有完成的订单中已部分收货数量
		                        select a.PO, a.Item, a.Rawsheet as Material, sum(a.Qty) as Qty
												                         from Store a 
												                         where a.Code='C01' and (a.PO + '-' + a.Item + '-' + a.Rawsheet in (select PurchDoc + '-' + Item + '-' + Material from Purdoc where DateDiff(day,[交付日期],'{0}')>=0 and Status is null )
																		 ---or DateDiff(day,a.InputTime,'{0}')=0   ---非计划收货	
																			)
												                         group by a.PO, a.Item, a.Rawsheet
	                        ),
	                        tb1
	                        as
	                        (
		                        select a.Vendor as Vendor, Isnull(a.PO,b.PO) as PO, Isnull(a.Item,b.Item) as Item, Isnull(a.Material,b.Material) as Material,a.[交付日期],a.Qty as Qty,b.Qty as Qty1
													                        from tbplan a full join tbstore b
												                            on a.PO=b.PO and a.Item=b.Item and a.Material=b.Material
	                        ),
	                        tb2
	                        as
	                        (
		                        select PO,Item,Rawsheet as Material,sum(Qty) as Qty, CONVERT(varchar(100),ScanTime,23) as 扫描日期 from C01 group by PO,Item,Rawsheet,CONVERT(varchar(100),ScanTime,23)
	                        )
	                        select a.Vendor, Isnull(a.PO,b.PO) as PO, Isnull(a.Item,b.Item) as Item, Isnull(a.Material,b.Material) as Material,a.[交付日期],
								                        a.Qty as 计划数量, a.Qty1 as 已收数量, b.Qty as 扫描数量, b.扫描日期, 
								                        case when a.Vendor is null then '非计划'
									                            when Isnull(b.Qty,0)=0 and (a.Qty - isnull(a.Qty1,0) - Isnull(b.Qty,0)=0)  then '已全部收货'
									                            when Isnull(b.Qty,0)=0 and Isnull(a.Qty1,0)>0 and (a.Qty - isnull(a.Qty1,0) - Isnull(b.Qty,0)<0)  then '已超量收货'
									                            when Isnull(b.Qty,0)=0 and Isnull(a.Qty1,0)>0 and (a.Qty - isnull(a.Qty1,0) - Isnull(b.Qty,0)>0)  then '已部分收货'
									                            when Isnull(b.Qty,0)=0 and Isnull(a.Qty1,0)=0 then '未送货'
									                            when Isnull(b.Qty,0)>0 and (a.Qty - isnull(a.Qty1,0) - Isnull(b.Qty,0)=0) then '待全部收货'								 
									                            when Isnull(b.Qty,0)>0 and (a.Qty - isnull(a.Qty1,0) - Isnull(b.Qty,0)>0) then '待部分收货('+ Convert(varchar(10),Isnull(b.Qty,0))+')'
									                            when Isnull(b.Qty,0)>0 and (a.Qty - isnull(a.Qty1,0) - Isnull(b.Qty,0)<0) then '超量('+ Convert(varchar(10),isnull(a.Qty1,0)+Isnull(b.Qty,0)-a.Qty) +')'
									                            else '需定义'
								                        end as VS
								                        from tb1 a full join tb2 b 
								                        on a.PO=b.PO and a.Item=b.Item and a.Material=b.Material 
								                        order by a.[交付日期], VS desc",
                                                        DateTime.Now.ToString("yyyy-MM-dd"));
            ShowDataInDataGridView(sql, this.dgv);
        }
    }
}
