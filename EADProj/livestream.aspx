<!DOCTYPE html>
<link href="css/livestream.css" rel="stylesheet">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.0/css/bootstrap.min.css" integrity="sha384-SI27wrMjH3ZZ89r4o+fGIJtnzkAnFs3E4qz9DIYioCQ5l9Rd/7UAa8DHcaL8jkWt" crossorigin="anonymous">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>

<body  style="background-color:#212121">

    <form id="form1" runat="server">
        <div class="header">
            <br>
            <h3 class="headerText">Live-streaming Demo</h3>
            <video class="center" width="1200" height="700" id="streamPlayer" src="img/testVideo.mp4" controls="controls" />
        </div>
        <!-- Chat -->
        <div class="center" style="background-color:#e8e6e6;overflow-x: hidden;width:1200px;border-bottom-left-radius:15px;border-bottom-right-radius:15px;overflow:auto;height:150px;">
            <br />
            <div class="media center">
                        <img class="mr-3" width="50px" height="'50px" src="img/likeyLogo.png" alt="Generic placeholder image">
                        <div class="media-body">
                            <h5 class="mt-0">Likey</h5>
                            This is a test message
                        </div>
             </div>
            <hr>
             <div class="media center">
                    <img class="mr-3" width="50px" height="'50px" src="img/likeyLogo.png" alt="Generic placeholder image">
                    <div class="media-body">
                            <h5 class="mt-0">Likey</h5>
                            This is a test message
                    </div>
             </div>
            <hr />
            <div class="media center">
                    <img class="mr-3" width="50px" height="'50px" src="img/likeyLogo.png" alt="Generic placeholder image">
                    <div class="media-body">
                            <h5 class="mt-0">Likey</h5>
                            This is a test message
                    </div>
             </div>
        </div>
        <br />
        <br />

        <div style="background-color:white;width:1200px;border-radius: 15px;" class="center">
            <div class="media center">
                    <img class="mr-3" width="100px" height="'100px" src="img/likeyLogo.png" alt="Generic placeholder image">
                    <div class="media-body">
                            <h5 class="mt-0">Likey</h5>
                            User description here<br /><br />
                        <div class="d-flex justify-content-start">
                            <button class="btn btn-dark">Subscribe</button>
                            <button style="margin-left:15px;" class="btn btn-dark">Follow</button>
                            <button style="margin-left:15px;" class="btn btn-dark">Notifications</button>
                        </div> 
                    </div>
             </div>
            
        </div>
    </form>

</body>

</html>
