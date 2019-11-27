<%@ Page Title="" Language="C#" MasterPageFile="~/menu1.Master" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="EADProj.register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
    <link rel="stylesheet" href="/css/signin.css">
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,700' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Sofia' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.2/css/all.css" integrity="sha384-/rXc/GQVaYpyDdyxK+ecHPVYJSN9bmVFBvjA/9eOB+pb3F2w2N6fc5qB9Ew5yIns" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css? family=Lato:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
<div class="container">

<div class='login'>
  <h2>Register</h2>
	<form action="/user/register" method="post">
		<div class="form-group">
			<label for="name">Name</label>
			<input type="text" class="form-control" name="name" value="" required>
		</div>
		<div class="form-group">
			<label for="email">Email</label>
			<input type="email" name="email" class="form-control" value="" required>
		</div>
		<div class="form-group">
			<label for="password">Password</label>
			<input type="password" name="password" class="form-control" value="" required>
		</div>
		<div class="form-group">
			<label for="password2">Confirm Password</label>
			<input type="password" name="password2" class="form-control" value="" required>
		</div>
    	<button class="btn btn-lg btn-primary btn-block" type="submit" style="background-color: #ffa31a;">Sign Up</button>
		</form>

      <label style="display: block;margin-top: 1em; text-align:center;"><a href="/showLogin">Already have an account?</a></label>
</div>
</form>

</div> 

</asp:Content>
