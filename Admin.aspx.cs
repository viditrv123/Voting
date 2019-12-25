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
    public partial class Admin : System.Web.UI.Page
    {
        tblvoter voter = new tblvoter();
        ShowDataLayer2 objshow = new ShowDataLayer2();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                show();
            }
        }

        protected void Unnamed_Click(object sender, EventArgs e)
        {
            try
            {

                insert();
                show();
            }
            catch (Exception ex)
            {
                lbl.Text = ex.Message;
                lbl.ForeColor = System.Drawing.Color.Red;
            }
        }

        void insert()
        {
            try
            {
                var q = objshow.ExistenceOfVoterIdEmailContact(txtid.Value, txtmail.Value, txtcontact.Value);
                if (q.Any())
                {
                    lbl.Text = "Candidate Name Or Party Already exists";
                    lbl.ForeColor = System.Drawing.Color.Red;
                }
                else
                {
                    voter.VoterId=txtid.Value;
                    voter.Name = txtname.Value;
                    voter.Email = txtmail.Value;
                    voter.Contact = Convert.ToInt32(txtcontact.Value);
                    voter.Password = txtpass.Value;
                    voter.Gender = Convert.ToChar(txtgndr.SelectedValue);
                    InsertionDataLayer2.AddVoter(voter);
                    lbl.Text = "Voter Added";
                    lbl.ForeColor = System.Drawing.Color.Green;
                }
            }
            catch (Exception e)
            {
                lbl.Text = e.Message;
                lbl.ForeColor = System.Drawing.Color.Red;
            }
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
