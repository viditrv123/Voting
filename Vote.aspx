<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Vote.aspx.cs" Inherits="ViditProject.Vote" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <link href="Content/Site.css" rel="stylesheet" />
    <br />
    <div class="container">

        <div class="col-md-12">
            <div class="panel panel-info">
                <div class="panel-heading">
                    <h3 class="panel-title">&nbsp;Vote For Candidates
                        <asp:LinkButton ID="lnklogout" runat="server" Text="Logout" CssClass="text-danger pull-right" OnClick="lnklogout_Click"></asp:LinkButton>
                    </h3>
                </div>
                <div class="panel-body">


                    <asp:GridView ID="grdshow1" runat="server" CssClass="table table-responsive table-hover" AutoGenerateColumns="false">
                        <Columns>



                            <asp:TemplateField HeaderText="Vote For Your Party" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center">
                                <ItemTemplate>
                                    <div class="col-md-4">
                                        <div class="panel panel-success">
                                            <div class="panel-heading">
                                                <h3 class="panel-title">Party Symbol
                                                </h3>
                                            </div>
                                            <div class="panel-body">
                                                <asp:Image ID="imgshow" runat="server" ImageUrl='<%# "fonts/"+Eval("Symbol") %>' Height="210" Width="200" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-8">
                                        <div class="panel panel-info">
                                            <div class="panel-heading">
                                                <h3 class="panel-title">Candidate Information
                                                </h3>
                                            </div>
                                            <div class="panel-body">
                                                <table class="table table-responsive table-hover">
                                                    <tr>
                                                        <td>
                                                            <asp:Label ID="lblcandidate" runat="server" Text='<%# Eval("CandidateName") %>'></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("Party") %>'></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("Constituency") %>'></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <asp:Label ID="Label3" runat="server" Text='<%# Eval("WardNo") %>'></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <asp:LinkButton ID="lnkvote" runat="server" CssClass="btn btn-primary" Text="Vote" CommandArgument='<%#Eval("Id") %>' OnCommand="lnkvote_Command"></asp:LinkButton>
                                                        </td>
                                                    </tr>
                                                </table>


                                            </div>
                                        </div>
                                    </div>



                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>

                    </asp:GridView>


                </div <div class="panel-body">


                    <asp:GridView ID="GridView1" runat="server" CssClass="table table-responsive table-hover" AutoGenerateColumns="false">
                        <Columns>



                            <asp:TemplateField HeaderText="You Voted For" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center">
                                <ItemTemplate>
                                    <div class="col-md-4">
                                        <div class="panel panel-success">
                                            <div class="panel-heading">
                                                <h3 class="panel-title">Party Symbol
                                                </h3>
                                            </div>
                                            <div class="panel-body">
                                                <asp:Image ID="imgshow" runat="server" ImageUrl='<%# "fonts/"+Eval("Symbol") %>' Height="210" Width="200" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-8">
                                        <div class="panel panel-info">
                                            <div class="panel-heading">
                                                <h3 class="panel-title">Candidate Information
                                                </h3>
                                            </div>
                                            <div class="panel-body">
                                                <table class="table table-responsive table-hover">
                                                    <tr>
                                                        <td>
                                                            <asp:Label ID="lblcandidate" runat="server" Text='<%# Eval("CandidateName") %>'></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("Party") %>'></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("Constituency") %>'></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <asp:Label ID="Label3" runat="server" Text='<%# Eval("WardNo") %>'></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <asp:LinkButton ID="lnkvote" runat="server" Text="Voted" CssClass="btn btn-success"></asp:LinkButton>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <asp:Label ID="lbldate" runat="server" Text='<%# "Voted On :" + Eval("Crdt") %>'></asp:Label>
                                                        </td>
                                                    </tr>
                                                </table>


                                            </div>
                                        </div>
                                    </div>



                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>

                    </asp:GridView>


                </div>


            </div>
        </div>

    </div>



</asp:Content>
