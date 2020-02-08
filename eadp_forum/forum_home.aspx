<%@ Page Title="" Language="C#" MasterPageFile="~/Likey.Master" AutoEventWireup="true" CodeBehind="forum_home.aspx.cs" Inherits="eadp_forum.forum_home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body {
            background-image: url("imgs/orange_wallpaper.jpg");
            height: 100%;
            background-position: center;
  background-repeat: no-repeat;
  background-size: cover;
}

        .post_desc {
            height: 30px;
            overflow: hidden;
        }
        .home{
            margin: -85vh 0 0 0;
            padding: 0 0 0 19vw;
        }
        .popular {
            border: 1.5px solid white;
            height: auto;
            width: 100%;
            border-radius: 10px;
            padding: 25px 23px 15px 23px;
            margin-right: 30px;
        }

        .home-container1 {
            display: inline-block;
            width: 42%;
            
        }

        .home-container2 {
            width: 30vw;
            margin-left: 70px;
            margin-top: 15vh;
            position: absolute;
        }     

        .popular-tags {
            border: 1.5px solid white;
            border-radius: 10px;
            height: 150px;
            padding: 3px 0 15px 15px;
        }

        .forum-post-instance {
        color: white !important;
        padding: 5px 10px;
        max-width: 70%;
    }

    .forum-post-subinstance {
        background-color: white;
        color: grey;
        border-radius: 9px;
        max-height: 25px;
        padding: 5px 15px;
    }

    .forum-search {
        width: 26vw;
        height: 27px;
        border-radius: 7px;
        display: inline;
        margin-top: -10px;
        color: grey;
        padding-left: 10px;
    }

.search-icon {
  position: relative;
  left: -30px;
  color: white;
  cursor: pointer;
}

.TopPostHeader {
        display: block;
        font-size: 18px;
        font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
        margin-bottom: 3px;
        font-style: normal;
    }

.forum-search-button {
    background-color: #F8932F;
    padding: 7px;
    width: 3vw;
    height: 27px;
    font-size: 15px;
    font-weight: 400;
    display: inline;
    text-align: center;
    border-radius: 7px;
}

.forum-search-button:hover {
    background-color: white;
    color: orange;
    padding: 7px;
    width: 3vw;
    height: 27px;
    font-size: 15px;
    font-weight: 400;
    display: inline;
    text-align: center;
    border-radius: 7px;
}

.forum-post-tags {
    display: inline-flex;
}

.forum-post-tags p:hover {
    background-color: white;
    color: darkorange;
}

#forum_tags p:hover {
    color: darkorange;
}

.forum-post-tags p {
    margin-top: 2px;
    margin-right: 5px;
    font-size: 0.6vw;
}

#forum_tags p {
    display: inline-block;
    margin: 3px; 
    padding: 1px 5px;
    border: 1px solid white;
    border-radius: 7px;
    letter-spacing: 2px;
    font-size: 0.9vh;
    color: white;
}
        

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <script>
  window.console = window.console || function(t) {};
</script>
<script>
  if (document.location.search.match(/type=embed/gi)) {
    window.parent.postMessage("resize", "*");
  }
</script>
    <div class="home">
        <div class="home-container1">
            <h3 style="color: white; margin: 0 0 15px 10px;"> <span class="glyphicon glyphicon-tasks"></span> &nbsp P O P U L A R

    </h3>
    <div class="popular" style="display: inline-block">



        
        <asp:Repeater ID="RepeaterTopPosts"  OnItemCommand="RepeaterTop_ItemCommand" runat="server">
            <HeaderTemplate>
                <table style="width: 100%">
                    <tr>
                        <th></th> <th></th> <th></th>
                    </tr>         
            </HeaderTemplate>
            <ItemTemplate>
                <tr>
                    <td>
                        <h3> 
                            <asp:LinkButton ID="ButtonPostTitle" runat="server" Text='<%# Eval("post_title") %>' OnClientClick="" ></asp:LinkButton></h3>
                </div>
                    </td>
                    <td>

                    </td>
                    <td></td>
                </tr>
                <tr> 
                    <td>
                        <p style="font-size: 150%; margin-left: 3px;"> <asp:Label ID="LabelDesc" CssClass="post_desc" runat="server" Text='<%# Eval("post_description").ToString().Substring(0, 100) + "..." %>'></asp:Label> </p>         
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="forum-post-subinstance">
                <p> upvotes: <asp:Label ID="LabelVotes" runat="server" Text='<%# Eval("post_votes") %>' CssClass="" /> &nbsp&nbsp&nbsp
                    comments: 0 &nbsp&nbsp&nbsp
                    user: <asp:Label ID="LabelUser" runat="server" Text='<%# Eval("user_id") %>' CssClass="" />
                    
                </p>
                <p style="color: #F8B109; padding-top: 10px"> <asp:Label ID="LabelPostID" runat="server" Text='<%# Eval("post_id") %>' CssClass="" />
                    <asp:Label ID="LabelSubj" runat="server" Text='<%# Eval("post_subject") %>' CssClass="" />
                    <asp:Label ID="LabelPostTags" runat="server" Text='<%# Eval("post_tags") %>' CssClass="" />
                    <asp:Label ID="LabelViews" runat="server" Text='<%# Eval("post_views") %>' CssClass="" />
                </p>
            </div>
                        <hr style="border: 1px solid white; width: auto" />
                    </td>
            
                </tr>
            </ItemTemplate>
            <FooterTemplate>
                </table>
            </FooterTemplate>
        </asp:Repeater>
    </div>
        </div>
    
    <div class="home-container2" style="display: inline-block;">
        <span class="glyphicon glyphicon-search" style="font-size: 150%; margin-bottom: 20px; color: white">  </span>  <h3 style="display: inline-block; color: white"> &nbsp S E A R C H</h3>
        <asp:TextBox ID="TextBoxSearch" placeholder="Have a question? Search it here..." CssClass="forum-search" runat="server"></asp:TextBox>

        <asp:Button ID="ButtonSearch" runat="server" Text="Go" CssClass="forum-search-button" BorderStyle="None" OnClick="ButtonSearch_Click" /> 
        <h3 style="color: white; margin-top: 70px; margin-left: 10px; margin-bottom: 20px;">
               <span class="glyphicon glyphicon-tag"></span>  &nbsp T A G S
            </h3>
        <div class="popular-tags">
            <div class="forum-post-tags" style="font-size: 150%">
 <div id="forum_tags" style="font-size: 150%; border-color: white" runat="server">
                        
                    </div>
                </div>
            
        </div>
    </div>
    </div>
   

   
</asp:Content>

