<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="HomeDecorStore.Register" MasterPageFile="~/Site.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row justify-content-center mt-5">
        <div class="col-md-6">
            <div class="card">
                <div class="card-header bg-primary text-white">
                    <h4>Create Account</h4>
                </div>
                <div class="card-body">
                    <div class="form-group">
                        <label>Username</label>
                        <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtUsername"
                            ErrorMessage="Required" CssClass="text-danger" Display="Dynamic"/>
                    </div>
                    <div class="form-group">
                        <label>Email</label>
                        <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" CssClass="form-control" />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtEmail"
                            ErrorMessage="Required" CssClass="text-danger" Display="Dynamic"/>
                        <asp:RegularExpressionValidator runat="server" ControlToValidate="txtEmail"
                            ValidationExpression="^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$"
                            ErrorMessage="Invalid email" CssClass="text-danger" Display="Dynamic"/>
                    </div>
                    <div class="form-group">
                        <label>Password</label>
                        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control" />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtPassword"
                            ErrorMessage="Required" CssClass="text-danger" Display="Dynamic"/>
                    </div>
                    <div class="form-group">
                        <label>Confirm Password</label>
                        <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" CssClass="form-control" />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtConfirmPassword"
                            ErrorMessage="Required" CssClass="text-danger" Display="Dynamic"/>
                        <asp:CompareValidator runat="server" ControlToCompare="txtPassword" ControlToValidate="txtConfirmPassword"
                            ErrorMessage="Passwords don't match" CssClass="text-danger" Display="Dynamic"/>
                    </div>
                    <asp:Button ID="btnRegister" runat="server" Text="Register" 
                        CssClass="btn btn-primary btn-block mt-3" OnClick="btnRegister_Click"/>
                    <asp:Literal ID="ltMessage" runat="server" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
