<%@page import="com.tech.blog.entities.User"%>
<%@page import="com.tech.blog.dao.UserDao"%>
<%@page import="com.tech.blog.dao.LikeDao"%>
<%@page import="java.util.List"%>
<%@page import="com.tech.blog.entities.Posts"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>

<div class="row">


    <%
        Thread.sleep(1000);

        String key = request.getParameter("key");
//        System.out.println(key);

        List<Posts> post = null;
        PostDao pd = new PostDao(ConnectionProvider.getConnection());

        String cids = request.getParameter("cid");
        int cid = 0;

        if (cids == null) {

        } else {
            cid = Integer.parseInt(cids);
        }

        if (key != null) {
            post = pd.getAllPostsByKeyWords(key);
        } else if (cid == 0) {
            post = pd.getAllPosts();
        } else {
            post = pd.getAllPosts(cid);
        }

        if (post.size() == 0) {
            out.print("<h3 class='display-3 text-center' >No posts in this Categories...</h3>");
            return;
        }

        for (Posts p : post) {
    %>

    <div class="col-md-4 " >  

        <div class="card mt-3 "  >

            <%
                String s = p.getpPic();
                int l = s.length();
                if (s.endsWith("mp4")) {
            %>
            <video src="BlogPic/<%= p.getpPic()%>" >  </video>
                <%
                } else {
                %>
            <img class="card-img-top" src="BlogPic/<%= p.getpPic()%>" alt="Card image cap">
            <%
                }
            %>


            <div class="card-body" > 
                <b> <%= p.getpTItle()%> </b>
                <p> <%= p.getpContent()%> </p>

            </div>

            <div class="card-footer text-center" >

                <%
                    LikeDao ld = new LikeDao(ConnectionProvider.getConnection());
                    User u = (User) session.getAttribute("currentUser");

                %>

                <a href="" onclick="doLiked(<%=p.getpId()%>, <%= u.getId()%>)"  class="btn btn-outline-primary"  > <i class="fa fa-thumbs-o-up" ></i> <span class="like-counter" > <%= ld.countLike(p.getpId(), u.getId())%>  </span> </a>
                <a href="" class="btn btn-outline-primary"  > <i class="fa fa-commenting-o" ></i> <span>15</span> </a>
                <a href="ShowPostDetial.jsp?postId=<%= p.getpId()%>" class="btn btn-outline-primary"  > Read more </a>
            </div>

        </div>
    </div>

    <%
        }
    %>


</div>