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
    public partial class DataGridViewEx : DataGridView
    {
        private bool m_ShowRowNo = false;  //行头是否加上序列号
        private bool m_ShowTriangleMark = true; //显示行头的三角指示
        /// <summary>
        /// 构造函数
        /// </summary>
        public DataGridViewEx()
        {
            this.CurrentCell = null;
            InitializeComponent();            
            SetStyle(ControlStyles.DoubleBuffer | ControlStyles.OptimizedDoubleBuffer | ControlStyles.AllPaintingInWmPaint, true);
        }

        /// <summary>
        /// 初始化
        /// </summary>
        private void InitializeComponent()
        {
            components = new System.ComponentModel.Container();
        }

        /// <summary>
        /// 设置datagridview的Theme
        /// </summary>
        /// <param name="ShowRowNo">显示行头的序列号</param>
        /// <param name="ShowTriangleMark">显示行头的三角指示符</param>
        /// <param name="TopLeftHeaderText">左上角单元格的headertext</param>
        /// <param name="ColumnHeaderHeight"></param>
        /// <param name="RowTemplateHeight"></param>
        public void SetDataGridViewTheme(bool ShowRowNo = false, bool ShowTriangleMark = true, string TopLeftHeaderText = "No", 
                                         bool allrowusertoaddrow = false, bool allowusertodeleterows = false, int ColumnHeaderHeight = 32, 
                                         int datarowHeight = 22)
        {
            m_ShowRowNo = ShowRowNo;
            m_ShowTriangleMark = ShowTriangleMark;
            ControlTheme.ApplyDefaultGridViewTheme(this, TopLeftHeaderText, allrowusertoaddrow, allowusertodeleterows, ColumnHeaderHeight, datarowHeight);
        }

        public void SetDataGridViewTheme2(bool ShowRowNo = false, bool ShowTriangleMark = true, string TopLeftHeaderText = "No", 
                                              bool allrowusertoaddrow = false, bool allowusertodeleterows = false, int ColumnHeaderHeight = 32,
                                              int datarowHeight = 22, bool rowheadervisible = true, bool fillsizecolumnsmode = false,  
                                              bool isautosizerows = false)
        {
            m_ShowRowNo = ShowRowNo;
            m_ShowTriangleMark = ShowTriangleMark;
            ControlThemeDataGridView.ApplyDefaultGridViewTheme(this, TopLeftHeaderText, allrowusertoaddrow, allowusertodeleterows, ColumnHeaderHeight, 
                                                        datarowHeight, rowheadervisible, fillsizecolumnsmode, isautosizerows);
        }

        public void SetDataGridViewBoardTheme(bool ShowRowNo = false, bool ShowTriangleMark = true, string TopLeftHeaderText = "No",
                                      bool allrowusertoaddrow = false, bool allowusertodeleterows = false, int ColumnHeaderHeight = 32,
                                      int datarowHeight = 22, bool rowheadervisible = true, bool fillsizecolumnsmode = false,
                                      bool isautosizerows = false)
        {
            m_ShowRowNo = ShowRowNo;
            m_ShowTriangleMark = ShowTriangleMark;
            ControlThemeBoard.ApplyDefaultGridViewTheme(this, TopLeftHeaderText, allrowusertoaddrow, allowusertodeleterows, ColumnHeaderHeight,
                                                        datarowHeight, rowheadervisible, fillsizecolumnsmode, isautosizerows);
        }

        protected override void OnRowPostPaint(DataGridViewRowPostPaintEventArgs e)
        {
            if(this.RowHeadersVisible == true)  //行头列可见
            {
                if(m_ShowTriangleMark == false)  //不显示行头的三角指示符
                {
                    Color Cellcolor;
                    var rect1 = new Rectangle(e.RowBounds.Left + 1, e.RowBounds.Top + 1, this.RowHeadersWidth - 2, e.RowBounds.Height - 2);
                    if (this.SelectedRows.Count > 0 && this.SelectedRows.Contains(this.Rows[e.RowIndex]))
                        Cellcolor = this.RowHeadersDefaultCellStyle.SelectionBackColor;
                    else
                        Cellcolor = this.RowHeadersDefaultCellStyle.BackColor;

                    using (Brush b = new SolidBrush(Cellcolor))
                    {
                        e.Graphics.FillRectangle(b, rect1);
                    }
                }

                //显示行头序列号
                if (m_ShowRowNo == true)
                {
                    ControlThemeDataGridView.RowPostPaint_HeaderCount(this, e);
                }
            }           
        }


    }
}
