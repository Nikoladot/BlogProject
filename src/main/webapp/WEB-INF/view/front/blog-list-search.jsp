<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Blogs</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="robots" content="all,follow">
    <!-- Bootstrap CSS-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/vendor/bootstrap/css/bootstrap.min.css">
    <!-- Font Awesome CSS-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/vendor/font-awesome/css/font-awesome.min.css">
    <!-- Custom icon font-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/fontastic.css">
    <!-- Google fonts - Open Sans-->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700">
    <!-- Fancybox-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/vendor/@fancyapps/fancybox/jquery.fancybox.min.css">
    <!-- theme stylesheet-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.default.css" id="theme-stylesheet">
    <!-- Custom stylesheet - for your changes-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/custom.css">
    <!-- Favicon-->
    <link rel="shortcut icon" href="favicon.png">
    <!-- Tweaks for older IEs--><!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
  </head>
  <body>
    <header class="header">
      <!-- Main Navbar-->
      <nav class="navbar navbar-expand-lg">
        <div class="search-area">
          <div class="search-area-inner d-flex align-items-center justify-content-center">
            <div class="close-btn"><i class="icon-close"></i></div>
            <div class="row d-flex justify-content-center">
              <div class="col-md-8">
                <form action="blog-list-search">
                  <div class="form-group">
                    <input type="search" name="word" id="search" placeholder="What are you looking for?">
                    <button type="submit" name="page" value="0" class="submit"><i class="icon-search-1"></i></button>
                  </div>
                </form>
              </div>
            </div>
          </div>
        </div>
        <div class="container">
          <!-- Navbar Brand -->
          <div class="navbar-header d-flex align-items-center justify-content-between">
            <!-- Navbar Brand --><a href="index-page" class="navbar-brand">Bootstrap Blog</a>
            <!-- Toggle Button-->
            <button type="button" data-toggle="collapse" data-target="#navbarcollapse" aria-controls="navbarcollapse" aria-expanded="false" aria-label="Toggle navigation" class="navbar-toggler"><span></span><span></span><span></span></button>
          </div>
          <!-- Navbar Menu -->
          <div id="navbarcollapse" class="collapse navbar-collapse">
            <ul class="navbar-nav ml-auto">
              <li class="nav-item"><a href="index-page" class="nav-link">Home</a>
              </li>
              <li class="nav-item"><a href="blog-list-page?page=0" class="nav-link active">Blog</a>
              </li>
              <li class="nav-item"><a href="contact-page" class="nav-link">Contact</a>
              </li>
            </ul>
            <div class="navbar-text"><a href="blog-list-search?page=0" class="search-btn"><i class="icon-search-1"></i></a></div>
          </div>
        </div>
      </nav>
    </header>
    <div class="container">
    <h2 class="mb-3">Search results for "${word}"</h2>
      <div class="row">
        <!-- Latest Posts -->
        <main class="posts-listing col-lg-8"> 
          <div class="container">
            <div class="row">
              <!-- post -->
              
              
              <c:forEach var="blog" items="${blogList}">
              <div class="post col-xl-6">
                <div class="post-thumbnail"><a href="blog-post?id=${blog.id}"><img src="${blog.image}" alt="..." class="img-fluid"></a></div>
                <div class="post-details">
                  <div class="post-meta d-flex justify-content-between">
                    <div class="date meta-last">${blog.date}</div>
                    <c:if test="${blog.category == null}">
                    <div class="category"><a>Uncategory</a></div>
                    </c:if>
                    <c:if test="${blog.category != null}">
                    <div class="category"><a href="blog-list-category?id=${blog.category.id}&"">${blog.category.name}</a></div>
                    </c:if>
                  </div><a href="blog-post?id=${blog.id}">
                    <h3 class="h4">${blog.title}</h3></a>
                  <p class="text-muted">${blog.description}</p>
                  <footer class="post-footer d-flex align-items-center"><a href="blog-author.html" class="author d-flex align-items-center flex-wrap">
                      <div class="avatar"><img src="${pageContext.request.contextPath}/img/avatar-3.jpg" alt="..." class="img-fluid"></div>
                      <div class="title"><span>John Doe</span></div></a>
                    <div class="date"><i class="icon-clock"></i> 2 months ago</div>
                    <div class="comments meta-last"><i class="icon-comment"></i>${blog.comments.size()}</div>
                  </footer>
                </div>
              </div>
              </c:forEach>
              
             
            </div>
            <!-- Pagination -->
            <nav aria-label="Page navigation example">
              
              <ul class="pagination pagination-template d-flex justify-content-center">
              
              <c:if test="${page>0}">
                <li class="page-item"><a href="blog-list-search-change?page=${page}&word=${word}&type=left" class="page-link"> <i class="fa fa-angle-left"></i></a></li>
                </c:if>
                
                <c:forEach var="i" begin="0" end="${size/12}">
                <c:if test="${page == i}">
                <li class="page-item"><a href="blog-list-search?page=${i}&word=${word}" class="page-link active">${i+1}</a></li>
                </c:if>
                <c:if test="${page != i}">
                <li class="page-item"><a href="blog-list-search?page=${i}&word=${word}" class="page-link">${i+1}</a></li>
                </c:if>
                </c:forEach>
                  
                <c:if test="${page < size/12-1}">
                <li class="page-item"><a href="blog-list-page-change?page=${page}&word=${word}type=right" class="page-link"> <i class="fa fa-angle-right"></i></a></li>
                </c:if>
              </ul>
            </nav>

          </div>
        </main>
       <aside class="col-lg-4">
          <!-- Widget [Search Bar Widget]-->
          <div class="widget search">
            <header>
              <h3 class="h6">Search the blog</h3>
            </header>
            <form action="blog-list-search" class="search-form">
                  <div class="form-group">
                    <input type="search" name="word" placeholder="What are you looking for?">
                    <button type="submit" name="page" value="0" class="submit"><i class="icon-search"></i></button>
                  </div>
                </form>
          </div>
          <!-- Widget [Latest Posts Widget]        -->
          <div class="widget latest-posts">
            <header>
              <h3 class="h6">Latest Posts</h3>
            </header>
            <div class="blog-posts">
            
            <c:forEach var="blog" items="${mostReviewList}">
            <a href="blog-post?id=${blog.id}">
                <div class="item d-flex align-items-center">
                  <div class="image"><img src="${blog.image}" alt="..." class="img-fluid"></div>
                  <div class="title"><strong>${blog.title}</strong>
                    <div class="d-flex align-items-center">
                      <div class="views"><i class="icon-eye"></i>${blog.review}</div>
                      <div class="comments"><i class="icon-comment"></i>${blog.comments.size()}</div>
                    </div>
                  </div>
                </div></a>
                </c:forEach>
                </div>
          </div>
          <!-- Widget [Categories Widget]-->
          <div class="widget categories">
            <header>
              <h3 class="h6">Categories</h3>
            </header>
            
            <c:forEach var="category" items="${categoryList}">
            <div class="item d-flex justify-content-between"><a href="blog-list-category?id=${category.id}&page=0">${category.name}</a><span>${category.count}</span></div>
            </c:forEach>
            
          </div>
          <!-- Widget [Tags Cloud Widget]-->
          <div class="widget tags">       
            <header>
              <h3 class="h6">Tags</h3>
            </header>
            <ul class="list-inline">
            <c:forEach var="tag" items="${tagList}">
              <li class="list-inline-item"><a href="blog-list-tag?id=${tag.id}&page=0" class="tag">#${tag.name}</a></li>
              </c:forEach>
            </ul>
          </div>
        </aside>
      </div>
    </div>
    <!-- Page Footer-->
    <footer class="main-footer">
      <div class="container">
        <div class="row">
          <div class="col-md-4">
            <div class="logo">
              <h6 class="text-white">Bootstrap Blog</h6>
            </div>
            <div class="contact-details">
              <p>Serbia, Belgrade</p>
              <p>Phone: +123456</p>
              <p>Email: <a href="mailto:random@gmail.com">Info@Company.com</a></p>
              <ul class="social-menu">
                <li class="list-inline-item"><a href="http://www.facebook.com"><i class="fa fa-facebook"></i></a></li>
                <li class="list-inline-item"><a href="http://www.twitter.com"><i class="fa fa-twitter"></i></a></li>
                <li class="list-inline-item"><a href="http://www.instagram.com"><i class="fa fa-instagram"></i></a></li>
                <li class="list-inline-item"><a href="http://www.behance.com""><i class="fa fa-behance"></i></a></li>
                <li class="list-inline-item"><a href="http://www.pinterest.com"><i class="fa fa-pinterest"></i></a></li>
              </ul>
            </div>
          </div>
          <div class="col-md-4">
            <div class="menus d-flex">
              <ul class="list-unstyled">
                <li> <a href="index-page">Home</a></li>
                <li> <a href="blog-list-page?page=0">Blog</a></li>
                <li> <a href="contact-page">Contact</a></li>
                <li> <a href="administration/admin">Login</a></li>
              </ul>
              <ul class="list-unstyled">
               
                 <c:forEach var="category" items="${categoryList}">
                 <li> <a href="blog-list-category?id=${category.id}&page=0">${category.name}</a></li>
            </c:forEach>
              </ul>
            </div>
          </div>
          <div class="col-md-4">
            <div class="latest-posts">
            <c:forEach var="blog" items="${threeBlogList}">
            	<a href="blog-post?id=${blog.id}">            	
                <div class="post d-flex align-items-center">
                  <div class="image"><img src="${blog.image}" alt="..." class="img-fluid"></div>
                  <div class="title"><strong>${blog.title}</strong><span class="date last-meta">${blog.date}</span></div>
                </div></a>
                </c:forEach>
                </div>
          </div>
        </div>
      </div>
      <div class="copyrights">
        <div class="container">
          <div class="row">
            <div class="col-md-6">
              <p>&copy; 2017. All rights reserved. Your great site.</p>
            </div>
            <div class="col-md-6 text-right">
              <p>Template By <a href="https://bootstrapious.com/p/bootstrap-carousel" class="text-white">Bootstrapious</a>
                <!-- Please do not remove the backlink to Bootstrap Temple unless you purchase an attribution-free license @ Bootstrap Temple or support us at http://bootstrapious.com/donate. It is part of the license conditions. Thanks for understanding :)                         -->
              </p>
            </div>
          </div>
        </div>
      </div>
    </footer>
    <!-- JavaScript files-->
    <script src="${pageContext.request.contextPath}/vendor/jquery/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/vendor/popper.js/umd/popper.min.js"> </script>
    <script src="${pageContext.request.contextPath}/vendor/bootstrap/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/vendor/jquery.cookie/jquery.cookie.js"> </script>
    <script src="${pageContext.request.contextPath}/vendor/@fancyapps/fancybox/jquery.fancybox.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/front.js"></script>
  </body>
</html>