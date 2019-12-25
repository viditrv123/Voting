<%@ Page Title="Add New Candidate" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Add-Candidate.aspx.cs" Inherits="ViditProject.Add_Candidate" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <link href="Content/Site.css" rel="stylesheet" />
    <br />
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-info">
                    <div class="panel-heading">
                        <h3 class="panel-title">&nbsp; Add New Candidate Here                                           A
                        </h3>
                    </div>
                    <div class="panel-body">
                        <table class="table table-responsive table-hover">
                            <tr>
                                <th>Candidate Name</th>
                                <td>
                                    <input type="text" id="txtname" runat="server" class="form-control" required="required" placeholder="Enter Candidate Name.." />
                                </td>
                            </tr>
                            <tr>
                                <th>Candidate Party</th>
                                <td>
                                    <input type="text" id="txtparty" runat="server" class="form-control" required="required" placeholder="Enter Candidate Party.." />
                                </td>
                            </tr>
                            <tr>
                                <th>Party Symbol</th>
                                <td>
                                    <asp:FileUpload ID="txtfile" runat="server" required="" />
                                </td>
                            </tr>
                            <tr>
                                <th>Candidate Constituency</th>
                                <td>
                                    <input type="text" id="txtconstituency" runat="server" class="form-control" required="required" placeholder="Enter Candidate Constituency.." />
                                </td>
                            </tr>
                            <tr>
                                <th>Ward Number</th>
                                <td>
                                    <input type="text" id="txtwardnum" runat="server" class="form-control" required="required" placeholder="Enter Ward Number..." />
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    <asp:Button ID="btnsub" runat="server" Text="Add New Candidate" CssClass="btn btn-success" OnClick="btnsub_Click" />
                                </th>
                            </tr>
                        </table>
                    </div>
                    <div class="panel-body">
                        <asp:GridView ID="grdshow" CssClass="table table-responsive table-hover" runat="server" AutoGenerateColumns="false" OnPageIndexChanging="grdshow_PageIndexChanging" AllowPaging="true" PageSize="3" EmptyDataText="No Record Found" EmptyDataRowStyle-CssClass="text-danger">
                            <Columns>
                                <asp:TemplateField HeaderText="S.No" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        <%# Container.DataItemIndex+1 %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="CandidateName" HeaderText="Candidate Name" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center" />
                                 <asp:BoundField DataField="Crdt" DataFormatString="{0:dd-MM-yyyy}" HeaderText="Date" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center" />
                                <asp:BoundField DataField="Party" HeaderText="Party" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center" />
                                <asp:BoundField DataField="Constituency" HeaderText="Constituency Name" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center" />
                                <asp:BoundField DataField="WardNo" HeaderText="Ward" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center" />
                                <asp:TemplateField HeaderText="S.No" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        <asp:Image ID="imgshow" runat="server" ImageUrl='<%# "fonts/"+Eval("Symbol") %>' Height="100" Width="100" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Candidature" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        <asp:Label ID="lblstatus" runat="server" Text='<%# (bool)Eval("IsActive")==true?"Accepted":"Rejected" %>' ForeColor='<%# (bool)Eval("IsActive")==true?System.Drawing.Color.Green:System.Drawing.Color.Red %>'></asp:Label>
                                    </ItemTemplate>

                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkBtn" runat="server" Enabled='<%# (bool)Eval("IsActive")==true?false:true %>' ForeColor="Green" CssClass="glyphicon glyphicon-check" CommandArgument='<%# Eval("Id") %>' OnCommand="LinkBtn_Command">
                                        </asp:LinkButton>
                                         <asp:LinkButton ID="LinkButton1" Enabled='<%# (bool)Eval("IsActive")==true?true:false %>' runat="server" ForeColor="Red" CssClass="glyphicon glyphicon-remove"  CommandArgument='<%# Eval("Id") %>' OnCommand="LinkButton1_Command" OnClientClick="if(!confirm('Do you Want To cancel Candidature')) return false;">
                                        </asp:LinkButton>
                                        <asp:HyperLink ID="HyperLink" runat="server" Text="Edit" NavigateUrl='<%# "Add-Candidate.aspx?Id="+Eval("Id") %>'> 
                                        </asp:HyperLink>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                    <div class="panel-footer">
                        <asp:Label ID="lblmsg" runat="server"></asp:Label>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
