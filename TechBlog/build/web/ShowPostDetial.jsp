<%@page import="com.tech.blog.dao.LikeDao"%>
<%@page import="java.text.DateFormat"%>
<%@page import="com.tech.blog.entities.Posts"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.entities.User"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.UserDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%

    String pId = request.getParameter("postId");

    PostDao p = new PostDao(ConnectionProvider.getConnection());

    Posts post = p.getPostByPostId(Integer.parseInt(pId));

    UserDao u = new UserDao(ConnectionProvider.getConnection());

    User user = u.getUserByUserId(post.getUserId());

%>


<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>watch</title>

        <!-- font awesome cdn link  -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css">

        <!-- custom css file link  -->
        <link rel="stylesheet" href="css/style.css">
        <link href="css/MyCSS.css" rel="stylesheet" type="text/css"/>
        
        <!--jqure cdn-->
        <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
        
    </head>
    <body>

        <header class="header">

            <section class="flex">

                <a href="home.html" class="logo">Techno Media</a>

                <form action="search.html" method="post" class="search-form">
                    <input type="text" name="search_box" required placeholder="search" maxlength="100">
                    <button type="submit" class="fas fa-search"></button>
                </form>

                <div class="icons">
                    <div id="menu-btn" class="fas fa-bars"></div>
                    <div id="search-btn" class="fas fa-search"></div>
                    <div id="user-btn" class="fas fa-user"></div>
                    <div id="toggle-btn" class="fas fa-sun"></div>
                </div>

                <div class="profile">
                    <img src="ProfilePic/<%= user.getProfile()  %>" class="image" alt="">
                    <h3 class="name"><%= user.getName() %></h3>
                    <p class="role"><%= user.getGender()  %></p>
                    <a href="profile.html" class="btn">view profile</a>
                    <div class="flex-btn">
                        <a href="login.html" class="option-btn">login</a>
                        <a href="register.html" class="option-btn">register</a>
                    </div>
                </div>

            </section>

        </header>   

        <div class="side-bar">

            <div id="close-btn">
                <i class="fas fa-times"></i>
            </div>

            <div class="profile">
                <img src="ProfilePic/<%= user.getProfile()  %>" class="image" alt="">
                    <h3 class="name"><%= user.getName() %></h3>
                    <p class="role"><%= user.getGender()  %></p>
                    <a href="profile.html" class="btn">view profile</a>
            </div>

            <nav class="navbar">
                <a href="home.html"><i class="fas fa-home"></i><span>home</span></a>
                <a href="about.html"><i class="fas fa-question"></i><span>about</span></a>
                <a href="courses.html"><i class="fas fa-graduation-cap"></i><span>courses</span></a>
                <a href="teachers.html"><i class="fas fa-chalkboard-user"></i><span>teachers</span></a>
                <a href="contact.html"><i class="fas fa-headset"></i><span>contact us</span></a>
            </nav>

        </div>

        <section class="watch-video">

            <div class="video-container">

                <%           if (post.getpPic().endsWith("mp4")) {

                %>
                <div class="video">
                    <video src="BlogPic/<%=post.getpPic()%>" controls poster="BlogPic/<%=post.getpPic()%>" id="video"></video>
                </div>
                <%

                } else {
                %>
                <div class="video">
                    <img src="BlogPic/<%=post.getpPic()%>" controls poster="image/<%=post.getpPic()%>" id="video"></img>
                </div>
                <%
                    }
                %>

                <h3 class="title"><%= post.getpTItle()%></h3>
                <div class="info">
                    
                    <%
                    LikeDao ld = new LikeDao(ConnectionProvider.getConnection());
                    
                    %>
                    
                    <p class="date"><i class="fas fa-calendar"></i><span><%= DateFormat.getDateInstance().format(post.getpDate()) %></span></p>
                    <p class="date"><i class="fas fa-heart"></i><span class="like-counter" > <%= ld.countLike(post.getpId(), user.getId()) %> </span> <span> likes</span></p>
                </div>
                <div class="tutor">
                    <img src="ProfilePic/<%= user.getProfile() %>" alt="">
                    <div>
                        <h3><%= user.getName()%></h3>
                        <span>developer</span>
                    </div>
                </div>
                <div class="flex">
                    <a href="playlist.html" class="inline-btn">view playlist</a>
                    <button><i onclick="doLiked(<%= post.getpId() %>,<%= user.getId() %>)" class="far fa-heart"></i><span>like</span></button>
                </div>
                <p class="description">
                    <%= post.getpContent() %>
                </p>
            </div>

        </section>

        <section class="comments">

            <h1 class="heading">5 comments</h1>

            <form action="" class="add-comment">
                <h3>add comments</h3>
                <textarea name="comment_box" placeholder="enter your comment" required maxlength="1000" cols="30" rows="10"></textarea>
                <input type="submit" value="add comment" class="inline-btn" name="add_comment">
            </form>

            <h1 class="heading">user comments</h1>

            <div class="box-container">

                <div class="box">
                    <div class="user">
                        <img src="images/pic-1.jpg" alt="">
                        <div>
                            <h3><%=user.getName()%></h3>
                            <span><%=post.getpDate()%></span>
                        </div>
                    </div>
                    <div class="comment-box">this is a comment form shaikh anas</div>
                    <form action="" class="flex-btn">
                        <input type="submit" value="edit comment" name="edit_comment" class="inline-option-btn">
                        <input type="submit" value="delete comment" name="delete_comment" class="inline-delete-btn">
                    </form>
                </div>

                <div class="box">
                    <div class="user">
                        <img src="images/pic-2.jpg" alt="">
                        <div>
                            <h3>john deo</h3>
                            <span>22-10-2022</span>
                        </div>
                    </div>
                    <div class="comment-box">awesome tutorial!
                        keep going!</div>
                </div>

                <div class="box">
                    <div class="user">
                        <img src="images/pic-3.jpg" alt="">
                        <div>
                            <h3>john deo</h3>
                            <span>22-10-2022</span>
                        </div>
                    </div>
                    <div class="comment-box">amazing way of teaching!
                        thank you so much!
                    </div>
                </div>

                <div class="box">
                    <div class="user">
                        <img src="images/pic-4.jpg" alt="">
                        <div>
                            <h3>john deo</h3>
                            <span>22-10-2022</span>
                        </div>
                    </div>
                    <div class="comment-box">loved it, thanks for the tutorial!</div>
                </div>

                <div class="box">
                    <div class="user">
                        <img src="images/pic-5.jpg" alt="">
                        <div>
                            <h3>john deo</h3>
                            <span>22-10-2022</span>
                        </div>
                    </div>
                    <div class="comment-box">this is what I have been looking for! thank you so much!</div>
                </div>

                <div class="box">
                    <div class="user">
                        <img src="images/pic-2.jpg" alt="">
                        <div>
                            <h3>john deo</h3>
                            <span>22-10-2022</span>
                        </div>
                    </div>
                    <div class="comment-box">thanks for the tutorial!

                        how to download source code file?
                    </div>
                </div>

            </div>

        </section>





        <footer class="footer">

            &copy; copyright @ 2022 by <span>mr. sayan shendre</span> | all rights reserved!

        </footer>

        <!-- custom js file link  -->
        <script src="js/script.js"></script>
        <script src="js/MyJavaScript.js" type="text/javascript"></script>
    </body>
</html>