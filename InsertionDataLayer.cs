using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer
{
    public class InsertionDataLayer
    {
        public static int AddCandidate(tblCandidate candidate)
        {
            try
            {
                using(var objdata=new DataClasses1DataContext())
                {
                    candidate.IsActive = true;
                    candidate.Crdt = DateTime.Now;
                    candidate.Updt = DateTime.Now;
                    objdata.tblCandidates.InsertOnSubmit(candidate);
                    objdata.SubmitChanges();
                    return 1;
                }
            }
            catch(Exception ex)
            {
                throw ex;
            }
        }
    }
}
