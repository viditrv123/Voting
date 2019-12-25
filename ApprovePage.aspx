<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ApprovePage.aspx.cs" Inherits="ViditProject.ApprovePage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <link href="Content/Site.css" rel="stylesheet" />

    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-info">
                    <div class="panel-heading">
                        <h3 class="panel-title">All Voter</h3>
                    </div>
                    <div class="panel-body">
                        <asp:GridView runat="server" ID="grdshow" AutoGenerateColumns="false" CssClass="table table-hover table-responsive" EmptyDataText="No Record">
                            <Columns>
                                <asp:BoundField DataField="VoterId" HeaderText="VoterId" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center" />
                                <asp:BoundField DataField="Name" HeaderText="Name" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center" />
                                <asp:BoundField DataField="Email" HeaderText="Email" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center" />
                                <asp:BoundField DataField="Contact" HeaderText="Contact" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center" />
                                <asp:BoundField DataField="Gender" HeaderText="Gender" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center" />
                                <asp:TemplateField HeaderText="Activity" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center">

                                    <ItemTemplate>
                                        <asp:Label ID="lblstatus" runat="server" Text='<%# (bool)Eval("IsActive")==true?"Accepted":"Rejected" %>' ForeColor='<%# (bool)Eval("IsActive")==true?System.Drawing.Color.Green:System.Drawing.Color.Red %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Activity" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center">

                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkBtn" runat="server" Enabled='<%# (bool)Eval("IsActive")==true?false:true %>' ForeColor="Green" CssClass="glyphicon glyphicon-check" CommandArgument='<%# Eval("Id") %>' OnCommand="LinkBtn_Command" OnClientClick="if(!confirm('Do you Want To accept Candidature')) return false;">
                                        </asp:LinkButton>
                                        <asp:LinkButton ID="LinkButton1" Enabled='<%# (bool)Eval("IsActive")==true?true:false %>' runat="server" ForeColor="Red" CssClass="glyphicon glyphicon-remove" CommandArgument='<%# Eval("Id") %>' OnCommand="LinkButton1_Command" OnClientClick="if(!confirm('Do you Want To cancel Candidature')) return false;">
                                        </asp:LinkButton>
                                        <%--<asp:HyperLink ID="HyperLink" runat="server" Text="Edit" NavigateUrl='<%# "Add-Candidate.aspx?Id="+Eval("Id") %>'> 
                                        </asp:HyperLink>--%>
                                    </ItemTemplate>

                                </asp:TemplateField>

                            </Columns>

                        </asp:GridView>
                        <asp:Label runat="server" ID="lbl"></asp:Label>
                    </div>
                </div>
            </div>
        </div>

    </div>



</asp:Content>
