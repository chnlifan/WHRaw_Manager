using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;


namespace FanNetWorldDataGridViewEx
{
    public partial class DataGridViewMergeColdata : DataGridView
    {        
        public DataGridViewMergeColdata()
        {
            InitializeComponent();
            SetStyle(ControlStyles.DoubleBuffer | ControlStyles.OptimizedDoubleBuffer | ControlStyles.AllPaintingInWmPaint, true);
            this.CurrentCell = null;
        }

        public DataGridViewMergeColdata(IContainer container)
        {
            container.Add(this);
            InitializeComponent();
        }
        
        bool _IsMergeBlankCell = true; //在不使用占位符的情况下,对于空值是否合并
        public bool IsMergeBlankCell
        {
            get
            {
                return _IsMergeBlankCell;
            }
            set
            {
                _IsMergeBlankCell = value;
            }
        }

        DataTable _linkvaluedt = null;  //对应单元格的值对应的值
        public DataTable Linkvaluedt
        {
            get
            {
                return _linkvaluedt;
            }
            set
            {
                _linkvaluedt = value;
            }
        }

        //显示链接值
        public bool ShowLinkValue
        {
            get; set;
        }

        protected override void OnPaint(PaintEventArgs pe)
        {
            base.OnPaint(pe);
        }
        protected override void OnCellPainting(DataGridViewCellPaintingEventArgs e)
        {
            try
            {
                if (e.RowIndex > -1 && e.ColumnIndex > -1)
                {                    
                    DrawCell(e);
                }                
            }
            catch(Exception ex)
            { }
        }

        private void DrawCell(DataGridViewCellPaintingEventArgs e)
        {
            if (e.CellStyle.Alignment == DataGridViewContentAlignment.NotSet)
            {
                e.CellStyle.Alignment = DataGridViewContentAlignment.MiddleCenter;
            }
            Brush gridBrush = new SolidBrush(this.GridColor);
            SolidBrush backBrush = new SolidBrush(e.CellStyle.BackColor);
            SolidBrush fontBrush = new SolidBrush(e.CellStyle.ForeColor);

            int cellwidth;
            //上面相同的行数
            int UpRows = 0;
            //下面相同的行数
            int DownRows = 0;
            //总行数
            int count = 0;
            if (this.MergeColumnNames.Contains(this.Columns[e.ColumnIndex].Name) && e.RowIndex != -1)
            {
                UpRows = 0;
                DownRows = 0;

                cellwidth = e.CellBounds.Width;
                Pen gridLinePen = new Pen(gridBrush);
                string curValue = e.Value == null ? "" : e.Value.ToString().Trim();
                string curSelected = this.CurrentRow.Cells[e.ColumnIndex].Value == null ? "" : this.CurrentRow.Cells[e.ColumnIndex].Value.ToString().Trim();

                {
                    #region 获取下面的行数
                    for (int i = e.RowIndex; i < this.Rows.Count; i++)
                    {
                        if (this.Rows[i].Cells[e.ColumnIndex].Value.ToString().Equals(curValue))
                        {
                            DownRows++;
                            if (e.RowIndex != i)
                            {
                                cellwidth = cellwidth < this.Rows[i].Cells[e.ColumnIndex].Size.Width ? cellwidth : this.Rows[i].Cells[e.ColumnIndex].Size.Width;
                            }
                        }
                        else
                        {
                            break;
                        }
                    }
                    #endregion

                    #region 获取上面的行数
                    for (int i = e.RowIndex; i >= 0; i--)
                    {
                        if (this.Rows[i].Cells[e.ColumnIndex].Value.ToString().Equals(curValue))
                        {
                            UpRows++;
                            if (e.RowIndex != i)
                            {
                                cellwidth = cellwidth < this.Rows[i].Cells[e.ColumnIndex].Size.Width ? cellwidth : this.Rows[i].Cells[e.ColumnIndex].Size.Width;
                            }
                        }
                        else
                        {
                            break;
                        }
                    }
                    #endregion
                }

                if(!IsMergeBlankCell) //如果不合并空值单元格
                {
                    if (string.IsNullOrEmpty(curValue))
                    {
                        DownRows = 0;
                        UpRows = 0;
                    }
                }

                count = DownRows + UpRows - 1;

                if (count < 2)
                {
                    //return;
                }

                //行高
                int cellh = e.CellBounds.Height;

                //防止多次重绘
                if (UpRows == 1) 
                {
                    //以背景色填充                    
                    backBrush.Color = e.CellStyle.BackColor;

                    //e.Graphics.FillRectangle(backBrush, e.CellBounds.X, e.CellBounds.Y - cellh * (UpRows - 1), e.CellBounds.Width - 1, cellh * count - 1);
                    e.Graphics.FillRectangle(backBrush, e.CellBounds.X, e.CellBounds.Y, e.CellBounds.Width - 1, cellh * count - 1);
                    
                    //画字符串
                    PaintingFont(e, cellwidth, UpRows, DownRows, count);
                }

                //画左边的线
                if(e.ColumnIndex == 0 && UpRows == 1)
                {
                    e.Graphics.DrawLine(gridLinePen, e.CellBounds.Left, e.CellBounds.Top, e.CellBounds.Left, e.CellBounds.Top + cellh * count - 1);
                }

                //画上边的线
                if(e.RowIndex == 0　&& UpRows == 1)
                {
                    e.Graphics.DrawLine(gridLinePen, e.CellBounds.Left, e.CellBounds.Top , e.CellBounds.Right - 1, e.CellBounds.Top);
                }

                //画下面的线
                if (DownRows == 1)
                {
                    e.Graphics.DrawLine(gridLinePen, e.CellBounds.Left, e.CellBounds.Bottom - 1, e.CellBounds.Right - 1, e.CellBounds.Bottom - 1);
                }

                // 画右边线
                e.Graphics.DrawLine(gridLinePen, e.CellBounds.Right - 1, e.CellBounds.Top, e.CellBounds.Right - 1, e.CellBounds.Bottom);
                e.Handled = true;
            }
        }

        private void PaintingFont(System.Windows.Forms.DataGridViewCellPaintingEventArgs e, int cellwidth, int UpRows, int DownRows, int count)
        {
            SolidBrush fontBrush = new SolidBrush(e.CellStyle.ForeColor);
            int fontheight = (int)e.Graphics.MeasureString(e.Value.ToString(), e.CellStyle.Font).Height;
            int fontwidth = (int)e.Graphics.MeasureString(e.Value.ToString(), e.CellStyle.Font).Width;
            int cellheight = e.CellBounds.Height;
            if (!string.IsNullOrEmpty(e.Value.ToString()))
            {
                if(ShowLinkValue == false)
                    e.Graphics.DrawString((String)e.Value, e.CellStyle.Font, fontBrush, e.CellBounds.X + (cellwidth - fontwidth) / 2, e.CellBounds.Y - cellheight * (UpRows - 1) + (cellheight * count - fontheight) / 2);
                else
                {
                    DataRow[] dts =  Linkvaluedt.Select(string.Format("name='{0}'", e.Value.ToString()));
                    if (dts.Length>0)
                    {
                        if (!Convert.IsDBNull(dts[0]["name2"]))
                        {
                            fontwidth = (int)e.Graphics.MeasureString(dts[0]["name2"].ToString(), e.CellStyle.Font).Width;
                            e.Graphics.DrawString(dts[0]["name2"].ToString(), e.CellStyle.Font, fontBrush, e.CellBounds.X + (cellwidth - fontwidth) / 2, e.CellBounds.Y - cellheight * (UpRows - 1) + (cellheight * count - fontheight) / 2);
                        }
                    }
                }
            }              
        }

        /// 设置或获取合并列的集合
        public List<string> MergeColumnNames
        {
            get
            {
                return _mergecolumnname;
            }
            set
            {
                _mergecolumnname = value;
            }
        }
        private List<string> _mergecolumnname = new List<string>();
    }
}
