<%@ Page Title="" Language="C#" MasterPageFile="~/menu.Master" AutoEventWireup="true" CodeBehind="LessonDetailsUpdate1.aspx.cs" Inherits="eadLab5.LessonDetailsUpdate1" %>
<script runat="server">

</script>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/lessonDetails.css" rel="stylesheet">
    <link href="css/font.css" rel="stylesheet" />
       
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <!-- header -->
<div style="margin: 10px; padding: 0; max-width: 100%; width: 100%;" class="container jumbo-container">
  <div class="jumbotron jumbo-header">
    <h3>
      
    </h3>
  </div>
</div>
   
     
        <div>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="Label1" runat="server" Font-Bold="False" Font-Size="Medium" Height="50px" Text="Lesson Code:" Width="200px" Font-Names="Arial Narrow"></asp:Label>
                    </td>
                    <td class="auto-style2">
                        <asp:TextBox ID="TbCode" runat="server" Width="405px" Height="32px" CssClass="col-xs-offset-0"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="Label2" runat="server" Font-Bold="False" Font-Size="Medium" Height="50px" Text="Name of Lesson:" Width="200px" Font-Names="Arial Narrow"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TbName" runat="server" Width="405px" Height="32px" CssClass="auto-style6"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="Label3" runat="server" Font-Bold="False" Font-Size="Medium" Height="50px" Text="Timing For Lesson:" Width="200px" Font-Names="Arial Narrow"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TbTiming" runat="server" Width="405px" Height="32px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="Label4" runat="server" Font-Bold="False" Font-Size="Medium" Height="50px" Text="Subject:" Width="200px" Font-Names="Arial Narrow"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="DdlSubj" runat="server" Width="405px" Height="32px">
                            <asp:ListItem Value="- Select -">- Select -</asp:ListItem>
                            <asp:ListItem>IT</asp:ListItem>
                            <asp:ListItem>Engineering</asp:ListItem>
                            <asp:ListItem>Sciences</asp:ListItem>
                            <asp:ListItem>Business</asp:ListItem>
                            <asp:ListItem>Design</asp:ListItem>
                            <asp:ListItem>Others</asp:ListItem>
                            
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="Label5" runat="server" Font-Bold="False" Font-Italic="False" Font-Size="Medium" Height="50px" Text="Teacher:" Width="200px" Font-Names="Arial Narrow"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TbTeacher" runat="server" Height="32px" Width="405px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td>
                         <asp:Button ID="BtnBack" runat="server" OnClick="BtnBack_Click" Text="Back" Width="115px" />
                        <asp:Button ID="BtnUpdate" runat="server" OnClick="BtnUpdate_Click" Text="Update" Width="115px" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                       
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <asp:Label ID="LblMsg" runat="server" ForeColor="Red"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1"></td>
                    <td class="auto-style1">
                        </td>
                </tr>
            </table>
        </div>
 
</asp:Content>
