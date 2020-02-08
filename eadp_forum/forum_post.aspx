<%@ Page Title="" Language="C#" MasterPageFile="~/Likey.Master" AutoEventWireup="true" CodeBehind="forum_post.aspx.cs" Inherits="eadp_forum.forum_page" EnableEventValidation="true" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .forum-post-page {
    margin: -85vh 0 0 23vw;
    position: relative;
    
}

        .forum-post-title {
    display: block;
    color: white;
    font-size: 2.3vw;
    margin-top: -10vh;
}

    /*
    .forum-post-title h1 {
    font-size: 2vw;
}
*/
    .fcommentidno {
        color: #E48F01
    }

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
    padding: 30px 45px 15px 50px;
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

.forum-post-tags p {
    margin-top: 2px;
    margin-right: 5px;
    font-size: 0.6vw;
}

#forum-tags p {
    display: inline-block;
    margin: 3px; 
    padding: 1px 5px;
    border: 1px solid grey;
    border-radius: 7px;
    letter-spacing: 2px;
    font-size: 0.9vh;
}

.forum-post-askqn {

}

    .forum-post-askqn button {
        border-radius: 10px;
        background-color: white;
        color: #f7a248;
        border: 1px solid white;
        padding: 10px 15px;
        cursor: pointer;
        font-size: 0.7vw;
        display: inline-flex;
    }

        .forum-post-askqn button:hover {
            border: 1px solid white;
            border-radius: 10px;
            background-color: #F9B369;
            color: white;
            padding: 10px 15px;
            cursor: pointer;
            font-size: 0.8vw;
        }

.forum-post-related {
    margin: -105vh 0 0 80vw;
    position: relative;
}

.forum-post-user {
    border: 0.5px solid grey;
    border-radius: 5px;
    height: 60px;
    width: 130px;
    padding: 7px;
}

.forum-post-subinstance {
    display: inline;
}

.link-button-comment {
    margin-left: 40vw;
}
.ForumTextbox {
    margin-bottom: 10px;
}

.ForumAskButton {
    border-radius: 10px;
    background-color: #f7a248;
    color: white;
    border: 1px solid white;
    padding: 10px 15px;
    cursor: pointer;
    font-size: 0.7vw;
    display: inline-flex;
    margin: 10px 0 0 35vw;
}

    .ForumAskButton:hover {
        border-radius: 10px;
        background-color: #F9B369;
        color: white;
        border: 1px solid white;
        padding: 10px 15px;
        cursor: pointer;
        font-size: 0.7vw;
        display: inline-flex;
    }

    .modalBackground
    {
        background-color: Black;
        filter: alpha(opacity=90);
        opacity: 0.8;
    }
    .modalPopup
    {
        background-color: #FFFFFF;
        border-width: 3px;
        border-style: solid;
        border-color: black;
        padding-top: 10px;
        padding-left: 10px;
        width: 300px;
        height: 140px;
    }

    .triangle-up {
	width: 0;
	height: 0;
    display: inline-block;
	border-left: 20px solid #E48F01;
	border-right: 20px solid #E48F01;
	border-bottom: 25px solid white;
    border-top: 0px solid white;
    margin-left: 20px;
}

    .triangle-up:hover {
        border-top: 0px solid blue;
    }

    .triangle-down {
	width: 0;
	height: 0;
	border-left: 20px solid #E48F01;
	border-right: 20px solid #E48F01;
	border-top: 25px solid white;
    margin-right: 35px;
}

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

        <div class="forum-post-page">
        <div class="forum-post-title">
        <h1> <asp:Label ID="LabelPostHeader" runat="server" Text=""></asp:Label> </h1>
            
        <div class="forum-post-subtitle">
            <p id="post-age"> Asked 3 days ago</p> 
            <p id="user-active"> Active 2 days ago</p>
            <p id="post-views"> Viewed <asp:Label ID="LabelViews" runat="server" Text=""></asp:Label> times </p>
        </div>         
    </div>
        <div class="forum-post-container">
            <div class="forum-post-text">
                <asp:Label ID="LabelPostDesc" runat="server" CssClass="forum-post-text"></asp:Label>
            </div>
            <div class="forum-post-tags">
                    <p> Tags: </p>
 <div id="forum-tags">
                        <p> USERS </p> <p> CSS </p>
                    </div>
                </div>
                <div class="forum-post-user">
                    <div style="height: 45px; width: 45px; border: 0.5px solid grey; border-radius: 50%; display: inline-block"></div>
                    <!-- <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRPTjNUoGrgWf-Hfk7F99JwJFIBjklSwwWn6tyaJNg02twJBNKY&s" /> -->
                    <div style="display: inline-block; line-height: 5px;">
                        <p> User: <asp:Label ID="LabelPostUserID" runat="server" Text=""></asp:Label></p>
                    <p>115</p>
                    <p> STUDENT </p>
                    </div>
                </div>
            <br />
            <asp:LinkButton ID="LinkButtonEdit" runat="server" OnClick="LinkButtonEdit_Click" Font-Size="Small">Edit</asp:LinkButton>
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
            <asp:LinkButton ID="LinkButtonDelete" runat="server" Font-Size="Small">Delete</asp:LinkButton>
        
            <cc1:ModalPopupExtender ID="ModalPopupExtender1" runat="server" PopupControlID="Panel1" TargetControlID="LinkButtonDelete"
    CancelControlID="LinkButtonDelete" BackgroundCssClass="modalBackground"></cc1:ModalPopupExtender>
            <asp:Panel ID="Panel1" runat="server" CssClass="modalPopup" align="center" style = "display:none"></asp:Panel>
            <div style="margin-right: 40vw; width: 100%; display: flex">
                <asp:LinkButton ID="LinkButtonVote" runat="server">Upvote</asp:LinkButton> &nbsp
                <asp:LinkButton ID="LinkButtonShare" runat="server">Share</asp:LinkButton>&nbsp
                <asp:LinkButton ID="LinkButtonMessage" runat="server">Message User</asp:LinkButton>
            </div>
        </div>
            <br />
            <br />
            <br />
           <div style="margin-top: 30px; margin-bottom: 30px; color: white">
                <h1> Answers </h1>
               <br />
               <hr style="border: 1px solid white; width: 65%" />
               <p style="margin-top: 20px; margin-right: 45%;"> 
                   <asp:Label ID="LabelNoAnswer" runat="server" Text="Label" Visible="False"> - there is no content to display - </asp:Label>
               </p> 
               
               <div>
                   <asp:Repeater ID="RepeaterAnswer" runat="server" OnItemCommand="RepeaterAnswer_ItemCommand">
                       <HeaderTemplate>
                <table style="width: 100%; padding-left: 20px;">
                    <tr>
                        <th>
                           
                        </th> <th></th> <th></th>
                    </tr>         
            </HeaderTemplate>
            <ItemTemplate>

                <tr>
                    
                        <td>  
                             
                        <div style="display: flex">
                            <asp:Button ID="ButtonUpvoteComment" onclick="ButtonUpvoteComment_Click" runat="server" Text="" CssClass="triangle-up" /> 
                            
                           
                   </div>
                    </td>
                    <td>
                         
                    </td>
                    
                    <td></td>
                </tr>
               
                <tr style="margin-bottom: 10px;">
                    <td>
                        <div class="forum-post-subinstance">
                            
                            <div style="display: flex">
                                <h2 style="display: inline-block; margin: 15px 25px 0px 35px;"> <asp:Label ID="LabelCommentVotes" runat="server" Text='<%# Eval("votes") %>'></asp:Label> </h2>
                                <figure style="height: 50px; width: 50px; margin-left: 20px;">
                                <img style="width: 100%" src="https://www.sackettwaconia.com/wp-content/uploads/default-profile.png" />
                                <figcaption>user: <asp:Label ID="Label1" runat="server" Text='<%# Eval("user_id") %>' CssClass="" /></figcaption>

                            </figure>
                       
                           <p style="margin-left: 10px; font-size: 150%"> 
                               <asp:Label ID="LabelCommentID" runat="server" Text='<%# Eval("fcomment_id") %>' CssClass="fcommentidno"></asp:Label>
                        <asp:Label ID="LabelAnswer" runat="server" Text='<%# Eval("comment") %>'></asp:Label> </p>
                            </div>
                <p style="padding-left: 0; margin-right: 50px; display: inline"> 
                   
                    <asp:LinkButton ID="LinkButtonEditComment" runat="server" Font-Size="Small" CssClass="link-button-comment" onclick="LinkButtonDeleteComment_Click">Edit</asp:LinkButton>
                <asp:LinkButton ID="LinkButtonDeleteComment" runat="server" Font-Size="Small">Delete</asp:LinkButton>
                </p>
                            <div style="margin-top: -20px; margin-left: 20px; margin-bottom: -7px; width: 100%; display: flex">
                                <asp:Button ID="ButtonDownvoteComment" runat="server" Text="Button" CssClass="triangle-down" />
                <!-- <asp:LinkButton ID="LinkButtonVote" runat="server">Upvote</asp:LinkButton> &nbsp
                <asp:LinkButton ID="LinkButtonShare" runat="server">Share</asp:LinkButton>&nbsp
                <asp:LinkButton ID="LinkButtonMessage" runat="server">Message User</asp:LinkButton> -->
            </div>
                           
            </div>
                        
                       
                        <hr style="border: 1px solid white; width: 47vw; margin-bottom: 10px;" />
                    </td>
            
                </tr>
            </ItemTemplate>
            <FooterTemplate>
                </table>
            </FooterTemplate>
                   </asp:Repeater>
               </div>
               <h2 style="margin-top: 20px"> Your Comment: </h2>
               <div class="forum-post-container" style="margin-bottom: 5vh; margin-top: 7px">
                   <div style="display: inline-block;">
                       <img style="height: 50px; width: 50px; margin-left: -20px; margin-right: 20px; margin-top: -270px" src="https://www.sackettwaconia.com/wp-content/uploads/default-profile.png" />
                   </div>
                   <asp:TextBox ID="TextBoxComment" width="80%" runat="server" Rows="10" placeholder="Have an answer? Leave it here!" TextMode="MultiLine"></asp:TextBox>
                   <asp:Button ID="ButtonSubmitComment" runat="server" Text="Submit" OnClick="ButtonSubmitComment_Click" />
               </div>
               <h3 style="margin-top: 30px"> Not the answer you're looking for? Feel free to <asp:LinkButton ID="LinkButtonAskLink" runat="server" OnClick="LinkButtonAskLink_Click">ask your own question</asp:LinkButton>!</h3>

            </div>
    </div>
    <div class="forum-post-related">
        <div class="forum-post-askqn">
        
                <button id="buttonAsk"> Ask a question</button>
            </div>
        <div>
            <asp:Repeater ID="RepeaterRecommended" runat="server">

            </asp:Repeater>
        </div>

    </div>

</asp:Content>
