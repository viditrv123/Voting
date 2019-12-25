using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataAccessLayer;
using System.IO;

namespace ViditProject
{
    public partial class Vote : System.Web.UI.Page
    {
        tblvote vote = new tblvote();
        ShowDataLayer2 objshow = new ShowDataLayer2();
        VoteAccessLayer objvote = new VoteAccessLayer();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["id"] != null)
                {
                    show();
                }
                else
                {
                    Response.Redirect("Login");
                }

            }
        }
        void show()
        {
            try
            {
                var q = objvote.CheckIfAlreadyVoted(Convert.ToInt32(Session["id"]));
                if (q.Any())
                {
                    GridView1.DataSource = objvote.JoinVoteTableWithCandidateTable(Convert.ToInt32(Session["id"]));
                    GridView1.DataBind();
                }
                else
                {
                    grdshow1.DataSource = objshow.GetActiveCandidateList();
                    grdshow1.DataBind();
                }
                
            }
            catch(Exception ex)
            {
                throw ex;
            }
        }

        protected void lnkvote_Command(object sender, CommandEventArgs e)
        {
            int Id = Convert.ToInt32(e.CommandArgument);
            vote.UserId = Convert.ToInt32(Session["id"]);
            vote.CandidateId = Id;
            vote.VoteCount = 1;
            VoteAccessLayer.AddVote(vote);
            show();
        }

        protected void lnklogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.RemoveAll();
            Session.Abandon();
            Response.Redirect("Login");
        }
    }
}
