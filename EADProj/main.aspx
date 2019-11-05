<%@ Page Title="" Language="C#" MasterPageFile="~/menu.Master" AutoEventWireup="true" CodeBehind="main.aspx.cs" Inherits="EADProj.main" %>
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
          <input type="text" class="searchTerm" placeholder="What are you looking for?">
          <button type="submit" class="searchButton">
            <i class="fa fa-search"></i>
         </button>
       </div>
    </div>
    </div>
    <div class="overlay"></div>
  </header>

  <!-- Categories -->
  <section style="background-color:#212121 !important;" class="content-section bg-primary text-white">
      <div class="content-section-heading">
        <h2 style="color:#fff; text-align:center;" class="mb-5">Trending Categories</h2>
      </div>
    <div class="container cat-container">
<div class="row">
  <div class="col-4 col-sm-4 col-md-4 col-lg-3">
  <div class="custom-card">
    <div class="small-image-thumbnail">
      <i style="width:100%; height:100%;" class="fas fa-code"></i>
    </div>
    <div class="small-text-container">
      <span class="small-category-title">
        Development
      </span>
      <div class="custom-create-button">
        <span class="create-text">
          GO
        </span>
      </div>
    </div>
  </div>
  </div>
  
  <div class="col-4 col-sm-4 col-md-4 col-lg-3">
  <div class="custom-card">
    <div class="small-image-thumbnail">
      <i class="fas fa-briefcase"></i>
    </div>
    <div class="small-text-container">
      <span class="small-category-title">
        Business
      </span>
      <div class="custom-create-button">
        <span class="create-text">
          GO
        </span>
      </div>
    </div>
  </div>
  </div>
  
  <div class="col-4 col-sm-4 col-md-4 col-lg-3">
  <div class="custom-card">
    <div class="small-image-thumbnail">
      <i class="fas fa-tv"></i>
    </div>
    <div class="small-text-container">
      <span class="small-category-title">
        Technology
      </span>
      <div class="custom-create-button">
        <span class="create-text">
          GO
        </span>
      </div>
    </div>
  </div>
  </div>
  
  <div class="col-4 col-sm-4 col-md-4 col-lg-3">
  <div class="custom-card">
    <div class="small-image-thumbnail">
      <i class="fas fa-palette"></i>
    </div>
    <div class="small-text-container">
      <span class="small-category-title">
        Art & Design
      </span>
      <div class="custom-create-button">
        <span class="create-text">
          GO
        </span>
      </div>
    </div>
  </div>
  </div>
  
  <div class="col-4 col-sm-4 col-md-4 col-lg-3">
  <div class="custom-card">
    <div class="small-image-thumbnail">
      <i class="fas fa-comment-dollar"></i>
    </div>
    <div class="small-text-container">
      <span class="small-category-title">
        Marketing
      </span>
      <div class="custom-create-button">
        <span class="create-text">
          GO
        </span>
      </div>
    </div>
  </div>
  </div>
  
  <div class="col-4 col-sm-4 col-md-4 col-lg-3">
  <div class="custom-card">
    <div class="small-image-thumbnail">
      <i class="fas fa-user-friends"></i>
    </div>
    <div class="small-text-container">
      <span class="small-category-title">
        Personal Dev.
      </span>
      <div class="custom-create-button">
        <span class="create-text">
          GO
        </span>
      </div>
    </div>
  </div>
  </div>
  
  <div class="col-4 col-sm-4 col-md-4 col-lg-3">
  <div class="custom-card">
    <div class="small-image-thumbnail">
      <i class="fas fa-camera"></i>
    </div>
    <div class="small-text-container">
      <span class="small-category-title">
        Photography
      </span>
      <div class="custom-create-button">
        <span class="create-text">
          GO
        </span>
      </div>
    </div>
  </div>
  </div>
  
  <div class="col-4 col-sm-4 col-md-4 col-lg-3">
  <div class="custom-card">
    <div class="small-image-thumbnail">
      <i class="fas fa-music"></i>
    </div>
    <div class="small-text-container">
      <span class="small-category-title">
        Music
      </span>
      <div class="custom-create-button">
        <span class="create-text">
          GO
        </span>
      </div>
    </div>
  </div>
  </div>
</div>
</div>
  </section>

  <!-- Services -->
  <section class="content-section bg-primary text-white text-center" id="services">
      <div class="content-section-heading">
        <h3 class="text-secondary mb-0">Courses</h3>
        <h2 style="color:#212121;" class="mb-5">Recommended for you</h2>
      </div>
      <div class="course-wrapper">
  <div class="container">
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
  </section>

  <!-- Callout -->
  <section class="callout">
    <div class="container text-center">
      <h2 class="mx-auto mb-5" style="margin-bottom:0 !important;">Get the
        <em>perfect</em>
        courses for you</h2>
        <p>Answer some questions related to what you want to learn!</p>
      <a class="btn btn-primary btn-xl" style="background-color:#ffa31a !important; border-color: #ffa31a !important; color: #212121 !important;" href="/courseRecc.aspx">Start here!</a>
    </div>
  </section>

  <!-- Portfolio -->
  <section class="content-section" id="portfolio">
    <div class="container">
      <div class="content-section-heading text-center">
        <h3 class="text-secondary mb-0">Portfolio</h3>
        <h2 class="mb-5">Recent Projects</h2>
      </div>
      <div class="row no-gutters">
        <div class="col-lg-6">
          <a class="portfolio-item" href="#">
            <span class="caption">
              <span class="caption-content">
                <h2>Stationary</h2>
                <p class="mb-0">A yellow pencil with envelopes on a clean, blue backdrop!</p>
              </span>
            </span>
            <img class="img-fluid" src="img/portfolio-1.jpg" alt="">
          </a>
        </div>
        <div class="col-lg-6">
          <a class="portfolio-item" href="#">
            <span class="caption">
              <span class="caption-content">
                <h2>Ice Cream</h2>
                <p class="mb-0">A dark blue background with a colored pencil, a clip, and a tiny ice cream cone!</p>
              </span>
            </span>
            <img class="img-fluid" src="img/portfolio-2.jpg" alt="">
          </a>
        </div>
        <div class="col-lg-6">
          <a class="portfolio-item" href="#">
            <span class="caption">
              <span class="caption-content">
                <h2>Strawberries</h2>
                <p class="mb-0">Strawberries are such a tasty snack, especially with a little sugar on top!</p>
              </span>
            </span>
            <img class="img-fluid" src="img/portfolio-3.jpg" alt="">
          </a>
        </div>
        <div class="col-lg-6">
          <a class="portfolio-item" href="#">
            <span class="caption">
              <span class="caption-content">
                <h2>Workspace</h2>
                <p class="mb-0">A yellow workspace with some scissors, pencils, and other objects.</p>
              </span>
            </span>
            <img class="img-fluid" src="img/portfolio-4.jpg" alt="">
          </a>
        </div>
      </div>
    </div>
  </section>
  <!-- Footer -->
  <footer class="footer text-center">
    <div class="container">
      <ul class="list-inline mb-5">
        <li class="list-inline-item">
          <a class="social-link rounded-circle text-white mr-3" href="#">
            <i class="icon-social-facebook"></i>
          </a>
        </li>
        <li class="list-inline-item">
          <a class="social-link rounded-circle text-white mr-3" href="#">
            <i class="icon-social-twitter"></i>
          </a>
        </li>
        <li class="list-inline-item">
          <a class="social-link rounded-circle text-white" href="#">
            <i class="icon-social-github"></i>
          </a>
        </li>
      </ul>
      <p class="text-muted small mb-0">Copyright &copy; Your Website 2019</p>
    </div>
  </footer>

</asp:Content>

