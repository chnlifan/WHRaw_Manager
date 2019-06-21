namespace WHRawManager
{
    partial class FormC1_2
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(FormC1_2));
            this.panel1 = new System.Windows.Forms.Panel();
            this.lblinfo = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.pictureBox1 = new System.Windows.Forms.PictureBox();
            this.panel2 = new System.Windows.Forms.Panel();
            this.lblokqty = new System.Windows.Forms.Label();
            this.label5 = new System.Windows.Forms.Label();
            this.chkshouhuo = new System.Windows.Forms.CheckBox();
            this.button2 = new System.Windows.Forms.Button();
            this.label4 = new System.Windows.Forms.Label();
            this.lblpackqty = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.dgv2 = new FanNetWorldDataGridViewEx.DataGridViewEx();
            this.Vendor = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.PO = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Item = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Material = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.交付日期 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Qty = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Qty1 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Qty2 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.VS = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.chkcol = new System.Windows.Forms.DataGridViewCheckBoxColumn();
            this.lblqty = new System.Windows.Forms.Label();
            this.panel1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).BeginInit();
            this.panel2.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgv2)).BeginInit();
            this.SuspendLayout();
            // 
            // panel1
            // 
            this.panel1.BackColor = System.Drawing.SystemColors.GradientActiveCaption;
            this.panel1.BackgroundImage = global::WHRawManager.Properties.Resources.bj;
            this.panel1.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch;
            this.panel1.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.panel1.Controls.Add(this.lblinfo);
            this.panel1.Controls.Add(this.label1);
            this.panel1.Controls.Add(this.pictureBox1);
            this.panel1.Dock = System.Windows.Forms.DockStyle.Top;
            this.panel1.Location = new System.Drawing.Point(0, 0);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(1112, 83);
            this.panel1.TabIndex = 1;
            // 
            // lblinfo
            // 
            this.lblinfo.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.lblinfo.BackColor = System.Drawing.Color.Transparent;
            this.lblinfo.Font = new System.Drawing.Font("微软雅黑", 21.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            this.lblinfo.ForeColor = System.Drawing.Color.Black;
            this.lblinfo.Location = new System.Drawing.Point(275, 5);
            this.lblinfo.Name = "lblinfo";
            this.lblinfo.Size = new System.Drawing.Size(836, 71);
            this.lblinfo.TabIndex = 3;
            this.lblinfo.Text = "提示信息";
            this.lblinfo.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.BackColor = System.Drawing.Color.Transparent;
            this.label1.Font = new System.Drawing.Font("微软雅黑", 26.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            this.label1.Location = new System.Drawing.Point(94, 14);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(175, 46);
            this.label1.TabIndex = 1;
            this.label1.Text = "收货-过账";
            // 
            // pictureBox1
            // 
            this.pictureBox1.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("pictureBox1.BackgroundImage")));
            this.pictureBox1.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch;
            this.pictureBox1.Location = new System.Drawing.Point(11, 20);
            this.pictureBox1.Name = "pictureBox1";
            this.pictureBox1.Size = new System.Drawing.Size(77, 40);
            this.pictureBox1.TabIndex = 0;
            this.pictureBox1.TabStop = false;
            // 
            // panel2
            // 
            this.panel2.BackColor = System.Drawing.SystemColors.GradientInactiveCaption;
            this.panel2.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.panel2.Controls.Add(this.lblokqty);
            this.panel2.Controls.Add(this.label5);
            this.panel2.Controls.Add(this.chkshouhuo);
            this.panel2.Controls.Add(this.button2);
            this.panel2.Controls.Add(this.label4);
            this.panel2.Controls.Add(this.lblpackqty);
            this.panel2.Controls.Add(this.label3);
            this.panel2.Controls.Add(this.dgv2);
            this.panel2.Controls.Add(this.lblqty);
            this.panel2.Dock = System.Windows.Forms.DockStyle.Fill;
            this.panel2.Location = new System.Drawing.Point(0, 83);
            this.panel2.Name = "panel2";
            this.panel2.Size = new System.Drawing.Size(1112, 656);
            this.panel2.TabIndex = 2;
            // 
            // lblokqty
            // 
            this.lblokqty.BackColor = System.Drawing.Color.Transparent;
            this.lblokqty.Font = new System.Drawing.Font("微软雅黑", 21.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            this.lblokqty.ForeColor = System.Drawing.Color.Blue;
            this.lblokqty.Location = new System.Drawing.Point(965, 14);
            this.lblokqty.Name = "lblokqty";
            this.lblokqty.Size = new System.Drawing.Size(90, 39);
            this.lblokqty.TabIndex = 18;
            this.lblokqty.Text = "0";
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Font = new System.Drawing.Font("微软雅黑", 21.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            this.label5.ForeColor = System.Drawing.Color.Green;
            this.label5.Location = new System.Drawing.Point(774, 14);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(191, 39);
            this.label5.TabIndex = 17;
            this.label5.Text = "可收货数量：";
            // 
            // chkshouhuo
            // 
            this.chkshouhuo.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.chkshouhuo.AutoSize = true;
            this.chkshouhuo.Checked = true;
            this.chkshouhuo.CheckState = System.Windows.Forms.CheckState.Checked;
            this.chkshouhuo.Font = new System.Drawing.Font("宋体", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            this.chkshouhuo.Location = new System.Drawing.Point(999, 636);
            this.chkshouhuo.Name = "chkshouhuo";
            this.chkshouhuo.Size = new System.Drawing.Size(115, 16);
            this.chkshouhuo.TabIndex = 16;
            this.chkshouhuo.Text = "只显示可收货项";
            this.chkshouhuo.UseVisualStyleBackColor = true;
            this.chkshouhuo.Click += new System.EventHandler(this.chkshouhuo_Click);
            // 
            // button2
            // 
            this.button2.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.button2.BackColor = System.Drawing.SystemColors.ButtonFace;
            this.button2.Font = new System.Drawing.Font("宋体", 18F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            this.button2.Image = ((System.Drawing.Image)(resources.GetObject("button2.Image")));
            this.button2.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.button2.Location = new System.Drawing.Point(470, 595);
            this.button2.Name = "button2";
            this.button2.Size = new System.Drawing.Size(122, 56);
            this.button2.TabIndex = 15;
            this.button2.Text = "过账";
            this.button2.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.button2.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageBeforeText;
            this.button2.UseVisualStyleBackColor = false;
            this.button2.Click += new System.EventHandler(this.button2_Click);
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Font = new System.Drawing.Font("微软雅黑", 21.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            this.label4.ForeColor = System.Drawing.Color.Green;
            this.label4.Location = new System.Drawing.Point(3, 14);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(133, 39);
            this.label4.TabIndex = 8;
            this.label4.Text = "总数量：";
            // 
            // lblpackqty
            // 
            this.lblpackqty.BackColor = System.Drawing.Color.Transparent;
            this.lblpackqty.Font = new System.Drawing.Font("微软雅黑", 21.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            this.lblpackqty.ForeColor = System.Drawing.Color.Blue;
            this.lblpackqty.Location = new System.Drawing.Point(544, 14);
            this.lblpackqty.Name = "lblpackqty";
            this.lblpackqty.Size = new System.Drawing.Size(90, 39);
            this.lblpackqty.TabIndex = 11;
            this.lblpackqty.Text = "0";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Font = new System.Drawing.Font("微软雅黑", 21.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            this.label3.ForeColor = System.Drawing.Color.Green;
            this.label3.Location = new System.Drawing.Point(405, 14);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(133, 39);
            this.label3.TabIndex = 9;
            this.label3.Text = "总包数：";
            // 
            // dgv2
            // 
            this.dgv2.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.dgv2.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.dgv2.BackgroundColor = System.Drawing.SystemColors.InactiveCaption;
            this.dgv2.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgv2.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.Vendor,
            this.PO,
            this.Item,
            this.Material,
            this.交付日期,
            this.Qty,
            this.Qty1,
            this.Qty2,
            this.VS,
            this.chkcol});
            this.dgv2.Location = new System.Drawing.Point(-1, 59);
            this.dgv2.Name = "dgv2";
            this.dgv2.RowTemplate.Height = 23;
            this.dgv2.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.CellSelect;
            this.dgv2.Size = new System.Drawing.Size(1112, 530);
            this.dgv2.TabIndex = 14;
            this.dgv2.CellDoubleClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dgv2_CellDoubleClick);
            this.dgv2.CellFormatting += new System.Windows.Forms.DataGridViewCellFormattingEventHandler(this.dgv2_CellFormatting);
            // 
            // Vendor
            // 
            this.Vendor.DataPropertyName = "Vendor";
            this.Vendor.HeaderText = "Vendor";
            this.Vendor.Name = "Vendor";
            this.Vendor.ReadOnly = true;
            // 
            // PO
            // 
            this.PO.DataPropertyName = "PO";
            this.PO.HeaderText = "PO";
            this.PO.Name = "PO";
            this.PO.ReadOnly = true;
            // 
            // Item
            // 
            this.Item.DataPropertyName = "Item";
            this.Item.HeaderText = "Item";
            this.Item.Name = "Item";
            this.Item.ReadOnly = true;
            // 
            // Material
            // 
            this.Material.DataPropertyName = "Material";
            this.Material.HeaderText = "Material";
            this.Material.Name = "Material";
            this.Material.ReadOnly = true;
            // 
            // 交付日期
            // 
            this.交付日期.DataPropertyName = "交付日期";
            this.交付日期.HeaderText = "交付日期";
            this.交付日期.Name = "交付日期";
            this.交付日期.ReadOnly = true;
            // 
            // Qty
            // 
            this.Qty.DataPropertyName = "Qty";
            this.Qty.HeaderText = "订单数量";
            this.Qty.Name = "Qty";
            this.Qty.ReadOnly = true;
            // 
            // Qty1
            // 
            this.Qty1.DataPropertyName = "Qty1";
            this.Qty1.HeaderText = "已收数量";
            this.Qty1.Name = "Qty1";
            this.Qty1.ReadOnly = true;
            // 
            // Qty2
            // 
            this.Qty2.DataPropertyName = "Qty2";
            this.Qty2.HeaderText = "扫描数量";
            this.Qty2.Name = "Qty2";
            this.Qty2.ReadOnly = true;
            // 
            // VS
            // 
            this.VS.DataPropertyName = "VS";
            this.VS.HeaderText = "VS";
            this.VS.Name = "VS";
            this.VS.ReadOnly = true;
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
            this.chkcol.Visible = false;
            // 
            // lblqty
            // 
            this.lblqty.BackColor = System.Drawing.Color.Transparent;
            this.lblqty.Font = new System.Drawing.Font("微软雅黑", 21.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            this.lblqty.ForeColor = System.Drawing.Color.Blue;
            this.lblqty.Location = new System.Drawing.Point(142, 14);
            this.lblqty.Name = "lblqty";
            this.lblqty.Size = new System.Drawing.Size(87, 39);
            this.lblqty.TabIndex = 10;
            this.lblqty.Text = "0";
            // 
            // FormC1_2
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 12F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1112, 739);
            this.Controls.Add(this.panel2);
            this.Controls.Add(this.panel1);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedDialog;
            this.Name = "FormC1_2";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "收货-过账";
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.FormC1_2_FormClosing);
            this.Load += new System.EventHandler(this.FormC1_2_Load);
            this.panel1.ResumeLayout(false);
            this.panel1.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).EndInit();
            this.panel2.ResumeLayout(false);
            this.panel2.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgv2)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.PictureBox pictureBox1;
        private System.Windows.Forms.Panel panel2;
        private System.Windows.Forms.Label lblpackqty;
        private System.Windows.Forms.Label lblqty;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label4;
        private FanNetWorldDataGridViewEx.DataGridViewEx dgv2;
        private System.Windows.Forms.Button button2;
        private System.Windows.Forms.Label lblinfo;
        private System.Windows.Forms.CheckBox chkshouhuo;
        private System.Windows.Forms.Label lblokqty;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.DataGridViewTextBoxColumn Vendor;
        private System.Windows.Forms.DataGridViewTextBoxColumn PO;
        private System.Windows.Forms.DataGridViewTextBoxColumn Item;
        private System.Windows.Forms.DataGridViewTextBoxColumn Material;
        private System.Windows.Forms.DataGridViewTextBoxColumn 交付日期;
        private System.Windows.Forms.DataGridViewTextBoxColumn Qty;
        private System.Windows.Forms.DataGridViewTextBoxColumn Qty1;
        private System.Windows.Forms.DataGridViewTextBoxColumn Qty2;
        private System.Windows.Forms.DataGridViewTextBoxColumn VS;
        private System.Windows.Forms.DataGridViewCheckBoxColumn chkcol;
    }
}