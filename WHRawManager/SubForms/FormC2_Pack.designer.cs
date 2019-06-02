namespace WHRawManager
{
    partial class FormC2_Pack
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(FormC2_Pack));
            this.dgv = new FanNetWorldDataGridViewEx.DataGridViewEx();
            this.YearID = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Lot = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Line = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.PackID = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.DelivID = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.chkcol = new System.Windows.Forms.DataGridViewCheckBoxColumn();
            this.Bar2ID = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.button2 = new System.Windows.Forms.Button();
            ((System.ComponentModel.ISupportInitialize)(this.dgv)).BeginInit();
            this.SuspendLayout();
            // 
            // dgv
            // 
            this.dgv.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.dgv.BackgroundColor = System.Drawing.SystemColors.InactiveCaption;
            this.dgv.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgv.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.YearID,
            this.Lot,
            this.Line,
            this.PackID,
            this.DelivID,
            this.chkcol,
            this.Bar2ID});
            this.dgv.Dock = System.Windows.Forms.DockStyle.Top;
            this.dgv.Location = new System.Drawing.Point(0, 0);
            this.dgv.Name = "dgv";
            this.dgv.RowTemplate.Height = 23;
            this.dgv.Size = new System.Drawing.Size(980, 459);
            this.dgv.TabIndex = 15;
            // 
            // YearID
            // 
            this.YearID.DataPropertyName = "YearID";
            this.YearID.HeaderText = "Year";
            this.YearID.Name = "YearID";
            this.YearID.ReadOnly = true;
            // 
            // Lot
            // 
            this.Lot.DataPropertyName = "Lot";
            this.Lot.HeaderText = "Lot";
            this.Lot.Name = "Lot";
            this.Lot.ReadOnly = true;
            // 
            // Line
            // 
            this.Line.DataPropertyName = "Line";
            this.Line.HeaderText = "Line";
            this.Line.Name = "Line";
            this.Line.ReadOnly = true;
            // 
            // PackID
            // 
            this.PackID.DataPropertyName = "PackID";
            this.PackID.HeaderText = "PackID";
            this.PackID.Name = "PackID";
            this.PackID.ReadOnly = true;
            // 
            // DelivID
            // 
            this.DelivID.DataPropertyName = "DelivID";
            this.DelivID.HeaderText = "编号";
            this.DelivID.Name = "DelivID";
            this.DelivID.ReadOnly = true;
            // 
            // chkcol
            // 
            this.chkcol.DataPropertyName = "chkcol";
            this.chkcol.FalseValue = "0";
            this.chkcol.HeaderText = "选择";
            this.chkcol.Name = "chkcol";
            this.chkcol.Resizable = System.Windows.Forms.DataGridViewTriState.True;
            this.chkcol.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Automatic;
            this.chkcol.TrueValue = "1";
            // 
            // Bar2ID
            // 
            this.Bar2ID.DataPropertyName = "Bar2ID";
            this.Bar2ID.HeaderText = "扫描项";
            this.Bar2ID.Name = "Bar2ID";
            this.Bar2ID.ReadOnly = true;
            // 
            // button2
            // 
            this.button2.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.button2.BackColor = System.Drawing.SystemColors.ButtonFace;
            this.button2.Font = new System.Drawing.Font("宋体", 15.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            this.button2.Image = ((System.Drawing.Image)(resources.GetObject("button2.Image")));
            this.button2.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.button2.Location = new System.Drawing.Point(381, 465);
            this.button2.Name = "button2";
            this.button2.Size = new System.Drawing.Size(231, 58);
            this.button2.TabIndex = 16;
            this.button2.Text = "删除部分扫描项";
            this.button2.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.button2.TextImageRelation = System.Windows.Forms.TextImageRelation.TextBeforeImage;
            this.button2.UseVisualStyleBackColor = false;
            this.button2.Click += new System.EventHandler(this.button2_Click_1);
            // 
            // FormC2_Pack
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 12F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.SystemColors.GradientInactiveCaption;
            this.ClientSize = new System.Drawing.Size(980, 528);
            this.Controls.Add(this.button2);
            this.Controls.Add(this.dgv);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedDialog;
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Name = "FormC2_Pack";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "发料扫描项删除";
            ((System.ComponentModel.ISupportInitialize)(this.dgv)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private FanNetWorldDataGridViewEx.DataGridViewEx dgv;
        private System.Windows.Forms.Button button2;
        private System.Windows.Forms.DataGridViewTextBoxColumn YearID;
        private System.Windows.Forms.DataGridViewTextBoxColumn Lot;
        private System.Windows.Forms.DataGridViewTextBoxColumn Line;
        private System.Windows.Forms.DataGridViewTextBoxColumn PackID;
        private System.Windows.Forms.DataGridViewTextBoxColumn DelivID;
        private System.Windows.Forms.DataGridViewCheckBoxColumn chkcol;
        private System.Windows.Forms.DataGridViewTextBoxColumn Bar2ID;
    }
}