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
            <div class="panel panel-mobile " style="margin-top: 3vh;">
              <div class="panel-heading" role="tab" id="headingFiltersMobile">
                <a class="panel-title accordion-toggle collapsed" role="button" data-toggle="collapse" href="#collapseFiltersMobile" aria-expanded="false" aria-controls="collapseFiltersMobile">
                  Filter
                </a>
                <div class="panel-body">
                  <hr />
                  <button id="submit_btn" onclick="filterQuery()" class="btn btn-primary" type="submit" style="color: #f7f8fa; background-color:#29303b; border: 1px solid ;">Apply Filters</button>
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
                                            ><input type="checkbox" name="devTopicsInput" value="JavaScript"/>&nbsp;JavaScript</a>
                                        </li>
                                        <li>
                                        <a href="#" class="small" data-value="option2" tabindex="-1"
                                            ><input type="checkbox" name="devTopicsInput" value="Python"/>&nbsp;Python</a>
                                        </li>
                                        <li>
                                        <a href="#" class="small" data-value="option3" tabindex="-1"
                                            ><input type="checkbox" name="devTopicsInput" value="C#"/>&nbsp;C#</a>
                                        </li>
                                        <li>
                                        <a href="#" class="small" data-value="option4" tabindex="-1"
                                            ><input type="checkbox" name="devTopicsInput" value="C++" />&nbsp;C++</a>
                                        </li>
                                        <li>
                                        <a href="#" class="small" data-value="option5" tabindex="-1"
                                            ><input type="checkbox" name="devTopicsInput" value="Java"/>&nbsp;Java</a>
                                        </li>
                                        <li>
                                        <a href="#" class="small" data-value="option6" tabindex="-1"
                                            ><input type="checkbox" name="devTopicsInput" value="Swift"/>&nbsp;Swift</a>
                                        </li>
                                        <li>
                                        <a href="#" class="small" data-value="option7" tabindex="-1"
                                            ><input type="checkbox" name="devTopicsInput" value="Kotlin"/>&nbsp;Kotlin</a>
                                        </li>
                                        <li>
                                        <a href="#" class="small" data-value="option8" tabindex="-1"
                                            ><input type="checkbox" name="devTopicsInput" value="MySQL"/>&nbsp;MySQL</a>
                                        </li>
                                        <li>
                                        <a href="#" class="small" data-value="option9" tabindex="-1"
                                            ><input type="checkbox" name="devTopicsInput" value="NoSQL"/>&nbsp;NoSQL</a>
                                        </li>
                                        <li>
                                        <a href="#" class="small" data-value="option10" tabindex="-1"
                                            ><input type="checkbox" name="devTopicsInput" value="ORACLE" />&nbsp;ORACLE</a>
                                        </li>
                                        <li>
                                        <a href="#" class="small" data-value="option11" tabindex="-1"
                                            ><input type="checkbox" name="devTopicsInput" value="HTML" />&nbsp;HTML</a>
                                        </li>
                                        <li>
                                        <a href="#" class="small" data-value="option12" tabindex="-1"
                                            ><input type="checkbox" name="devTopicsInput" value="CSS"/>&nbsp;CSS</a>
                                        </li>
                                        <li>
                                        <a href="#" class="small" data-value="option13" tabindex="-1"
                                            ><input type="checkbox" name="devTopicsInput" value="XML"/>&nbsp;XML</a>
                                        </li>
                                        <li>
                                        <a href="#" class="small" data-value="option14" tabindex="-1"
                                            ><input type="checkbox" name="devTopicsInput" value="PHP"/>&nbsp;PHP</a>
                                        </li>
                                        <li>
                                        <a href="#" class="small" data-value="option15" tabindex="-1"
                                            ><input type="checkbox" name="devTopicsInput" value="Bootstrap"/>&nbsp;Bootstrap</a>
                                        </li>
                                        <li>
                                        <a href="#" class="small" data-value="option16" tabindex="-1"
                                            ><input type="checkbox" name="devTopicsInput" value="Node.js" />&nbsp;Node.js</a>
                                        </li>
                                        <li>
                                        <a href="#" class="small" data-value="option17" tabindex="-1"
                                            ><input type="checkbox" name="devTopicsInput" value="Vue.js"/>&nbsp;Vue.js</a>
                                        </li>
                                        <li>
                                        <a href="#" class="small" data-value="option18" tabindex="-1"
                                            ><input type="checkbox" name="devTopicsInput" value="Angular"/>&nbsp;Angular</a>
                                        </li>
                                        <li>
                                        <a href="#" class="small" data-value="option19" tabindex="-1"
                                            ><input type="checkbox" name="devTopicsInput" value="React"/>&nbsp;React</a>
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
                                            ><input type="checkbox" name="businessTopicsInput" value="JavaScript"/>&nbsp;Accounting</a>
                                        </li>
                                        <li>
                                        <a href="#" class="small" data-value="option1" tabindex="-1"
                                            ><input type="checkbox" name="businessTopicsInput" value="Financing"/>&nbsp;Financing</a>
                                        </li>
                                        <li>
                                        <a href="#" class="small" data-value="option3" tabindex="-1"
                                            ><input type="checkbox" name="businessTopicsInput" value="Forex"/>&nbsp;Forex</a>
                                        </li>
                                        <li>
                                        <a href="#" class="small" data-value="option4" tabindex="-1"
                                            ><input type="checkbox" name="businessTopicsInput" value="Investing" />&nbsp;Investing</a>
                                        </li>
                                        <li>
                                        <a href="#" class="small" data-value="option5" tabindex="-1"
                                            ><input type="checkbox" name="businessTopicsInput" value="Excel"/>&nbsp;Excel</a>
                                        </li>
                                        <li>
                                        <a href="#" class="small" data-value="option6" tabindex="-1"
                                            ><input type="checkbox" name="businessTopicsInput" value="Stock Trading"/>&nbsp;Stock Trading</a>
                                        </li>
                                        <li>
                                        <a href="#" class="small" data-value="option7" tabindex="-1"
                                            ><input type="checkbox" name="businessTopicsInput" value="Technical Analysis"/>&nbsp;Technical Analysis</a>
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
                                            ><input type="checkbox" name="itTopicsInput" value="AWS"/>&nbsp;AWS Certification</a>
                                        </li>
                                        <li>
                                        <a href="#" class="small" data-value="option1" tabindex="-1"
                                            ><input type="checkbox" name="itTopicsInput" value="Cisco"/>&nbsp;Cisco CCNA</a>
                                        </li>
                                        <li>
                                        <a href="#" class="small" data-value="option3" tabindex="-1"
                                            ><input type="checkbox" name="itTopicsInput" value="Cyber Security"/>&nbsp;Cyber Security</a>
                                        </li>
                                        <li>
                                        <a href="#" class="small" data-value="option4" tabindex="-1"
                                            ><input type="checkbox" name="itTopicsInput" value="Ethical Hacking" />&nbsp;Ethical Hacking</a>
                                        </li>
                                        <li>
                                        <a href="#" class="small" data-value="option5" tabindex="-1"
                                            ><input type="checkbox" name="itTopicsInput" value="Linux"/>&nbsp;Linux</a>
                                        </li>
                                        <li>
                                        <a href="#" class="small" data-value="option6" tabindex="-1"
                                            ><input type="checkbox" name="itTopicsInput" value="AI"/>&nbsp;AI/ML</a>
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
                                            ><input type="checkbox" name="artTopicsInput" value="3D Modeling"/>&nbsp;3D Modeling</a>
                                        </li>
                                        <li>
                                        <a href="#" class="small" data-value="option1" tabindex="-1"
                                            ><input type="checkbox" name="artTopicsInput" value="After Effects"/>&nbsp;After Effects</a>
                                        </li>
                                        <li>
                                        <a href="#" class="small" data-value="option3" tabindex="-1"
                                            ><input type="checkbox" name="artTopicsInput" value="Adobe Illustrator"/>&nbsp;Adobe Illustrator</a>
                                        </li>
                                        <li>
                                        <a href="#" class="small" data-value="option4" tabindex="-1"
                                            ><input type="checkbox" name="artTopicsInput" value="Photoshop" />&nbsp;Photoshop</a>
                                        </li>
                                        <li>
                                        <a href="#" class="small" data-value="option5" tabindex="-1"
                                            ><input type="checkbox" name="artTopicsInput" value="Blender"/>&nbsp;Blender</a>
                                        </li>
                                        <li>
                                        <a href="#" class="small" data-value="option6" tabindex="-1"
                                            ><input type="checkbox" name="artTopicsInput" value="Character Animation"/>&nbsp;Character Animation</a>
                                        </li>
                                        <li>
                                        <a href="#" class="small" data-value="option6" tabindex="-1"
                                            ><input type="checkbox" name="artTopicsInput" value="User Experience Design"/>&nbsp;User Experience Design</a>
                                        </li>
                                        <li>
                                        <a href="#" class="small" data-value="option6" tabindex="-1"
                                            ><input type="checkbox" name="artTopicsInput" value="Drawing"/>&nbsp;Drawing</a>
                                        </li>
                                        <li>
                                        <a href="#" class="small" data-value="option6" tabindex="-1"
                                            ><input type="checkbox" name="artTopicsInput" value="Graphic Design"/>&nbsp;Graphic Design</a>
                                        </li>
                                        <li>
                                        <a href="#" class="small" data-value="option6" tabindex="-1"
                                            ><input type="checkbox" name="artTopicsInput" value="Web Design"/>&nbsp;Web Design</a>
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
                                        <span class="glyphicon glyphicon-cog"> <span style="font-family:Arial;">Health & Fitness</span></span>
                                        <span class="caret"></span>
                                    </button>
                                    <ul class="dropdown-menu" id="healthTopics">
                                        <li>
                                        <a href="#" class="small" data-value="option1" tabindex="-1"
                                            ><input type="checkbox" name="healthTopicsInput" value="Aromatheraphy"/>&nbsp;Aromatheraphy</a>
                                        </li>
                                        <li>
                                        <a href="#" class="small" data-value="option1" tabindex="-1"
                                            ><input type="checkbox" name="healthTopicsInput" value="Art Therapy"/>&nbsp;Art Therapy</a>
                                        </li>
                                        <li>
                                        <a href="#" class="small" data-value="option3" tabindex="-1"
                                            ><input type="checkbox" name="healthTopicsInput" value="CBT"/>&nbsp;CBT</a>
                                        </li>
                                        <li>
                                        <a href="#" class="small" data-value="option4" tabindex="-1"
                                            ><input type="checkbox" name="healthTopicsInput" value="Fitness" />&nbsp;Fitness</a>
                                        </li>
                                        <li>
                                        <a href="#" class="small" data-value="option5" tabindex="-1"
                                            ><input type="checkbox" name="healthTopicsInput" value="Herbalism"/>&nbsp;Herbalism</a>
                                        </li>
                                        <li>
                                        <a href="#" class="small" data-value="option6" tabindex="-1"
                                            ><input type="checkbox" name="healthTopicsInput" value="Massage"/>&nbsp;Massage</a>
                                        </li>
                                        <li>
                                        <a href="#" class="small" data-value="option6" tabindex="-1"
                                            ><input type="checkbox" name="healthTopicsInput" value="Meditation"/>&nbsp;Meditation</a>
                                        </li>
                                        <li>
                                        <a href="#" class="small" data-value="option6" tabindex="-1"
                                            ><input type="checkbox" name="healthTopicsInput" value="Nutrition"/>&nbsp;Nutrition</a>
                                        </li>
                                        <li>
                                        <a href="#" class="small" data-value="option6" tabindex="-1"
                                            ><input type="checkbox" name="healthTopicsInput" value="Yoga"/>&nbsp;Yoga</a>
                                        </li>
                                        <li>
                                        <a href="#" class="small" data-value="option6" tabindex="-1"
                                            ><input type="checkbox" name="healthTopicsInput" value="Health Coaching"/>&nbsp;Health Coaching</a>
                                        </li>
                                        <li>
                                        <a href="#" class="small" data-value="option6" tabindex="-1"
                                            ><input type="checkbox" name="healthTopicsInput" value="Personal Improvement"/>&nbsp;Personal Improvement</a>
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
                                        <span class="glyphicon glyphicon-cog"> <span style="font-family:Arial;">Music</span></span>
                                        <span class="caret"></span>
                                    </button>
                                    <ul class="dropdown-menu" id="musicTopics">
                                        <li>
                                        <a href="#" class="small" data-value="option1" tabindex="-1"
                                            ><input type="checkbox" name="musicTopicsInput" value="Guitar"/>&nbsp;Guitar</a>
                                        </li>
                                        <li>
                                        <a href="#" class="small" data-value="option1" tabindex="-1"
                                            ><input type="checkbox" name="musicTopicsInput" value="Keyboard Instrument"/>&nbsp;Keyboard Instrument</a>
                                        </li>
                                        <li>
                                        <a href="#" class="small" data-value="option3" tabindex="-1"
                                            ><input type="checkbox" name="musicTopicsInput" value="Music Composition"/>&nbsp;Music Composition</a>
                                        </li>
                                        <li>
                                        <a href="#" class="small" data-value="option4" tabindex="-1"
                                            ><input type="checkbox" name="musicTopicsInput" value="Music Production" />&nbsp;Music Production</a>
                                        </li>
                                        <li>
                                        <a href="#" class="small" data-value="option5" tabindex="-1"
                                            ><input type="checkbox" name="musicTopicsInput" value="Music Theory"/>&nbsp;Music Theory</a>
                                        </li>
                                        <li>
                                        <a href="#" class="small" data-value="option6" tabindex="-1"
                                            ><input type="checkbox" name="musicTopicsInput" value="Piano"/>&nbsp;Piano</a>
                                        </li>
                                        <li>
                                        <a href="#" class="small" data-value="option6" tabindex="-1"
                                            ><input type="checkbox" name="musicTopicsInput" value="Singing"/>&nbsp;Singing</a>
                                        </li>
                                        <li>
                                        <a href="#" class="small" data-value="option6" tabindex="-1"
                                            ><input type="checkbox" name="musicTopicsInput" value="Songwriting"/>&nbsp;Songwriting</a>
                                        </li>
                                        <li>
                                        <a href="#" class="small" data-value="option6" tabindex="-1"
                                            ><input type="checkbox" name="musicTopicsInput" value="Ableton Live"/>&nbsp;Ableton Live</a>
                                        </li>
                                        <li>
                                        <a href="#" class="small" data-value="option6" tabindex="-1"
                                            ><input type="checkbox" name="musicTopicsInput" value="Logic Pro X"/>&nbsp;Logic Pro X</a>
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
                                        <span class="glyphicon glyphicon-cog"> <span style="font-family:Arial;">Marketing</span></span>
                                        <span class="caret"></span>
                                    </button>
                                    <ul class="dropdown-menu" id="marketingTopics">
                                        <li>
                                        <a href="#" class="small" data-value="option1" tabindex="-1"
                                            ><input type="checkbox" name="marketingInput" value="Copywriting"/>&nbsp;Copywriting</a>
                                        </li>
                                        <li>
                                        <a href="#" class="small" data-value="option1" tabindex="-1"
                                            ><input type="checkbox" name="marketingInput" value="Digital Marketing"/>&nbsp;Digital Marketing</a>
                                        </li>
                                        <li>
                                        <a href="#" class="small" data-value="option3" tabindex="-1"
                                            ><input type="checkbox" name="marketingInput" value="Facebook Marketing"/>&nbsp;Facebook Marketing</a>
                                        </li>
                                        <li>
                                        <a href="#" class="small" data-value="option4" tabindex="-1"
                                            ><input type="checkbox" name="marketingInput" value="Google Analytics" />&nbsp;Google Analytics</a>
                                        </li>
                                        <li>
                                        <a href="#" class="small" data-value="option5" tabindex="-1"
                                            ><input type="checkbox" name="marketingInput" value="Instagram Marketing"/>&nbsp;Instagram Marketing</a>
                                        </li>
                                        <li>
                                        <a href="#" class="small" data-value="option6" tabindex="-1"
                                            ><input type="checkbox" name="marketingInput" value="Marketing Strategy"/>&nbsp;Marketing Strategy</a>
                                        </li>
                                        <li>
                                        <a href="#" class="small" data-value="option6" tabindex="-1"
                                            ><input type="checkbox" name="marketingInput" value="SEO"/>&nbsp;SEO</a>
                                        </li>
                                        <li>
                                        <a href="#" class="small" data-value="option6" tabindex="-1"
                                            ><input type="checkbox" name="marketingInput" value="Social Media Marketing"/>&nbsp;Social Media Marketing</a>
                                        </li>
                                        <li>
                                        <a href="#" class="small" data-value="option6" tabindex="-1"
                                            ><input type="checkbox" name="marketingInput" value="Google Ads (AdWords) Certification"/>&nbsp;Google Ads (AdWords) Certification</a>
                                        </li>
                                        <li>
                                        <a href="#" class="small" data-value="option6" tabindex="-1"
                                            ><input type="checkbox" name="marketingInput" value="Google Ads (Adwords)"/>&nbsp;Google Ads (Adwords)</a>
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
                                        <span class="glyphicon glyphicon-cog"> <span style="font-family:Arial;">Personal Dev.</span></span>
                                        <span class="caret"></span>
                                    </button>
                                    <ul class="dropdown-menu" id="personalDevTopics">
                                        <li>
                                        <a href="#" class="small" data-value="option1" tabindex="-1"
                                            ><input type="checkbox" name="personalDevTopicsInputs" value="Confidence"/>&nbsp;Confidence</a>
                                        </li>
                                        <li>
                                        <a href="#" class="small" data-value="option1" tabindex="-1"
                                            ><input type="checkbox" name="personalDevTopicsInputs" value="Energy Healing"/>&nbsp;Energy Healing</a>
                                        </li>
                                        <li>
                                        <a href="#" class="small" data-value="option3" tabindex="-1"
                                            ><input type="checkbox" name="personalDevTopicsInputs" value="Learning Strategies"/>&nbsp;Learning Strategies</a>
                                        </li>
                                        <li>
                                        <a href="#" class="small" data-value="option4" tabindex="-1"
                                            ><input type="checkbox" name="personalDevTopicsInputs" value="Memory" />&nbsp;Memory</a>
                                        </li>
                                        <li>
                                        <a href="#" class="small" data-value="option5" tabindex="-1"
                                            ><input type="checkbox" name="personalDevTopicsInputs" value="Mindfulness"/>&nbsp;Mindfulness</a>
                                        </li>
                                        <li>
                                        <a href="#" class="small" data-value="option6" tabindex="-1"
                                            ><input type="checkbox" name="personalDevTopicsInputs" value="Neuro-Linguistic Programming"/>&nbsp;Neuro-Linguistic Programming</a>
                                        </li>
                                        <li>
                                        <a href="#" class="small" data-value="option6" tabindex="-1"
                                            ><input type="checkbox" name="personalDevTopicsInputs" value="Neuroscience"/>&nbsp;Neuroscience</a>
                                        </li>
                                        <li>
                                        <a href="#" class="small" data-value="option6" tabindex="-1"
                                            ><input type="checkbox" name="personalDevTopicsInputs" value="Reiki"/>&nbsp;Reiki</a>
                                        </li>
                                        <li>
                                        <a href="#" class="small" data-value="option6" tabindex="-1"
                                            ><input type="checkbox" name="personalDevTopicsInputs" value="Speed Reading"/>&nbsp;Speed Reading</a>
                                        </li>
                                        <li>
                                        <a href="#" class="small" data-value="option6" tabindex="-1"
                                            ><input type="checkbox" name="personalDevTopicsInputs" value="Life Coaching"/>&nbsp;Life Coaching</a>
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
                            <div class="checkbox"><label><input type="checkbox" name="levelInput" id="easyLevel" value="Easy">Easy</label></div>
                          </div>
                          <div class="col-xs-6 col-lg-3">
                            <div class="checkbox"><label><input type="checkbox" name="levelInput" id="intermediateLevel" value="Intermediate">Intermediate</label></div>
                          </div>
                          <div class="col-xs-6 col-lg-3">
                            <div class="checkbox"><label><input type="checkbox" name="levelInput" id="expertLevel" value="Expert">Expert</label></div>
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
                              <div class="checkbox"><label><input type="checkbox" id="priceFree" name="priceLevel" value="Free">Free</label></div>
                            </div>
                            <div class="col-xs-6 col-lg-3">
                              <div class="checkbox"><label><input type="checkbox" id="pricePaid" name="priceLevel" value="Paid">Paid</label></div>
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
                              <input type="radio" name="rating" id="ratingFive" value="5">
                              <span class="fa fa-star checked"></span>
                              <span class="fa fa-star checked"></span>
                              <span class="fa fa-star checked"></span>
                              <span class="fa fa-star checked"></span>
                              <span class="fa fa-star checked"></span> 5.0
                            </div>
                            <div class="col-xs-6 col-lg-3">
                              <input type="radio" name="rating" id="ratingFour" value="4">
                              <span class="fa fa-star checked"></span>
                              <span class="fa fa-star checked"></span>
                              <span class="fa fa-star checked"></span>
                              <span class="fa fa-star checked"></span>
                              <span class="fa fa-star"></span> 4.0 & Up
                            </div>
                            <div class="col-xs-6 col-lg-3">
                              <input type="radio" name="rating" id="ratingThree" value="3">
                              <span class="fa fa-star checked"></span>
                              <span class="fa fa-star checked"></span>
                              <span class="fa fa-star checked"></span>
                              <span class="fa fa-star"></span>
                              <span class="fa fa-star"></span> 3.0 & Up
                            </div>
                            <div class="col-xs-6 col-lg-3">
                              <input type="radio" name="rating" id="ratingTwo" value="2">
                              <span class="fa fa-star checked"></span>
                              <span class="fa fa-star checked"></span>
                              <span class="fa fa-star "></span>
                              <span class="fa fa-star "></span>
                              <span class="fa fa-star "></span> 2.0 & Up
                            </div>
                            <div class="col-xs-6 col-lg-3">
                              <input type="radio" name="rating" id="ratingOne" value="1">
                              <span class="fa fa-star checked"></span>
                              <span class="fa fa-star "></span>
                              <span class="fa fa-star "></span>
                              <span class="fa fa-star "></span>
                              <span class="fa fa-star "></span> 1.0 & Up
                            </div>
                              <div class="col-xs-6 col-lg-3">
                              <input type="radio" name="rating" id="ratingZero" value="0">
                              <span class="fa fa-star "></span>
                              <span class="fa fa-star "></span>
                              <span class="fa fa-star "></span>
                              <span class="fa fa-star "></span>
                              <span class="fa fa-star "></span> 0.0 & Up
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
        </div>
        <!-- /.filter-menu -->
      </div>
    </div>

    <!-- Featured Users -->
    <div class="row" style="border-top: 1px solid #eee;">
    <% if (user.Count > 0)
        { %>
      <h3 style="display:block; width: 100%; padding-top: 3vh; padding-bottom: 3vh; text-align: center;">Featured Tutors</h3>
    <% }%>

      <div class="cards">
          <!--
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
            <img src="https://cdn140.picsart.com/302202574114211.png?r1024x1024 " alt="">
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
          -->
          <% foreach(var i in user) { %>
              <div class="col-sm-12 col-lg-3">
                  <div class="card">
                    <img src="<%=i.imageURL %>"" alt="">
                    <h4><%=i.name %></h4>
                    <small><%=i.rank %></small>
                    <button>See More</button>
                  </div>
                </div>
          <% } %>

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
                      <img class="course-card__image" src="<%= x.image_url %>"" />
                      <div class="course-card__inner">
                        <span class="u-d--block course-card__instructor">Ralph Smith</span>
                        <h3 class="course-card__title"><%= x.title %></h3>
                        <div class="star-rating">
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
<script src="https://code.jquery.com/jquery-3.2.1.js" integrity="sha256-DZAnKJ/6XZ9si04Hgrsxu/8s717jcIzLy3oi35EouyE=" crossorigin="anonymous"></script>

<!-- /.primary -->
    <script>
        /*
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
        */

        function filterQuery() {
            var filter = [];

            var devFilter = [];
            var businessFilter = [];
            var itFilter = [];
            var artFilter = [];
            var healthFilter = [];
            var musicFilter = [];
            var personalDevFilter = [];
            var marketingFilter = [];


            var lvlFilter = [];
            var priceFilter = [];
            var ratingFilter = [];
        
            // businessTopics, itTopics, artTopics, healthTopics, musicTopics
            var devUL = document.getElementById("devTopics");
            var businessUL = document.getElementById("businessTopics");
            var itUL = document.getElementById("itTopics");
            var artUL = document.getElementById("artTopics");
            var healthUL = document.getElementById("healthTopics");
            var musicUL = document.getElementById("musicTopics");

            var devInputs = document.getElementsByName("devTopicsInput");
            var businessInputs = document.getElementsByName("businessTopicsInput");
            var itInputs = document.getElementsByName("itTopicsInput");
            var artInputs = document.getElementsByName("artTopicsInput");
            var healthInputs = document.getElementsByName("healthTopicsInput");
            var musicInputs = document.getElementsByName("musicTopicsInput");
            var lvlInputs = document.getElementsByName("levelInput");
            var priceInputs = document.getElementsByName("priceLevel");
            var ratingInputs = document.getElementsByName("rating");
            var personalDevInputs = document.getElementsByName("personalDevTopicsInputs");
            var marketingInputs = document.getElementsByName("marketingInput");




            for (var i = 0; (ratingInputs.length - 1); i++) {
                try {
                    if (ratingInputs[i].checked == true) {
                        ratingFilter.push(ratingInputs[i].value);
                    }
                } catch {
                    break;
                }

            }

            for (var i = 0; (priceInputs.length - 1); i++) {
                try {
                    if (priceInputs[i].checked == true) {
                        priceFilter.push(priceInputs[i].value);
                    }
                } catch {
                    break;
                }

            }

            for (var i = 0; (lvlInputs.length - 1); i++) {
                try {
                    if (lvlInputs[i].checked == true) {
                        lvlFilter.push(lvlInputs[i].value);
                    }
                } catch {
                    break;
                }

            }

            for (var i = 0; (devInputs.length - 1); i++) {
                try {
                    if (devInputs[i].checked == true) {
                        devFilter.push(devInputs[i].value);
                    }
                } catch {
                    break;
                }

            }
            
            for (var i = 0; (businessInputs.length - 1); i++) {
                try {
                    if (businessInputs[i].checked == true) {
                        businessFilter.push(businessInputs[i].value);
                    }
                } catch {
                    break;
                }

            }

            
            for (var i = 0; (itInputs.length - 1); i++) {
                try {
                    if (itInputs[i].checked == true) {
                        itFilter.push(itInputs[i].value);
                    }
                } catch {
                    break;
                }
                
            }

            for (var i = 0; (artInputs.length - 1); i++) {
                try {
                    if (artInputs[i].checked == true) {
                        artFilter.push(artInputs[i].value);
                    }
                } catch {
                    break;
                }
                
            }

            for (var i = 0; (healthInputs.length - 1); i++) {
                try {
                    if (healthInputs[i].checked == true) {
                        healthFilter.push(healthInputs[i].value);
                    }
                } catch {
                    break;
                }
                
            }

            for (var i = 0; (musicInputs.length - 1); i++) {
                try {
                    if (musicInputs[i].checked == true) {
                        musicFilter.push(musicInputs[i].value);
                    }
                } catch {
                    break;
                }
                
            }

            for (var i = 0; (personalDevInputs.length - 1); i++) {
                try {
                    if (personalDevInputs[i].checked == true) {
                        personalDevFilter.push(personalDevInputs[i].value);
                    }
                } catch {
                    break;
                }
                
            }

            for (var i = 0; (marketingInputs.length - 1); i++) {
                try {
                    if (marketingInputs[i].checked == true) {
                        marketingFilter.push(marketingInputs[i].value);
                    }
                } catch {
                    break;
                }
                
            }

            for (var i = 0; i < devFilter.length; i++) {
                filter.push(devFilter[i]);
            }

            for (var i = 0; i < businessFilter.length; i++) {
                filter.push(businessFilter[i]);
            }

            for (var i = 0; i < itFilter.length; i++) {
                filter.push(itFilter[i]);
            }

            for (var i = 0; i < artFilter.length; i++) {
                filter.push(artFilter[i]);
            }

            for (var i = 0; i < healthFilter.length; i++) {
                filter.push(healthFilter[i]);
            }

            for (var i = 0; i < musicFilter.length; i++) {
                filter.push(musicFilter[i]);
            }

            for (var i = 0; i < personalDevFilter.length; i++) {
                filter.push(personalDevFilter[i]);
            }

            for (var i = 0; i < marketingFilter.length; i++) {
                filter.push(marketingFilter[i]);
            }



            if (document.getElementById("easyLevel").checked) {
                lvlFilter.push("Easy");
            }
            if (document.getElementById("intermediateLevel").checked) {
                lvlFilter.push("Intermediate");
            } 
            if (document.getElementById("expertLevel").checked) {
                lvlFilter.push("Expert");
            } 

            if (document.getElementById("priceFree").checked) {
                priceFilter.push("Free");
            } else if (document.getElementById("pricePaid").checked) {
                priceFilter.push("Paid");
            }

            var obj = { filter: filter, lvlFilter: lvlFilter, priceFilter: priceFilter, ratingFilter: ratingFilter };
            var param = JSON.stringify(obj);

            
             $.ajax({  
                 type: "POST",  
                 url: "productGrid.aspx/queryFilter",  
                 contentType: "application/json; charset=utf-8",  
                 dataType: "json",
                 data: param,
                 success: function (response) {  
                     var ret = response.d; 
                     window.location = "http://localhost:5000/" + ret;
                 
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