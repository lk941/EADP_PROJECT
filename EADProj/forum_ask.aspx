<%@ Page Title="" Language="C#" MasterPageFile="~/Likey.Master" AutoEventWireup="true" CodeBehind="forum_ask.aspx.cs" Inherits="EADProj.forum_ask" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body {
    background-color: #f7a248;
}

        .forum-post-page {
    margin: -80vh 0 0 27vw;
    padding: -80vh 0 0 25vw;
    position: relative;
    display: block;
}
    
.forum-post-title {
    display: block;
    color: white;
    font-size: 2.3vw;
    margin-top: -20vh;
}

    /*
    .forum-post-title h1 {
    font-size: 2vw;
}
*/


.forum-post-subtitle {
    display: flex;
    font-size: 0.7vw;
}

    .forum-post-subtitle p {
        margin: 5px;
    }

.forum-post-container {
    border: 1.5px solid white;
    background-color: white;
    margin-top: 3vh;
    height: auto;
    padding: 30px 0 25px 50px;
    width: 47vw;
    border-radius: 10px;
    display: inline-block;
    color: grey;
    font-size: 110%;
}

.forum-post-container h3 {
    margin: 7px 0;
}

.forum-post-text {
    font-size: 0.8vw;
    margin: 15px auto 25px auto;
}

.forum-post-tags {
    display: inline-flex;
}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="forum-post-page" style="margin-top: -80vh; margin-left: 20vw;">
        <div class="forum-post-title">
            <h1> Ask a public question </h1>
        </div>
        <div class="forum-post-container">
            <h3> Post Title </h3>
            <asp:RequiredFieldValidator ID="RequiredFieldValidatorTitle" runat="server" ErrorMessage="* Give your post a title!" ControlToValidate="TextBoxFTitle" ValidationGroup="SubmitAsk"></asp:RequiredFieldValidator>
            <br />
            <asp:TextBox ID="TextBoxFTitle" runat="server" Width="570px" Height="30px" CssClass="ForumTextbox" MaxLength="570"></asp:TextBox> 
            
            <br />
            <h3> Body </h3>
            <asp:RequiredFieldValidator ID="RequiredFieldValidatorBody" runat="server" ErrorMessage="* Support your question with a more detailed description" ControlToValidate="TextBoxFBody" ValidationGroup="SubmitAsk"></asp:RequiredFieldValidator>
            <br />
            <asp:TextBox ID="TextBoxFBody" runat="server" Rows="10" Height="254px" Width="570px" CssClass="ForumTextbox" MaxLength="570" TextMode="MultiLine"></asp:TextBox>
            
            <h3> Subject </h3>
            <br />
            <asp:DropDownList ID="DDLSubject" runat="server">
                <asp:ListItem>Art</asp:ListItem>
                <asp:ListItem>Biology</asp:ListItem>
                <asp:ListItem>Chemistry</asp:ListItem>
                <asp:ListItem>Engineering</asp:ListItem>
                <asp:ListItem>Information Technology</asp:ListItem>
            </asp:DropDownList>
            <br />
            <h3> Tags </h3>
            <br />
            <asp:TextBox ID="TextBoxFTags" runat="server" Width="570px" Height="30px" CssClass="ForumTextbox" MaxLength="570"></asp:TextBox>
            <asp:Button ID="ButtonFSubmit" runat="server" Text="Submit Question" CssClass="ForumAskButton" OnClick="ButtonFSubmit_Click" ValidationGroup="SubmitAsk" />
        </div>
        <div class="forum-post-container" style="width: 15.5vw; margin: -70vh 20px 20px 20px; padding: 15px;">
            <h3> Guidelines </h3>
            <p> Tips on structuring your questions </p>
            <hr />
                <h4> 1. Ask your question in the header</h4> <hr />
                <h4> 2. Back up your question with the subtitle -- attaching images of your solution helps too!</h4> <hr />
                <h4> 3. Tag your posts appropriately and effectively; we would recommend about 2-3 tags per post</h4> <hr />
        </div>
    </div>
       

</asp:Content>
