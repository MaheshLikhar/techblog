
<%@page import="java.sql.*"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <!--icons-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

        <!--css-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/MyCSS.css" rel="stylesheet" type="text/css"/>

        <style>
            .banner-clippath{
                clip-path: polygon(0 0, 100% 0, 100% 100%, 89% 90%, 33% 100%, 0 85%);
            }
        </style>
        
        
        <title>home Page</title>
    </head>
    <body>

        <!--NavBar-->
        <%@include  file="navbar.jsp" %>

        <!--banner-->

        <div class="container-fluid p-0 m-0 banner-clippath">

            <div class="jumbotron primary-background text-white"  >

                <div class="container">
                    <h3 class="display-3">Welcome to TechBlog</h3 >
                    <p>Computer Technology means all designs, drawings, procedures (including design, manufacturing, test and maintenance procedures), specifications, software (other than as described within the meaning of the term "Software" defined elsewhere herein), printed circuit board art work, integrated circuit masks, test equipment, tools, fixtures, documentation, training materials, and information, in whatever form, related to, useful, utilizable or necessary in the design, manufacture, test and/or maintenance of the computer system, or relate to any Technology Licenses.</p>
                    <p>Computer Technology means all designs, drawings, procedures computer system, or relate to any Technology Licenses.</p>

                    <button class="btn btn-outline-light" ><span class="fa fa-share-square-o"></span> Start! its free</button>
                    <a class="btn btn-outline-light" href="login.jsp" ><span class="fa fa-user-circle fa-spin"></span> Login</a>

                </div>

            </div>   

        </div>


        <div class="container">

            <div class="row my-3">

                <div class="col-md-4">

                    <div class="card" ">
                        <img class="card-img-top" src="..." alt="Card image cap">
                        <div class="card-body">
                            <h5 class="card-title">Java Programing</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <a href="#" class="btn btn-outline-light primary-background">Read</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">

                    <div class="card" ">
                        <img class="card-img-top" src="..." alt="Card image cap">
                        <div class="card-body">
                            <h5 class="card-title">Java Programing</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <a href="#" class="btn btn-outline-light primary-background">Read</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">

                    <div class="card" ">
                        <img class="card-img-top" src="..." alt="Card image cap">
                        <div class="card-body">
                            <h5 class="card-title">Java Programing</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <a href="#" class="btn btn-outline-light primary-background">Read</a>
                        </div>
                    </div>
                </div>

            </div>
            
            
            <div class="row">

                <div class="col-md-4">

                    <div class="card" ">
                        <img class="card-img-top" src="..." alt="Card image cap">
                        <div class="card-body">
                            <h5 class="card-title">Java Programing</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <a href="#" class="btn btn-outline-light primary-background">Read</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">

                    <div class="card" ">
                        <img class="card-img-top" src="..." alt="Card image cap">
                        <div class="card-body">
                            <h5 class="card-title">Java Programing</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <a href="#" class="btn btn-outline-light primary-background">Read</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">

                    <div class="card" ">
                        <img class="card-img-top" src="..." alt="Card image cap">
                        <div class="card-body">
                            <h5 class="card-title">Java Programing</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <a href="#" class="btn btn-outline-light primary-background">Read</a>
                        </div>
                    </div>
                </div>

            </div>

        </div>









        <!--javaScript-->

        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script><!-- comment -->

        <script
            src="https://code.jquery.com/jquery-3.6.0.min.js"
            integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
        crossorigin="anonymous"></script>

        <script src="js/MyJavaScript.js" type="text/javascript"></script>


    </body>
</html>
