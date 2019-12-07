<%@ Page Title="" Language="C#" MasterPageFile="~/menu.Master" AutoEventWireup="true" CodeBehind="courseRecc.aspx.cs" Inherits="EADProj.courseRecc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/courseReccomend.css" rel="stylesheet">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- multistep form -->
    <form id="msform">
        <!-- progressbar -->
        <ul id="progressbar">
            <li class="active">Account Setup</li>
            <li>Social Profiles</li>
            <li>Personal Details</li>
        </ul>
        <!-- fieldsets -->
        <fieldset>
            <h2 class="fs-title">Category</h2>
            <h3 class="fs-subtitle">What is category is your course in?</h3>
            <section style="background-color: white !important;" class="content-section bg-primary text-white">
                <div class="container cat-container">
                    <div class="row">
                        <div class="col-12 col-sm-12 col-md-12 col-lg-12">
                            <div class="custom-card">
                                <div class="small-image-thumbnail">
                                    <i style="width: 100%; height: 100%;" class="fas fa-code"></i>
                                </div>
                                <div class="small-text-container">
                                    <span class="small-category-title">Development
                                    </span>
                                    <div class="custom-create-button">
                                        <span class="create-text">GO
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-12 col-sm-12 col-md-12 col-lg-12">
                            <div class="custom-card">
                                <div class="small-image-thumbnail">
                                    <i class="fas fa-briefcase"></i>
                                </div>
                                <div class="small-text-container">
                                    <span class="small-category-title">Business
                                    </span>
                                    <div class="custom-create-button">
                                        <span class="create-text">GO
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-12 col-sm-12 col-md-12 col-lg-12">
                            <div class="custom-card">
                                <div class="small-image-thumbnail">
                                    <i class="fas fa-tv"></i>
                                </div>
                                <div class="small-text-container">
                                    <span class="small-category-title">Technology
                                    </span>
                                    <div class="custom-create-button">
                                        <span class="create-text">GO
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-12 col-sm-12 col-md-12 col-lg-12">
                            <div class="custom-card">
                                <div class="small-image-thumbnail">
                                    <i class="fas fa-palette"></i>
                                </div>
                                <div class="small-text-container">
                                    <span class="small-category-title">Art & Design
                                    </span>
                                    <div class="custom-create-button">
                                        <span class="create-text">GO
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-12 col-sm-12 col-md-12 col-lg-12">
                            <div class="custom-card">
                                <div class="small-image-thumbnail">
                                    <i class="fas fa-comment-dollar"></i>
                                </div>
                                <div class="small-text-container">
                                    <span class="small-category-title">Marketing
                                    </span>
                                    <div class="custom-create-button">
                                        <span class="create-text">GO
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-12 col-sm-12 col-md-12 col-lg-12">
                            <div class="custom-card">
                                <div class="small-image-thumbnail">
                                    <i class="fas fa-user-friends"></i>
                                </div>
                                <div class="small-text-container">
                                    <span class="small-category-title">Personal Dev.
                                    </span>
                                    <div class="custom-create-button">
                                        <span class="create-text">GO
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-12 col-sm-12 col-md-12 col-lg-12">
                            <div class="custom-card">
                                <div class="small-image-thumbnail">
                                    <i class="fas fa-camera"></i>
                                </div>
                                <div class="small-text-container">
                                    <span class="small-category-title">Photography
                                    </span>
                                    <div class="custom-create-button">
                                        <span class="create-text">GO
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-12 col-sm-12 col-md-12 col-lg-12">
                            <div class="custom-card">
                                <div class="small-image-thumbnail">
                                    <i class="fas fa-music"></i>
                                </div>
                                <div class="small-text-container">
                                    <span class="small-category-title">Music
                                    </span>
                                    <div class="custom-create-button">
                                        <span class="create-text">GO
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <input type="button" name="next" class="next action-button" value="Next" />
        </fieldset>
        <fieldset>
            <h2 class="fs-title">Social Profiles</h2>
            <h3 class="fs-subtitle">Your presence on the social network</h3>
            <input type="text" name="twitter" placeholder="Twitter" />
            <input type="text" name="facebook" placeholder="Facebook" />
            <input type="text" name="gplus" placeholder="Google Plus" />
            <input type="button" name="previous" class="previous action-button" value="Previous" />
            <input type="button" name="next" class="next action-button" value="Next" />
        </fieldset>
        <fieldset>
            <h2 class="fs-title">Personal Details</h2>
            <h3 class="fs-subtitle">We will never sell it</h3>
            <input type="text" name="fname" placeholder="First Name" />
            <input type="text" name="lname" placeholder="Last Name" />
            <input type="text" name="phone" placeholder="Phone" />
            <textarea name="address" placeholder="Address"></textarea>
            <input type="button" name="previous" class="previous action-button" value="Previous" />
            <input type="submit" name="submit" class="submit action-button" value="Submit" />
        </fieldset>
    </form>

    <script src="https://code.jquery.com/jquery-3.2.1.js" integrity="sha256-DZAnKJ/6XZ9si04Hgrsxu/8s717jcIzLy3oi35EouyE=" crossorigin="anonymous"></script>
    <script>
        //jQuery time
        var current_fs, next_fs, previous_fs; //fieldsets
        var left, opacity, scale;
        var animating;

        $(".next").click(function() {
          if (animating) return false;
          animating = true;
          current_fs = $(this).parent();
          next_fs = $(this)
            .parent()
            .next();

          $("#progressbar li")
            .eq($("fieldset").index(next_fs))
            .addClass("active");

          //show the next fieldset
          next_fs.show();
          //hide the current fieldset with style
          current_fs.animate(
            { opacity: 0 },
            {
              step: function(now, mx) {
                scale = 1 - (1 - now) * 0.2;
                left = now * 50 + "%";
                opacity = 1 - now;
                current_fs.css({
                  transform: "scale(" + scale + ")",
                  position: "absolute"
                });
                next_fs.css({ left: left, opacity: opacity });
              },
              duration: 800,
              complete: function() {
                current_fs.hide();
                animating = false;
              },
              //\easing plugin
              easing: "easeInOutBack"
            }
          );
        });

        $(".previous").click(function() {
          if (animating) return false;
          animating = true;

          current_fs = $(this).parent();
          previous_fs = $(this)
            .parent()
            .prev();

          //de-activate current step on progressbar
          $("#progressbar li")
            .eq($("fieldset").index(current_fs))
            .removeClass("active");

          //show the previous fieldset
          previous_fs.show();
          //hide the current fieldset with style
          current_fs.animate(
            { opacity: 0 },
            {
              step: function(now, mx) {
                scale = 0.8 + (1 - now) * 0.2;
                //2. take current_fs to the right(50%) - from 0%
                left = (1 - now) * 50 + "%";
                //3. increase opacity of previous_fs to 1 as it moves in
                opacity = 1 - now;
                current_fs.css({ left: left });
                previous_fs.css({
                  transform: "scale(" + scale + ")",
                  opacity: opacity
                });
              },
              duration: 800,
              complete: function() {
                current_fs.hide();
                animating = false;
              },
              //this comes from the custom easing plugin
              easing: "easeInOutBack"
            }
          );
        });

        $(".submit").click(function() {
          return false;
        });
    </script>
</asp:Content>