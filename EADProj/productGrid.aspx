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
      This is a header.
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
                              <div class="checkbox"><label><input type="checkbox" name="career_state[]" value="">JavaScript</label></div>
                              <div class="checkbox"><label><input type="checkbox" name="career_state[]" value="">Python</label></div>
                              <div class="checkbox"><label><input type="checkbox" name="career_state[]" value="">C#</label></div>
                              <div class="checkbox"><label><input type="checkbox" name="career_state[]" value="">C++</label></div>
                              <div class="checkbox"><label><input type="checkbox" name="career_state[]" value="">Java</label></div>
                              <div class="checkbox"><label><input type="checkbox" name="career_state[]" value="">Swift</label></div>
                              <div class="checkbox"><label><input type="checkbox" name="career_state[]" value="">Kotlin</label></div>
                            </div>
                            <div class="col-xs-6 col-lg-2">
                              <div class="checkbox"><label><input type="checkbox" name="career_state[]" value="">MySQL</label></div>
                              <div class="checkbox"><label><input type="checkbox" name="career_state[]" value="">NoSQL</label></div>
                              <div class="checkbox"><label><input type="checkbox" name="career_state[]" value="">ORACLE</label></div>
                            </div>
                            <div class="col-xs-6 col-lg-2">
                              <div class="checkbox"><label><input type="checkbox" name="career_state[]" value="">HTML</label></div>
                              <div class="checkbox"><label><input type="checkbox" name="career_state[]" value="">CSS</label></div>
                              <div class="checkbox"><label><input type="checkbox" name="career_state[]" value="">XML</label></div>
                              <div class="checkbox"><label><input type="checkbox" name="career_state[]" value="">PHP</label></div>
                              <div class="checkbox"><label><input type="checkbox" name="career_state[]" value="">Bootstrap</label></div>
                            </div>
                            <div class="col-xs-6 col-lg-2">
                              <div class="checkbox"><label><input type="checkbox" name="career_state[]" value="">Node.js</label></div>
                              <div class="checkbox"><label><input type="checkbox" name="career_state[]" value="">Vue.js</label></div>
                              <div class="checkbox"><label><input type="checkbox" name="career_state[]" value="">Angular</label></div>
                              <div class="checkbox"><label><input type="checkbox" name="career_state[]" value="">React</label></div>
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
      <div class="row">
        <div class="col-6 col-sm-6 col-md-4 col-lg-3">
          <a class="course-anchor" href="#">
            <div class="course-card">
              <img class="course-card__image" src="https://www.edureka.co/blog/wp-content/uploads/2016/11/aws-cloud-computing-02.png" />
              <div class="course-card__inner">
                <span class="u-d--block course-card__instructor">Ralph Smith</span>
                <h3 class="course-card__title">Deploying Maraki Cloud Access Points</h3>
                <div class="star-rating">
                  <span class="fas fa-star"></span>
                  <span class="fas fa-star"></span>
                  <span class="fas fa-star"></span>
                  <span class="far fa-star"></span>
                  <span class="far fa-star"></span>
                </div>
                <div class="course-card__meta-wrapper">
                  <span class="u-d--inline-block course-card__difficulty"><i class="fas fa-igloo"></i>Beginner</span>
                  <span class="u-d--inline-block course-card__time"><i class="fas fa-film"></i>2h 20m</span>
                </div>
                <div class="product-price">
                  $200.00
                </div>
              </div>
            </div>
          </a>
        </div>
        <div class="col-6 col-sm-6 col-md-4 col-lg-3">
          <a class="course-anchor" href="#">
            <div class="course-card">
              <img class="course-card__image" src="https://www.edureka.co/blog/wp-content/uploads/2016/11/aws-cloud-computing-02.png" />
              <div class="course-card__inner">
                <span class="u-d--block course-card__instructor">Ralph Smith</span>
                <h3 class="course-card__title">Deploying Maraki Cloud Access Points</h3>
                <div class="star-rating">
                  <span class="fas fa-star"></span>
                  <span class="fas fa-star"></span>
                  <span class="fas fa-star"></span>
                  <span class="far fa-star"></span>
                  <span class="far fa-star"></span>
                </div>
                <div class="course-card__meta-wrapper">
                  <span class="u-d--inline-block course-card__difficulty"><i class="fas fa-igloo"></i>Beginner</span>
                  <span class="u-d--inline-block course-card__time"><i class="fas fa-film"></i>2h 20m</span>
                </div>
                <div class="product-price">
                  $200.00
                </div>
              </div>
            </div>
          </a>
        </div>
        <div class="col-6 col-sm-6 col-md-4 col-lg-3">
          <a class="course-anchor" href="#">
            <div class="course-card">
              <img class="course-card__image" src="https://www.edureka.co/blog/wp-content/uploads/2016/11/aws-cloud-computing-02.png" />
              <div class="course-card__inner">
                <span class="u-d--block course-card__instructor">Ralph Smith</span>
                <h3 class="course-card__title">Deploying Maraki Cloud Access Points</h3>
                <div class="star-rating">
                  <span class="fas fa-star"></span>
                  <span class="fas fa-star"></span>
                  <span class="fas fa-star"></span>
                  <span class="far fa-star"></span>
                  <span class="far fa-star"></span>
                </div>
                <div class="course-card__meta-wrapper">
                  <span class="u-d--inline-block course-card__difficulty"><i class="fas fa-igloo"></i>Beginner</span>
                  <span class="u-d--inline-block course-card__time"><i class="fas fa-film"></i>2h 20m</span>
                </div>
                <div class="product-price">
                  $200.00
                </div>
              </div>
            </div>
          </a>
        </div>
        <div class="col-6 col-sm-6 col-md-4 col-lg-3">
          <a class="course-anchor" href="#">
            <div class="course-card">
              <img class="course-card__image" src="https://www.edureka.co/blog/wp-content/uploads/2016/11/aws-cloud-computing-02.png" />
              <div class="course-card__inner">
                <span class="u-d--block course-card__instructor">Ralph Smith</span>
                <h3 class="course-card__title">Deploying Maraki Cloud Access Points</h3>
                <div class="star-rating">
                  <span class="fas fa-star"></span>
                  <span class="fas fa-star"></span>
                  <span class="fas fa-star"></span>
                  <span class="far fa-star"></span>
                  <span class="far fa-star"></span>
                </div>
                <div class="course-card__meta-wrapper">
                  <span class="u-d--inline-block course-card__difficulty"><i class="fas fa-igloo"></i>Beginner</span>
                  <span class="u-d--inline-block course-card__time"><i class="fas fa-film"></i>2h 20m</span>
                </div>
                <div class="product-price">
                  $200.00
                </div>
              </div>
            </div>
          </a>
        </div>

      </div>
    </div>
  </div>
</div>
<!-- /.primary -->
</asp:Content>