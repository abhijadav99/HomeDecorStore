<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="HomeDecorStore.Login" MasterPageFile="~/Site.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row justify-content-center mt-5">
        <div class="col-md-6">
            <div class="card">
                <div class="card-header bg-primary text-white">
                    <h4>User Login</h4>
                </div>
                <div class="card-body">
                    <div class="form-group">
                        <label>Username</label>
                        <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtUsername"
                            ErrorMessage="Please enter the correct User name" CssClass="text-danger" Display="Dynamic"/>
                    </div>
                    <div class="form-group">
                        <label>Password</label>
                        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control" />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtPassword"
                            ErrorMessage="Please Enter correct password" CssClass="text-danger" Display="Dynamic"/>
                    </div>
                    <asp:Button ID="btnLogin" runat="server" Text="Login" 
                        CssClass="btn btn-primary btn-block mt-3" OnClick="btnLogin_Click"/>
                    <div class="text-center mt-3">
                        <a href="Register.aspx">Create new account</a>
                    </div>
                    <asp:Literal ID="ltMessage" runat="server" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
