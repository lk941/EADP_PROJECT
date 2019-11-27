<%@ Page Title="" Language="C#" MasterPageFile="~/menu.Master" AutoEventWireup="true" CodeBehind="productGrid.aspx.cs" Inherits="EADProj.productGrid" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="/css/productGrid.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- /.primary collapse filter -->
    <div class="primary">
        <div class="container">
            <div class="row">
                <div class="col-xs-8 col-lg-10" style="float: none; margin: auto;">
                    <div class="filter-menu mobile">
                        <form>
                            <div class="panel panel-mobile " style="margin-top: 3vh;">
                                <div class="panel-heading" role="tab" id="headingFiltersMobile">
                                    <a class="panel-title accordion-toggle collapsed" role="button" data-toggle="collapse" href="#collapseFiltersMobile" aria-expanded="false" aria-controls="collapseFiltersMobile">Filter
                                    </a>
                                    <div class="panel-body">
                                        <hr />
                                        <button id="submit_btn" class="btn btn-primary" type="submit" style="background-color: #29303b; border: 1px solid; color: #f7f8fa;">Apply Filters</button>
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
                                                    <a class="panel-title accordion-toggle collapsed" role="button" data-toggle="collapse" data-parent="#filter-menu-mobile" href="#collapseOneMobile" aria-expanded="true" aria-controls="collapseOneMobile">Categories
                                                    </a>
                                                    <!-- /.panel-title -->
                                                </div>
                                                <!-- /.panel-heading -->
                                                <div id="collapseOneMobile" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOneMobile">
                                                    <div class="panel-body">
                                                        <div class="row">
                                                            <div class="col-xs-6 col-lg-2">
                                                                <div class="checkbox">
                                                                    <label>
                                                                        <input type="checkbox" name="career_state[]" value="">JavaScript</label>
                                                                </div>
                                                                <div class="checkbox">
                                                                    <label>
                                                                        <input type="checkbox" name="career_state[]" value="">Python</label>
                                                                </div>
                                                                <div class="checkbox">
                                                                    <label>
                                                                        <input type="checkbox" name="career_state[]" value="">C#</label>
                                                                </div>
                                                                <div class="checkbox">
                                                                    <label>
                                                                        <input type="checkbox" name="career_state[]" value="">C++</label>
                                                                </div>
                                                                <div class="checkbox">
                                                                    <label>
                                                                        <input type="checkbox" name="career_state[]" value="">Java</label>
                                                                </div>
                                                                <div class="checkbox">
                                                                    <label>
                                                                        <input type="checkbox" name="career_state[]" value="">Swift</label>
                                                                </div>
                                                                <div class="checkbox">
                                                                    <label>
                                                                        <input type="checkbox" name="career_state[]" value="">Kotlin</label>
                                                                </div>
                                                            </div>
                                                            <div class="col-xs-6 col-lg-2">
                                                                <div class="checkbox">
                                                                    <label>
                                                                        <input type="checkbox" name="career_state[]" value="">MySQL</label>
                                                                </div>
                                                                <div class="checkbox">
                                                                    <label>
                                                                        <input type="checkbox" name="career_state[]" value="">NoSQL</label>
                                                                </div>
                                                                <div class="checkbox">
                                                                    <label>
                                                                        <input type="checkbox" name="career_state[]" value="">ORACLE</label>
                                                                </div>
                                                            </div>
                                                            <div class="col-xs-6 col-lg-2">
                                                                <div class="checkbox">
                                                                    <label>
                                                                        <input type="checkbox" name="career_state[]" value="">HTML</label>
                                                                </div>
                                                                <div class="checkbox">
                                                                    <label>
                                                                        <input type="checkbox" name="career_state[]" value="">CSS</label>
                                                                </div>
                                                                <div class="checkbox">
                                                                    <label>
                                                                        <input type="checkbox" name="career_state[]" value="">XML</label>
                                                                </div>
                                                                <div class="checkbox">
                                                                    <label>
                                                                        <input type="checkbox" name="career_state[]" value="">PHP</label>
                                                                </div>
                                                                <div class="checkbox">
                                                                    <label>
                                                                        <input type="checkbox" name="career_state[]" value="">Bootstrap</label>
                                                                </div>
                                                            </div>
                                                            <div class="col-xs-6 col-lg-2">
                                                                <div class="checkbox">
                                                                    <label>
                                                                        <input type="checkbox" name="career_state[]" value="">Node.js</label>
                                                                </div>
                                                                <div class="checkbox">
                                                                    <label>
                                                                        <input type="checkbox" name="career_state[]" value="">Vue.js</label>
                                                                </div>
                                                                <div class="checkbox">
                                                                    <label>
                                                                        <input type="checkbox" name="career_state[]" value="">Angular</label>
                                                                </div>
                                                                <div class="checkbox">
                                                                    <label>
                                                                        <input type="checkbox" name="career_state[]" value="">React</label>
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
                                                    <a class="panel-title accordion-toggle collapsed" role="button" data-toggle="collapse" data-parent="#filter-menu-mobile" href="#collapseTwoMobile" aria-expanded="false" aria-controls="collapseTwoMobile">Level
                                                    </a>
                                                    <!-- /.panel-title -->
                                                </div>
                                                <!-- /.panel-heading -->
                                                <div id="collapseTwoMobile" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwoMobile">
                                                    <div class="row">
                                                        <div class="col-xs-6 col-lg-3">
                                                            <div class="checkbox">
                                                                <label>
                                                                    <input type="checkbox" name="career_state[]" value="">All Levels</label>
                                                            </div>
                                                        </div>
                                                        <div class="col-xs-6 col-lg-3">
                                                            <div class="checkbox">
                                                                <label>
                                                                    <input type="checkbox" name="career_state[]" value="">Beginners</label>
                                                            </div>
                                                        </div>
                                                        <div class="col-xs-6 col-lg-3">
                                                            <div class="checkbox">
                                                                <label>
                                                                    <input type="checkbox" name="career_state[]" value="">Intermediate</label>
                                                            </div>
                                                        </div>
                                                        <div class="col-xs-6 col-lg-3">
                                                            <div class="checkbox">
                                                                <label>
                                                                    <input type="checkbox" name="career_state[]" value="">Expert</label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!-- /.panel-body -->
                                                </div>
                                                <!-- /.panel-collapse -->
                                            </div>
                                            <!-- /.panel -->

                                            <div class="panel panel-mobile">
                                                <div class="panel-heading" role="tab" id="headingThreeMobile">
                                                    <a class="panel-title accordion-toggle collapsed" role="button" data-toggle="collapse" data-parent="#filter-menu-mobile" href="#collapseThreeMobile" aria-expanded="false" aria-controls="collapseThreeMobile">Price
                                                    </a>
                                                    <!-- /.panel-title -->
                                                </div>
                                                <!-- /.panel-heading -->
                                                <div id="collapseThreeMobile" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThreeMobile">
                                                    <div class="panel-body">
                                                        <div class="row">
                                                            <div class="col-xs-6 col-lg-3">
                                                                <div class="checkbox">
                                                                    <label>
                                                                        <input type="checkbox" name="career_state[]" value="">Free</label>
                                                                </div>
                                                            </div>
                                                            <div class="col-xs-6 col-lg-3">
                                                                <div class="checkbox">
                                                                    <label>
                                                                        <input type="checkbox" name="career_state[]" value="">Paid</label>
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
                                                <div class="panel-heading" role="tab" id="headingFourMobile">
                                                    <a class="panel-title accordion-toggle collapsed" role="button" data-toggle="collapse" data-parent="#filter-menu-mobile" href="#collapseFourMobile" aria-expanded="false" aria-controls="collapseFourMobile">Ratings
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
                                                                <span class="fa fa-star checked"></span>5.0
                                                            </div>
                                                            <div class="col-xs-6 col-lg-3">
                                                                <input type="radio" name="rating" value="4">
                                                                <span class="fa fa-star checked"></span>
                                                                <span class="fa fa-star checked"></span>
                                                                <span class="fa fa-star checked"></span>
                                                                <span class="fa fa-star checked"></span>
                                                                <span class="fa fa-star"></span>4.0 & Up
                                                            </div>
                                                            <div class="col-xs-6 col-lg-3">
                                                                <input type="radio" name="rating" value="3">
                                                                <span class="fa fa-star checked"></span>
                                                                <span class="fa fa-star checked"></span>
                                                                <span class="fa fa-star checked"></span>
                                                                <span class="fa fa-star"></span>
                                                                <span class="fa fa-star"></span>3.0 & Up
                                                            </div>
                                                            <div class="col-xs-6 col-lg-3">
                                                                <input type="radio" name="rating" value="2">
                                                                <span class="fa fa-star checked"></span>
                                                                <span class="fa fa-star checked"></span>
                                                                <span class="fa fa-star "></span>
                                                                <span class="fa fa-star "></span>
                                                                <span class="fa fa-star "></span>2.0 & Up
                                                            </div>
                                                            <div class="col-xs-6 col-lg-3">
                                                                <input type="radio" name="rating" value="1">
                                                                <span class="fa fa-star checked"></span>
                                                                <span class="fa fa-star "></span>
                                                                <span class="fa fa-star "></span>
                                                                <span class="fa fa-star "></span>
                                                                <span class="fa fa-star "></span>1.0 & Up
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
                                                    <a class="panel-title accordion-toggle collapsed" role="button" data-toggle="collapse" data-parent="#filter-menu-mobile" href="#collapseFiveMobile" aria-expanded="false" aria-controls="collapseFiveMobile">Duration
                                                    </a>
                                                    <!-- /.panel-title -->
                                                </div>
                                                <!-- /.panel-heading -->
                                                <div id="collapseFiveMobile" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingFiveMobile">
                                                    <div class="panel-body">
                                                        <div class="row">
                                                            <div class="col-xs-6 col-lg-3">
                                                                <div class="checkbox">
                                                                    <label>
                                                                        <input type="checkbox" name="career_state[]" value="">0-2 Hours</label>
                                                                </div>
                                                            </div>
                                                            <div class="col-xs-6 col-lg-3">
                                                                <div class="checkbox">
                                                                    <label>
                                                                        <input type="checkbox" name="career_state[]" value="">3-6 Hours</label>
                                                                </div>
                                                            </div>
                                                            <div class="col-xs-6 col-lg-3">
                                                                <div class="checkbox">
                                                                    <label>
                                                                        <input type="checkbox" name="career_state[]" value="">7-16 Hours</label>
                                                                </div>
                                                            </div>
                                                            <div class="col-xs-6 col-lg-3">
                                                                <div class="checkbox">
                                                                    <label>
                                                                        <input type="checkbox" name="career_state[]" value="">17+ Hours</label>
                                                                </div>
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
        </div>
        <!-- /.container -->
    </div>
    <!-- /.primary -->
</asp:Content>