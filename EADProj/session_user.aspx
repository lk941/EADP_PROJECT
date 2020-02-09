<%@ Page Title="" Language="C#" MasterPageFile="~/Likey.Master" AutoEventWireup="true" CodeBehind="session_user.aspx.cs" Inherits="EADProj.session_user" %>

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
            margin: -100vh 20% 0 20%;
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

        .edit-bio-textbox {
            margin: 15px 0 10px 0; 
            padding: 10px 0 10px 15px; 
            height: 75px; 
            width: 460px; 
            align-content: center; 
            background-color: #e3e3e3
        }

        .display-panels {
            display: block;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="user_profile_wrapper">
        <h1 style="font-size: 2vw"> Profile Page</h1>
        <div class="user_profile_content_wrap">
            <div class="profile_sideinfo">
               
                <asp:Image ID="Image1" runat="server" CssClass="user-profile-picture" />
                <asp:FileUpload ID="FileUpload1" runat="server" />
                <asp:Button ID="btnUpload" Text="Upload" runat="server" OnClick="UploadFile" />
                <hr />  

            <div class="more_under_pic">
                <h3> Credentials </h3>
                <div style="line-height: 27px; font-size: 120%; margin-top: 10px">
                    <h5>Attended: </h5>
                    <asp:Panel ID="PanelSchoolAttended" runat="server" CssClass="display-panels">
                        <div style="display: block">
                            <asp:Label ID="LabelSchoolAttended" runat="server" Text="-"></asp:Label> 
                        </div>
                        
                        <asp:LinkButton ID="LinkButtonSchool" runat="server" OnClick="LinkButtonSchool_Click"><span class="glyphicon glyphicon-education"></span> Add/Change your school </asp:LinkButton>
                    </asp:Panel>
                    <br />
                    <asp:Panel ID="PanelEditSchool" runat="server" Visible="False">
                        <asp:TextBox ID="TextBoxSchoolAttended" runat="server"></asp:TextBox>
                        <div style="display: inline-block">
                        <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButtonCancelBio_Click">Cancel</asp:LinkButton>
                    <asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click">Done</asp:LinkButton>
                    </div>
                    </asp:Panel>
                <h5 style="margin-top: 10px"> Works at: </h5>
                    <asp:Panel ID="PanelWorkedAt" runat="server" CssClass="display-panels">
                        <div style="display: block">
                            <asp:Label ID="LabelWorksAt" runat="server" Text="-"></asp:Label>
                        </div>
                        
                        <asp:LinkButton ID="LinkButtonWork" runat="server" OnClick="LinkButtonWork_Click"><span class="glyphicon glyphicon-briefcase"></span> Add/Change where you work </asp:LinkButton>
                    </asp:Panel>
                    <asp:Panel ID="PanelEditWork" runat="server" Visible="False">
                        <asp:TextBox ID="TextBoxWorkedAt" runat="server"></asp:TextBox>
                        <div style="display: inline-block">
                        <asp:LinkButton ID="LinkButton3" runat="server" OnClick="LinkButtonCancelBio_Click">Cancel</asp:LinkButton>
                    <asp:LinkButton ID="LinkButton4" runat="server">Done</asp:LinkButton>
                    </div>
                    </asp:Panel>
                    <br />
                    
                </div>
            </div>
        </div>
        <div class="profile_othersideinfo">
            <h1 style="letter-spacing: 1px; margin-bottom: 12px"> <asp:Label ID="LabelUsername" runat="server" Text=""></asp:Label> </h1>
            <h5> STUDENT </h5>
            <h5> 0 votes </h5>
            <!-- <h5> <span class="glyphicon glyphicon-folder-close"></span> Wallet: $0.00</h5> -->
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
               
                <asp:Panel ID="PanelEditBio" runat="server" Visible="False">
                    <asp:TextBox ID="TextBoxEditBio" runat="server" TextMode="MultiLine" Rows="5" CssClass="edit-bio-textbox"></asp:TextBox>
                    <div style="display: inline-block">
                        <asp:LinkButton ID="LinkButtonCancelBio" runat="server" OnClick="LinkButtonCancelBio_Click">Cancel</asp:LinkButton>
                    <asp:LinkButton ID="LinkButtonSubmitBio" runat="server" OnClick="LinkButtonSubmitBio_Click">Done</asp:LinkButton>
                    </div>
                </asp:Panel>
                <asp:Panel ID="PanelDisplayBio" runat="server">
                    <div style="margin: 15px 0 10px 0; padding: 10px 0 10px 15px; height: 75px; width: 460px; align-content: center; background-color: #e3e3e3">
                    <p> <asp:Label ID="LabelBio" runat="server" Text=""></asp:Label> </p> 
               </div>
                    <asp:LinkButton ID="LinkButtonBio" runat="server" OnClick="LinkButtonBio_Click"> <span class="glyphicon glyphicon-pencil"></span> Edit Bio </asp:LinkButton>
                <hr />
                </asp:Panel>
                

                <h4 style="margin-top: 15px; margin-bottom: 10px"> Contact Info</h4>
                <p style="font-size: 125%"> Phone No. :  -</p>
                <p style="font-size: 125%"> Email :  <asp:Label ID="LabelEmail" runat="server" Text='<%# Eval("email") %>'></asp:Label></p>
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
