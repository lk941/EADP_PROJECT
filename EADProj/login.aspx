<%@ Page Title="" Language="C#" MasterPageFile="~/menu.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="EADProj.login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
    <link rel="stylesheet" href="/css/signin.css">
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,700' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Sofia' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.2/css/all.css" integrity="sha384-/rXc/GQVaYpyDdyxK+ecHPVYJSN9bmVFBvjA/9eOB+pb3F2w2N6fc5qB9Ew5yIns" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css? family=Lato:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">
    <script src="https://apis.google.com/js/platform.js" async defer></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class='login'>
            <h2>Login</h2>
            <form runat="server" method="post"> 
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
                    <label style="display: block;margin-top: 1em;margin-left: 6.5em;"><a href="localhost:5000/register.aspx">Don't have an account?</a></label>
                    <!--
                    <a href="/user/facebook" class="sc-buttons github-button" style="background-color:#4267b2;">
                        <i class="fab fa-facebook-f"></i>
                        Facebook
                    </a>

                    <a href="/user/twitter" class="sc-buttons twitter-button twitter-btn">
                        <i class="fab fa-twitter"></i>
                        Twitter
                    </a>
                    -->

                    <div class="g-signin2" data-onsuccess="onSignIn" style="width:auto;"></div>
		
                    <!--
                        <i class="fab fa-google"></i>
                        Google
                            -->
                </div>
                <asp:ValidationSummary ID="loginSummary" runat="server" DisplayMode="List" />
                <asp:Label ID="errLabel" runat="server" Text="" ForeColor="Red"></asp:Label>
            </form>
        </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.2.1.js" integrity="sha256-DZAnKJ/6XZ9si04Hgrsxu/8s717jcIzLy3oi35EouyE=" crossorigin="anonymous"></script>

<script>

    $( document ).ready(function() {
        $(".footer__webservice").hide();
    });

    function onSignIn(googleUser) {
        var profile = googleUser.getBasicProfile();
        console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
        console.log('Name: ' + profile.getName());
        console.log('Image URL: ' + profile.getImageUrl());
        console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.

        googleSignin(profile.getName(), profile.getEmail(), profile.getImageUrl());

    }

    function googleSignin(name, email, imageURL) {

        var obj = { name: name, email: email, imageURL: imageURL };
        var param = JSON.stringify(obj);

         $.ajax({  
             type: "POST",  
             url: "login.aspx/googleLogin",  
             contentType: "application/json; charset=utf-8",  
             dataType: "json",
             data: param,
             success: function (response) {  
                 var ret = response.d; 
                 //alert(ret);  
                 window.location.href = "http://localhost:5000/main.aspx";
             },  
             error: function (response) {  
                 alert(response.d);  
             }  
         });  
    }

    function signOut() {
        var auth2 = gapi.auth2.getAuthInstance();
        auth2.signOut().then(function () {
            console.log('User signed out.');
        });
    }


</script>


</asp:Content>