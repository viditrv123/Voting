<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="ViditProject.Admin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <link href="Content/Site.css" rel="stylesheet" />
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="panel-info">
                    <div class="panel-heading">
                        <h3 class="panel-title">&nbsp Add Voter </h3>
                    </div>
                    <div class="panel-body">
                        <table class="table table-hover table-responsive">
                            <tr>
                                <th>VoterId</th>
                                <td>
                                    <input type="text" id="txtid" runat="server" class="form-control" required="required" />
                                    <asp:RegularExpressionValidator ID="id" runat="server" ControlToValidate="txtid" ValidationExpression="[a-zA-Z ]*$" ErrorMessage="Enter Valid Id" Font-Bold="true" ForeColor="Red"></asp:RegularExpressionValidator>
                                </td>

                            </tr>
                            <tr>
                                <th>Name
                                </th>
                                <td>
                                    <input type="text" runat="server" class="form-control" id="txtname" required="required" />
                                    <asp:RegularExpressionValidator runat="server" ID="name" ControlToValidate="txtname" ForeColor="Red" ValidationExpression="[a-zA-Z ]*$" ErrorMessage="Enter Valid Name" Font-Bold="true"></asp:RegularExpressionValidator>
                                </td>
                            </tr>
                            <tr>
                                <th>Email
                                </th>
                                <td>
                                    <input type="email" runat="server" class="form-control" id="txtmail" required="required" />

                                </td>
                            </tr>
                            <tr>
                                <th>Contact</th>
                                <td>
                                    <input type="text" runat="server" class="form-control" id="txtcontact" required="required" />
                                    <asp:RegularExpressionValidator runat="server" ID="contact" ControlToValidate="txtcontact" ForeColor="Red" ValidationExpression="[0-9]{10}" ErrorMessage="Enter Valid Name" Font-Bold="true"></asp:RegularExpressionValidator>
                                </td>

                            </tr>
                            <tr>
                                <th>Gender</th>
                                <td>
                                    <asp:RadioButtonList runat="server" ID="txtgndr"  RepeatDirection="Horizontal" RepeatColumns="3" >

                                        <asp:ListItem Value="M">Male</asp:ListItem>
                                        <asp:ListItem Value="F">Female</asp:ListItem>
                                        <asp:ListItem Value="O">Others</asp:ListItem>

                                    </asp:RadioButtonList>
                                   
                                </td>
                            </tr>
                            <tr>
                                <th>Password</th>
                                <td>
                                    <input type="password" runat="server" class="form-control" id="txtpass" required="required" />

                                </td>

                            </tr>
                            <tr>
                                <th>Confirm Password</th>
                                <td>
                                    <input type="password" runat="server" class="form-control" id="txtpass2" required="required" />

                                </td>
                                <td>
                                    <asp:CompareValidator runat="server" ID="conparepass" ControlToValidate="txtpass2" ControlToCompare="txtpass" ErrorMessage="*Error" ForeColor="Red" Font-Bold="true"></asp:CompareValidator>
                                </td>

                            </tr>


                            <tr>
                                <td>
                                    <asp:Button runat="server" OnClick="Unnamed_Click" Text="Add Voter" CssClass="btn btn-success" />
                                </td>
                                <td>
                                    <asp:Label ID="lbl" runat="server"></asp:Label>
                                </td>
                            </tr>

                        </table>
                    </div>
                    <div class="panel-body">
                        <asp:GridView ID="grdshow" AutoGenerateColumns="false" CssClass="table table-hover table-responsive" runat="server" EmptyDataText="No Record Found">
                            <Columns>
                                <asp:TemplateField HeaderText="S.No." HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        <%# Container.DataItemIndex+1 %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                 
                               <asp:BoundField DataField="Name" HeaderText="Name" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center" />
                                <asp:BoundField DataField="Contact" HeaderText="Contact" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center" />
                                <asp:BoundField DataField="Gender" HeaderText="Gender" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center" />
                            </Columns>
                        </asp:GridView>

                    </div>

                </div>
            </div>

        </div>

    </div>
</asp:Content>
