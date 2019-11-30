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
<<<<<<< HEAD
        <div class='login'>
            <h2>Login</h2>
            <form method="post" action="/user/login">
                <div class="form-group">
                    <label for="email">Email</label>
                    <input type="email" name="email" class="form-control" required>
                </div>
                <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password" name="password" class="form-control" required>
                </div>
                <div class='agree'>
                    <button type="submit" class='animated btn btn-lg btn-primary btn-block' type='submit' style="background-color: #ffa31a;">Login</button>
                    <label style="display: block; margin-top: 1em; margin-left: 6.5em;"><a href="/showRegister">Don't have an account?</a></label>
                    <a href="/user/facebook" class="sc-buttons github-button" style="background-color: #4267b2;">
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
        </div>
        </form>
    </div>
</asp:Content>
=======
<div class='login'>
  <h2>Login</h2>
	<form method="post" action="/user/login"> 
		<div class="form-group">
			<label for="email">Email</label>
			<input type="email" name="email" class="form-control" required>
		</div>
		<div class="form-group">
			<label for="password">Password</label>
			<input type="password" name="password" class="form-control" required>
		</div>
	<div class='agree'>
      <button type="submit" class='animated btn btn-lg btn-primary btn-block' type='submit' style="background-color:#ffa31a;">Login</button>
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
		</div>
	</form>
</div>
</asp:Content>
>>>>>>> parent of f6fd3f5... Product Grid Page + Filter UI
