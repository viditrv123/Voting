using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer
{
    public class InsertionDataLayer2
    {
        public static int AddVoter(tblvoter voter)
        {
            try
            {
                using (var objdata = new DataClasses1DataContext())
                {
                    voter.IsActive = true;
                    voter.Crdt = DateTime.Now;
                    voter.Updt = DateTime.Now;
                    objdata.tblvoters.InsertOnSubmit(voter);
                    objdata.SubmitChanges();
                    return 1;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
