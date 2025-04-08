<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="HomeDecorStore.Products" MasterPageFile="~/Site.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2 class="mb-4">Our Products</h2>
    <!-- Category Filter -->
    <div class="row mb-4">
        <div class="col-md-4">
            <asp:DropDownList 
                ID="ddlCategories" 
                runat="server" 
                AutoPostBack="True" 
                OnSelectedIndexChanged="ddlCategories_SelectedIndexChanged"
                CssClass="form-select">
            </asp:DropDownList>
        </div>
    </div>
    <!-- Message Display -->
    <asp:Literal ID="ltMessage" runat="server" EnableViewState="false" />
    <div class="row">
        <asp:Repeater ID="rptProducts" runat="server">
            <ItemTemplate>
                <div class="col-md-4 mb-4">
                    <div class="card h-100">
                        <img src='<%# Eval("ImageURL") %>' class="card-img-top img-fluid object-fit-cover" style="height: 350px;" alt='<%# Eval("Name") %>'/>
                        <div class="card-body">
                            <h5 class="card-title"><%# Eval("Name") %></h5>
                            <p class="card-text"><%# Eval("Description") %></p>
                            <p class="h4 text-primary">$<%# Eval("Price", "{0:F2}") %></p>
                            <asp:Button runat="server" CommandArgument='<%# Eval("ProductID") %>' 
                                Text="Add to Cart" CssClass="btn btn-primary" 
                                OnClick="btnAddToCart_Click"/>
                        </div>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</asp:Content>
