<%@ Page Title="" Language="C#" MasterPageFile="~/menu.Master" AutoEventWireup="true" CodeBehind="courseRecc.aspx.cs" Inherits="EADProj.courseRecc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="css/courseReccomend.css" rel="stylesheet">
    <style>
        #catBttn:disabled {
            background:dimgrey;
            cursor:default;
        }

        #topicBttn:disabled {
            background:dimgrey;
            cursor:default;
        }

        .catContainer label {
            height: 30%;
        }

        .cardFamiliar {
            padding: 7.5% !important; 
            font-size: 15px;
        }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- multistep form -->
    <form id="msform">
        <!-- progressbar -->
        <ul id="progressbar">
            <li class="active">Categories</li>
            <li>Topic</li>
            <li>Level</li>
        </ul>
        <!-- fieldsets -->
        <fieldset>
            <h2 class="fs-title">Category</h2>
            <h3 class="fs-subtitle">What is category is your course in?</h3>
            <section style="background-color: white !important;" class="content-section bg-primary text-white">
                <div class="row">

                    <div class="cardContainer catContainer">
                      <input type="radio" value="catDevelopment" name="courseRadio" id="cb-1" />
                      <label for="cb-1">
                        <span class="spec"><i style="color:black; font-size: 12.5px;" class="fas fa-code"></i></span>
                        <span style="font-weight:bold; font-size:17.5px; color:black;">Development</span>
                        <p>software engineering is the systematic application of engineering approaches to the development of software.</p>
                      </label>

                      <input type="radio" value="catBusiness" name="courseRadio" id="cb-2" />
                      <label for="cb-2">
                        <span class="spec"><i style="color:black; font-size: 12.5px;" class="fas fa-briefcase"></i></span>
                        <span style="font-weight:bold; font-size:17.5px; color:black;">Business</span>
                        <p>a person's regular occupation, profession, or trade/ commercial activity.</p>
                      </label>

                        <input type="radio" value="catTechnology" name="courseRadio" id="cb-3" />
                      <label for="cb-3">
                        <span class="spec"><i style="color:black; font-size: 12.5px;"  class="fas fa-memory"></i></span>
                        <span style="font-weight:bold; font-size:17.5px; color:black;">IT & Technology</span>
                        <p>the study or use of systems (especially computers and telecommunications) for storing, retrieving, and sending information.</p>
                      </label>

                        <input type="radio" value="catDesign" name="courseRadio" id="cb-4" />
                      <label for="cb-4">
                        <span class="spec"><i style="color:black; font-size: 12.5px;" class="fas fa-palette"></i></span>
                        <span style="font-weight:bold; font-size:17.5px; color:black;">Art & Design</span>
                        <p>the various branches of creative activity, such as painting, music, literature, and dance.</p>
                      </label>

                        <input type="radio" value="catMarketing" name="courseRadio" id="cb-5" />
                      <label for="cb-5">
                        <span class="spec"><i style="color:black; font-size: 12.5px;" class="far fa-envelope"></i></span>
                        <span style="font-weight:bold; font-size:17.5px; color:black;">Marketing</span>
                        <p>the action or business of promoting and selling products or services, including market research and advertising..</p>
                      </label>

                        <input type="radio" value="catHealth" name="courseRadio" id="cb-6" />
                      <label for="cb-6">
                        <span class="spec"><i style="color:black; font-size: 12.5px;" class="fas fa-running"></i></span>
                        <span style="font-weight:bold; font-size:17.5px; color:black;">Health & Fitness</span>
                        <p>the condition of being physically fit and healthy/ the quality of being suitable to fulfil a particular role or task.</p>
                      </label>

                        <input type="radio" value="catPersonalDev" name="courseRadio" id="cb-7" />
                      <label for="cb-7">
                        <span class="spec"><i style="color:black; font-size: 12.5px;" class="fas fa-user"></i></span>
                        <span style="font-weight:bold; font-size:17.5px; color:black;">Personal Development</span>
                        <p>The process of improving oneself through such activities as enhancing employment skills, increasing consciousness and building wealth.</p>
                      </label>

                        <input type="radio" value="catMusic" name="courseRadio" id="cb-8" />
                      <label for="cb-8">
                        <span class="spec"><i style="color:black; font-size: 12.5px;" class="fas fa-music"></i></span>
                        <span style="font-weight:bold; font-size:17.5px; color:black;">Music</span>
                        <p>vocal or instrumental sounds (or both) combined in such a way as to produce beauty of form, harmony, and expression of emotion.</p>
                      </label>

                    </div>
                </div>

            </section>
            <input type="button" id="catBttn" name="next" class="next action-button" value="Next" disabled="disabled"/>
        </fieldset>
        <fieldset>
            <h2 class="fs-title">Pick a topic</h2>
            <h3 class="fs-subtitle">Lets narrow down your options.</h3>
            <div class="row" style="margin-bottom: 10%;">

                <div class="cardContainer devContainer" id="devContainer">
                  <input class="cardInputs" name="devInputs" type="radio" id="cbDev-1" value="Javascript"/>
                  <label for="cbDev-1">
                    <span>Javascript</span>
                  </label>
                   <input class="cardInputs" name="devInputs" type="radio" id="cbDev-2" value="Python" />
                  <label for="cbDev-2">
                    <span>Python</span>
                  </label>
                    <input class="cardInputs" name="devInputs" type="radio" id="cbDev-3" value="C#"/>
                  <label for="cbDev-3">
                    <span>C#</span>
                  </label>
                    <input class="cardInputs" name="devInputs" type="radio" id="cbDev-4" value="C++"/>
                  <label for="cbDev-4">
                    <span>C++</span>
                  </label>
                    <input class="cardInputs" name="devInputs" type="radio" id="cbDev-5" value="Java"/>
                  <label for="cbDev-5">
                    <span>Java</span>
                  </label>
                    <input class="cardInputs" name="devInputs" type="radio" id="cbDev-6" value="Swift"/>
                  <label for="cbDev-6">
                    <span>Swift</span>
                  </label>
                    <input class="cardInputs" name="devInputs" type="radio" id="cbDev-7" value="Kotlin"/>
                  <label for="cbDev-7">
                    <span>Kotlin</span>
                  </label>
                     <input class="cardInputs" name="devInputs" type="radio" id="cbDev-8" value="MySQL"/>
                  <label for="cbDev-8">
                    <span>MySQL</span>
                  </label>
                     <input class="cardInputs" name="devInputs" type="radio" id="cbDev-9" value="NoSQL"/>
                  <label for="cbDev-9">
                    <span>NoSQL</span>
                  </label>
                     <input class="cardInputs" name="devInputs" type="radio" id="cbDev-10" value="ORACLE"/>
                  <label for="cbDev-10">
                    <span>ORACLE</span>
                  </label>
                     <input class="cardInputs" name="devInputs" type="radio" id="cbDev-11" value="HTML"/>
                  <label for="cbDev-11">
                    <span>HTML</span>
                  </label>
                 <input class="cardInputs" name="devInputs" type="radio" id="cbDev-12" value="CSS"/>
                  <label for="cbDev-12">
                    <span>CSS</span>
                  </label>
                 <input class="cardInputs" name="devInputs" type="radio" id="cbDev-13" value="XML"/>
                  <label for="cbDev-13">
                    <span>XML</span>
                  </label>
                 <input class="cardInputs" name="devInputs" type="radio" id="cbDev-14" value="PHP"/>
                  <label for="cbDev-14">
                    <span>PHP</span>
                  </label>
                 <input class="cardInputs" name="devInputs" type="radio" id="cbDev-15" value="Bootstrap"/>
                  <label for="cbDev-15">
                    <span>Bootstrap</span>
                  </label>
                 <input class="cardInputs" name="devInputs" type="radio" id="cbDev-16" value="Node.js"/>
                  <label for="cbDev-16">
                    <span>Node.js</span>
                  </label>
                 <input class="cardInputs" name="devInputs" type="radio" id="cbDev-17" value="Vue.js"/>
                  <label for="cbDev-17">
                    <span>Vue.js</span>
                  </label>
                <input class="cardInputs" name="devInputs" type="radio" id="cbDev-18" value="Angular"/>
                  <label for="cbDev-18">
                    <span>Angular</span>
                  </label>
                <input class="cardInputs" name="devInputs" type="radio" id="cbDev-19" value="React"/>
                  <label for="cbDev-19">
                    <span>React</span>
                  </label>
                </div>

                <div class="cardContainer businessContainer" id="businessContainer">
                  <input class="cardInputs" name="busiInputs" type="radio" id="cbBusi-1" value="Accounting"/>
                  <label for="cbBusi-1">
                    <span>Accounting</span>
                  </label>
                   <input class="cardInputs" name="busiInputs" type="radio" id="cbBusi-2" value="Financing"/>
                  <label for="cbBusi-2">
                    <span>Financing</span>
                  </label>
                    <input class="cardInputs" name="busiInputs" type="radio" id="cbBusi-3" value="Forex"/>
                  <label for="cbBusi-3">
                    <span>Forex</span>
                  </label>
                    <input class="cardInputs" name="busiInputs" type="radio" id="cbBusi-4" value="Investing"/>
                  <label for="cbBusi-4">
                    <span>Investing</span>
                  </label>
                    <input class="cardInputs" name="busiInputs" type="radio" id="cbBusi-5" value="Excel"/>
                  <label for="cbBusi-5">
                    <span>Excel</span>
                  </label>
                    <input class="cardInputs" name="busiInputs" type="radio" id="cbBusi-6" value="Stock Trading"/>
                  <label for="cbBusi-6">
                    <span>Stock Trading</span>
                  </label>
                    <input class="cardInputs" name="busiInputs" type="radio" id="cbBusi-7" value="Technical Analysis"/>
                  <label for="cbBusi-7">
                    <span>Technical Analysis</span>
                  </label>
                </div>

                <div class="cardContainer softwareContainer" id="softwareContainer">
                  <input class="cardInputs" name="softwareInputs" type="radio" id="cbSoft-1" value="AWS Certificate"/>
                  <label for="cbSoft-1">
                    <span>AWS Certification</span>
                  </label>
                   <input class="cardInputs" name="softwareInputs" type="radio" id="cbSoft-2" value="Cisco CCNA"/>
                  <label for="cbSoft-2">
                    <span>Cisco CCNA</span>
                  </label>
                    <input class="cardInputs" name="softwareInputs" type="radio" id="cbSoft-3" value="Cyber Security"/>
                  <label for="cbSoft-3">
                    <span>Cyber Security</span>
                  </label>
                    <input class="cardInputs" name="softwareInputs" type="radio" id="cbSoft-4" value="Ethical Hacking"/>
                  <label for="cbSoft-4">
                    <span>Ethical Hacking</span>
                  </label>
                    <input class="cardInputs" name="softwareInputs" type="radio" id="cbSoft-5" value="Linux"/>
                  <label for="cbSoft-5">
                    <span>Linux</span>
                  </label>
                    <input class="cardInputs" name="softwareInputs" type="radio" id="cbSoft-6" value="AI/ML"/>
                  <label for="cbSoft-6">
                    <span>AI/ML</span>
                  </label>
                </div>

                <div class="cardContainer healthContainer" id="healthContainer">
                  <input class="cardInputs" name="artInputs" type="radio" id="cbHealth-1" value="Aromatheraphy"/>
                  <label for="cbHealth-1">
                    <span>Aromatheraphy</span>
                  </label>
                   <input class="cardInputs" name="artInputs" type="radio" id="cbHealth-2" value="Art Therapy"/>
                  <label for="cbHealth-2">
                    <span>Art Therapy</span>
                  </label>
                    <input class="cardInputs" name="artInputs" type="radio" id="cbHealth-3" value="CBT"/>
                  <label for="cbHealth-3">
                    <span>CBT</span>
                  </label>
                    <input class="cardInputs" name="artInputs" type="radio" id="cbHealth-4" value="Fitness"/>
                  <label for="cbHealth-4">
                    <span>Fitness</span>
                  </label>
                    <input class="cardInputs" name="artInputs"type="radio" id="cbHealth-5" value="Herbalism"/>
                  <label for="cbHealth-5">
                    <span>Herbalism</span>
                  </label>
                    <input class="cardInputs" name="artInputs" type="radio" id="cbHealth-6" value="Massage"/>
                  <label for="cbHealth-6">
                    <span>Massage</span>
                  </label>
                    <input class="cardInputs" name="artInputs" type="radio" id="cbHealth-7" value="Meditation"/>
                  <label for="cbHealth-7">
                    <span>Meditation</span>
                  </label>
                    <input class="cardInputs" name="artInputs" type="radio" id="cbHealth-8" value="Nutrition"/>
                  <label for="cbHealth-8">
                    <span>Nutrition</span>
                  </label>
                    <input class="cardInputs" name="artInputs" type="radio" id="cbHealth-9" value="Yoga"/>
                  <label for="cbHealth-9">
                    <span>Yoga</span>
                  </label>
                    <input class="cardInputs" name="artInputs" type="radio" id="cbHealth-10" value="Health Coaching"/>
                  <label for="cbHealth-10">
                    <span>Health Coaching</span>
                  </label>
                    <input class="cardInputs" name="artInputs" type="radio" id="cbHealth-11" value="Personal Improvement"/>
                  <label for="cbHealth-11">
                    <span>Personal Improvement</span>
                  </label>
                </div>

                <div class="cardContainer musicContainer" id="musicContainer">
                  <input class="cardInputs" name="musicInputs" type="radio" id="cbMusic-1" value="Guitar"/>
                  <label for="cbMusic-1">
                    <span>Guitar</span>
                  </label>
                   <input class="cardInputs" name="musicInputs" type="radio" id="cbMusic-2" value="Keyboard Instrument"/>
                  <label for="cbMusic-2">
                    <span>Keyboard Instrument</span>
                  </label>
                    <input class="cardInputs" name="musicInputs" type="radio" id="cbMusic-3" value="Music Composition"/>
                  <label for="cbMusic-3">
                    <span>Music Composition</span>
                  </label>
                    <input class="cardInputs" name="musicInputs" type="radio" id="cbMusic-4" value="Music Production"/>
                  <label for="cbMusic-4">
                    <span>Music Production</span>
                  </label>
                    <input class="cardInputs" name="musicInputs"type="radio" id="cbMusic-5" value="Music Theory"/>
                  <label for="cbMusic-5">
                    <span>Music Theory</span>
                  </label>
                    <input class="cardInputs" name="musicInputs" type="radio" id="cbMusic-6" value="Piano"/>
                  <label for="cbMusic-6">
                    <span>Piano</span>
                  </label>
                    <input class="cardInputs" name="musicInputs" type="radio" id="cbMusic-7" value="Singing"/>
                  <label for="cbMusic-7">
                    <span>Singing</span>
                  </label>
                    <input class="cardInputs" name="musicInputs" type="radio" id="cbMusic-8" value="Songwriting"/>
                  <label for="cbMusic-8">
                    <span>Songwriting</span>
                  </label>
                    <input class="cardInputs" name="musicInputs" type="radio" id="cbMusic-9" value="Ableton Live"/>
                  <label for="cbMusic-9">
                    <span>Ableton Live</span>
                  </label>
                    <input class="cardInputs" name="musicInputs" type="radio" id="cbMusic-10" value="Logic Pro X"/>
                  <label for="cbMusic-10">
                    <span>Logic Pro X</span>
                  </label>
                </div>

                <div class="cardContainer marketingContainer" id="marketingContainer">
                  <input class="cardInputs" name="marketingInputs" type="radio" id="cbMarketing-1" value="Copywriting"/>
                  <label for="cbMarketing-1">
                    <span>Copywriting</span>
                  </label>
                   <input class="cardInputs" name="marketingInputs" type="radio" id="cbMarketing-2" value="Digital Marketing"/>
                  <label for="cbMarketing-2">
                    <span>Digital Marketing</span>
                  </label>
                    <input class="cardInputs" name="marketingInputs" type="radio" id="cbMarketing-3" value="Facebook Marketing"/>
                  <label for="cbMarketing-3">
                    <span>Facebook Marketing</span>
                  </label>
                    <input class="cardInputs" name="marketingInputs" type="radio" id="cbMarketing-4" value="Google Analytics"/>
                  <label for="cbMarketing-4">
                    <span>Google Analytics</span>
                  </label>
                    <input class="cardInputs" name="marketingInputs"type="radio" id="cbMarketing-5" value="Instagram Marketing"/>
                  <label for="cbMarketing-5">
                    <span>Instagram Marketing</span>
                  </label>
                    <input class="cardInputs" name="marketingInputs" type="radio" id="cbMarketing-6" value="Marketing Strategy"/>
                  <label for="cbMarketing-6">
                    <span>Marketing Strategy</span>
                  </label>
                    <input class="cardInputs" name="marketingInputs" type="radio" id="cbMarketing-7" value="SEO"/>
                  <label for="cbMarketing-7">
                    <span>SEO</span>
                  </label>
                    <input class="cardInputs" name="marketingInputs" type="radio" id="cbMarketing-8" value="Social Media Marketing"/>
                  <label for="cbMarketing-8">
                    <span>Social Media Marketing</span>
                  </label>
                    <input class="cardInputs" name="marketingInputs" type="radio" id="cbMarketing-9" value="Google Ads Certification"/>
                  <label for="cbMarketing-9">
                    <span>Google Ads (AdWords) Certification</span>
                  </label>
                    <input class="cardInputs" name="marketingInputs" type="radio" id="cbMarketing-10" value="Google Ads (Adwords)"/>
                  <label for="cbMarketing-10">
                    <span>Google Ads (Adwords)</span>
                  </label>
                </div>

                <div class="cardContainer personalContainer" id="personalContainer">
                  <input class="cardInputs" name="personalInputs" type="radio" id="cbPersonal-1" value="Confidence"/>
                  <label for="cbPersonal-1">
                    <span>Confidence</span>
                  </label>
                   <input class="cardInputs" name="personalInputs" type="radio" id="cbPersonal-2" value="Energy Healing"/>
                  <label for="cbPersonal-2">
                    <span>Energy Healing</span>
                  </label>
                    <input class="cardInputs" name="personalInputs" type="radio" id="cbPersonal-3" value="Learning Strategies"/>
                  <label for="cbPersonal-3">
                    <span>Learning Strategies</span>
                  </label>
                    <input class="cardInputs" name="personalInputs" type="radio" id="cbPersonal-4" value="Memory"/>
                  <label for="cbPersonal-4">
                    <span>Memory</span>
                  </label>
                    <input class="cardInputs" name="personalInputs"type="radio" id="cbPersonal-5" value="Mindfulness"/>
                  <label for="cbPersonal-5">
                    <span>Mindfulness</span>
                  </label>
                    <input class="cardInputs" name="personalInputs" type="radio" id="cbPersonal-6" value="Neuro-Linguistic Programming"/>
                  <label for="cbPersonal-6">
                    <span>Neuro-Linguistic Programming</span>
                  </label>
                    <input class="cardInputs" name="personalInputs" type="radio" id="cbPersonal-7" value="Neuroscience"/>
                  <label for="cbPersonal-7">
                    <span>Neuroscience</span>
                  </label>
                    <input class="cardInputs" name="personalInputs" type="radio" id="cbPersonal-8" value="Reiki"/>
                  <label for="cbPersonal-8">
                    <span>Reiki</span>
                  </label>
                    <input class="cardInputs" name="personalInputs" type="radio" id="cbPersonal-9" value="Speed Reading"/>
                  <label for="cbPersonal-9">
                    <span>Speed Reading</span>
                  </label>
                    <input class="cardInputs" name="personalInputs" type="radio" id="cbPersonal-10" value="Life Coaching"/>
                  <label for="cbPersonal-10">
                    <span>Life Coaching</span>
                  </label>
                </div>

                <div class="cardContainer artContainer" id="artContainer">
                  <input class="cardInputs" name="artInputs" type="radio" id="cbArt-1" value="3D Modeling"/>
                  <label for="cbArt-1">
                    <span>3D Modeling</span>
                  </label>
                   <input class="cardInputs" name="artInputs" type="radio" id="cbArt-2" value="After Effects"/>
                  <label for="cbArt-2">
                    <span>After Effects</span>
                  </label>
                    <input class="cardInputs" name="artInputs" type="radio" id="cbArt-3" value="Adobe Illustrator"/>
                  <label for="cbArt-3">
                    <span>Adobe Illustrator</span>
                  </label>
                    <input class="cardInputs" name="artInputs" type="radio" id="cbArt-4" value="Photoshop"/>
                  <label for="cbArt-4">
                    <span>Photoshop</span>
                  </label>
                    <input class="cardInputs" name="artInputs"type="radio" id="cbArt-5" value="Blender"/>
                  <label for="cbArt-5">
                    <span>Blender</span>
                  </label>
                    <input class="cardInputs" name="artInputs" type="radio" id="cbArt-6" value="Character Animation"/>
                  <label for="cbArt-6">
                    <span>Character Animation</span>
                  </label>
                    <input class="cardInputs" name="artInputs" type="radio" id="cbArt-7" value="User Experience Design"/>
                  <label for="cbArt-7">
                    <span>User Experience Design</span>
                  </label>
                    <input class="cardInputs" name="artInputs" type="radio" id="cbArt-8" value="Drawing"/>
                  <label for="cbArt-8">
                    <span>Drawing</span>
                  </label>
                    <input class="cardInputs" name="artInputs" type="radio" id="cbArt-9" value="Graphic Design"/>
                  <label for="cbArt-9">
                    <span>Graphic Design</span>
                  </label>
                    <input class="cardInputs" name="artInputs" type="radio" id="cbArt-10" value="Web Design"/>
                  <label for="cbArt-10">
                    <span>Web Design</span>
                  </label>
                </div>

            </div>


            <input type="button" name="previous" class="previous action-button" value="Previous" />
            <input type="button" id="topicBttn" name="next" class="next action-button" value="Next" disabled="disabled"/>
        </fieldset>
        <fieldset>
            <h2 class="fs-title">Knowledge</h2>
            <h3 class="fs-subtitle">How familiar are you with <span id="topicSpan"></span> </h3>
            
            <div class="row">
                <div class="cardContainer">
                    <input class="familiarInputs easyInput" name="famInputs" type="radio" id="cbFamiliar-1" value="Easy"/>
                    <label class="cardFamiliar" for="cbFamiliar-1">
                    <span>Have never done this before.</span>
                    </label>

                    <input class="familiarInputs interInput" name="famInputs" type="radio" id="cbFamiliar-2" value="Intermediate"/>
                    <label class="cardFamiliar" for="cbFamiliar-2">
                    <span>Some related knowledge.</span>
                    </label>

                    <input class="familiarInputs expertInput" name="famInputs" type="radio" id="cbFamiliar-3" value="Expert"/>
                    <label class="cardFamiliar" for="cbFamiliar-3">
                    <span>Comfortable or advanced.</span>
                    </label>
                </div>
            </div>

            <input type="button" name="previous" class="previous action-button" value="Previous" />
            <input type="submit" name="submit" class="submit action-button" value="Submit" />
        </fieldset>
    </form>

    <script src="https://code.jquery.com/jquery-3.2.1.js" integrity="sha256-DZAnKJ/6XZ9si04Hgrsxu/8s717jcIzLy3oi35EouyE=" crossorigin="anonymous"></script>
    <script>
        /*
        $('input[type="radio"][name="courseRadio"]').click(function(){
            if ($(this).is(':checked'))
            {
              alert($(this).val());
            }
        });
        */

        var cardId = 0;
        var cardTopicId = 0;
        var familiarId = 0;

        $("input[name='courseRadio']").click(function () {
            $("#catBttn").prop("disabled", false);
            cardId = event.target.id;
            console.log(cardId);
        });

        $("#catBttn").click(function () {

            var devContainer = document.getElementById("devContainer");
            var businessContainer = document.getElementById("businessContainer");
            var softwareContainer = document.getElementById("softwareContainer");
            var healthContainer = document.getElementById("healthContainer");
            var musicContainer = document.getElementById("musicContainer");
            var marketingContainer = document.getElementById("marketingContainer");
            var personalContainer = document.getElementById("personalContainer");
            var artContainer = document.getElementById("artContainer");

            if (cardId == "cb-1") {
                //alert("dev");
                devContainer.style.display = "block";
                businessContainer.style.display = "none";
                softwareContainer.style.display = "none";
                healthContainer.style.display = "none";
                musicContainer.style.display = "none";
                marketingContainer.style.display = "none";
                personalContainer.style.display = "none";
                artContainer.style.display = "none";

            } else if (cardId == "cb-2") {
                //alert("business");
                devContainer.style.display = "none";
                businessContainer.style.display = "block";
                softwareContainer.style.display = "none";
                healthContainer.style.display = "none";
                musicContainer.style.display = "none";
                marketingContainer.style.display = "none";
                personalContainer.style.display = "none";
                artContainer.style.display = "none";
            } else if (cardId == "cb-3") {
                //alert("tech");
                devContainer.style.display = "none";
                businessContainer.style.display = "none";
                softwareContainer.style.display = "block";
                healthContainer.style.display = "none";
                musicContainer.style.display = "none";
                marketingContainer.style.display = "none";
                personalContainer.style.display = "none";
                artContainer.style.display = "none";

            } else if (cardId == "cb-4") {
                //alert("design");
                devContainer.style.display = "none";
                businessContainer.style.display = "none";
                softwareContainer.style.display = "none";
                healthContainer.style.display = "none";
                musicContainer.style.display = "none";
                marketingContainer.style.display = "none";
                personalContainer.style.display = "none";
                artContainer.style.display = "block";

            } else if (cardId == "cb-5") {
                //alert("marketing");
                devContainer.style.display = "none";
                businessContainer.style.display = "none";
                softwareContainer.style.display = "none";
                healthContainer.style.display = "none";
                musicContainer.style.display = "none";
                marketingContainer.style.display = "block";
                personalContainer.style.display = "none";
                artContainer.style.display = "none";

            } else if (cardId == "cb-6") {
                //alert("health");
                devContainer.style.display = "none";
                businessContainer.style.display = "none";
                softwareContainer.style.display = "none";
                healthContainer.style.display = "block";
                musicContainer.style.display = "none";
                marketingContainer.style.display = "none";
                personalContainer.style.display = "none";
                artContainer.style.display = "none";

            } else if (cardId == "cb-7") {
                //alert("personal dev");
                devContainer.style.display = "none";
                businessContainer.style.display = "none";
                softwareContainer.style.display = "none";
                healthContainer.style.display = "none";
                musicContainer.style.display = "none";
                marketingContainer.style.display = "none";
                personalContainer.style.display = "block";
                artContainer.style.display = "none";

            }  else if (cardId == "cb-8") {
                //alert("music");
                devContainer.style.display = "none";
                businessContainer.style.display = "none";
                softwareContainer.style.display = "none";
                healthContainer.style.display = "none";
                musicContainer.style.display = "block";
                marketingContainer.style.display = "none";
                personalContainer.style.display = "none";
                artContainer.style.display = "none";

            }
        });

        $(".cardInputs").click(function () {
            $("#topicBttn").prop("disabled", false);
            cardTopicId = event.target.id;
            console.log(cardTopicId);
        });

        $("#topicBttn").click(function () {
            var topic = document.getElementById(cardTopicId).value;
            document.getElementById("topicSpan").innerHTML = topic;
        });

         $(".familiarInputs").click(function () {
            familiarId = event.target.value;
        });


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
            var obj = { topic: document.getElementById(cardTopicId).value, familiar: familiarId };
            var param = JSON.stringify(obj);

             $.ajax({  
                 type: "POST",  
                 url: "courseRecc.aspx/reccQuery",  
                 contentType: "application/json; charset=utf-8",  
                 dataType: "json",
                 data: param,
                 success: function (response) {  
                    var ret = response.d; 
                    window.location = "http://localhost:5000/courseQueriedRecc.aspx?courseRecc=" + ret;
                 },  
                 error: function (response, textStatus, error) {  
                     alert("The error is: " + response.d + " " + error);  
                 }  
             });  
        });
    </script>
</asp:Content>