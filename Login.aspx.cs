using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataAccessLayer;
namespace ViditProject
{
    public partial class Login : System.Web.UI.Page
    {
        LoginDataLayer objlogin = new LoginDataLayer();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_Click(object sender, EventArgs e)
        {
            try
            {
                var q = objlogin.CheckLogin(txtname.Text, txtpass.Text, null);
                if (q.Any())
                {
                    foreach (tblvoter k in q)
                    {
                        Session["id"] = k.Id;
                        Session["mail"] = k.Password;
                        Session["contact"] = k.Contact;
                        Session["password"] = k.Password;
                    }
                    Response.Redirect("Vote.aspx");
                }
                else
                {
                    var LoginWithContact = objlogin.CheckLogin(null, txtpass.Text, Convert.ToInt64(txtname.Text));
                    if (LoginWithContact.Any())
                    {
                        foreach (tblvoter k in LoginWithContact)
                        {
                            Session["id"] = k.Id;
                            Session["mail"] = k.Password;
                            Session["contact"] = k.Contact;
                            Session["password"] = k.Password;
                        }
                        Response.Redirect("Vote.aspx");
                    }
                    else
                    {
                        Response.Write("<script>alert('Invalid LoginId/Password Or User Not Activated ');</script>");
                    }
                }
            }
            catch(Exception ex)
            {

                Response.Write("<script>alert('Invalid LoginId/Password Or User Not Activated ');</script>");
            }
        }
    }
}
