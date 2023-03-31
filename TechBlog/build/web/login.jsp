
<%@page import="com.tech.blog.entities.Message"%>
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


        <title>Login Page</title>
    </head>
    <body>

        <%@include  file="navbar.jsp" %>

        <main class="d-flex align-items-center primary-background banner-clippath" style="height: 70vh" >

            <div class="container">

                <div class="row">

                    <div class="col-md-4 offset-4">

                        <div class="card">

                            <div class="card-header primary-background text-white text-center">
                                <span class="fa fa-user-plus fa-3x"></span>
                                <br>
                                <p>Login here<p>
                            </div>

                            <%

                                Message msg = (Message) session.getAttribute("msg");

                                if (msg != null) {

                            %>
                            <div class="alert <%= msg.getCssClass() %>" role="alert">
                                <%= msg.getContext()  %>
                            </div>
                            <%   
                                }

                                session.removeAttribute("msg");

                            %>

                            <div class="card-body">

                                <form action="LoginServlet" method="post" >
                                    <div class="form-group">
                                        <label for="exampleInputEmail1">Email address</label>
                                        <input name="email" required type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                        <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputPassword1">Password</label>
                                        <input name="password" required type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                                    </div>

                                    <button type="submit" class="btn btn-primary">Submit</button>
                                </form>

                            </div>

                        </div>

                    </div>

                </div>

            </div>

        </main>





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
