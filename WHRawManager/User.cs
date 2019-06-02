using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WHRawManager
{
    class User
    {
        private static string m_UserID = string.Empty;
        public static string UserID
        {
            get { return m_UserID;  }
            set { m_UserID = value; }
        } 
        
        public static bool IsAdmin
        {
            get;
            set;
        }
    }
}
