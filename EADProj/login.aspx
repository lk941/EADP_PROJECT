<%@ Page Title="" Language="C#" MasterPageFile="~/menu.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="EADProj.login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
    <link rel="stylesheet" href="/css/signin.css">
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,700' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Sofia' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.2/css/all.css" integrity="sha384-/rXc/GQVaYpyDdyxK+ecHPVYJSN9bmVFBvjA/9eOB+pb3F2w2N6fc5qB9Ew5yIns" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css?    family=Lato:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class='login'>
            <h2>Login</h2>
            <form runat="server"> 
                <div class="form-group">
                    <label for="email">Email</label><asp:RequiredFieldValidator ID="emailLoginRequired" runat="server" ErrorMessage="Enter your email" ControlToValidate="emailTB" Text="*"></asp:RequiredFieldValidator>
                    <asp:TextBox type="email" name="email" class="form-control" ID="emailTB" runat="server"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="password">Password</label><asp:RequiredFieldValidator ID="passwordLoginRequired" runat="server" ErrorMessage="Enter your password." Text="*" ControlToValidate="passwordTB"></asp:RequiredFieldValidator>
                    <asp:TextBox type="password" name="password" class="form-control" ID="passwordTB" runat="server"></asp:TextBox>
                </div>
                <div class='agree'>
                    <asp:Button type="submit" class='animated btn btn-lg btn-primary btn-block' style="background-color:#ffa31a;" ID="loginBtn" runat="server" Text="Login" OnClick="loginBtn_Click" />
                    <label style="display: block;margin-top: 1em;margin-left: 6.5em;"><a href="/showRegister">Don't have an account?</a></label>
                    <a href="/user/facebook" class="sc-buttons github-button" style="background-color:#4267b2;">
                        <i class="fab fa-facebook-f"></i>
                        Facebook
                    </a>

                    <a href="/user/twitter" class="sc-buttons twitter-button twitter-btn">
                        <i class="fab fa-twitter"></i>
                        Twitter
                    </a>
		
                    <a href="/user/google" class="sc-buttons googleplus-button google-btn">
                        <i class="fab fa-google"></i>
                        Google
                    </a>
                </div>
                <asp:ValidationSummary ID="loginSummary" runat="server" DisplayMode="List" />
                <asp:Label ID="errLabel" runat="server" Text="" ForeColor="Red"></asp:Label>
            </form>
        </div>
    </div>
</asp:Content>