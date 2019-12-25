<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="ViditProject.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <link href="Content/Site.css" rel="stylesheet" />
    <table class="table table-hover table-responsive">
        <tr>
            <th>UserName</th>
            <td>
                <asp:TextBox runat="server" ID="txtname" Placeholder="Mail/Contact" CssClass="form-control"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <th>Password</th>
            <td>
                <asp:TextBox runat="server" ID="txtpass" Placeholder="Password" CssClass="form-control"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button runat="server" ID="btn" Text="Login" CssClass="btn btn-success" OnClick="btn_Click" />
            </td>
        </tr>
    </table>
</asp:Content>
