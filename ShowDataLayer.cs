using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace DataAccessLayer
{
    public class ShowDataLayer
    {
        Connection con = new Connection();

        public IQueryable<tblCandidate>GetCandidateList()
        {
            var q = con.da.tblCandidates.OrderByDescending(x => x.Id);
            return q;
        }

        public IQueryable<tblCandidate> GetCandidateList(int Ids)
        {
            var q = con.da.tblCandidates.Where(x => x.Id == Ids);
            return q;
        }

        
        public void RejectCandidateMemberShip(int Ids)
        {
            tblCandidate k = con.da.tblCandidates.Where(x => x.Id == Ids).FirstOrDefault();
            if(k!=null)
            {
                k.IsActive = false;
            }
            con.da.SubmitChanges();
        }

        public void AcceptCandidateMemberShip(int Ids)
        {
            tblCandidate k = con.da.tblCandidates.Where(x => x.Id == Ids).FirstOrDefault();
            if (k != null)
            {
                k.IsActive = true;
            }
            con.da.SubmitChanges();
        }

        public void EditCandidateInfon(int Ids,string Name,string party,string constituency,int wardno)
        {
            tblCandidate k = con.da.tblCandidates.Where(x => x.Id == Ids).FirstOrDefault();
            if (k != null)
            {
                k.CandidateName = Name;
                k.Party = party;
                k.Constituency = constituency;
                k.WardNo = wardno;
            }
            con.da.SubmitChanges();
        }

        public IQueryable<tblCandidate>ChecKIfNameOrPartyAlreadyExists(string Name,string Party)
        {
            var q = con.da.tblCandidates.Where(x => x.CandidateName == Name || x.Party == Party);
            return q;
        }
    }
}
