using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer
{
    public class ShowDataLayer2
    {
        Connection con = new Connection();
        public IQueryable<tblvoter> GetVoterList()
        {
            var q = con.da.tblvoters.OrderByDescending(x => x.Id);
            return q;
        }
        public IQueryable<tblvoter>ExistenceOfVoterIdEmailContact(string voterId,string email,string contact)
        {
            var q = con.da.tblvoters.Where(x => x.VoterId == voterId||x.Email==email||Convert.ToString(x.Contact)==contact);
            return q;
        }
        public void RejectCandidateMemberShip(int Ids)
        {
            tblvoter k = con.da.tblvoters.Where(x => x.Id == Ids).FirstOrDefault();
            if (k != null)
            {
                k.IsActive = false;
            }
            con.da.SubmitChanges();
        }
        public void AcceptCandidateMemberShip(int Ids)
        {
            tblvoter k = con.da.tblvoters.Where(x => x.Id == Ids).FirstOrDefault();
            if (k != null)
            {
                k.IsActive = true;
            }
            con.da.SubmitChanges();
        }
        public IQueryable<tblCandidate> GetActiveCandidateList()
        {
            var q = con.da.tblCandidates.OrderByDescending(x =>x.IsActive==true);
            return q;
        }
    }
}
