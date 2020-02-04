<%@ Page Title="" Language="C#" MasterPageFile="~/menu.Master" AutoEventWireup="true" CodeBehind="productGrid.aspx.cs" Inherits="EADProj.productGrid" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="/css/productGrid.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<!-- header -->
<div style="margin: 0; padding: 0; max-width: 100%; width: 100%;" class="container jumbo-container">
  <div class="jumbotron jumbo-header">
    <h3>
        <asp:Label ID="headerText" runat="server"></asp:Label>
    </h3>
  </div>
</div>

<div class="primary">
  <div class="container">

    <!-- Filter -->
    <div class="row">
      <div class="col-xs-8 col-lg-12" style="margin: auto; float: none;">
        <div class="filter-menu mobile">
          <form>
            <div class="panel panel-mobile " style="margin-top: 3vh;">
              <div class="panel-heading" role="tab" id="headingFiltersMobile">
                <a class="panel-title accordion-toggle collapsed" role="button" data-toggle="collapse" href="#collapseFiltersMobile" aria-expanded="false" aria-controls="collapseFiltersMobile">
                  Filter
                </a>
                <div class="panel-body">
                  <hr />
                  <button id="submit_btn" class="btn btn-primary" type="submit" style="color: #f7f8fa; background-color:#29303b; border: 1px solid ;">Apply Filters</button>
                  <a class="btn btn-sm btn-link pull-right" href="#">Clear Selections</a>
                </div>
                <!-- /.panel-body -->
              </div>
              <!-- /.panel-heading -->
              <div id="collapseFiltersMobile" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingFiltersMobile" aria-expanded="false">
                <div class="panel-body">
                  <div class="panel-group" id="filter-menu-mobile" role="tablist" aria-multiselectable="true">
                    <div class="panel panel-mobile">
                      <div class="panel-heading" role="tab" id="headingOneMobile">
                        <a class="panel-title accordion-toggle collapsed" role="button" data-toggle="collapse" data-parent="#filter-menu-mobile" href="#collapseOneMobile" aria-expanded="true" aria-controls="collapseOneMobile">
                          Categories
                        </a>
                        <!-- /.panel-title -->
                      </div>
                      <!-- /.panel-heading -->
                      <div id="collapseOneMobile" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOneMobile">
                        <div class="panel-body">
                          <div class="row">
                            <div class="col-xs-6 col-lg-2">
                                <div class="button-group">
                                    <button
                                        type="button"
                                        class="btn btn-default btn-sm dropdown-toggle"
                                        data-toggle="dropdown">
                                        <span class="glyphicon glyphicon-cog"> <span style="font-family:Arial;">Development</span></span>
                                        <span class="caret"></span>
                                    </button>
                                    <ul class="dropdown-menu" id="devTopics">
                                        <li>
                                        <a href="#" class="small" data-value="option1" tabindex="-1"
                                            ><input type="checkbox" value="JavaScript"/>&nbsp;JavaScript</a>
                                        </li>
                                        <li>
                                        <a href="#" class="small" data-value="option2" tabindex="-1"
                                            ><input type="checkbox" value="Python"/>&nbsp;Python</a>
                                        </li>
                                        <li>
                                        <a href="#" class="small" data-value="option3" tabindex="-1"
                                            ><input type="checkbox" value="C#"/>&nbsp;C#</a>
                                        </li>
                                        <li>
                                        <a href="#" class="small" data-value="option4" tabindex="-1"
                                            ><input type="checkbox" value="C++" />&nbsp;C++</a>
                                        </li>
                                        <li>
                                        <a href="#" class="small" data-value="option5" tabindex="-1"
                                            ><input type="checkbox" value="Java"/>&nbsp;Java</a>
                                        </li>
                                        <li>
                                        <a href="#" class="small" data-value="option6" tabindex="-1"
                                            ><input type="checkbox" value="Swift"/>&nbsp;Swift</a>
                                        </li>
                                        <li>
                                        <a href="#" class="small" data-value="option7" tabindex="-1"
                                            ><input type="checkbox" value="Kotlin"/>&nbsp;Kotlin</a>
                                        </li>
                                        <li>
                                        <a href="#" class="small" data-value="option8" tabindex="-1"
                                            ><input type="checkbox" value="MySQL"/>&nbsp;MySQL</a>
                                        </li>
                                        <li>
                                        <a href="#" class="small" data-value="option9" tabindex="-1"
                                            ><input type="checkbox" value="NoSQL"/>&nbsp;NoSQL</a>
                                        </li>
                                        <li>
                                        <a href="#" class="small" data-value="option10" tabindex="-1"
                                            ><input type="checkbox" value="ORACLE" />&nbsp;ORACLE</a>
                                        </li>
                                        <li>
                                        <a href="#" class="small" data-value="option11" tabindex="-1"
                                            ><input type="checkbox" value="HTML" />&nbsp;HTML</a>
                                        </li>
                                        <li>
                                        <a href="#" class="small" data-value="option12" tabindex="-1"
                                            ><input type="checkbox" value="CSS"/>&nbsp;CSS</a>
                                        </li>
                                        <li>
                                        <a href="#" class="small" data-value="option13" tabindex="-1"
                                            ><input type="checkbox" value="XML"/>&nbsp;XML</a>
                                        </li>
                                        <li>
                                        <a href="#" class="small" data-value="option14" tabindex="-1"
                                            ><input type="checkbox" value="PHP"/>&nbsp;PHP</a>
                                        </li>
                                        <li>
                                        <a href="#" class="small" data-value="option15" tabindex="-1"
                                            ><input type="checkbox" value="Bootstrap"/>&nbsp;Bootstrap</a>
                                        </li>
                                        <li>
                                        <a href="#" class="small" data-value="option16" tabindex="-1"
                                            ><input type="checkbox" value="Node.js" />&nbsp;Node.js</a>
                                        </li>
                                        <li>
                                        <a href="#" class="small" data-value="option17" tabindex="-1"
                                            ><input type="checkbox" value="Vue.js"/>&nbsp;Vue.js</a>
                                        </li>
                                        <li>
                                        <a href="#" class="small" data-value="option18" tabindex="-1"
                                            ><input type="checkbox" value="Angular"/>&nbsp;Angular</a>
                                        </li>
                                        <li>
                                        <a href="#" class="small" data-value="option19" tabindex="-1"
                                            ><input type="checkbox" value="React"/>&nbsp;React</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="col-xs-6 col-lg-2">
                                <div class="button-group">
                                    <button
                                        type="button"
                                        class="btn btn-default btn-sm dropdown-toggle"
                                        data-toggle="dropdown">
                                        <span class="glyphicon glyphicon-cog"> <span style="font-family:Arial;">Business</span></span>
                                        <span class="caret"></span>
                                    </button>
                                    <ul class="dropdown-menu" id="businessTopics">
                                        <li>
                                        <a href="#" class="small" data-value="option1" tabindex="-1"
                                            ><input type="checkbox" value="JavaScript"/>&nbsp;Accounting</a>
                                        </li>
                                        <li>
                                        <a href="#" class="small" data-value="option1" tabindex="-1"
                                            ><input type="checkbox" value="Financing"/>&nbsp;Financing</a>
                                        </li>
                                        <li>
                                        <a href="#" class="small" data-value="option3" tabindex="-1"
                                            ><input type="checkbox" value="Forex"/>&nbsp;Forex</a>
                                        </li>
                                        <li>
                                        <a href="#" class="small" data-value="option4" tabindex="-1"
                                            ><input type="checkbox" value="Investing" />&nbsp;Investing</a>
                                        </li>
                                        <li>
                                        <a href="#" class="small" data-value="option5" tabindex="-1"
                                            ><input type="checkbox" value="Excel"/>&nbsp;Excel</a>
                                        </li>
                                        <li>
                                        <a href="#" class="small" data-value="option6" tabindex="-1"
                                            ><input type="checkbox" value="Stock Trading"/>&nbsp;Stock Trading</a>
                                        </li>
                                        <li>
                                        <a href="#" class="small" data-value="option7" tabindex="-1"
                                            ><input type="checkbox" value="Technical Analysis"/>&nbsp;Technical Analysis</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="col-xs-6 col-lg-2">
                              <div class="button-group">
                                    <button
                                        type="button"
                                        class="btn btn-default btn-sm dropdown-toggle"
                                        data-toggle="dropdown">
                                        <span class="glyphicon glyphicon-cog"> <span style="font-family:Arial;">IT & Software</span></span>
                                        <span class="caret"></span>
                                    </button>
                                    <ul class="dropdown-menu" id="itTopics">
                                        <li>
                                        <a href="#" class="small" data-value="option1" tabindex="-1"
                                            ><input type="checkbox" value="AWS"/>&nbsp;AWS Certification</a>
                                        </li>
                                        <li>
                                        <a href="#" class="small" data-value="option1" tabindex="-1"
                                            ><input type="checkbox" value="Cisco"/>&nbsp;Cisco CCNA</a>
                                        </li>
                                        <li>
                                        <a href="#" class="small" data-value="option3" tabindex="-1"
                                            ><input type="checkbox" value="Cyber Security"/>&nbsp;Cyber Security</a>
                                        </li>
                                        <li>
                                        <a href="#" class="small" data-value="option4" tabindex="-1"
                                            ><input type="checkbox" value="Ethical Hacking" />&nbsp;Ethical Hacking</a>
                                        </li>
                                        <li>
                                        <a href="#" class="small" data-value="option5" tabindex="-1"
                                            ><input type="checkbox" value="Linux"/>&nbsp;Linux</a>
                                        </li>
                                        <li>
                                        <a href="#" class="small" data-value="option6" tabindex="-1"
                                            ><input type="checkbox" value="AI"/>&nbsp;AI/ML</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="col-xs-6 col-lg-2">
                              <div class="button-group">
                                    <button
                                        type="button"
                                        class="btn btn-default btn-sm dropdown-toggle"
                                        data-toggle="dropdown">
                                        <span class="glyphicon glyphicon-cog"> <span style="font-family:Arial;">Art & Design</span></span>
                                        <span class="caret"></span>
                                    </button>
                                    <ul class="dropdown-menu" id="artTopics">
                                        <li>
                                        <a href="#" class="small" data-value="option1" tabindex="-1"
                                            ><input type="checkbox" value="AWS"/>&nbsp;AWS Certification</a>
                                        </li>
                                        <li>
                                        <a href="#" class="small" data-value="option1" tabindex="-1"
                                            ><input type="checkbox" value="Cisco"/>&nbsp;Cisco CCNA</a>
                                        </li>
                                        <li>
                                        <a href="#" class="small" data-value="option3" tabindex="-1"
                                            ><input type="checkbox" value="Cyber Security"/>&nbsp;Cyber Security</a>
                                        </li>
                                        <li>
                                        <a href="#" class="small" data-value="option4" tabindex="-1"
                                            ><input type="checkbox" value="Ethical Hacking" />&nbsp;Ethical Hacking</a>
                                        </li>
                                        <li>
                                        <a href="#" class="small" data-value="option5" tabindex="-1"
                                            ><input type="checkbox" value="Linux"/>&nbsp;Linux</a>
                                        </li>
                                        <li>
                                        <a href="#" class="small" data-value="option6" tabindex="-1"
                                            ><input type="checkbox" value="AI"/>&nbsp;AI/ML</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                          </div>
                        </div>
                        <!-- /.panel-body -->
                      </div>
                      <!-- /.panel-collapse -->
                    </div>
                    <!-- /.panel -->

                    <div class="panel panel-mobile">
                      <div class="panel-heading" role="tab" id="headingTwoMobile">
                        <a class="panel-title accordion-toggle collapsed" role="button" data-toggle="collapse" data-parent="#filter-menu-mobile" href="#collapseTwoMobile" aria-expanded="false" aria-controls="collapseTwoMobile">
                          Level
                        </a>
                        <!-- /.panel-title -->
                      </div>
                      <!-- /.panel-heading -->
                      <div id="collapseTwoMobile" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwoMobile">
                        <div class="row">
                          <div class="col-xs-6 col-lg-3">
                            <div class="checkbox"><label><input type="checkbox" name="career_state[]" value="">All Levels</label></div>
                          </div>
                          <div class="col-xs-6 col-lg-3">
                            <div class="checkbox"><label><input type="checkbox" name="career_state[]" value="">Beginners</label></div>
                          </div>
                          <div class="col-xs-6 col-lg-3">
                            <div class="checkbox"><label><input type="checkbox" name="career_state[]" value="">Intermediate</label></div>
                          </div>
                          <div class="col-xs-6 col-lg-3">
                            <div class="checkbox"><label><input type="checkbox" name="career_state[]" value="">Expert</label></div>
                          </div>
                        </div>
                        <!-- /.panel-body -->
                      </div>
                      <!-- /.panel-collapse -->
                    </div>
                    <!-- /.panel -->

                    <div class="panel panel-mobile">
                      <div class="panel-heading" role="tab" id="headingThreeMobile">
                        <a class="panel-title accordion-toggle collapsed" role="button" data-toggle="collapse" data-parent="#filter-menu-mobile" href="#collapseThreeMobile" aria-expanded="false" aria-controls="collapseThreeMobile">
                          Price
                        </a>
                        <!-- /.panel-title -->
                      </div>
                      <!-- /.panel-heading -->
                      <div id="collapseThreeMobile" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThreeMobile">
                        <div class="panel-body">
                          <div class="row">
                            <div class="col-xs-6 col-lg-3">
                              <div class="checkbox"><label><input type="checkbox" name="career_state[]" value="">Free</label></div>
                            </div>
                            <div class="col-xs-6 col-lg-3">
                              <div class="checkbox"><label><input type="checkbox" name="career_state[]" value="">Paid</label></div>
                            </div>
                          </div>
                        </div>
                        <!-- /.panel-body -->
                      </div>
                      <!-- /.panel-collapse -->
                    </div>
                    <!-- /.panel -->

                    <div class="panel panel-mobile">
                      <div class="panel-heading" role="tab" id="headingFourMobile">
                        <a class="panel-title accordion-toggle collapsed" role="button" data-toggle="collapse" data-parent="#filter-menu-mobile" href="#collapseFourMobile" aria-expanded="false" aria-controls="collapseFourMobile">
                          Ratings
                        </a>
                        <!-- /.panel-title -->
                      </div>
                      <!-- /.panel-heading -->
                      <div id="collapseFourMobile" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingFourMobile">
                        <div class="panel-body">
                          <div class="row">
                            <div class="col-xs-6 col-lg-3">
                              <input type="radio" name="rating" value="5">
                              <span class="fa fa-star checked"></span>
                              <span class="fa fa-star checked"></span>
                              <span class="fa fa-star checked"></span>
                              <span class="fa fa-star checked"></span>
                              <span class="fa fa-star checked"></span> 5.0
                            </div>
                            <div class="col-xs-6 col-lg-3">
                              <input type="radio" name="rating" value="4">
                              <span class="fa fa-star checked"></span>
                              <span class="fa fa-star checked"></span>
                              <span class="fa fa-star checked"></span>
                              <span class="fa fa-star checked"></span>
                              <span class="fa fa-star"></span> 4.0 & Up
                            </div>
                            <div class="col-xs-6 col-lg-3">
                              <input type="radio" name="rating" value="3">
                              <span class="fa fa-star checked"></span>
                              <span class="fa fa-star checked"></span>
                              <span class="fa fa-star checked"></span>
                              <span class="fa fa-star"></span>
                              <span class="fa fa-star"></span> 3.0 & Up
                            </div>
                            <div class="col-xs-6 col-lg-3">
                              <input type="radio" name="rating" value="2">
                              <span class="fa fa-star checked"></span>
                              <span class="fa fa-star checked"></span>
                              <span class="fa fa-star "></span>
                              <span class="fa fa-star "></span>
                              <span class="fa fa-star "></span> 2.0 & Up
                            </div>
                            <div class="col-xs-6 col-lg-3">
                              <input type="radio" name="rating" value="1">
                              <span class="fa fa-star checked"></span>
                              <span class="fa fa-star "></span>
                              <span class="fa fa-star "></span>
                              <span class="fa fa-star "></span>
                              <span class="fa fa-star "></span> 1.0 & Up
                            </div>
                          </div>
                        </div>
                        <!-- /.panel-body -->
                      </div>
                      <!-- /.panel-collapse -->
                    </div>
                    <!-- /.panel -->

                    <div class="panel panel-mobile">
                      <div class="panel-heading" role="tab" id="headingFiveMobile">
                        <a class="panel-title accordion-toggle collapsed" role="button" data-toggle="collapse" data-parent="#filter-menu-mobile" href="#collapseFiveMobile" aria-expanded="false" aria-controls="collapseFiveMobile">
                          Duration
                        </a>
                        <!-- /.panel-title -->
                      </div>
                      <!-- /.panel-heading -->
                      <div id="collapseFiveMobile" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingFiveMobile">
                        <div class="panel-body">
                          <div class="row">
                            <div class="col-xs-6 col-lg-3">
                              <div class="checkbox"><label><input type="checkbox" name="career_state[]" value="">0-2 Hours</label></div>
                            </div>
                            <div class="col-xs-6 col-lg-3">
                              <div class="checkbox"><label><input type="checkbox" name="career_state[]" value="">3-6 Hours</label></div>
                            </div>
                            <div class="col-xs-6 col-lg-3">
                              <div class="checkbox"><label><input type="checkbox" name="career_state[]" value="">7-16 Hours</label></div>
                            </div>
                            <div class="col-xs-6 col-lg-3">
                              <div class="checkbox"><label><input type="checkbox" name="career_state[]" value="">17+ Hours</label></div>
                            </div>
                          </div>
                        </div>
                        <!-- /.panel-body -->
                      </div>
                      <!-- /.panel-collapse -->
                    </div>
                    <!-- /.panel -->
                  </div>
                  <!-- /.panel-group -->
                </div>
                <!-- /.panel-body -->
              </div>
              <!-- /.panel-collapse -->
            </div>
            <!-- /.panel -->
          </form>
        </div>
        <!-- /.filter-menu -->
      </div>
    </div>

    <!-- Featured Users -->
    <div class="row" style="border-top: 1px solid #eee;">
      <h3 style="display:block; width: 100%; padding-top: 3vh; padding-bottom: 3vh; text-align: center;">Featured Tutors</h3>
      <div class="cards">
        <div class="col-sm-12 col-lg-3">
          <div class="card">
            <img src="https://cdn140.picsart.com/302202574114211.png?r1024x1024" alt="">
            <h4>Uzumaki Mario</h4>
            <small>Google CEO</small>
            <button>See More</button>
          </div>
        </div>
        <div class="col-sm-12 col-lg-3">
          <div class="card">
            <img src="https://i.pinimg.com/originals/bf/85/da/bf85daf12641323bc231a526c71c7a57.png " alt="">
            <h4>Elizabeth J. Vetter</h4>
            <small>Software Engineer</small>
            <button>See More</button>
          </div>
        </div>
        <div class="col-sm-12 col-lg-3">
          <div class="card">
            <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQrHuM5-QbXi5_UGCyCSo0SRi2x5_tzgNrTVqXeclvNEnl8FPJwHQ&s" alt="">
            <h4>Lillian S. Rodriguez</h4>
            <small>Marking Director</small>
            <button>See More</button>
          </div>
        </div>
        <div class="col-sm-12 col-lg-3">
          <div class="card">
            <img src="https://fiverr-res.cloudinary.com/images/t_main1,q_auto,f_auto/gigs/131845221/original/5ed9b69a319671a6485a58248502107569a56744/photoshop-you-into-anime-scenes-or-with-an-anime-girlfriend.jpg" alt="">
            <h4>Mentaiko Salmon</h4>
            <small>IT Specialist</small>
            <button>See More</button>
          </div>
        </div>
      </div>

    </div>

  </div>

  <!--Courses -->
  <div class="course-wrapper">

  </div>

  <!--Courses -->
  <div class="course-wrapper">
    <div class="container" style="border-top: 1px solid #eee; border-bottom: 1px solid #eee;">
      <h3 style="padding-top: 3vh; padding-bottom: 3vh; text-align: center;">All Courses</h3>
       <asp:Label style="text-align: center; display: block; font-size: x-large; color: red; padding-bottom: 1%;" ID="notFoundLbl"  runat="server" Text="Not found" Visible="False"></asp:Label>

      <div class="row">

          <% foreach(var x in lesson) { %>

              <div class="col-6 col-sm-6 col-md-4 col-lg-3">
                  <a class="course-anchor" href="#">
                    <div class="course-card">
                      <img class="course-card__image" src="https://pics.me.me/how-to-disappoint-your-parents-starter-pack-funnyism-come-1007325.png" />
                      <div class="course-card__inner">
                        <span class="u-d--block course-card__instructor">Ralph Smith</span>
                        <h3 class="course-card__title"><%= x.title %></h3>
                        <div class="star-rating">
                          <span class="fas fa-star"></span>
                          <span class="fas fa-star"></span>
                          <span class="fas fa-star"></span>
                          <span class="far fa-star"></span>
                          <span class="far fa-star"></span>
                        </div>
                        <div class="course-card__meta-wrapper">
                          <span class="u-d--inline-block course-card__difficulty"><i class="fas fa-igloo"></i><%= x.difficulty %></span>
                          <span class="u-d--inline-block course-card__time"><i class="fas fa-film"></i><%= x.duration %></span>
                        </div>
                        <div class="product-price">
                          $<%= x.price %>
                        </div>
                      </div>
                    </div>
                  </a>
             </div>
          <% } %>
      </div>
    </div>
  </div>
</div>
<!-- /.primary -->
    <script>
        var options = [];

        $( '.dropdown-menu a' ).on( 'click', function( event ) {

           var $target = $( event.currentTarget ),
               val = $target.attr( 'data-value' ),
               $inp = $target.find( 'input' ),
               idx;

           if ( ( idx = options.indexOf( val ) ) > -1 ) {
              options.splice( idx, 1 );
              setTimeout( function() { $inp.prop( 'checked', false ) }, 0);
           } else {
              options.push( val );
              setTimeout( function() { $inp.prop( 'checked', true ) }, 0);
           }

           $( event.target ).blur();
      
           console.log( options );
           return false;
        });
    </script>
</asp:Content>