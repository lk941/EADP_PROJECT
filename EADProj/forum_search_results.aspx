<%@ Page Title="" Language="C#" MasterPageFile="~/Likey.Master" AutoEventWireup="true" CodeBehind="forum_search_results.aspx.cs" Inherits="EADProj.forum_search_results" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!--<script src="Scripts/jquery-1.10.2.min.js" type="text/javascript"></script>
     <script type="text/javascript">
    function getProducts() {
        $.getJSON("api/GetPostsBySearch",
            function (data) {
                $('#forum_post').empty(); // Clear the table body.

                // Loop through the list of products.
                $.each(data, function (key, val) {
                    // Add a table row for the product.
                    var row = '<td>' + val.user_id + '</td><td>' + val.post_title + '</td>';
                    $('<tr/>', { html: row })  // Append the name.
                        .appendTo($('#forum_post'));
                });
            });
        }

        $(document).ready(GetPostsBySearch);

</script> -->
    <style>
        .home{
            margin: -87vh 0 0 19vw;
        }
        .popular {
            border: 1.5px solid white;
            height: auto;
            width: 100%;
            border-radius: 10px;
            padding: 25px 23px 15px 23px;
            margin-right: 30px;
            margin-top: 50px;
        }

        .home-container1 {
            display: inline-block;
            width: 42%;
            
        }

        .forum-post-subinstance {
        background-color: white;
        color: grey;
        border-radius: 9px;
        max-height: 25px;
        padding: 5px 15px;
    }

        .no-of-searches {
            font-size: 135%;
            margin-left: 70px;
            color: white;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>test</p>
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
            <h1 style="color: white; margin: 0 0 5px 10px;"> <span class="glyphicon glyphicon-search" style="font-size: 150%; margin-bottom: 15px; color: white">  </span> &nbsp Results for " <asp:Label ID="LabelQuery" runat="server" Text=""></asp:Label> "

    </h1>
            <asp:Label ID="LabelNoOfResults" CssClass="no-of-searches" runat="server" Text=""></asp:Label>
    <div class="popular" style="display: inline-block">     
        
        <asp:Repeater ID="RepeaterSearchResults"  OnItemCommand="RepeaterTop_ItemCommand" runat="server">
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
                        <p style="font-size: 150%; margin-left: 3px;"> <asp:Label ID="LabelDesc" runat="server" Text='<%# Eval("post_description").ToString().Substring(0, 100) + "..." %>'></asp:Label> </p>         
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
    </div>
</asp:Content>
