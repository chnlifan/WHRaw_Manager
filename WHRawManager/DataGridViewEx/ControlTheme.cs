using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace FanNetWorldDataGridViewEx
{
   public class ControlTheme
    {
        #region 默认使用的DataGridView Style
        static DataGridViewCellStyle dateCellStyle = new DataGridViewCellStyle { Alignment = DataGridViewContentAlignment.MiddleRight };
        static DataGridViewCellStyle amountCellStyle = new DataGridViewCellStyle { Alignment = DataGridViewContentAlignment.MiddleRight, Format = "N2" };

        static readonly DataGridViewCellStyle ColumnHeaderCellStyle = new DataGridViewCellStyle
        {
            Alignment = DataGridViewContentAlignment.MiddleCenter,
            BackColor = Color.FromArgb(System.Convert.ToInt32(System.Convert.ToByte(79)), System.Convert.ToInt32(System.Convert.ToByte(129)), System.Convert.ToInt32(System.Convert.ToByte(189))),
            Font = new Font("微软雅黑", (float)(10.0F), FontStyle.Regular, GraphicsUnit.Point, System.Convert.ToByte(0)),
            ForeColor = SystemColors.ControlLightLight,
            SelectionBackColor = SystemColors.Highlight,
            SelectionForeColor = SystemColors.HighlightText,
            WrapMode = DataGridViewTriState.True
        };

        static readonly DataGridViewCellStyle DataCellStyle = new DataGridViewCellStyle
        {
            Alignment = DataGridViewContentAlignment.MiddleLeft,
            BackColor = SystemColors.ControlLightLight,
            Font = new Font("微软雅黑", (float)(8F), FontStyle.Regular, GraphicsUnit.Point, System.Convert.ToByte(0)),
            ForeColor = SystemColors.ControlText,
            SelectionBackColor = Color.FromArgb(System.Convert.ToInt32(System.Convert.ToByte(155)), System.Convert.ToInt32(System.Convert.ToByte(187)), System.Convert.ToInt32(System.Convert.ToByte(89))),
            SelectionForeColor = SystemColors.HighlightText,
            WrapMode = DataGridViewTriState.False
        };

        static DataGridViewCellStyle RowHeaderCellStyle = new DataGridViewCellStyle
        {
            Alignment = DataGridViewContentAlignment.MiddleCenter,
            BackColor = Color.WhiteSmoke,
            Font = new Font("微软雅黑", (float)(9.0F), FontStyle.Regular, GraphicsUnit.Point, System.Convert.ToByte(0)),
            ForeColor = SystemColors.WindowText,
            SelectionBackColor = Color.FromArgb(System.Convert.ToInt32(System.Convert.ToByte(155)), System.Convert.ToInt32(System.Convert.ToByte(187)), System.Convert.ToInt32(System.Convert.ToByte(89))),
            SelectionForeColor = SystemColors.HighlightText,
            WrapMode = DataGridViewTriState.True
        };

        //设置表格的主题样式
        static public void ApplyDefaultGridViewTheme(DataGridView grid, string TopLeftHeaderText = "No",bool allrowusertoaddrow = false, bool allowusertodeleterows = false, int ColumnHeaderHeight = 32, int RowTemplateHeight = 22)
        {
            grid.AllowUserToAddRows = allrowusertoaddrow;
            grid.AllowUserToDeleteRows = allowusertodeleterows;
            grid.BackgroundColor = SystemColors.Window;
            grid.BorderStyle = BorderStyle.None;
            grid.ColumnHeadersBorderStyle = DataGridViewHeaderBorderStyle.Single;

            //datagridview columnheader style
            grid.ColumnHeadersDefaultCellStyle = ColumnHeaderCellStyle;
            grid.ColumnHeadersHeight = ColumnHeaderHeight;
            grid.ColumnHeadersHeightSizeMode = DataGridViewColumnHeadersHeightSizeMode.DisableResizing;

            //datagridview data style
            grid.DefaultCellStyle = DataCellStyle;
            grid.EnableHeadersVisualStyles = false;
            grid.GridColor = SystemColors.GradientInactiveCaption;

            //datagridview rowheader style
            //grid.RowHeadersVisible = true;
            grid.RowHeadersBorderStyle = DataGridViewHeaderBorderStyle.Single;
            grid.RowHeadersDefaultCellStyle = RowHeaderCellStyle;
            grid.Font = ColumnHeaderCellStyle.Font;

            //topleftheader style
            grid.TopLeftHeaderCell.Value = TopLeftHeaderText;
            grid.TopLeftHeaderCell.Style.Alignment = DataGridViewContentAlignment.MiddleCenter;
            grid.RowHeadersWidthSizeMode = DataGridViewRowHeadersWidthSizeMode.AutoSizeToDisplayedHeaders;

            //数据行高度
            grid.RowTemplate.Height = RowTemplateHeight;
            grid.RowTemplate.Resizable = DataGridViewTriState.False; //行高不能调整

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
                e.Graphics.DrawString(rowIdx, grid.Font, SystemBrushes.ControlText, headerBounds, centerFormat);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        #endregion  //datagridview

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
