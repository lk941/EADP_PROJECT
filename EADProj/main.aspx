﻿<%@ Page Title="" Language="C#" MasterPageFile="~/menu.Master" AutoEventWireup="true" CodeBehind="main.aspx.cs" Inherits="EADProj.main" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/mainPage.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">
</asp:Content>

<asp:Content ID="Content2" runat="server" contentplaceholderid="ContentPlaceHolder1">
  <!-- Header -->
  <header class="masthead d-flex">
    <div class="container my-auto" >
      <h1 class="mb-1">Tuition. Anytime. Anywhere. Anywhen.</h1>
      <h3 class="mb-5">
        <em>Whatever you want to learn. Just search it here. Likey™ has got you covered.</em>
      </h3>
      <div class="wrap">
       <div class="search">
          <input type="text" id="searchInput" class="searchTerm" placeholder="What are you looking for?">
          <button type="submit" class="searchButton" onclick="searchQuery()">
            <i class="fa fa-search"></i>
         </button>
       </div>
    </div>
    </div>
    <div class="overlay"></div>
  </header>


    <!-- Categories -->
    <section style="background-color: #212121 !important;" class="content-section bg-primary text-white">
        <div class="content-section-heading">
            <h2 style="color: #fff; text-align: center;" class="mb-5">Trending Categories</h2>
        </div>
        <div class="container cat-container">
            <div class="row">
                <div class="col-4 col-sm-4 col-md-4 col-lg-3">
                    <a href="productGrid.aspx?cate=Development">
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
                    </a>
                </div>

                <div class="col-4 col-sm-4 col-md-4 col-lg-3">
                    <a href="/productGrid.aspx?cate=Business">

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

                    </a>
                </div>

                <div class="col-4 col-sm-4 col-md-4 col-lg-3">
                    <a href="/productGrid.aspx?cate=Technology">

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
                    </a>
                </div>

                <div class="col-4 col-sm-4 col-md-4 col-lg-3">
                    <a href="/productGrid.aspx?cate=Art%AND%20Design">
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
                    </a>
                </div>

                <div class="col-4 col-sm-4 col-md-4 col-lg-3">
                    <a href="/productGrid.aspx?cate=Marketing">

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
                        </a>
                </div>

                <div class="col-4 col-sm-4 col-md-4 col-lg-3">
                    <a href="/productGrid.aspx?cate=Health%AND%20Fitness">

                        <div class="custom-card">
                            <div class="small-image-thumbnail">
                                <i class="fas fa-user-friends"></i>
                            </div>
                            <div class="small-text-container">
                                <span class="small-category-title">Health & Fitness
                                </span>
                                <div class="custom-create-button">
                                    <span class="create-text">GO
                                    </span>
                                </div>
                            </div>
                        </div>
                        </a>
                </div>

                <div class="col-4 col-sm-4 col-md-4 col-lg-3">
                    <a href="/productGrid.aspx?cate=Photography">

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
                        </a>
                </div>

                <div class="col-4 col-sm-4 col-md-4 col-lg-3">
                    <a href="/productGrid.aspx?cate=Music">

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
                        </a>
                </div>
            </div>
        </div>
    </section>

    <!-- Front page lessons -->
    <section class="content-section bg-primary text-white text-center" id="services">
        <div class="content-section-heading">
            <h3 class="text-secondary mb-0">Courses</h3>
            <h2 style="color: #212121;" class="mb-5">Check these out</h2>
        </div>
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
    </section>

    <!-- Callout -->
    <section class="callout">
        <div class="container text-center">
            <h2 class="mx-auto mb-5" style="margin-bottom: 0 !important;">Get the
        <em>perfect</em>
                courses for you</h2>
            <p>Answer some questions related to what you want to learn!</p>
            <button class="btn btn-primary btn-xl" style="background-color: #ffa31a !important; border-color: #ffa31a !important; color: #212121 !important;" onclick="reccFn()">Start here!</button>
        </div>
    </section>
    <script src="https://code.jquery.com/jquery-3.2.1.js" integrity="sha256-DZAnKJ/6XZ9si04Hgrsxu/8s717jcIzLy3oi35EouyE=" crossorigin="anonymous"></script>

    <script>
    function searchQuery() {
        var search = document.getElementById("searchInput").value;
        var obj = { search: search };
        var param = JSON.stringify(obj);

         $.ajax({  
             type: "POST",  
             url: "main.aspx/queryFind",  
             contentType: "application/json; charset=utf-8",  
             dataType: "json",
             data: param,
             success: function (response) {  
                 var ret = response.d; 
                 
                 if (ret == "empty") {
                     alert("Type Something"); 
                 } else if (ret == "error") {
                     alert("Something went wrong, please try again later"); 
                 } else {
                     window.location = "http://localhost:5000/productGrid.aspx?search=" + search;
                 }
                 
             },  
             error: function (response, textStatus, error) {  
                 alert("The error is: " + response.d + " " + error);  
             }  
         });  
        }

        function reccFn() {
            var obj = { };
            var param = JSON.stringify(obj);

             $.ajax({  
                 type: "POST",  
                 url: "main.aspx/reccFn",  
                 contentType: "application/json; charset=utf-8",  
                 dataType: "json",
                 data: param,
                 success: function (response) {  
                     var ret = response.d; 
                 
                    if (ret == "login") {
                        window.location = "http://localhost:5000/login.aspx?login=False";
                    } else {
                        window.location = "http://localhost:5000/courseRecc.aspx";
                    }
                 
                 },  
                 error: function (response, textStatus, error) {  
                     alert("The error is: " + response.d + " " + error);  
                 }  
             });  
        }

        $.fn.stars = function() {
          return $(this).each(function() {
            const rating = $(this).data("rating");
            const numStars = $(this).data("numStars");
            const fullStar = '<i class="fas fa-star checked"></i>'.repeat(Math.floor(rating));
            const halfStar =
              rating % 1 !== 0 ? '<i class="fas fa-star-half-alt"></i>' : "";
            const noStar = '<i class="far fa-star"></i>'.repeat(
              Math.floor(numStars - rating)
            );
            $(this).html(`${fullStar}${halfStar}${noStar}`);
          });
        };

        $(".stars").stars();

    </script>
</asp:Content>

