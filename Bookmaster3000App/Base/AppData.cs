using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Bookmaster3000App.Base
{
    class AppData
    {
        private static Bookmaster3000Entities context;
        public static Bookmaster3000Entities GetContext()
        {
            if (context == null)
            {
                context = new Bookmaster3000Entities();
            }

            return context;
        }

        public static User currentUser;
    }
}
