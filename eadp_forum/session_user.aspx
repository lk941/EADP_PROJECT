﻿<%@ Page Title="" Language="C#" MasterPageFile="~/menu.Master" AutoEventWireup="true" CodeBehind="session_user.aspx.cs" Inherits="eadp_forum.session_user" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body {
            background-color: orange;
            font-family: "Poppins", sans-serif;
        }

        .user_profile_wrapper {
            height: 100vh;
            margin-bottom: 0;
            width: 60%;
            min-width: 900px;
            padding: 90px 45px 90px 90px;
            margin: 0 20% 0 20%;
            background-color: white;
            background-image: url("https://img.rawpixel.com/s3fs-private/rawpixel_images/website_content/v748-toon-108_1_1.jpg?w=800&dpr=1&fit=default&crop=default&auto=format&fm=pjpg&q=75&vib=3&con=3&usm=15&bg=F4F4F3&ixlib=js-2.2.1&s=20d0baebe199568a38dc3b400c2f4813");
            display: block;
            justify-content: center;
        }

        .user_profile_wrapper h1 {
            letter-spacing: 3px;
        }

        .user_profile_picture {
            
            height: 220px;
            width: 250px;
            border: 1px solid grey;
            background-image: url("https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQE_0p3sdt4wuD5X2ZnKrT5pOCmDJ1N73Y5lfSJNU1f_W-hpQ41");
        }

        .user_profile_content_wrap {
            display: inline-flex;
            margin: 50px 30px 0 0;
        }

        .profile_sideinfo {
            display: inline-block;
            width: 250px;
        }

        .profile_othersideinfo {
            display: inline-block;
            padding: 0 0 0 45px;
        }

        .more_under_pic {
            padding: 30px 0 0 10px;
        }

        .profile-menu-container {
            padding-left: 15px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="user_profile_wrapper">
        <h1 style="font-size: 2vw"> Profile Page</h1>
        <div class="user_profile_content_wrap">
            <div class="profile_sideinfo">
            <div class="user_profile_picture">
                
        </div>
            <asp:ScriptManager ID="ScriptManagerUserProfile" runat="server"></asp:ScriptManager>
                <ajaxToolkit:AjaxFileUpload ID="AjaxFileUploadProfilePic" runat="server" AllowedFileTypes=".jpg, .png" ClearFileListAfterUpload="False" MaximumNumberOfFiles="1" ToolTip="Upload Profile Pic here" />

            <div class="more_under_pic">
                <h3> Credentials </h3>
                <div style="line-height: 27px; font-size: 120%; margin-top: 10px">
                    <asp:LinkButton ID="LinkButtonSchool" runat="server"><span class="glyphicon glyphicon-education"></span> Add your school </asp:LinkButton> <br />
                <asp:LinkButton ID="LinkButtonWork" runat="server"><span class="glyphicon glyphicon-briefcase"></span> Add where you work </asp:LinkButton>
                </div>
            </div>
        </div>
        <div class="profile_othersideinfo">
            <h1 style="letter-spacing: 1px; margin-bottom: 12px"> Username </h1>
            <h5> STUDENT </h5>
            <h5> 0 votes </h5>
            <h5> <span class="glyphicon glyphicon-folder-close"></span> Wallet: $0.00</h5>
            <div class="panel panel-default" style="width: 500px; height: auto; margin: 20px 0 0 0; padding: 15px 20px 20px 20px">
    <div id="Tabs" role="tabpanel">
        <!-- Nav tabs -->
        <ul class="nav nav-tabs" role="tablist">
            <li class="active"><a href="#about" aria-controls="about" role="tab" data-toggle="tab">About</a></li>
            <li><a href="#personal" aria-controls="personal" role="tab" data-toggle="tab">
                Timeline</a></li>
            
        </ul>
        <!-- Tab panes -->
        <div class="tab-content" style="padding-top: 20px">
            <div role="tabpanel" class="tab-pane active" id="about">
                <div style="margin: 15px 0 10px 0; padding: 10px 0 10px 15px; height: 75px; width: 460px; align-content: center; background-color: #e3e3e3">
                    <p> Hello, I am a new user! </p>
               </div>
                <asp:LinkButton ID="LinkButtonBio" runat="server"> <span class="glyphicon glyphicon-pencil"></span> Edit Bio </asp:LinkButton>
                <hr />

                <h4 style="margin-top: 15px; margin-bottom: 10px"> Contact Info</h4>
                <p style="font-size: 125%"> Phone No. :  -</p>
                <p style="font-size: 125%"> Email :  -</p>
                <p style="font-size: 125%"> <span class="glyphicon glyphicon-map-marker" style="font-size: 135%"></span>  &nbsp -</p>
                <asp:LinkButton ID="LinkButtonEditContact" runat="server"> <span class="glyphicon glyphicon-pencil"></span> Edit Contact Info</asp:LinkButton>
            </div>
            <div role="tabpanel" class="tab-pane" id="personal">
                - No content to display - 
            </div>
        </div>
    </div>
</div>
        </div>
        </div>

    </div>
</asp:Content>
