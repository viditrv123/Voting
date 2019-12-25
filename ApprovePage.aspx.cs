using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataAccessLayer;

namespace ViditProject
{
    
    public partial class ApprovePage : System.Web.UI.Page
    {
        ShowDataLayer2 objshow = new ShowDataLayer2();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                show();
            }
        }

        protected void LinkBtn_Command(object sender, CommandEventArgs e)
        {
            int Id = Convert.ToInt32(e.CommandArgument);
            objshow.AcceptCandidateMemberShip(Id);
            show();
        }

        protected void LinkButton1_Command(object sender, CommandEventArgs e)
        {
            int Id = Convert.ToInt32(e.CommandArgument);
            objshow.RejectCandidateMemberShip(Id);
            show();
        }
        void show()
        {
            try
            {
                grdshow.DataSource = objshow.GetVoterList();
                grdshow.DataBind();
            }
            catch (Exception ex)
            {
                lbl.Text = ex.Message;
                lbl.ForeColor = System.Drawing.Color.Red;

            }
        }


        
    }
}
