namespace WHRawManager
{
    partial class FormC2
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(FormC2));
            this.panel1 = new System.Windows.Forms.Panel();
            this.chkbigfont = new System.Windows.Forms.CheckBox();
            this.chkonlydisplay = new System.Windows.Forms.CheckBox();
            this.chksingleshow = new System.Windows.Forms.CheckBox();
            this.pictureBox2 = new System.Windows.Forms.PictureBox();
            this.chksound = new System.Windows.Forms.CheckBox();
            this.button2 = new System.Windows.Forms.Button();
            this.lblinfo = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.pictureBox1 = new System.Windows.Forms.PictureBox();
            this.txtc1 = new System.Windows.Forms.TextBox();
            this.panel3 = new System.Windows.Forms.Panel();
            this.lblqty = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.dgv = new FanNetWorldDataGridViewEx.DataGridViewEx();
            this.raw = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.rack = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.qty = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.panelMap = new System.Windows.Forms.Panel();
            this.splitContainer1 = new System.Windows.Forms.SplitContainer();
            this.panel1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox2)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).BeginInit();
            this.panel3.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgv)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.splitContainer1)).BeginInit();
            this.splitContainer1.Panel1.SuspendLayout();
            this.splitContainer1.Panel2.SuspendLayout();
            this.splitContainer1.SuspendLayout();
            this.SuspendLayout();
            // 
            // panel1
            // 
            this.panel1.BackColor = System.Drawing.SystemColors.GradientActiveCaption;
            this.panel1.BackgroundImage = global::WHRawManager.Properties.Resources.bj;
            this.panel1.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch;
            this.panel1.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.panel1.Controls.Add(this.chkbigfont);
            this.panel1.Controls.Add(this.chkonlydisplay);
            this.panel1.Controls.Add(this.chksingleshow);
            this.panel1.Controls.Add(this.pictureBox2);
            this.panel1.Controls.Add(this.chksound);
            this.panel1.Controls.Add(this.button2);
            this.panel1.Controls.Add(this.lblinfo);
            this.panel1.Controls.Add(this.label1);
            this.panel1.Controls.Add(this.pictureBox1);
            this.panel1.Dock = System.Windows.Forms.DockStyle.Top;
            this.panel1.Location = new System.Drawing.Point(0, 0);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(1157, 87);
            this.panel1.TabIndex = 0;
            // 
            // chkbigfont
            // 
            this.chkbigfont.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.chkbigfont.AutoSize = true;
            this.chkbigfont.BackColor = System.Drawing.Color.Transparent;
            this.chkbigfont.Checked = true;
            this.chkbigfont.CheckState = System.Windows.Forms.CheckState.Checked;
            this.chkbigfont.Font = new System.Drawing.Font("微软雅黑", 7.5F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            this.chkbigfont.Location = new System.Drawing.Point(1063, 64);
            this.chkbigfont.Name = "chkbigfont";
            this.chkbigfont.Size = new System.Drawing.Size(66, 19);
            this.chkbigfont.TabIndex = 21;
            this.chkbigfont.Text = "字体加大";
            this.chkbigfont.UseVisualStyleBackColor = false;
            this.chkbigfont.CheckedChanged += new System.EventHandler(this.chkbigfont_CheckedChanged);
            // 
            // chkonlydisplay
            // 
            this.chkonlydisplay.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.chkonlydisplay.AutoSize = true;
            this.chkonlydisplay.BackColor = System.Drawing.Color.Transparent;
            this.chkonlydisplay.Font = new System.Drawing.Font("微软雅黑", 7.5F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            this.chkonlydisplay.Location = new System.Drawing.Point(1062, 39);
            this.chkonlydisplay.Name = "chkonlydisplay";
            this.chkonlydisplay.Size = new System.Drawing.Size(86, 19);
            this.chkonlydisplay.TabIndex = 20;
            this.chkonlydisplay.Text = "只显示不入账";
            this.chkonlydisplay.UseVisualStyleBackColor = false;
            // 
            // chksingleshow
            // 
            this.chksingleshow.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.chksingleshow.AutoSize = true;
            this.chksingleshow.BackColor = System.Drawing.Color.Transparent;
            this.chksingleshow.Checked = true;
            this.chksingleshow.CheckState = System.Windows.Forms.CheckState.Checked;
            this.chksingleshow.Font = new System.Drawing.Font("微软雅黑", 7.5F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            this.chksingleshow.Location = new System.Drawing.Point(993, 65);
            this.chksingleshow.Name = "chksingleshow";
            this.chksingleshow.Size = new System.Drawing.Size(66, 19);
            this.chksingleshow.TabIndex = 19;
            this.chksingleshow.Text = "单批显示";
            this.chksingleshow.UseVisualStyleBackColor = false;
            this.chksingleshow.CheckedChanged += new System.EventHandler(this.chksingleshow_CheckedChanged);
            // 
            // pictureBox2
            // 
            this.pictureBox2.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.pictureBox2.BackColor = System.Drawing.SystemColors.ButtonFace;
            this.pictureBox2.Image = ((System.Drawing.Image)(resources.GetObject("pictureBox2.Image")));
            this.pictureBox2.Location = new System.Drawing.Point(1114, 4);
            this.pictureBox2.Name = "pictureBox2";
            this.pictureBox2.Size = new System.Drawing.Size(35, 31);
            this.pictureBox2.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            this.pictureBox2.TabIndex = 18;
            this.pictureBox2.TabStop = false;
            this.pictureBox2.Click += new System.EventHandler(this.pictureBox2_Click);
            // 
            // chksound
            // 
            this.chksound.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.chksound.AutoSize = true;
            this.chksound.BackColor = System.Drawing.Color.Transparent;
            this.chksound.Checked = true;
            this.chksound.CheckState = System.Windows.Forms.CheckState.Checked;
            this.chksound.Font = new System.Drawing.Font("微软雅黑", 7.5F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            this.chksound.Location = new System.Drawing.Point(1062, 12);
            this.chksound.Name = "chksound";
            this.chksound.Size = new System.Drawing.Size(46, 19);
            this.chksound.TabIndex = 17;
            this.chksound.Text = "音效";
            this.chksound.UseVisualStyleBackColor = false;
            this.chksound.CheckedChanged += new System.EventHandler(this.chksound_CheckedChanged);
            // 
            // button2
            // 
            this.button2.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.button2.BackColor = System.Drawing.SystemColors.GradientActiveCaption;
            this.button2.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.button2.Font = new System.Drawing.Font("宋体", 10.5F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            this.button2.Image = global::WHRawManager.Properties.Resources.export32x32_24_bit;
            this.button2.ImageAlign = System.Drawing.ContentAlignment.TopCenter;
            this.button2.Location = new System.Drawing.Point(989, 4);
            this.button2.Name = "button2";
            this.button2.Size = new System.Drawing.Size(66, 58);
            this.button2.TabIndex = 16;
            this.button2.Text = "过账";
            this.button2.TextAlign = System.Drawing.ContentAlignment.BottomCenter;
            this.button2.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageAboveText;
            this.button2.UseVisualStyleBackColor = false;
            this.button2.Click += new System.EventHandler(this.button2_Click);
            // 
            // lblinfo
            // 
            this.lblinfo.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.lblinfo.BackColor = System.Drawing.Color.Transparent;
            this.lblinfo.Font = new System.Drawing.Font("微软雅黑", 21.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            this.lblinfo.ForeColor = System.Drawing.Color.Black;
            this.lblinfo.Location = new System.Drawing.Point(294, 5);
            this.lblinfo.Name = "lblinfo";
            this.lblinfo.Size = new System.Drawing.Size(683, 74);
            this.lblinfo.TabIndex = 3;
            this.lblinfo.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.BackColor = System.Drawing.Color.Transparent;
            this.label1.Font = new System.Drawing.Font("微软雅黑", 42F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            this.label1.Location = new System.Drawing.Point(103, 4);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(144, 75);
            this.label1.TabIndex = 1;
            this.label1.Text = "发料";
            this.label1.Click += new System.EventHandler(this.label1_Click);
            // 
            // pictureBox1
            // 
            this.pictureBox1.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("pictureBox1.BackgroundImage")));
            this.pictureBox1.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch;
            this.pictureBox1.Location = new System.Drawing.Point(20, 25);
            this.pictureBox1.Name = "pictureBox1";
            this.pictureBox1.Size = new System.Drawing.Size(77, 40);
            this.pictureBox1.TabIndex = 0;
            this.pictureBox1.TabStop = false;
            // 
            // txtc1
            // 
            this.txtc1.BackColor = System.Drawing.Color.White;
            this.txtc1.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.txtc1.Dock = System.Windows.Forms.DockStyle.Top;
            this.txtc1.Font = new System.Drawing.Font("宋体", 10.5F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            this.txtc1.Location = new System.Drawing.Point(0, 0);
            this.txtc1.Multiline = true;
            this.txtc1.Name = "txtc1";
            this.txtc1.Size = new System.Drawing.Size(282, 55);
            this.txtc1.TabIndex = 2;
            this.txtc1.KeyDown += new System.Windows.Forms.KeyEventHandler(this.txtc1_KeyDown);
            // 
            // panel3
            // 
            this.panel3.BackColor = System.Drawing.SystemColors.GradientInactiveCaption;
            this.panel3.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.panel3.Controls.Add(this.lblqty);
            this.panel3.Controls.Add(this.label2);
            this.panel3.Controls.Add(this.dgv);
            this.panel3.Controls.Add(this.txtc1);
            this.panel3.Dock = System.Windows.Forms.DockStyle.Fill;
            this.panel3.Location = new System.Drawing.Point(0, 0);
            this.panel3.Name = "panel3";
            this.panel3.Size = new System.Drawing.Size(284, 655);
            this.panel3.TabIndex = 2;
            this.panel3.SizeChanged += new System.EventHandler(this.panel3_SizeChanged);
            // 
            // lblqty
            // 
            this.lblqty.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.lblqty.AutoSize = true;
            this.lblqty.Font = new System.Drawing.Font("微软雅黑", 21.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            this.lblqty.ForeColor = System.Drawing.Color.Blue;
            this.lblqty.Location = new System.Drawing.Point(171, 609);
            this.lblqty.Name = "lblqty";
            this.lblqty.Size = new System.Drawing.Size(35, 39);
            this.lblqty.TabIndex = 5;
            this.lblqty.Text = "0";
            this.lblqty.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            // 
            // label2
            // 
            this.label2.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("微软雅黑", 21.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            this.label2.ForeColor = System.Drawing.Color.Green;
            this.label2.Location = new System.Drawing.Point(3, 609);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(162, 39);
            this.label2.TabIndex = 4;
            this.label2.Text = "合计数量：";
            // 
            // dgv
            // 
            this.dgv.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.dgv.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.dgv.BackgroundColor = System.Drawing.SystemColors.InactiveCaption;
            this.dgv.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgv.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.raw,
            this.rack,
            this.qty});
            this.dgv.Location = new System.Drawing.Point(4, 61);
            this.dgv.Name = "dgv";
            this.dgv.RowHeadersVisible = false;
            this.dgv.RowTemplate.Height = 23;
            this.dgv.ScrollBars = System.Windows.Forms.ScrollBars.Vertical;
            this.dgv.Size = new System.Drawing.Size(275, 542);
            this.dgv.TabIndex = 3;
            // 
            // raw
            // 
            this.raw.DataPropertyName = "raw";
            this.raw.HeaderText = "料号";
            this.raw.Name = "raw";
            // 
            // rack
            // 
            this.rack.DataPropertyName = "rack";
            this.rack.HeaderText = "货架";
            this.rack.Name = "rack";
            // 
            // qty
            // 
            this.qty.DataPropertyName = "qty";
            this.qty.HeaderText = "数量";
            this.qty.Name = "qty";
            // 
            // panelMap
            // 
            this.panelMap.Dock = System.Windows.Forms.DockStyle.Fill;
            this.panelMap.Enabled = false;
            this.panelMap.Location = new System.Drawing.Point(0, 0);
            this.panelMap.Name = "panelMap";
            this.panelMap.Size = new System.Drawing.Size(869, 655);
            this.panelMap.TabIndex = 3;
            // 
            // splitContainer1
            // 
            this.splitContainer1.BackColor = System.Drawing.SystemColors.Control;
            this.splitContainer1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.splitContainer1.FixedPanel = System.Windows.Forms.FixedPanel.Panel1;
            this.splitContainer1.Location = new System.Drawing.Point(0, 87);
            this.splitContainer1.Name = "splitContainer1";
            // 
            // splitContainer1.Panel1
            // 
            this.splitContainer1.Panel1.Controls.Add(this.panel3);
            // 
            // splitContainer1.Panel2
            // 
            this.splitContainer1.Panel2.Controls.Add(this.panelMap);
            this.splitContainer1.Size = new System.Drawing.Size(1157, 655);
            this.splitContainer1.SplitterDistance = 284;
            this.splitContainer1.TabIndex = 4;
            // 
            // FormC2
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 12F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1157, 742);
            this.Controls.Add(this.splitContainer1);
            this.Controls.Add(this.panel1);
            this.DoubleBuffered = true;
            this.Name = "FormC2";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "发料";
            this.WindowState = System.Windows.Forms.FormWindowState.Maximized;
            this.Load += new System.EventHandler(this.FormC1_Load);
            this.KeyUp += new System.Windows.Forms.KeyEventHandler(this.FormC1_KeyUp);
            this.panel1.ResumeLayout(false);
            this.panel1.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox2)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).EndInit();
            this.panel3.ResumeLayout(false);
            this.panel3.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgv)).EndInit();
            this.splitContainer1.Panel1.ResumeLayout(false);
            this.splitContainer1.Panel2.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.splitContainer1)).EndInit();
            this.splitContainer1.ResumeLayout(false);
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.PictureBox pictureBox1;
        private System.Windows.Forms.Panel panel3;
        private System.Windows.Forms.Label lblinfo;
        private FanNetWorldDataGridViewEx.DataGridViewEx dgv;
        private System.Windows.Forms.DataGridViewTextBoxColumn raw;
        private System.Windows.Forms.DataGridViewTextBoxColumn rack;
        private System.Windows.Forms.DataGridViewTextBoxColumn qty;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Panel panelMap;
        private System.Windows.Forms.Button button2;
        private System.Windows.Forms.CheckBox chksound;
        private System.Windows.Forms.PictureBox pictureBox2;
        public System.Windows.Forms.TextBox txtc1;
        private System.Windows.Forms.SplitContainer splitContainer1;
        private System.Windows.Forms.CheckBox chksingleshow;
        private System.Windows.Forms.Label lblqty;
        private System.Windows.Forms.CheckBox chkonlydisplay;
        private System.Windows.Forms.CheckBox chkbigfont;
    }
}