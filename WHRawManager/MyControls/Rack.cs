using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Configuration;
using FanNetWorld.IO;

namespace WHRawManager.Controls
{
    public partial class Rack : UserControl
    {
        int rowh = 0;
        int colw = 0;
        int rowcount = 0;
        int colcount = 0;

        DataTable rackdt = null;
        DataTable rackrawdt = null;
        DataTable selectdt = null;

        Color MarkBackColor;
        Color MarkForeColor;
        Color QueryMarkBackColor;
        Color QueryMarkForeColor;

        Color titlebackcolor;
        Color titleforecolor;

        bool IsShowRawName = Convert.ToBoolean(ConfigurationManager.AppSettings["ShowRawnameInRack"]);

        static readonly DataGridViewCellStyle DataCellStyle1 = new DataGridViewCellStyle
        {
            Alignment = DataGridViewContentAlignment.MiddleCenter,
            BackColor = Color.DarkSlateGray,
            Font = new Font("微软雅黑", (float)(10.0F), FontStyle.Bold, GraphicsUnit.Point),
            ForeColor = Color.White,
            SelectionBackColor = Color.FromArgb(155, 187, 89),
            SelectionForeColor = SystemColors.HighlightText,
            WrapMode = DataGridViewTriState.False
        };

        public Rack()
        {
            InitializeComponent();
        }
        
        public Rack(string name, DataTable Rackdt, DataTable Rackrawdt, DataTable SelectRackdt, int mywidth, int myheigth, Color backcolor, Color forecolor,
                                                                                                                           Color querybackcolor, Color queryforecolor,
                                                                                                                           bool IsShowName = true)
        {
            InitializeComponent();

            titlebackcolor = this.lblname.BackColor;
            titleforecolor = this.lblname.ForeColor;

            MarkBackColor = backcolor;
            MarkForeColor = forecolor;
            QueryMarkBackColor = querybackcolor;
            QueryMarkForeColor = queryforecolor;


            rackdt = Rackdt;
            rackrawdt = Rackrawdt;

            //建立selecdatable
            CreateSelectTable();

            this.dgv.AllowUserToAddRows = false;
            this.dgv.AllowUserToDeleteRows = false;
            this.dgv.AllowUserToOrderColumns = false;
            this.dgv.AllowUserToResizeColumns = false;
            this.dgv.AllowUserToResizeRows = false;
            this.dgv.ColumnHeadersVisible = false;
            this.dgv.RowHeadersVisible = false;
            this.dgv.Enabled = false;
            this.dgv.ReadOnly = true;

            //货架号对应的原材料表
            this.dgv.Linkvaluedt = rackrawdt;

            //显示原材料名称
            this.dgv.ShowLinkValue = IsShowRawName;

            //合并列的名称
            foreach (DataColumn dc in rackdt.Columns)
            {
                this.dgv.MergeColumnNames.Add(dc.ColumnName);
            }

            //所有单元格的格式
            this.dgv.DefaultCellStyle = DataCellStyle1;
            rowcount = rackdt.Rows.Count;
            colcount = rackdt.Columns.Count;

            //查询C01表中已有的原材料
            foreach(DataRow dr in SelectRackdt.Rows)
            {
                selectdt.Rows.Add(dr[0].ToString(), Convert.ToInt16(dr[1]), Convert.ToInt16(dr[2]));
            }

            setLayout(name, mywidth, myheigth, IsShowName);            
        }

        public void setLayout(string name, int mywidth, int myheight, bool IsShowName = true)
        {
            //考虑的货架标签的高度
            //if(IsShowName == true)
            {
                myheight +=  lblname.Height/2;
            }

            //把datagridview每行的误差把整个控件的高度改变
            int yushu = (myheight - lblname.Height) % rowcount;
            myheight -= yushu;
            
            layout(name, mywidth, myheight, IsShowName);

            //数据行高度
            rowh = (int)((myheight - lblname.Height) / rowcount);
            this.dgv.RowTemplate.Height = rowh;             

            //网格线颜色
            this.dgv.GridColor = Color.LightGray;

            dgv.DataSource = null;   //加快数据绑定的速度
            this.dgv.DataSource = rackdt.DefaultView;

            //列宽
            colw = (int)((mywidth - 1) / colcount);
            for (int i = 0; i < colcount; i++)
            {
                this.dgv.Columns[i].Width = colw;
            }
            //最后一列的宽度
            this.dgv.Columns[colcount - 1].Width = mywidth - (colcount - 1) * colw - 1;

            float fontsize = 10;
            //设定字体的大小
            if (IsShowRawName == false)
            {
                fontsize = CoolFont.FitStringRect("Q2-10-9", dgv.DefaultCellStyle.Font, dgv.CreateGraphics(), new Rectangle(0, 0, colw, rowh));
            }                
            else
            {
                fontsize = CoolFont.FitStringRect("KM500094471", dgv.DefaultCellStyle.Font, dgv.CreateGraphics(), new Rectangle(0, 0, colw, rowh));
            }
            dgv.DefaultCellStyle.Font = new Font("微软雅黑", fontsize, FontStyle.Bold, GraphicsUnit.Point);

            //标注已有原材料库位
            MarkSelectRack();
        }
        
        private void layout(string name, int mywidth, int myheight, bool IsShowName)
        {
            this.Width = mywidth;
            this.Height = myheight;
            this.lblname.Text = name;
            this.lblname.Left = 1;

            if (IsShowName == false)  //不显示标签名            
            {
                this.lblname.Width -= 1;
                this.lblname.Height = 0;
                this.lblname.Visible = false;
            }

            dgv.Left = 0;
            dgv.Top = lblname.Height - 1;
            dgv.Width = this.Width;
            dgv.Height = this.Height - lblname.Height + 2;
        }

        //标注送货的原材料的库位
        public void MarkSelectRack()
        {
            //已选择的单元格的颜色变化
            foreach (DataRow dr in selectdt.Rows)
            {
                SetCellColor(dr["rackid"].ToString(), (int)dr["row"], (int)dr["column"]);
            }
        }


        public void SetCellColor(string rackid, int row, int col)
        {
            this.lblname.BackColor = Color.Red ;
            this.lblname.ForeColor = Color.Yellow;
            this.dgv[col - 1, row - 1].Style.BackColor = MarkBackColor;
            this.dgv[col - 1, row - 1].Style.ForeColor = MarkForeColor;

            DataRow[] drs = selectdt.Select(string.Format("rackid='{0}'", rackid));
            if(drs.Length == 0)
            {
                selectdt.Rows.Add(rackid, row, col);
            }           
        }

        private void CreateSelectTable()
        {
            if (selectdt == null)
            {
                selectdt = new DataTable();
                selectdt.Columns.Add("rackid", typeof(string));
                selectdt.Columns.Add("row", typeof(int));
                selectdt.Columns.Add("column", typeof(int));
            }
        }

        //防止闪烁
        protected override CreateParams CreateParams
        {
            get
            {
                var parms = base.CreateParams;
                parms.Style &= ~0x02000000; // Turn off WS_CLIPCHILDREN 
                return parms;
            }
        }

        //更新选中的原材料Mark
        public void RefreshSelectRack(DataTable SelectRackdt)
        {
            //先把原来选中的原材料更新颜色到默认
            foreach (DataRow dr in selectdt.Rows)
            {
                SetDefaultCellColor(dr["rackid"].ToString(), (int)dr["row"], (int)dr["column"]);
            }

            selectdt.Rows.Clear();

            foreach (DataRow dr in SelectRackdt.Rows)
            {
                selectdt.Rows.Add(dr[0].ToString(), Convert.ToInt16(dr[1]), Convert.ToInt16(dr[2]));
            }

            MarkSelectRack();
        }

        public void SetDefaultCellColor(string rackid, int row, int col)
        {
            this.lblname.BackColor = titlebackcolor;
            this.lblname.ForeColor = titleforecolor;
            this.dgv[col - 1, row - 1].Style.BackColor = this.dgv.DefaultCellStyle.BackColor;
            this.dgv[col - 1, row - 1].Style.ForeColor = this.dgv.DefaultCellStyle.ForeColor;
        }

        //恢复原先选择的单元
        public void RemoveQueryCellColor(string rackid, int row, int col)
        {
            DataRow[] drs = selectdt.Select(string.Format("rackid='{0}'", rackid));
            if (drs.Length >0)
            {
                SetCellColor(rackid, row, col);
            }
            else
            {
                SetDefaultCellColor(rackid, row, col);
            }
        }

        //设置查询的库位的颜色
        public void SetQueryCellColor(string rackid, int row, int col)
        {
            this.dgv[col - 1, row - 1].Style.BackColor = QueryMarkBackColor;
            this.dgv[col - 1, row - 1].Style.ForeColor = QueryMarkForeColor;
        }
    }
}
