<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="HomeDecorStore._Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="hero-section">
        <div class="container">
            <h1 class="display-4 mb-4">Transform Your Living Space</h1>
            <p class="lead mb-4">Discover premium home decor items that elevate your home aesthetics</p>
            <a href="Products.aspx" class="btn btn-primary btn-lg">Shop Now</a>
        </div>
    </div>

    <div class="container py-5">
        <h2 class="text-center mb-5">Popular Categories</h2>
        <div class="row g-4">
            <div class="col-md-4">
                <div class="card category-card h-100">
                    <img src="Images/living-room.jpg" class="card-img-top" alt="Living Room">
                    <div class="card-body">
                        <h5 class="card-title">Living Room</h5>
                        <p class="card-text">Modern furniture and accessories for your living space</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card category-card h-100">
                    <img src="Images/bedroom.jpg" class="card-img-top" alt="Bedroom">
                    <div class="card-body">
                        <h5 class="card-title">Bedroom</h5>
                        <p class="card-text">Create your perfect sleep sanctuary</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card category-card h-100">
                    <img src="Images/kitchen.jpg" class="card-img-top" alt="Kitchen">
                    <div class="card-body">
                        <h5 class="card-title">Kitchen & Dining</h5>
                        <p class="card-text">Stylish and functional kitchenware</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
