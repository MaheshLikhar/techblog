<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.entities.Categories"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.entities.Message"%>
<%@page errorPage="error_page.jsp" %>
<%@page import="com.tech.blog.entities.User"%>
<%

    User user = (User) session.getAttribute("currentUser");

    if (user == null) {
        response.sendRedirect("login.jsp");
    } else {

    }

%>


<!DOCTYPE html>
<html>
    <head>


        <!--icons-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

        <!--css-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/MyCSS.css" rel="stylesheet" type="text/css"/>

        <style>
            .banner-clippath{
                clip-path: polygon(0 0, 100% 0, 100% 100%, 89% 90%, 33% 100%, 0 85%);
            }

            .nav-logo{
                position: absolute;
                left: 45vw;
                top: 8px;
            }

            @media(min-width: 992px){
                .nav-logo{
                    position: absolute;
                    left: 45vw;
                    top: 8px;
                }
            }

            .Add-Sticky-Btn {
                position: fixed;
                top: 90%;
                right: 5%;
                transform: scale(2.5);
            }

            .addLogo {
                background: #308D46;
                color: white;
                padding: 8px 14px;
                border-radius: 50%;
            }
            .addLogo:hover{
                color: yellow;
            }

            .left-sticky{
                position: fixed;
                top: 10%;
                left:  0%;
            }

        </style>



        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>


        <!--navbar-->

        <nav class="navbar navbar-expand-lg navbar-dark primary-background" id="navbarTog"  style="position: fixed; top: 0px; left: 0px; width: 100vw; z-index: 1; " >

            <div class="nav-logo" style=" " >
                <a class="navbar-brand" href="index.jsp"><span class="fa fa-cubes"></span> Techno Media</a>
            </div>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>



            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="#"><span class="fa fa-home"></span> Home <span class="sr-only">(current)</span></a>
                    </li>

                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <span class="fa fa-folder-open"></span> Categories
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="#">Programing lang</a>
                            <a class="dropdown-item" href="#">Logic</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#">Data Structures and Algorithm</a>
                        </div>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link " href="#"><span class="fa fa-phone" ></span> Contact</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link " href="#" data-toggle="modal" data-target="#Add-Post-Modal" ><span class="fa fa-asterisk" ></span> Do Post</a>
                    </li>

                </ul>

                <ul class="navbar-nav mr-right" >



                    <li class="nav-item">
                        <a class="nav-link " href=""  data-toggle="modal" data-target="#profile-view" ><span class="fa fa-user-circle" ></span> <%= user.getName()%></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link " href="LogoutServlet"><span class="fa fa-user-plus" ></span> Logout</a>
                    </li>

                </ul>


            </div>
        </nav>

        <!--navbar end-->

        <%

            Message msg = (Message) session.getAttribute("msg");

            if (msg != null) {

        %>
        <div class="alert <%= msg.getCssClass()%>" role="alert">
            <%= msg.getContext()%>
        </div>
        <%
            }

            session.removeAttribute("msg");

        %>



        <!--main page start-->

        <main>

            <div class="container-fluid " >


                <div class="row "   >

                    <!--left collum-->
                    <div class="col col-md-3 col-sm-12  left-sticky " style="justify-content: center" > 

                        <div class="container text-center mt-4" >

                            <img src="ProfilePic/<%= user.getProfile()%>" style="border-radius: 50%; width: 8rem "  >
                            <br>
                            <h5 class="modal-title  " > <%= user.getName()%> </h5>

                            <br>
                            <button class="btn btn-outline-primary"   data-toggle="modal" data-target="#profile-view" > View Profile </button>
                        </div>

                        <div class="mt-4" >



                            <ul class="list-group">
                                <a  onclick="getPosts(0, this)" class=" c-link list-group-item  list-group-item-action active ">All Posts</a>
                                <%                                        PostDao p = new PostDao(ConnectionProvider.getConnection());

                                    ArrayList<Categories> list1 = p.getAllCategories();

                                    for (Categories c : list1) {

                                %>

                                <a  onclick="getPosts(<%= c.getcId()%>, this)" class="c-link list-group-item "><%= c.getName()%></a>
                                <%
                                    }

                                %>

                            </ul>

                        </div>    
                    </div>

                    <!--right collum-->


                    <div class="col col-md-9 " style=" background: #daedff  ;  height:  100vh; padding: 0px; position: absolute ; top: 4rem; right: 0px " > 
                        <div class="container-fluid  text-center" style=" background: white  ;  height: 10vh; margin: 0px; padding: 1rem" > 

                            <input onKeyUp="myFunction()" class="form-control text-center" type="text"   placeholder="Search" aria-label="Search"  id="search"  >

                        </div>
                        <!--loader-->
                        <div class="container text-center" id="loader" >
                            <i class="fa fa-refresh fa-4x fa-spin mt-4" ></i>
                            <h3 class="mt-2" >Loading...</h3>
                        </div>

                        <!--posts-->
                        <div class="container-fluid mt-4"  >
                            <div id="post-container" ></div>
                        </div>

                    </div>

                </div>

            </div>

        </main>

        <!--end main page-->

        <!--add post sticky button-->

        <div class="Add-Sticky-Btn" >

            <a href=""   data-toggle="modal" data-target="#Add-Post-Modal" class="addLogo"><i class="fa fa-plus"></i></a>

        </div>

        <!--end add post sticky button-->





        <!--model start-->

        <!-- Button trigger modal -->
        <!--        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#profile-view">
                    Launch demo modal
                </button>-->

        <!-- Modal -->
        <div class="modal fade" id="profile-view" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header primary-background text-white ">
                        <h5 class="modal-title  " id="exampleModalLongTitle">TechBlog</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="container text-center" >

                            <img src="ProfilePic/<%= user.getProfile()%>" style="border-radius: 50%; width: 8rem "  >
                            <br>
                            <h5 class="modal-title  " > <%= user.getName()%> </h5>

                            <br>

                            <!--table-->


                            <div id="Profile-View" >

                                <table class="table">

                                    <tbody>
                                        <tr>
                                            <th scope="row">ID :</th>
                                            <td><%= user.getId()%></td>

                                        </tr>

                                        <tr>
                                            <th scope="row">Email :</th>
                                            <td><%= user.getEmail()%></td>

                                        </tr>

                                        <tr>
                                            <th scope="row">Status :</th>
                                            <td><%= user.getAbout()%></td>

                                        </tr>

                                        <tr>
                                            <th scope="row">Registered on :</th>
                                            <td><%= user.getCurrentTime()%></td>

                                        </tr>

                                    </tbody>
                                </table>


                            </div>

                            <!--profile edit--> 
                            <div id="Profile-Edit" style="display: none" >
                                <h4>Please edit carefully</h4>

                                <form action="EditServelt"  method="post" enctype="multipart/form-data"  >
                                    <table class="table">

                                        <tbody>
                                            <tr>
                                                <th scope="row">ID :</th>
                                                <td><%= user.getId()%></td>

                                            </tr>
                                            <tr>
                                                <th scope="row">Name :</th>
                                                <td> <input class="form-control" type="text" name="name"  value="<%= user.getName()%>" > </td>

                                            </tr>

                                            <tr>
                                                <th scope="row">Email :</th>
                                                <td> <input class="form-control" type="email" name="email"  value="<%= user.getEmail()%>" > </td>

                                            </tr>

                                            <tr>
                                                <th scope="row">Password :</th>
                                                <td> <input class="form-control" type="password" name="password"  value="<%= user.getPassword()%>" > </td>

                                            </tr>

                                            <tr>
                                                <th scope="row">Status :</th>
                                                <td>

                                                    <textarea class="form-control" rows="3" class="" name="user_about" > <%= user.getAbout()%> </textarea>

                                                </td>

                                            </tr>

                                            <tr>
                                                <th scope="row">Profile pic:</th>
                                                <td> <input class="form-control" type="file" name="image"  value="<%= user.getProfile()%>" > </td>

                                            </tr>



                                        </tbody>
                                    </table>

                                    <button type="submit" class=" btn btn-outline-success"  >Save</button>

                                </form>
                            </div>




                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="button"  id="EditBtn" class="btn btn-primary">Edit</button>
                    </div>
                </div>
            </div>
        </div>

        <!--model end-->


        <!--add post model-->

        <!-- Modal -->
        <div class="modal fade" id="Add-Post-Modal" tabindex="-1" exampleModarole="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header bg-dark text-white">
                        <h5 class="modal-title" id="exampleModalLabel">Add Post detials</h5>
                        <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">

                        <form id="add-post-form" action="AddpostServlet" method="post" >


                            <div class="form-group" >

                                <select class="form-control" name="cid" >

                                    <option selected disabled >select categories</option>

                                    <%

                                        PostDao pd = new PostDao(ConnectionProvider.getConnection());

                                        ArrayList<Categories> cat = pd.getAllCategories();

                                        for (Categories c : cat) {

                                    %>

                                    <option value=" <%=c.getcId()%> " > <%= c.getName()%> </option>
                                    <%

                                        }

                                    %>



                                </select>

                            </div>

                            <div class="form-group" >
                                <input type="text" name="pTitle" placeholder="Enter your Title" class="form-control"   />       
                            </div>

                            <div class="form-group" >
                                <textarea rows="5" type="text" name="pContent" placeholder="Enter your Content" class="form-control" ></textarea>       
                            </div>

                            <div class="form-group" >
                                <textarea rows="5" type="text" name="pCode" placeholder="Enter your Code (if any)" class="form-control" ></textarea>       
                            </div>

                            <div class="form-group" >
                                <label> Select the pic..</label> <br>
                                <input type="file" name="pPic"  class="form-control"   />       
                            </div>

                            <div class="text-center">

                                <button onclick="getPosts(0, this)" id="post-btn" type="submit" class="btn btn-outline-primary">Post</button>
                            </div>


                        </form>


                    </div>

                </div>
            </div>
        </div>

        <!--End Add post model-->


        <!--javaScript-->

        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script><!-- comment -->
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <script
            src="https://code.jquery.com/jquery-3.6.0.min.js"
            integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
        crossorigin="anonymous"></script>

        <script src="js/MyJavaScript.js" type="text/javascript"></script>

        <script src="https://code.jquery.com/jquery-3.2.1.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>


        <script>

                                    $(document).ready(function () {

                                        let btnStatus = false;

                                        $('#EditBtn').click(function ()
                                        {

                                            if (btnStatus == false) {
                                                $('#Profile-View').hide();
                                                $('#Profile-Edit').show();
                                                btnStatus = true;
                                                $('#EditBtn').html("Back");
                                            } else {
                                                $('#Profile-View').show();
                                                $('#Profile-Edit').hide();
                                                btnStatus = false;
                                                $('#EditBtn').html("Edit");
                                            }

                                        });


                                    });

        </script>

        <script>

            $(document).ready(function () {

                $("#add-post-form").on("submit", function (event) {

                    event.preventDefault();

                    let form = new FormData(this);


//                   doing ajexx call
                    $.ajax({
                        url: "AddpostServlet",
                        type: "post",
                        data: form,
                        success: function (data, textStatus, jqXHR) {

                            console.log(data);

                            if (data.trim() === "Done") {
                                swal("Good job!", "Your Post SAVED Successfully", "success");
                            } else {
                                swal("Opps...", "Something went wrong!!!", "error");
                            }

                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            swal("Opps...", "Something went wrong!!!", "error");
                        },
                        processData: false,
                        contentType: false

                    });

                });
//                
            });


        </script>

        <script>

            function getPosts(catId, temp) {

                $('#loader').show();
                $('#post-container').hide();

                $('.c-link').removeClass("active");
                $(temp).addClass('active');


                $.ajax({
                    url: "posts_content.jsp",
                    data: {cid: catId},
                    success: function (data, textStatus, jqXHR) {


                        $('#loader').hide();
                        $('#post-container').show();

                        $('#post-container').html(data);



                    }
                });

            }

            $(document).ready(function () {

                let allPostRef = $('.c-link')[0];

                getPosts(0, allPostRef);

            })

        </script>


        <script>

            //              serch bar code


            function myFunction() {

                $('#loader').show();
                $('#post-container').hide();

                $('.c-link').removeClass("active");
//                $(temp).addClass('active');

                var k = $('#search').val();
//                alert(k);

                $.ajax({
                    url: "posts_content.jsp",
                    data: {key: k},
                    success: function (data, textStatus, jqXHR) {


                        $('#loader').hide();
                        $('#post-container').show();

                        $('#post-container').html(data);



                    }
                });


            }
            ;


        </script>

        <script src="js/MyJavaScript.js" type="text/javascript"></script>

    </body>
</html>
