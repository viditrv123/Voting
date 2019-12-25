using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataAccessLayer;

namespace ViditProject
{
    public partial class Contact : Page
    {
        LoginDataLayer objlogin = new LoginDataLayer();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["id"]!=null)
            {
                DetailsView1.DataSource = objlogin.GetProfileInfo(Convert.ToInt32(Session["id"]));
                DetailsView1.DataBind();

                var q = objlogin.GetProfileInfo(Convert.ToInt32(Session["id"]));
                if(q.Any())
                {
                    foreach(tblvoter k in q)
                    {
                        lblname.Text = k.Name;
                        lblemail.Text = k.Email;
                    }
                }
            }
        }
    }
}
