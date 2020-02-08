<%@ Page Title="" Language="C#" MasterPageFile="~/menu.Master" AutoEventWireup="true" CodeBehind="courseQueriedRecc.aspx.cs" Inherits="EADProj.courseQueriedRecc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="css/courseReccomend.css" rel="stylesheet">
    <link href="css/queryRecc.css" rel="stylesheet">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="msform">
        <!-- fieldsets -->
        <fieldset>
            <h2 class="fs-title">Recommendations</h2>
            <h3 class="fs-subtitle">here is what we think you'd like.</h3>
            <section style="background-color: white !important;" class="content-section bg-primary text-white">
                <div class="row">
                    <div class="course-wrapper">
                        <div class="container">
                            <div class="row">
                              <% foreach(var x in lesson) { %>
                                  <div class="col-6 col-sm-6 col-md-4 col-lg-3">
                                      <a class="course-anchor" href="#">
                                        <div class="course-card">
                                          <img class="course-card__image" src="<%= x.image_url %>"" />
                                          <div class="course-card__inner">
                                            <span class="u-d--block course-card__instructor">Ralph Smith</span>
                                            <h3 class="course-card__title"><%= x.title %></h3>

                                            <div class="star-rating">
                                                <!--
                                              <span class="fas fa-star"></span>
                                              <span class="fas fa-star"></span>
                                              <span class="fas fa-star-half"></span>
                                              <span class="far fa-star"></span>
                                              <span class="far fa-star"></span>
                                                -->
                                                <span class="stars" data-rating="<%=x.rating_1.ToString() %>"" data-num-stars="5" ></span>

                                            </div>
                                            <div class="course-card__meta-wrapper">
                                              <span class="u-d--inline-block course-card__difficulty"><i class="fas fa-igloo"></i><%= x.difficulty %></span>
                                              <span class="u-d--inline-block course-card__time"><%= x.duration %></span>
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
            </section>
        </fieldset>
        </form>
    <script src="https://code.jquery.com/jquery-3.2.1.js" integrity="sha256-DZAnKJ/6XZ9si04Hgrsxu/8s717jcIzLy3oi35EouyE=" crossorigin="anonymous"></script>

<script>
    $( document ).ready(function() {
        $(".footer__webservice").hide();
    });
</script>
</asp:Content>
