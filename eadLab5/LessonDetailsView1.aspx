<%@ Page Title="" Language="C#" MasterPageFile="~/menu.Master" AutoEventWireup="true" CodeBehind="LessonDetailsView1.aspx.cs" Inherits="eadLab5.LessonDetailsView1" %>
<script runat="server">

</script>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/lessonDetails.css" rel="stylesheet">
    <style type="text/css">
        body {
   
    font-family: "Glyphicons Halflings";
}

        }
        .auto-style1 {
            width: 100%;
            height: 859px;
        }
        .auto-style6 {
            margin-left: 3;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- header -->
<div style="margin: 0; padding: 0; max-width: 100%; width: 100%;" class="container jumbo-container">
  <div class="jumbotron jumbo-header">
    <h3>
      This is a header.
    </h3>
  </div>
</div>
    
        <div>
        </div>
        <asp:GridView ID="GvEmployee" runat="server" AutoGenerateColumns="False" OnSelectedIndexChanged="GvEmployee_SelectedIndexChanged">
            <Columns>
                <asp:BoundField DataField="Code" HeaderText="Code" ReadOnly="True" />
                <asp:BoundField DataField="Name" HeaderText="Lesson Name" ReadOnly="True" />
                <asp:BoundField DataField="Timing" HeaderText="Timings Avaliable" ReadOnly="True" />
                <asp:BoundField DataField="Subj" HeaderText="Subj" ReadOnly="True" />
                <asp:BoundField DataField="Teacher" HeaderText="Teacher" ReadOnly="True" />
                
               
                <asp:CommandField ShowSelectButton="True" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnStr %>" SelectCommand="SELECT * FROM [Lesson]"></asp:SqlDataSource>
        <p>
                        <asp:Button ID="BtnAdd" runat="server" OnClick="BtnAdd_Click" Text="Add" Width="115px" />
                    </p>
  
</asp:Content>
