
namespace DW_ETL_Example
{
    partial class FormAnalysis
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
            System.Windows.Forms.DataVisualization.Charting.ChartArea chartArea3 = new System.Windows.Forms.DataVisualization.Charting.ChartArea();
            System.Windows.Forms.DataVisualization.Charting.Legend legend3 = new System.Windows.Forms.DataVisualization.Charting.Legend();
            System.Windows.Forms.DataVisualization.Charting.Series series3 = new System.Windows.Forms.DataVisualization.Charting.Series();
            this.label1 = new System.Windows.Forms.Label();
            this.cbReport1 = new System.Windows.Forms.ComboBox();
            this.btnReport1 = new System.Windows.Forms.Button();
            this.tbOrigin = new System.Windows.Forms.TextBox();
            this.lblStatOLAP = new System.Windows.Forms.Label();
            this.tbHostOLAP = new System.Windows.Forms.TextBox();
            this.label3 = new System.Windows.Forms.Label();
            this.tbDBNameOLAP = new System.Windows.Forms.TextBox();
            this.btnDiscOLAP = new System.Windows.Forms.Button();
            this.btnConnectOLAP = new System.Windows.Forms.Button();
            this.tbPassOLAP = new System.Windows.Forms.TextBox();
            this.tbUserOLAP = new System.Windows.Forms.TextBox();
            this.label7 = new System.Windows.Forms.Label();
            this.label8 = new System.Windows.Forms.Label();
            this.label9 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.label5 = new System.Windows.Forms.Label();
            this.btnReport2 = new System.Windows.Forms.Button();
            this.cbReport2 = new System.Windows.Forms.ComboBox();
            this.dgvResult = new System.Windows.Forms.DataGridView();
            this.chart1 = new System.Windows.Forms.DataVisualization.Charting.Chart();
            this.cbReport4 = new System.Windows.Forms.ComboBox();
            this.btnReport4 = new System.Windows.Forms.Button();
            this.label2 = new System.Windows.Forms.Label();
            this.tbOrigin1 = new System.Windows.Forms.TextBox();
            this.btnReport3 = new System.Windows.Forms.Button();
            this.cbReport3 = new System.Windows.Forms.ComboBox();
            this.label6 = new System.Windows.Forms.Label();
            ((System.ComponentModel.ISupportInitialize)(this.dgvResult)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.chart1)).BeginInit();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(12, 9);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(447, 29);
            this.label1.TabIndex = 0;
            this.label1.Text = "Metric 3 : Customer Purchase Frequency";
            // 
            // cbReport1
            // 
            this.cbReport1.FormattingEnabled = true;
            this.cbReport1.Items.AddRange(new object[] {
            "ALL",
            "Specific Origin",
            "ALL, Group by Origin",
            "[choose filter]"});
            this.cbReport1.Location = new System.Drawing.Point(17, 37);
            this.cbReport1.Name = "cbReport1";
            this.cbReport1.Size = new System.Drawing.Size(232, 37);
            this.cbReport1.TabIndex = 1;
            // 
            // btnReport1
            // 
            this.btnReport1.Location = new System.Drawing.Point(255, 36);
            this.btnReport1.Name = "btnReport1";
            this.btnReport1.Size = new System.Drawing.Size(126, 33);
            this.btnReport1.TabIndex = 2;
            this.btnReport1.Text = "Get Report";
            this.btnReport1.UseVisualStyleBackColor = true;
            this.btnReport1.Click += new System.EventHandler(this.btnReport1_Click);
            // 
            // tbOrigin
            // 
            this.tbOrigin.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.tbOrigin.Location = new System.Drawing.Point(17, 76);
            this.tbOrigin.Name = "tbOrigin";
            this.tbOrigin.Size = new System.Drawing.Size(96, 31);
            this.tbOrigin.TabIndex = 3;
            this.tbOrigin.Text = "Nganjuk";
            // 
            // lblStatOLAP
            // 
            this.lblStatOLAP.AutoSize = true;
            this.lblStatOLAP.Location = new System.Drawing.Point(1308, 8);
            this.lblStatOLAP.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.lblStatOLAP.Name = "lblStatOLAP";
            this.lblStatOLAP.Size = new System.Drawing.Size(162, 29);
            this.lblStatOLAP.TabIndex = 61;
            this.lblStatOLAP.Text = "status OLAP : ";
            this.lblStatOLAP.TextAlign = System.Drawing.ContentAlignment.TopRight;
            // 
            // tbHostOLAP
            // 
            this.tbHostOLAP.Location = new System.Drawing.Point(1156, 41);
            this.tbHostOLAP.Name = "tbHostOLAP";
            this.tbHostOLAP.Size = new System.Drawing.Size(378, 35);
            this.tbHostOLAP.TabIndex = 60;
            this.tbHostOLAP.Text = "sub7.sift-uc.id";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(1010, 46);
            this.label3.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(162, 29);
            this.label3.TabIndex = 59;
            this.label3.Text = "OLAP HOST :";
            // 
            // tbDBNameOLAP
            // 
            this.tbDBNameOLAP.Location = new System.Drawing.Point(1156, 77);
            this.tbDBNameOLAP.Name = "tbDBNameOLAP";
            this.tbDBNameOLAP.Size = new System.Drawing.Size(378, 35);
            this.tbDBNameOLAP.TabIndex = 58;
            this.tbDBNameOLAP.Text = "subsift8_OLAP_HagunStore";
            // 
            // btnDiscOLAP
            // 
            this.btnDiscOLAP.Location = new System.Drawing.Point(1286, 190);
            this.btnDiscOLAP.Name = "btnDiscOLAP";
            this.btnDiscOLAP.Size = new System.Drawing.Size(161, 46);
            this.btnDiscOLAP.TabIndex = 57;
            this.btnDiscOLAP.Text = "DISCONNECT";
            this.btnDiscOLAP.UseVisualStyleBackColor = true;
            this.btnDiscOLAP.Click += new System.EventHandler(this.btnDiscOLAP_Click);
            // 
            // btnConnectOLAP
            // 
            this.btnConnectOLAP.Location = new System.Drawing.Point(1156, 190);
            this.btnConnectOLAP.Name = "btnConnectOLAP";
            this.btnConnectOLAP.Size = new System.Drawing.Size(124, 46);
            this.btnConnectOLAP.TabIndex = 56;
            this.btnConnectOLAP.Text = "CONNECT";
            this.btnConnectOLAP.UseVisualStyleBackColor = true;
            this.btnConnectOLAP.Click += new System.EventHandler(this.btnConnectOLAP_Click);
            // 
            // tbPassOLAP
            // 
            this.tbPassOLAP.Location = new System.Drawing.Point(1156, 149);
            this.tbPassOLAP.Name = "tbPassOLAP";
            this.tbPassOLAP.Size = new System.Drawing.Size(378, 35);
            this.tbPassOLAP.TabIndex = 55;
            this.tbPassOLAP.Text = "6j9X0Y3t[#PfmF";
            // 
            // tbUserOLAP
            // 
            this.tbUserOLAP.Location = new System.Drawing.Point(1156, 113);
            this.tbUserOLAP.Name = "tbUserOLAP";
            this.tbUserOLAP.Size = new System.Drawing.Size(378, 35);
            this.tbUserOLAP.TabIndex = 54;
            this.tbUserOLAP.Text = "subsift8_OLAP_HagunStore_user";
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.Location = new System.Drawing.Point(1008, 152);
            this.label7.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(171, 29);
            this.label7.TabIndex = 53;
            this.label7.Text = "DB Password :";
            // 
            // label8
            // 
            this.label8.AutoSize = true;
            this.label8.Location = new System.Drawing.Point(1004, 116);
            this.label8.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label8.Name = "label8";
            this.label8.Size = new System.Drawing.Size(175, 29);
            this.label8.TabIndex = 52;
            this.label8.Text = "DB Username :";
            // 
            // label9
            // 
            this.label9.AutoSize = true;
            this.label9.Location = new System.Drawing.Point(1041, 80);
            this.label9.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label9.Name = "label9";
            this.label9.Size = new System.Drawing.Size(129, 29);
            this.label9.TabIndex = 51;
            this.label9.Text = "DB Name :";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(12, 200);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(126, 29);
            this.label4.TabIndex = 63;
            this.label4.Text = "RESULT : ";
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(12, 119);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(348, 29);
            this.label5.TabIndex = 64;
            this.label5.Text = "Metric 4 : Best-Selling Products";
            // 
            // btnReport2
            // 
            this.btnReport2.Location = new System.Drawing.Point(255, 153);
            this.btnReport2.Name = "btnReport2";
            this.btnReport2.Size = new System.Drawing.Size(126, 33);
            this.btnReport2.TabIndex = 65;
            this.btnReport2.Text = "Get Report";
            this.btnReport2.UseVisualStyleBackColor = true;
            this.btnReport2.Click += new System.EventHandler(this.btnReport2_Click);
            // 
            // cbReport2
            // 
            this.cbReport2.FormattingEnabled = true;
            this.cbReport2.Items.AddRange(new object[] {
            "ALL",
            "Monthly",
            "Yearly"});
            this.cbReport2.Location = new System.Drawing.Point(17, 154);
            this.cbReport2.Name = "cbReport2";
            this.cbReport2.Size = new System.Drawing.Size(232, 37);
            this.cbReport2.TabIndex = 66;
            // 
            // dgvResult
            // 
            this.dgvResult.AllowUserToAddRows = false;
            this.dgvResult.AllowUserToDeleteRows = false;
            this.dgvResult.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvResult.Location = new System.Drawing.Point(17, 228);
            this.dgvResult.Name = "dgvResult";
            this.dgvResult.ReadOnly = true;
            this.dgvResult.RowHeadersWidth = 51;
            this.dgvResult.RowTemplate.Height = 24;
            this.dgvResult.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dgvResult.Size = new System.Drawing.Size(526, 227);
            this.dgvResult.TabIndex = 67;
            // 
            // chart1
            // 
            chartArea3.Name = "ChartArea1";
            this.chart1.ChartAreas.Add(chartArea3);
            legend3.Name = "Legend1";
            this.chart1.Legends.Add(legend3);
            this.chart1.Location = new System.Drawing.Point(17, 478);
            this.chart1.Name = "chart1";
            series3.ChartArea = "ChartArea1";
            series3.Legend = "Legend1";
            series3.Name = "Series1";
            this.chart1.Series.Add(series3);
            this.chart1.Size = new System.Drawing.Size(1085, 300);
            this.chart1.TabIndex = 68;
            this.chart1.Text = "chart1";
            // 
            // cbReport4
            // 
            this.cbReport4.FormattingEnabled = true;
            this.cbReport4.Items.AddRange(new object[] {
            "ALL",
            "Monthly",
            "Yearly"});
            this.cbReport4.Location = new System.Drawing.Point(526, 154);
            this.cbReport4.Name = "cbReport4";
            this.cbReport4.Size = new System.Drawing.Size(232, 37);
            this.cbReport4.TabIndex = 75;
            // 
            // btnReport4
            // 
            this.btnReport4.Location = new System.Drawing.Point(764, 153);
            this.btnReport4.Name = "btnReport4";
            this.btnReport4.Size = new System.Drawing.Size(126, 33);
            this.btnReport4.TabIndex = 74;
            this.btnReport4.Text = "Get Report";
            this.btnReport4.UseVisualStyleBackColor = true;
            this.btnReport4.Click += new System.EventHandler(this.btnReport4_Click);
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(521, 119);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(317, 29);
            this.label2.TabIndex = 73;
            this.label2.Text = "Metric 6 : Best-Selling Brand";
            // 
            // tbOrigin1
            // 
            this.tbOrigin1.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.tbOrigin1.Location = new System.Drawing.Point(526, 76);
            this.tbOrigin1.Name = "tbOrigin1";
            this.tbOrigin1.Size = new System.Drawing.Size(96, 31);
            this.tbOrigin1.TabIndex = 72;
            this.tbOrigin1.Text = "Nganjuk";
            // 
            // btnReport3
            // 
            this.btnReport3.Location = new System.Drawing.Point(764, 36);
            this.btnReport3.Name = "btnReport3";
            this.btnReport3.Size = new System.Drawing.Size(126, 33);
            this.btnReport3.TabIndex = 71;
            this.btnReport3.Text = "Get Report";
            this.btnReport3.UseVisualStyleBackColor = true;
            this.btnReport3.Click += new System.EventHandler(this.btnReport3_Click);
            // 
            // cbReport3
            // 
            this.cbReport3.FormattingEnabled = true;
            this.cbReport3.Items.AddRange(new object[] {
            "ALL",
            "Specific Origin",
            "ALL, Group by Origin",
            "[choose filter]"});
            this.cbReport3.Location = new System.Drawing.Point(526, 37);
            this.cbReport3.Name = "cbReport3";
            this.cbReport3.Size = new System.Drawing.Size(232, 37);
            this.cbReport3.TabIndex = 70;
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Location = new System.Drawing.Point(521, 9);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(298, 29);
            this.label6.TabIndex = 69;
            this.label6.Text = "Metric 5 : Best Selling Size";
            // 
            // FormAnalysis
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(14F, 29F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.AutoScroll = true;
            this.ClientSize = new System.Drawing.Size(1661, 797);
            this.Controls.Add(this.cbReport4);
            this.Controls.Add(this.btnReport4);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.tbOrigin1);
            this.Controls.Add(this.btnReport3);
            this.Controls.Add(this.cbReport3);
            this.Controls.Add(this.label6);
            this.Controls.Add(this.chart1);
            this.Controls.Add(this.dgvResult);
            this.Controls.Add(this.cbReport2);
            this.Controls.Add(this.btnReport2);
            this.Controls.Add(this.label5);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.lblStatOLAP);
            this.Controls.Add(this.tbHostOLAP);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.tbDBNameOLAP);
            this.Controls.Add(this.btnDiscOLAP);
            this.Controls.Add(this.btnConnectOLAP);
            this.Controls.Add(this.tbPassOLAP);
            this.Controls.Add(this.tbUserOLAP);
            this.Controls.Add(this.label7);
            this.Controls.Add(this.label8);
            this.Controls.Add(this.label9);
            this.Controls.Add(this.tbOrigin);
            this.Controls.Add(this.btnReport1);
            this.Controls.Add(this.cbReport1);
            this.Controls.Add(this.label1);
            this.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.Name = "FormAnalysis";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "FormAnalysis";
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.FormAnalysis_FormClosing);
            this.Load += new System.EventHandler(this.FormAnalysis_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dgvResult)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.chart1)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.ComboBox cbReport1;
        private System.Windows.Forms.Button btnReport1;
        private System.Windows.Forms.TextBox tbOrigin;
        private System.Windows.Forms.Label lblStatOLAP;
        private System.Windows.Forms.TextBox tbHostOLAP;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.TextBox tbDBNameOLAP;
        private System.Windows.Forms.Button btnDiscOLAP;
        private System.Windows.Forms.Button btnConnectOLAP;
        private System.Windows.Forms.TextBox tbPassOLAP;
        private System.Windows.Forms.TextBox tbUserOLAP;
        private System.Windows.Forms.Label label7;
        private System.Windows.Forms.Label label8;
        private System.Windows.Forms.Label label9;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.Button btnReport2;
        private System.Windows.Forms.ComboBox cbReport2;
        private System.Windows.Forms.DataGridView dgvResult;
        private System.Windows.Forms.DataVisualization.Charting.Chart chart1;
        private System.Windows.Forms.ComboBox cbReport4;
        private System.Windows.Forms.Button btnReport4;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.TextBox tbOrigin1;
        private System.Windows.Forms.Button btnReport3;
        private System.Windows.Forms.ComboBox cbReport3;
        private System.Windows.Forms.Label label6;
    }
}