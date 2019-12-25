using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Runtime.InteropServices;

namespace DataAccessLayer
{
    public class LoginDataLayer
    {
        Connection con = new Connection();
        public IQueryable<tblvoter>CheckLogin([Optional]string mail,[Optional]string password,[Optional] long? Contact)
        {
            if (mail != null && password != null)
            {
                var q = con.da.tblvoters.Where(x => x.Email == mail && x.Password == password && x.IsActive == true);
                return q;
            }
            else if(Contact!=null && password!=null)
            {
                var q = con.da.tblvoters.Where(x => x.Contact == Contact && x.Password == password && x.IsActive == true);
                return q;
            }
            else
            {
                return null;
            }
        }

        public IQueryable<tblvoter>GetProfileInfo(int Ids)
        {
            var q = con.da.tblvoters.Where(x => x.IsActive == true && x.Id==Ids);
            return q;
        }
        
    }
}
