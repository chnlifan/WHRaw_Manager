using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace WHRawManager.Controls
{
    public partial class Wall : UserControl
    {
        public Wall()
        {
            InitializeComponent();
        }

        public Wall(int mywidth, int myheigth)
        {
            InitializeComponent();
            setlayout(mywidth, myheigth);
        }

        public void setlayout(int mywidth, int myheigth)
        {
            this.Width = mywidth;
            this.Height = myheigth;
        }

        //防止闪烁
        protected override CreateParams CreateParams
        {
            get
            {
                var parms = base.CreateParams;
                parms.Style &= ~0x02000000; // Turn off WS_CLIPCHILDREN 
                return parms;
            }
        }
    }
}
