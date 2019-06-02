using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace FanNetWorldDataGridViewEx
{
    public class ControlThemeDataGridView
    {
        static DataGridViewCellStyle dateCellStyle = new DataGridViewCellStyle { Alignment = DataGridViewContentAlignment.MiddleRight };
        static DataGridViewCellStyle amountCellStyle = new DataGridViewCellStyle { Alignment = DataGridViewContentAlignment.MiddleRight, Format = "N2" };

        static public readonly DataGridViewCellStyle ColumnHeaderCellStyle = new DataGridViewCellStyle
        {
            Alignment = DataGridViewContentAlignment.MiddleCenter,
            BackColor = Color.FromArgb(79, 129, 189),
            Font = new Font("微软雅黑", (float)(10.0F), FontStyle.Bold, GraphicsUnit.Point),
            ForeColor = SystemColors.ControlLightLight,
            SelectionBackColor = SystemColors.Highlight,
            SelectionForeColor = SystemColors.HighlightText,
            WrapMode = DataGridViewTriState.False 
        };

        static public DataGridViewCellStyle RowHeaderCellStyle = new DataGridViewCellStyle
        {
            Alignment = DataGridViewContentAlignment.MiddleCenter,
            BackColor = SystemColors.ControlLightLight,
            Font = new Font("微软雅黑", (float)(9.0F), FontStyle.Bold, GraphicsUnit.Point),
            ForeColor = SystemColors.ControlText,
            SelectionBackColor = Color.FromArgb(155, 187, 89),
            SelectionForeColor = SystemColors.HighlightText,
            WrapMode = DataGridViewTriState.False
        };

        static public readonly DataGridViewCellStyle DataCellStyle = new DataGridViewCellStyle
        {
            Alignment = DataGridViewContentAlignment.MiddleLeft,
            BackColor = Color.WhiteSmoke,
            Font = new Font("微软雅黑", (float)(10.0F), FontStyle.Bold, GraphicsUnit.Point),
            ForeColor = SystemColors.WindowText,
            SelectionBackColor = Color.FromArgb(155, 187, 89),
            SelectionForeColor = SystemColors.HighlightText,
            WrapMode = DataGridViewTriState.False    
        };

        //设置表格的主题样式
        static public void ApplyDefaultGridViewTheme(DataGridView grid, string TopLeftHeaderText = "No",
                                                     bool allrowusertoaddrow = false, bool allowusertodeleterows = false,
                                                     int columnHeaderHeight = 32, int datarowHeight = 22,
                                                     bool rowheadervisible = true, bool fillsizecolumnsmode = false,
                                                     bool isautosizerows = true)
        {
            //基本属性设置
            grid.AllowUserToAddRows = allrowusertoaddrow;
            grid.AllowUserToDeleteRows = allowusertodeleterows;
            //grid.BackgroundColor = SystemColors.Window;
            grid.BorderStyle = BorderStyle.None;

            //columnheader style
            grid.ColumnHeadersBorderStyle = DataGridViewHeaderBorderStyle.Single;
            grid.ColumnHeadersDefaultCellStyle = ColumnHeaderCellStyle;
            grid.ColumnHeadersHeight = columnHeaderHeight;
            grid.ColumnHeadersHeightSizeMode = DataGridViewColumnHeadersHeightSizeMode.DisableResizing;

            //rowheader style
            grid.RowHeadersVisible = rowheadervisible;
            grid.RowHeadersBorderStyle = DataGridViewHeaderBorderStyle.Single;
            grid.RowHeadersDefaultCellStyle = RowHeaderCellStyle;
            grid.RowHeadersWidthSizeMode = DataGridViewRowHeadersWidthSizeMode.AutoSizeToDisplayedHeaders;

            //让标题的边框线和颜色生效还需要如下设置
            grid.EnableHeadersVisualStyles = false;

            //topleftheader style
            grid.TopLeftHeaderCell.Value = TopLeftHeaderText;
            grid.TopLeftHeaderCell.Style.Alignment = DataGridViewContentAlignment.MiddleCenter;

            //datacell style  
            grid.DefaultCellStyle = DataCellStyle;   //所有单元格           
            grid.RowTemplate.Height = datarowHeight; //数据行高度
            grid.RowTemplate.Resizable = DataGridViewTriState.False; //行高不能调整(AllowUserToResizeRows = false)

            //网格线颜色
            grid.GridColor = SystemColors.AppWorkspace;
            //grid.Font = ColumnHeaderCellStyle.Font;

            //设置datagridview行列的适应模式
            if (fillsizecolumnsmode == true)
            {
                grid.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
            }
            else
            {
                grid.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.AllCells ;
            }
                
            if(isautosizerows == true) grid.AutoSizeRowsMode = DataGridViewAutoSizeRowsMode.AllCellsExceptHeaders;

            //不显示tooltip
            grid.ShowCellToolTips = false;
        }

        //设置表格单元格样式
        static public void SetColumnFormat(DataGridView dgv)
        {
            foreach (DataGridViewColumn cCol in dgv.Columns)
            {
                if (cCol.ValueType.ToString() == typeof(DateTime).ToString())
                {
                    cCol.DefaultCellStyle = dateCellStyle;
                }
                else if (cCol.ValueType.ToString() == typeof(decimal).ToString() || cCol.ValueType.ToString() == typeof(double).ToString())
                {
                    cCol.DefaultCellStyle = amountCellStyle;
                }
            }
            dgv.AutoResizeColumns();
        }

        //设置表格的行号
        static public void RowPostPaint_HeaderCount(object obj_sender, DataGridViewRowPostPaintEventArgs e)
        {
            try
            {
                var sender = (DataGridView)obj_sender;
                DataGridView grid = (DataGridView)sender;
                if (grid.RowHeadersVisible == false) return;

                string rowIdx = System.Convert.ToString((e.RowIndex + 1).ToString());
                var centerFormat = new StringFormat();
                centerFormat.Alignment = StringAlignment.Center;
                centerFormat.LineAlignment = StringAlignment.Center;
                Rectangle headerBounds = new Rectangle(e.RowBounds.Left, e.RowBounds.Top, grid.RowHeadersWidth, e.RowBounds.Height);
                e.Graphics.DrawString(rowIdx, grid.RowHeadersDefaultCellStyle.Font, SystemBrushes.ControlText, headerBounds, centerFormat);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        #region Nice Color        
        public static Color LightBlueColor
        {
            get
            {
                return Color.FromArgb(227, 241, 254);
            }
        }
        #endregion
    }
}
