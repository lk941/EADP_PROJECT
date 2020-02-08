<%@ Page Title="" Language="C#" MasterPageFile="~/menu.Master" AutoEventWireup="true" CodeBehind="VideoUpload.aspx.cs" Inherits="eadpProject1.VideoUpload" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">  
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">  
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>  
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>  
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.16/css/dataTables.bootstrap4.min.css" />  
    <link href="css/videoUpload.css" rel="stylesheet">
    <script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js" type="text/javascript"></script>  
    <script src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap4.min.js" type="text/javascript"></script>  
    <script type="text/javascript">  
    $(document).ready(function () {  
        $("#GridView1").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();  
    });  
</script> 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

      
        <div class="container py-3">  
            <h2 class="text-center text-uppercase">Video upload for lessons</h2>  
            <div class="row">  
                <div class="form-group">  
                    <label>Choose Video:</label>  
                    <div class="input-group">  
                        <div class="custom-file">  
                            <asp:FileUpload ID="FileUpload1" CssClass="custom-file-input" runat="server" />  
                            <label class="custom-file-label"></label>  
                        </div>  
                        <div class="input-group-append">  
                            <asp:Button ID="btnUpload" CssClass="btn btn-outline-secondary" runat="server" Text="Upload" OnClick="btnUpload_Click" />  
                        </div>  
                    </div>  
                </div>  
            </div>  
            <asp:Label ID="lblMessage" runat="server"></asp:Label>  
            <br />
            
            <asp:GridView ID="GridView1" ShowHeaderWhenEmpty="True" HeaderStyle-CssClass="bg-primary text-black" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered" DataKeyNames="ID" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">  
                
                <Columns>
                    <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="True" ReadOnly="True" SortExpression="ID" />
                    <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                    <asp:BoundField DataField="Video_Path" HeaderText="Video_Path" SortExpression="Video_Path" />
                </Columns>
                
             <EmptyDataTemplate>  
                    <div class="text-center">No Data Found <strong>Upload New Video</strong></div>  
                </EmptyDataTemplate>   

<HeaderStyle CssClass="bg-primary text-white"></HeaderStyle>
            </asp:GridView>  
            
        </div> 
          
   
   
    
</asp:Content>
