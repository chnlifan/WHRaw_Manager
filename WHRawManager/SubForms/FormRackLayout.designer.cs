namespace WHRawManager
{
    partial class FormRackLayout
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
            this.lblLayoutname = new System.Windows.Forms.Label();
            this.SuspendLayout();
            // 
            // lblLayoutname
            // 
            this.lblLayoutname.AutoSize = true;
            this.lblLayoutname.BackColor = System.Drawing.Color.Transparent;
            this.lblLayoutname.Font = new System.Drawing.Font("黑体", 26.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblLayoutname.Location = new System.Drawing.Point(319, 274);
            this.lblLayoutname.Name = "lblLayoutname";
            this.lblLayoutname.Size = new System.Drawing.Size(311, 35);
            this.lblLayoutname.TabIndex = 0;
            this.lblLayoutname.Text = "原材料仓库布局图";
            // 
            // FormRackLayout
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 12F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.SystemColors.Control;
            this.ClientSize = new System.Drawing.Size(1033, 657);
            this.Controls.Add(this.lblLayoutname);
            this.DoubleBuffered = true;
            this.Enabled = false;
            this.Name = "FormRackLayout";
            this.Text = "库位图";
            this.Load += new System.EventHandler(this.FormRackLayout_Load);
            this.Resize += new System.EventHandler(this.FormRackLayout_Resize);
            //this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label lblLayoutname;
    }
}