<%@ Page Title="" Language="C#" MasterPageFile="~/menu.Master" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="eadp_forum.register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
    <link rel="stylesheet" href="/css/signin.css">
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,700' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Sofia' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.2/css/all.css" integrity="sha384-/rXc/GQVaYpyDdyxK+ecHPVYJSN9bmVFBvjA/9eOB+pb3F2w2N6fc5qB9Ew5yIns" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css?family="Lato:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">

        <div class='login'>
            <h2>Register</h2>
		<div class="form-group">
			<label for="name">Name</label>
            <asp:RequiredFieldValidator ID="nameValidator" runat="server" ControlToValidate="nameTB" ErrorMessage="Name is required." ForeColor="Red">*</asp:RequiredFieldValidator>
            <asp:TextBox type="text" class="form-control" name="name" ID="nameTB" runat="server"></asp:TextBox>
		</div>
		<div class="form-group">
			<label for="email">Email</label><asp:RequiredFieldValidator ID="emailValidator" runat="server" ErrorMessage="Email is required." ForeColor="Red" ControlToValidate="emailTB">*</asp:RequiredFieldValidator>
&nbsp;<asp:TextBox type="email" name="email" class="form-control" ID="emailTB" runat="server"></asp:TextBox>
		</div>
		<div class="form-group">
			<label for="password">Password</label>&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="passwordTB" ErrorMessage="Password is required." ForeColor="Red">*</asp:RequiredFieldValidator>
            <asp:TextBox type="password" name="password" class="form-control" ID="passwordTB" runat="server"></asp:TextBox>

		</div>
		<div class="form-group">
			<label for="password2">Confirm Password</label>
            <asp:CustomValidator  ID="cfmPasswordValidator" runat="server" ControlToValidate="cfmPasswordTB" ErrorMessage="Passwords does not match." ForeColor="Red" Font-Strikeout="False" OnServerValidate="cfmPasswordValidator_ServerValidate">*</asp:CustomValidator>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="cfmPasswordTB" ErrorMessage="Please enter your password again." ForeColor="Red">*</asp:RequiredFieldValidator>
            <asp:TextBox type="password" name="password2" class="form-control" ID="cfmPasswordTB"  runat="server"></asp:TextBox>
		</div>
        <asp:Button class="btn btn-lg btn-primary btn-block" type="submit" style="background-color: #ffa31a;" ID="registerBtn" runat="server" Text="Sign Up" OnClick="registerBtn_Click" />
		

      <label style="display: block;margin-top: 1em; text-align:center;"><a href="localhost:5000/login.aspx">Already have an account?</a></label>
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" DisplayMode="List" />
        <asp:Label ID="errLabel" runat="server" Visible="False" ForeColor="Red"></asp:Label>
</div>
</div>
</asp:Content>
