namespace WHRawManager
{
    partial class MainForm
    {
        /// <summary>
        /// 必需的设计器变量。
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// 清理所有正在使用的资源。
        /// </summary>
        /// <param name="disposing">如果应释放托管资源，为 true；否则为 false。</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows 窗体设计器生成的代码

        /// <summary>
        /// 设计器支持所需的方法 - 不要修改
        /// 使用代码编辑器修改此方法的内容。
        /// </summary>
        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(MainForm));
            this.toolStripContainer1 = new System.Windows.Forms.ToolStripContainer();
            this.panel1 = new System.Windows.Forms.Panel();
            this.toolStrip1 = new System.Windows.Forms.ToolStrip();
            this.buttonlogo = new System.Windows.Forms.ToolStripButton();
            this.buttonpwd = new System.Windows.Forms.ToolStripButton();
            this.toolStripSeparator2 = new System.Windows.Forms.ToolStripSeparator();
            this.buttonc1 = new System.Windows.Forms.ToolStripButton();
            this.buttonc1query = new System.Windows.Forms.ToolStripButton();
            this.buttonc1today = new System.Windows.Forms.ToolStripButton();
            this.toolStripSeparator1 = new System.Windows.Forms.ToolStripSeparator();
            this.buttonc2deliv = new System.Windows.Forms.ToolStripButton();
            this.buttonc2query = new System.Windows.Forms.ToolStripButton();
            this.toolStripSeparator3 = new System.Windows.Forms.ToolStripSeparator();
            this.buttonrawquery = new System.Windows.Forms.ToolStripButton();
            this.toolStripSeparator4 = new System.Windows.Forms.ToolStripSeparator();
            this.buttondatamaintain = new System.Windows.Forms.ToolStripButton();
            this.buttonrightsetting = new System.Windows.Forms.ToolStripButton();
            this.toolStripContainer1.ContentPanel.SuspendLayout();
            this.toolStripContainer1.TopToolStripPanel.SuspendLayout();
            this.toolStripContainer1.SuspendLayout();
            this.toolStrip1.SuspendLayout();
            this.SuspendLayout();
            // 
            // toolStripContainer1
            // 
            // 
            // toolStripContainer1.ContentPanel
            // 
            this.toolStripContainer1.ContentPanel.Controls.Add(this.panel1);
            this.toolStripContainer1.ContentPanel.Size = new System.Drawing.Size(1065, 644);
            this.toolStripContainer1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.toolStripContainer1.Location = new System.Drawing.Point(0, 0);
            this.toolStripContainer1.Name = "toolStripContainer1";
            this.toolStripContainer1.Size = new System.Drawing.Size(1065, 734);
            this.toolStripContainer1.TabIndex = 0;
            this.toolStripContainer1.Text = "toolStripContainer1";
            // 
            // toolStripContainer1.TopToolStripPanel
            // 
            this.toolStripContainer1.TopToolStripPanel.Controls.Add(this.toolStrip1);
            // 
            // panel1
            // 
            this.panel1.BackColor = System.Drawing.Color.Transparent;
            this.panel1.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("panel1.BackgroundImage")));
            this.panel1.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch;
            this.panel1.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.panel1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.panel1.Location = new System.Drawing.Point(0, 0);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(1065, 644);
            this.panel1.TabIndex = 0;
            // 
            // toolStrip1
            // 
            this.toolStrip1.BackColor = System.Drawing.SystemColors.ButtonFace;
            this.toolStrip1.Dock = System.Windows.Forms.DockStyle.None;
            this.toolStrip1.ImageScalingSize = new System.Drawing.Size(64, 64);
            this.toolStrip1.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.buttonlogo,
            this.buttonpwd,
            this.toolStripSeparator2,
            this.buttonc1,
            this.buttonc1query,
            this.buttonc1today,
            this.toolStripSeparator1,
            this.buttonc2deliv,
            this.buttonc2query,
            this.toolStripSeparator3,
            this.buttonrawquery,
            this.toolStripSeparator4,
            this.buttondatamaintain,
            this.buttonrightsetting});
            this.toolStrip1.Location = new System.Drawing.Point(0, 0);
            this.toolStrip1.Name = "toolStrip1";
            this.toolStrip1.Size = new System.Drawing.Size(1065, 90);
            this.toolStrip1.Stretch = true;
            this.toolStrip1.TabIndex = 0;
            // 
            // buttonlogo
            // 
            this.buttonlogo.Font = new System.Drawing.Font("微软雅黑", 10.5F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            this.buttonlogo.Image = ((System.Drawing.Image)(resources.GetObject("buttonlogo.Image")));
            this.buttonlogo.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.buttonlogo.Name = "buttonlogo";
            this.buttonlogo.Size = new System.Drawing.Size(68, 87);
            this.buttonlogo.Tag = "登录";
            this.buttonlogo.Text = "登录";
            this.buttonlogo.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageAboveText;
            this.buttonlogo.Click += new System.EventHandler(this.buttonlogo_Click);
            // 
            // buttonpwd
            // 
            this.buttonpwd.Enabled = false;
            this.buttonpwd.Font = new System.Drawing.Font("微软雅黑", 10.5F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            this.buttonpwd.Image = ((System.Drawing.Image)(resources.GetObject("buttonpwd.Image")));
            this.buttonpwd.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.buttonpwd.Name = "buttonpwd";
            this.buttonpwd.Size = new System.Drawing.Size(69, 87);
            this.buttonpwd.Tag = "修改密码";
            this.buttonpwd.Text = "修改密码";
            this.buttonpwd.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageAboveText;
            this.buttonpwd.Click += new System.EventHandler(this.buttonpwd_Click);
            // 
            // toolStripSeparator2
            // 
            this.toolStripSeparator2.Name = "toolStripSeparator2";
            this.toolStripSeparator2.Size = new System.Drawing.Size(6, 90);
            // 
            // buttonc1
            // 
            this.buttonc1.Enabled = false;
            this.buttonc1.Font = new System.Drawing.Font("微软雅黑", 10.5F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            this.buttonc1.Image = ((System.Drawing.Image)(resources.GetObject("buttonc1.Image")));
            this.buttonc1.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.buttonc1.Name = "buttonc1";
            this.buttonc1.Size = new System.Drawing.Size(68, 87);
            this.buttonc1.Tag = "收货";
            this.buttonc1.Text = "收货";
            this.buttonc1.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageAboveText;
            this.buttonc1.Click += new System.EventHandler(this.buttonc1_Click);
            // 
            // buttonc1query
            // 
            this.buttonc1query.Enabled = false;
            this.buttonc1query.Font = new System.Drawing.Font("微软雅黑", 10.5F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            this.buttonc1query.Image = ((System.Drawing.Image)(resources.GetObject("buttonc1query.Image")));
            this.buttonc1query.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.buttonc1query.Name = "buttonc1query";
            this.buttonc1query.Size = new System.Drawing.Size(69, 87);
            this.buttonc1query.Tag = "收货查询";
            this.buttonc1query.Text = "收货查询";
            this.buttonc1query.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageAboveText;
            this.buttonc1query.Click += new System.EventHandler(this.buttonc1query_Click);
            // 
            // buttonc1today
            // 
            this.buttonc1today.Enabled = false;
            this.buttonc1today.Font = new System.Drawing.Font("微软雅黑", 10.5F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            this.buttonc1today.Image = ((System.Drawing.Image)(resources.GetObject("buttonc1today.Image")));
            this.buttonc1today.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.buttonc1today.Name = "buttonc1today";
            this.buttonc1today.Size = new System.Drawing.Size(69, 87);
            this.buttonc1today.Tag = "今日状态";
            this.buttonc1today.Text = "今日状态";
            this.buttonc1today.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageAboveText;
            this.buttonc1today.Click += new System.EventHandler(this.buttonc1today_Click);
            // 
            // toolStripSeparator1
            // 
            this.toolStripSeparator1.BackColor = System.Drawing.SystemColors.ActiveCaption;
            this.toolStripSeparator1.ForeColor = System.Drawing.SystemColors.ActiveCaptionText;
            this.toolStripSeparator1.Name = "toolStripSeparator1";
            this.toolStripSeparator1.Size = new System.Drawing.Size(6, 90);
            // 
            // buttonc2deliv
            // 
            this.buttonc2deliv.Enabled = false;
            this.buttonc2deliv.Font = new System.Drawing.Font("微软雅黑", 10.5F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            this.buttonc2deliv.Image = ((System.Drawing.Image)(resources.GetObject("buttonc2deliv.Image")));
            this.buttonc2deliv.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.buttonc2deliv.Name = "buttonc2deliv";
            this.buttonc2deliv.Size = new System.Drawing.Size(68, 87);
            this.buttonc2deliv.Tag = "发料";
            this.buttonc2deliv.Text = "发料";
            this.buttonc2deliv.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageAboveText;
            this.buttonc2deliv.Click += new System.EventHandler(this.toolStripButton1_Click);
            // 
            // buttonc2query
            // 
            this.buttonc2query.Enabled = false;
            this.buttonc2query.Font = new System.Drawing.Font("微软雅黑", 10.5F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            this.buttonc2query.Image = ((System.Drawing.Image)(resources.GetObject("buttonc2query.Image")));
            this.buttonc2query.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.buttonc2query.Name = "buttonc2query";
            this.buttonc2query.Size = new System.Drawing.Size(69, 87);
            this.buttonc2query.Tag = "发料查询";
            this.buttonc2query.Text = "发料查询";
            this.buttonc2query.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageAboveText;
            this.buttonc2query.Click += new System.EventHandler(this.buttonc2query_Click);
            // 
            // toolStripSeparator3
            // 
            this.toolStripSeparator3.Name = "toolStripSeparator3";
            this.toolStripSeparator3.Size = new System.Drawing.Size(6, 90);
            // 
            // buttonrawquery
            // 
            this.buttonrawquery.Enabled = false;
            this.buttonrawquery.Font = new System.Drawing.Font("微软雅黑", 10.5F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            this.buttonrawquery.Image = ((System.Drawing.Image)(resources.GetObject("buttonrawquery.Image")));
            this.buttonrawquery.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.buttonrawquery.Name = "buttonrawquery";
            this.buttonrawquery.Size = new System.Drawing.Size(69, 87);
            this.buttonrawquery.Tag = "库存查询";
            this.buttonrawquery.Text = "库存查询";
            this.buttonrawquery.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageAboveText;
            this.buttonrawquery.Click += new System.EventHandler(this.toolStripButton1_Click_1);
            // 
            // toolStripSeparator4
            // 
            this.toolStripSeparator4.Name = "toolStripSeparator4";
            this.toolStripSeparator4.Size = new System.Drawing.Size(6, 90);
            // 
            // buttondatamaintain
            // 
            this.buttondatamaintain.Enabled = false;
            this.buttondatamaintain.Font = new System.Drawing.Font("微软雅黑", 10.5F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            this.buttondatamaintain.Image = ((System.Drawing.Image)(resources.GetObject("buttondatamaintain.Image")));
            this.buttondatamaintain.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.buttondatamaintain.Name = "buttondatamaintain";
            this.buttondatamaintain.Size = new System.Drawing.Size(69, 87);
            this.buttondatamaintain.Tag = "数据维护";
            this.buttondatamaintain.Text = "数据维护";
            this.buttondatamaintain.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageAboveText;
            this.buttondatamaintain.Click += new System.EventHandler(this.toolStripButton1_Click_2);
            // 
            // buttonrightsetting
            // 
            this.buttonrightsetting.Enabled = false;
            this.buttonrightsetting.Font = new System.Drawing.Font("微软雅黑", 10.5F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            this.buttonrightsetting.Image = ((System.Drawing.Image)(resources.GetObject("buttonrightsetting.Image")));
            this.buttonrightsetting.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.buttonrightsetting.Name = "buttonrightsetting";
            this.buttonrightsetting.Size = new System.Drawing.Size(69, 87);
            this.buttonrightsetting.Tag = "权限设定";
            this.buttonrightsetting.Text = "权限设定";
            this.buttonrightsetting.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageAboveText;
            this.buttonrightsetting.Click += new System.EventHandler(this.toolStripButton1_Click_3);
            // 
            // MainForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 12F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1065, 734);
            this.Controls.Add(this.toolStripContainer1);
            this.Name = "MainForm";
            this.Text = "数据维护";
            this.WindowState = System.Windows.Forms.FormWindowState.Maximized;
            this.Load += new System.EventHandler(this.MainForm_Load);
            this.toolStripContainer1.ContentPanel.ResumeLayout(false);
            this.toolStripContainer1.TopToolStripPanel.ResumeLayout(false);
            this.toolStripContainer1.TopToolStripPanel.PerformLayout();
            this.toolStripContainer1.ResumeLayout(false);
            this.toolStripContainer1.PerformLayout();
            this.toolStrip1.ResumeLayout(false);
            this.toolStrip1.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.ToolStripContainer toolStripContainer1;
        private System.Windows.Forms.ToolStrip toolStrip1;
        private System.Windows.Forms.ToolStripSeparator toolStripSeparator2;
        private System.Windows.Forms.Panel panel1;
        public System.Windows.Forms.ToolStripButton buttonlogo;
        public System.Windows.Forms.ToolStripButton buttonpwd;
        private System.Windows.Forms.ToolStripButton buttonc1;
        private System.Windows.Forms.ToolStripSeparator toolStripSeparator1;
        private System.Windows.Forms.ToolStripButton buttonc1query;
        private System.Windows.Forms.ToolStripButton buttonc1today;
        private System.Windows.Forms.ToolStripButton buttonc2deliv;
        private System.Windows.Forms.ToolStripButton buttonc2query;
        private System.Windows.Forms.ToolStripSeparator toolStripSeparator3;
        private System.Windows.Forms.ToolStripButton buttonrawquery;
        private System.Windows.Forms.ToolStripSeparator toolStripSeparator4;
        private System.Windows.Forms.ToolStripButton buttondatamaintain;
        private System.Windows.Forms.ToolStripButton buttonrightsetting;
    }
}

