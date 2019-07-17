namespace WHRawManager
{
    partial class FormTodayStatus
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
            this.components = new System.ComponentModel.Container();
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(FormTodayStatus));
            System.Windows.Forms.DataVisualization.Charting.ChartArea chartArea1 = new System.Windows.Forms.DataVisualization.Charting.ChartArea();
            System.Windows.Forms.DataVisualization.Charting.Legend legend1 = new System.Windows.Forms.DataVisualization.Charting.Legend();
            System.Windows.Forms.DataVisualization.Charting.Series series1 = new System.Windows.Forms.DataVisualization.Charting.Series();
            this.panel1 = new System.Windows.Forms.Panel();
            this.pictureBox3 = new System.Windows.Forms.PictureBox();
            this.pictureBox2 = new System.Windows.Forms.PictureBox();
            this.marklate = new System.Windows.Forms.Label();
            this.markno = new System.Windows.Forms.Label();
            this.markpart = new System.Windows.Forms.Label();
            this.markok = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.pictureBox1 = new System.Windows.Forms.PictureBox();
            this.flowLayoutPanel1 = new System.Windows.Forms.FlowLayoutPanel();
            this.timer1 = new System.Windows.Forms.Timer(this.components);
            this.chartpanel = new System.Windows.Forms.Panel();
            this.chart1 = new System.Windows.Forms.DataVisualization.Charting.Chart();
            this.timer2 = new System.Windows.Forms.Timer(this.components);
            this.panel1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox3)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox2)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).BeginInit();
            this.chartpanel.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.chart1)).BeginInit();
            this.SuspendLayout();
            // 
            // panel1
            // 
            this.panel1.BackColor = System.Drawing.SystemColors.GradientActiveCaption;
            this.panel1.BackgroundImage = global::WHRawManager.Properties.Resources.bj;
            this.panel1.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch;
            this.panel1.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.panel1.Controls.Add(this.pictureBox3);
            this.panel1.Controls.Add(this.pictureBox2);
            this.panel1.Controls.Add(this.marklate);
            this.panel1.Controls.Add(this.markno);
            this.panel1.Controls.Add(this.markpart);
            this.panel1.Controls.Add(this.markok);
            this.panel1.Controls.Add(this.label1);
            this.panel1.Controls.Add(this.pictureBox1);
            this.panel1.Dock = System.Windows.Forms.DockStyle.Top;
            this.panel1.Location = new System.Drawing.Point(0, 0);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(1168, 83);
            this.panel1.TabIndex = 1;
            // 
            // pictureBox3
            // 
            this.pictureBox3.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.pictureBox3.BackColor = System.Drawing.Color.Transparent;
            this.pictureBox3.Image = ((System.Drawing.Image)(resources.GetObject("pictureBox3.Image")));
            this.pictureBox3.Location = new System.Drawing.Point(1089, 25);
            this.pictureBox3.Name = "pictureBox3";
            this.pictureBox3.Size = new System.Drawing.Size(41, 40);
            this.pictureBox3.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            this.pictureBox3.TabIndex = 9;
            this.pictureBox3.TabStop = false;
            this.pictureBox3.Click += new System.EventHandler(this.pictureBox3_Click);
            // 
            // pictureBox2
            // 
            this.pictureBox2.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.pictureBox2.BackColor = System.Drawing.SystemColors.ButtonFace;
            this.pictureBox2.Image = ((System.Drawing.Image)(resources.GetObject("pictureBox2.Image")));
            this.pictureBox2.Location = new System.Drawing.Point(1136, 0);
            this.pictureBox2.Name = "pictureBox2";
            this.pictureBox2.Size = new System.Drawing.Size(30, 28);
            this.pictureBox2.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            this.pictureBox2.TabIndex = 8;
            this.pictureBox2.TabStop = false;
            this.pictureBox2.Click += new System.EventHandler(this.pictureBox2_Click);
            // 
            // marklate
            // 
            this.marklate.BackColor = System.Drawing.Color.White;
            this.marklate.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.marklate.Font = new System.Drawing.Font("宋体", 14.25F, ((System.Drawing.FontStyle)((System.Drawing.FontStyle.Bold | System.Drawing.FontStyle.Italic))), System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            this.marklate.Location = new System.Drawing.Point(923, 21);
            this.marklate.Name = "marklate";
            this.marklate.Size = new System.Drawing.Size(90, 43);
            this.marklate.TabIndex = 7;
            this.marklate.Text = "已延期";
            this.marklate.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            // 
            // markno
            // 
            this.markno.BackColor = System.Drawing.Color.White;
            this.markno.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.markno.Font = new System.Drawing.Font("宋体", 14.25F, ((System.Drawing.FontStyle)((System.Drawing.FontStyle.Bold | System.Drawing.FontStyle.Italic))), System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            this.markno.Location = new System.Drawing.Point(821, 22);
            this.markno.Name = "markno";
            this.markno.Size = new System.Drawing.Size(90, 43);
            this.markno.TabIndex = 6;
            this.markno.Text = "待交付";
            this.markno.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            // 
            // markpart
            // 
            this.markpart.BackColor = System.Drawing.Color.White;
            this.markpart.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.markpart.Font = new System.Drawing.Font("宋体", 14.25F, ((System.Drawing.FontStyle)((System.Drawing.FontStyle.Bold | System.Drawing.FontStyle.Italic))), System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            this.markpart.Location = new System.Drawing.Point(719, 21);
            this.markpart.Name = "markpart";
            this.markpart.Size = new System.Drawing.Size(90, 43);
            this.markpart.TabIndex = 5;
            this.markpart.Text = "交付中";
            this.markpart.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            // 
            // markok
            // 
            this.markok.BackColor = System.Drawing.Color.White;
            this.markok.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.markok.Font = new System.Drawing.Font("宋体", 14.25F, ((System.Drawing.FontStyle)((System.Drawing.FontStyle.Bold | System.Drawing.FontStyle.Italic))), System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            this.markok.Location = new System.Drawing.Point(617, 21);
            this.markok.Name = "markok";
            this.markok.Size = new System.Drawing.Size(90, 43);
            this.markok.TabIndex = 4;
            this.markok.Text = "已交付";
            this.markok.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.BackColor = System.Drawing.Color.Transparent;
            this.label1.Font = new System.Drawing.Font("微软雅黑", 36F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            this.label1.Location = new System.Drawing.Point(100, 8);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(337, 64);
            this.label1.TabIndex = 1;
            this.label1.Text = "收货-今日状态";
            this.label1.Click += new System.EventHandler(this.label1_Click);
            this.label1.DoubleClick += new System.EventHandler(this.label1_DoubleClick);
            // 
            // pictureBox1
            // 
            this.pictureBox1.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("pictureBox1.BackgroundImage")));
            this.pictureBox1.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch;
            this.pictureBox1.Location = new System.Drawing.Point(17, 21);
            this.pictureBox1.Name = "pictureBox1";
            this.pictureBox1.Size = new System.Drawing.Size(77, 40);
            this.pictureBox1.TabIndex = 0;
            this.pictureBox1.TabStop = false;
            // 
            // flowLayoutPanel1
            // 
            this.flowLayoutPanel1.BackColor = System.Drawing.Color.White;
            this.flowLayoutPanel1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.flowLayoutPanel1.Location = new System.Drawing.Point(0, 83);
            this.flowLayoutPanel1.Name = "flowLayoutPanel1";
            this.flowLayoutPanel1.Size = new System.Drawing.Size(1168, 655);
            this.flowLayoutPanel1.TabIndex = 2;
            // 
            // timer1
            // 
            this.timer1.Interval = 25000;
            this.timer1.Tick += new System.EventHandler(this.timer1_Tick);
            // 
            // chartpanel
            // 
            this.chartpanel.Controls.Add(this.chart1);
            this.chartpanel.Dock = System.Windows.Forms.DockStyle.Fill;
            this.chartpanel.Location = new System.Drawing.Point(0, 83);
            this.chartpanel.Name = "chartpanel";
            this.chartpanel.Size = new System.Drawing.Size(1168, 655);
            this.chartpanel.TabIndex = 0;
            this.chartpanel.Visible = false;
            // 
            // chart1
            // 
            chartArea1.Name = "ChartArea1";
            this.chart1.ChartAreas.Add(chartArea1);
            this.chart1.Dock = System.Windows.Forms.DockStyle.Fill;
            legend1.Alignment = System.Drawing.StringAlignment.Center;
            legend1.Docking = System.Windows.Forms.DataVisualization.Charting.Docking.Bottom;
            legend1.Font = new System.Drawing.Font("Microsoft Sans Serif", 15.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            legend1.IsTextAutoFit = false;
            legend1.Name = "Legend1";
            this.chart1.Legends.Add(legend1);
            this.chart1.Location = new System.Drawing.Point(0, 0);
            this.chart1.Name = "chart1";
            series1.ChartArea = "ChartArea1";
            series1.ChartType = System.Windows.Forms.DataVisualization.Charting.SeriesChartType.Pie;
            series1.Font = new System.Drawing.Font("Microsoft Sans Serif", 15.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            series1.IsValueShownAsLabel = true;
            series1.Legend = "Legend1";
            series1.Name = "Series1";
            this.chart1.Series.Add(series1);
            this.chart1.Size = new System.Drawing.Size(1168, 655);
            this.chart1.TabIndex = 0;
            this.chart1.Text = "chart1";
            // 
            // timer2
            // 
            this.timer2.Interval = 60000;
            this.timer2.Tick += new System.EventHandler(this.timer2_Tick);
            // 
            // FormTodayStatus
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 12F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1168, 738);
            this.Controls.Add(this.chartpanel);
            this.Controls.Add(this.flowLayoutPanel1);
            this.Controls.Add(this.panel1);
            this.Name = "FormTodayStatus";
            this.Text = "今日状态";
            this.Load += new System.EventHandler(this.FormTodayStatus_Load);
            this.KeyUp += new System.Windows.Forms.KeyEventHandler(this.FormTodayStatus_KeyUp);
            this.Resize += new System.EventHandler(this.FormTodayStatus_Resize);
            this.panel1.ResumeLayout(false);
            this.panel1.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox3)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox2)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).EndInit();
            this.chartpanel.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.chart1)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.PictureBox pictureBox1;
        private System.Windows.Forms.FlowLayoutPanel flowLayoutPanel1;
        private System.Windows.Forms.Label markok;
        private System.Windows.Forms.Label marklate;
        private System.Windows.Forms.Label markno;
        private System.Windows.Forms.Label markpart;
        private System.Windows.Forms.PictureBox pictureBox2;
        private System.Windows.Forms.PictureBox pictureBox3;
        private System.Windows.Forms.Timer timer1;
        private System.Windows.Forms.Panel chartpanel;
        private System.Windows.Forms.DataVisualization.Charting.Chart chart1;
        private System.Windows.Forms.Timer timer2;
    }
}