using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Configuration;
using WHRawManager.Controls;
using FanNetWorld.Data;
using FanNetWorld.IO;


namespace WHRawManager
{
    public partial class FormRackLayout : Form
    {

         DbHelper db = new DbHelper();
         bool Issingleshow = false;

         string LayID = "";
         Dictionary<string, Rack> rackdic = new Dictionary<string, Rack>();
         Dictionary<string, Wall> linedic = new Dictionary<string, Wall>();
         bool ShowRackName = Convert.ToBoolean(ConfigurationManager.AppSettings["ShowRackName"]);

         List<string> racknamelist = new List<string>();
         List<string> walllist = new List<string>();
         
        //收货库位颜色显示
         public Color MarkBackColor;
         public Color MarkForeColor;

        //查询库位颜色显示
        public Color QueryMarkBackColor;
        public Color QueryMarkForeColor;

        private double titlex, titley, titlewidth, titleheight;
        private string fromtable;

        public FormRackLayout(string m_layid, string titlename, string fromtable0, bool Singleshow = false)
        {
            InitializeComponent();
            fromtable = fromtable0;
            Issingleshow = Singleshow;

            if(fromtable0 == "C02")
            {
                this.BackColor = Color.FromArgb(0,176,80);
            }

            SetStyle(ControlStyles.UserPaint | ControlStyles.AllPaintingInWmPaint | ControlStyles.OptimizedDoubleBuffer, true);

            if(m_layid == "Layout1")
            {
                titlex = 0.4;
                titley = 0.55;
                titlewidth = 0.2;
                titleheight = 0.1;
            }
            else
            {
                titlex = 0.45;
                titley = 0.55;
                titlewidth = 0.2;
                titleheight = 0.1;
            }

            lblLayoutname.Text = titlename;

            LayID = m_layid;

            //货架数据
            DataTable namedt = db.GetDataTable(string.Format("select RackName from RackLayout where LayID='{0}' and ForUse=1 and ConType='rack'", LayID));
            foreach (DataRow dr in namedt.Rows)
            {
                racknamelist.Add(dr["RackName"].ToString());
            }

            //wall数据
            DataTable walldt = db.GetDataTable(string.Format("select RackName from RackLayout where LayID='{0}' and ForUse=1 and ConType='line'", LayID));
            foreach (DataRow dr in walldt.Rows)
            {
                walllist.Add(dr["RackName"].ToString());
            }
        }

        private void FormRackLayout_Load(object sender, EventArgs e)
        {
            ShowRacks();
        }

        private void FormRackLayout_Resize(object sender, EventArgs e)
        {
            ShowRacks();
        }

        //显示所有的货架
        public void ShowRacks()
        {
            try
            {
                lblLayoutname.Left = (int)(this.Width * titlex);
                lblLayoutname.Top = (int)(this.Height * titley);
                float lblfontsize = CoolFont.FitStringRect(lblLayoutname.Text, lblLayoutname.Font, this.CreateGraphics(), new Rectangle(0, 0, (int)(this.Width * titlewidth), (int)(this.Height * titleheight)));
                lblLayoutname.Font = new Font(lblLayoutname.Font.Name, lblfontsize, FontStyle.Bold, GraphicsUnit.Point);

                foreach (string rackname in racknamelist)
                {
                    ShowRack(rackname);
                }

                foreach (string name in walllist)
                {
                    ShowWall(name);
                }
            }
            catch (Exception e)
            {
                MessageBox.Show(e.Message);
            }
        }

        //显示一个货架
        private void ShowRack(string name)
        {
            DataTable tempdt = db.GetDataTable(string.Format("select * from RackLayout where RackName='{0}' and LayID='{1}'",name, LayID));
            double x = Convert.ToDouble(tempdt.Rows[0]["Layoutx"]);
            double y = Convert.ToDouble(tempdt.Rows[0]["Layouty"]);
            double widthp = Convert.ToDouble(tempdt.Rows[0]["Laywidth"]);
            double heightp = Convert.ToDouble(tempdt.Rows[0]["Layheight"]);
            int columnnum = Convert.ToInt32(tempdt.Rows[0]["ColumnNum"]);

            //定位参数
            int rx = (int)(this.Width * x);
            int ry = (int)(this.Height * y);
            int rwidth = (int)(this.Width * widthp);
            int rheight = (int)(this.Height * heightp);

            if(!rackdic.ContainsKey(name))
            {
                //货架datatable
                string querystr = "select ";
                for(int i=1; i<=columnnum; i++)
                {
                    querystr += string.Format("column{0},", i);
                }
                querystr = querystr.Substring(0, querystr.Length-1);
                querystr += string.Format(" from Rack where RackName='{0}'", name);
                DataTable rackdt = db.GetDataTable(querystr);

                //货架号原材料对应表
                DataTable rackrawdt = db.GetDataTable(string.Format("select RackID as name, Rawsheet as name2 from RackRaw where RackName='{0}' and UniqueID=1", name));
                
                //表中已有原材料(关于此货架)
                if(Issingleshow)
                    querystr = string.Format("select RackID,RowNo,ColumnNo from {0} where RackName='{1}' and 1=2", fromtable, name); //不显示已有原物料的库位
                else
                    querystr = string.Format("select RackID,RowNo,ColumnNo from {0} where RackName='{1}'", fromtable, name);  
                DataTable selectdt = db.GetDataTable(querystr);

                Rack rackone = new Rack(name, rackdt, rackrawdt, selectdt, rwidth, rheight, MarkBackColor, MarkForeColor, QueryMarkBackColor, QueryMarkForeColor, ShowRackName);
                this.Controls.Add(rackone);
                rackone.Left = rx;
                rackone.Top = ry;
                if(!rackdic.ContainsKey(name))
                {
                   rackdic.Add(name, rackone);
                }                
            }
            else
            {
                Rack rackone = rackdic[name];
                rackone.setLayout(name, rwidth, rheight, ShowRackName);
                rackone.Left = rx;
                rackone.Top = ry;
            }
        }

        private void ShowWall(string wallname)
        {
            DataTable tempdt = db.GetDataTable(string.Format("select * from RackLayout where RackName='{0}' and LayID='{1}'", wallname, LayID));
            string name = tempdt.Rows[0]["RackName"].ToString();
            double x = Convert.ToDouble(tempdt.Rows[0]["Layoutx"]);
            double y = Convert.ToDouble(tempdt.Rows[0]["Layouty"]);
            double widthp = Convert.ToDouble(tempdt.Rows[0]["Laywidth"]);
            double heightp = Convert.ToDouble(tempdt.Rows[0]["Layheight"]);

            //定位参数
            int rx = (int)(this.Width * x);
            int ry = (int)(this.Height * y);
            int rwidth = widthp > 1 ? (int)widthp : (int)(this.Width * widthp);
            int rheight = heightp > 1 ? (int)heightp : (int)(this.Height * heightp);

            if (!linedic.ContainsKey(name))
            {
                Wall line = new Wall(rwidth, rheight);
                this.Controls.Add(line);
                line.Left = rx;
                line.Top = ry;
                linedic.Add(name, line);
            }
            else
            {
                Wall line = linedic[name];
                line.setlayout(rwidth, rheight);
                line.Left = rx;
                line.Top = ry;
            }
        }

        //防止闪烁        
       protected override CreateParams CreateParams
        {
            get
            {
                CreateParams cp = base.CreateParams;
                cp.ExStyle |= 0x02000000; // Turn on WS_EX_COMPOSITED 
                return cp;
            }
        }

        //显示某一个库位
        public void MarkRackPosition(string rackname, string rackid, int rowno, int colno)
        {
            if(rackdic.ContainsKey(rackname))
            {
                Rack rack = rackdic[rackname];
                rack.SetCellColor(rackid, rowno, colno);
            }
        }

        //显示用于查询的库位显示
        public void MarkQueryRackPosition(string rackname, string rackid, int rowno, int colno)
        {
            if(rackdic.ContainsKey(rackname))
            {
                Rack rack = rackdic[rackname];
                rack.SetQueryCellColor(rackid, rowno, colno);
            }
        }

        //删除查询的库位颜色
        public void MarkRemoveQueryRackPosition(string rackname, string rackid, int rowno, int colno)
        {
            if (rackdic.ContainsKey(rackname))
            {
                Rack rack = rackdic[rackname];
                rack.RemoveQueryCellColor(rackid, rowno, colno);
            }
        }

        //更新显示所有的货架中选中单元的状态
        public void RefreshShowRacks()
        {
            try
            {
                foreach (string rackname in racknamelist)
                {
                    RefreshShowRack(rackname);
                }
            }
            catch (Exception e)
            {
                MessageBox.Show(e.Message);
            }
        }

        //更新一个货架中某个单元的选中状态
        private void RefreshShowRack(string name)
        {
                //表中已有原材料(关于此货架)
                string querystr = string.Format("select RackID,RowNo,ColumnNo from {0} where RackName='{1}'", fromtable, name);
                DataTable selectdt = db.GetDataTable(querystr);

                Rack rackone = rackdic[name];
                rackone.RefreshSelectRack(selectdt);
        }

        //把一个货架的颜色恢复到默认
        public void ResetRackCellsDefaultColor(string name)
        {
            if(name == "all")
            {
                foreach (string rackname in rackdic.Keys)
                {
                    Rack rackone = rackdic[rackname];
                    rackone.ResetRackCellsDefaultColor();
                }
            }
            else
            {
                Rack rackone = rackdic[name];
                rackone.ResetRackCellsDefaultColor();
            }
        }

    }
}
