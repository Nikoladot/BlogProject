<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<!--
This is a starter template page. Use this page to start your new project from
scratch. This page gets rid of all links and provides the needed markup only.
-->
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="x-ua-compatible" content="ie=edge">

<title>Add new Blog</title>

<!-- Font Awesome Icons -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/fontawesome-free/css/all.min.css">
<!-- Theme style -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/dist/css/adminlte.min.css">
<!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/summernote/summernote-bs4.css">
<link
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700"
	rel="stylesheet">
</head>
<body class="hold-transition sidebar-mini">
	<div class="wrapper">

		<!-- Navbar -->
		<nav
			class="main-header navbar navbar-expand navbar-white navbar-light">
			<!-- Left navbar links -->
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link" data-widget="pushmenu"
					href="#" role="button"><i class="fas fa-bars"></i></a></li>
			</ul>


			<!-- Right navbar links -->
			<ul class="navbar-nav ml-auto">
      <!-- Messages Dropdown Menu -->
      <li class="nav-item dropdown"><a class="nav-link"
					data-toggle="dropdown" href="#"> <i class="far fa-user"></i>
				</a>
					<div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
						<a href="user-edit-profile" class="dropdown-item"> <!-- Message Start -->
							<div class="media align-items-center">
								<img
									src="${pageContext.request.contextPath}/dist/img/user1-128x128.jpg"
									alt="User Avatar" class="img-size-50 mr-3 img-circle">
								<div class="media-body">
									<h3 class="dropdown-item-title"><sec:authentication property="principal.username"/></h3>
								</div>
							</div> <!-- Message End -->
						</a>
						<div class="dropdown-divider"></div>
						<a href="user-change-password" class="dropdown-item"> <i class="fas fa-user"></i>
							Change password
						</a>
						<div class="dropdown-divider"></div>
						<a href="login.html" class="dropdown-item"> 
						
						<form:form action="${pageContext.request.contextPath}/logout">				
						<input class="fas fa-sign-out-alt" type="submit" value="Sing out"/>
						</form:form>		
						</a>
					</div></li>
    </ul>
			<form class="form-inline ml-3" action="blog-list-search">
      <div class="input-group input-group-sm">
        <input name="word" class="form-control form-control-navbar" type="search" placeholder="Search" aria-label="Search">
        <div class="input-group-append">
          <button class="btn btn-navbar" type="submit">
            <i class="fas fa-search"></i>
          </button>
        </div>
      </div>
    </form>
		</nav>
		<!-- /.navbar -->

		<!-- Main Sidebar Container -->
		<aside class="main-sidebar sidebar-dark-primary elevation-4">
			<!-- Brand Logo -->
			<a href="index3.html" class="brand-link"> <img
				src="${pageContext.request.contextPath}/dist/img/AdminLTELogo.png"
				alt="Cubes School Logo" class="brand-image img-circle elevation-3"
				style="opacity: .8"> <span
				class="brand-text font-weight-light">Cubes School</span>
			</a>

			<!-- Sidebar -->
			<div class="sidebar">
				<!-- Sidebar Menu -->
				<nav class="mt-2">
					<ul class="nav nav-pills nav-sidebar flex-column"
						data-widget="treeview" role="menu" data-accordion="false">
						<!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
						<li class="nav-item has-treeview"><a href="#"
							class="nav-link"> <i class="nav-icon far fa-plus-square"></i>
								<p>
									Blogs <i class="right fas fa-angle-left"></i>
								</p>
						</a>
							<ul class="nav nav-treeview">
								<li class="nav-item"><a href="blog-list" class="nav-link">
										<i class="far fa-circle nav-icon"></i>
										<p>Blog list</p>
								</a></li>
								<li class="nav-item"><a href="blog-form" class="nav-link">
										<i class="far fa-circle nav-icon"></i>
										<p>Add Blog</p>
								</a></li>
							</ul></li>
					</ul>
					<ul class="nav nav-pills nav-sidebar flex-column"
						data-widget="treeview" role="menu" data-accordion="false">
						<!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
						<li class="nav-item has-treeview"><a href="#"
							class="nav-link"> <i class="nav-icon far fa-plus-square"></i>
								<p>
									Sliders <i class="right fas fa-angle-left"></i>
								</p>
						</a>
							<ul class="nav nav-treeview">
								<li class="nav-item"><a href="slider-list" class="nav-link">
										<i class="far fa-circle nav-icon"></i>
										<p>Slider list</p>
								</a></li>
								<li class="nav-item"><a href="slider-add" class="nav-link">
										<i class="far fa-circle nav-icon"></i>
										<p>Add slider</p>
								</a></li>
							</ul></li>
					</ul>
					<ul class="nav nav-pills nav-sidebar flex-column"
						data-widget="treeview" role="menu" data-accordion="false">
						<!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
						<li class="nav-item has-treeview"><a href="#"
							class="nav-link"> <i class="nav-icon far fa-plus-square"></i>
								<p>
									Category <i class="right fas fa-angle-left"></i>
								</p>
						</a>
							<ul class="nav nav-treeview">
								<li class="nav-item"><a href="category-list"
									class="nav-link"> <i class="far fa-circle nav-icon"></i>
										<p>Category list</p>
								</a></li>
								<li class="nav-item"><a href="category-form"
									class="nav-link"> <i class="far fa-circle nav-icon"></i>
										<p>Add new Category</p>
								</a></li>
							</ul></li>
					</ul>
					<ul class="nav nav-pills nav-sidebar flex-column"
						data-widget="treeview" role="menu" data-accordion="false">
						<!-- Add icons to the links using the .nav-icon class
              			 with font-awesome or any other icon font library -->
						<li class="nav-item has-treeview"><a href="#"
							class="nav-link"> <i class="nav-icon far fa-plus-square"></i>
								<p>
									Tags <i class="right fas fa-angle-left"></i>
								</p>
						</a>
							<ul class="nav nav-treeview">
								<li class="nav-item"><a href="tag-list" class="nav-link">
										<i class="far fa-circle nav-icon"></i>
										<p>Tags list</p>
								</a></li>
								<li class="nav-item"><a href="tag-form" class="nav-link">
										<i class="far fa-circle nav-icon"></i>
										<p>Add Tag</p>
								</a></li>
							</ul></li>
					</ul>
					<sec:authorize access="hasRole('admin')">
					<ul class="nav nav-pills nav-sidebar flex-column"
						data-widget="treeview" role="menu" data-accordion="false">
						<!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
						<li class="nav-item has-treeview"><a href="#"
							class="nav-link"> <i class="nav-icon far fa-plus-square"></i>
								<p>
									Users <i class="right fas fa-angle-left"></i>
								</p>
						</a>
							<ul class="nav nav-treeview">
								<li class="nav-item"><a href="user-list" class="nav-link">
										<i class="far fa-circle nav-icon"></i>
										<p>User list</p>
								</a></li>
								<li class="nav-item"><a href="user-form" class="nav-link">
										<i class="far fa-circle nav-icon"></i>
										<p>Add new user</p>
								</a></li>
							</ul></li>
					</ul>
					</sec:authorize>

					<ul class="nav nav-pills nav-sidebar flex-column"
						data-widget="treeview" role="menu" data-accordion="false">
						<!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
						<li class="nav-item has-treeview"><a href="#"
							class="nav-link"> <i class="nav-icon far fa-plus-square"></i>
								<p>
									Other <i class="right fas fa-angle-left"></i>
								</p>
						</a>
							<ul class="nav nav-treeview">
								<li class="nav-item"><a href="contact-list"
									class="nav-link"> <i class="far fa-circle nav-icon"></i>
										<p>Contact list</p>
								</a></li>
								<li class="nav-item"><a href="comment-list"
									class="nav-link"> <i class="far fa-circle nav-icon"></i>
										<p>Comments</p>
								</a></li>
							</ul></li>
					</ul>


				</nav>
				<!-- /.sidebar-menu -->
			</div>
			<!-- /.sidebar -->
		</aside>

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<div class="container-fluid">
					<div class="row mb-2">
						<div class="col-sm-6">
							<h1>Blog Form</h1>
						</div>

					</div>
				</div>
				<!-- /.container-fluid -->
			</section>

			<!-- Main content -->
			<section class="content">
				<div class="container-fluid">
					<div class="row">
						<div class="col-md-6">
							<div class="card card-primary">
								<div class="card-header">
									<h3 class="card-title">Blog Form</h3>
								</div>
								<!-- /.card-header -->
								<!-- form start -->


								<form:form  role="form"
									action="blog-save-new" modelAttribute="blog">

									<form:hidden path="id" />
									<form:hidden path="date"/>
								

									<div class="card-body">
										<div class="form-group">
											<label>Title</label>
											<form:input path="title" type="text" class="form-control"
												placeholder="Enter title" />
										</div>
										<div class="form-group">
											<label>Description</label>
											<form:textarea path="description" type="text"
												class="form-control" rows="3"
												placeholder="Enter description" />
										</div>
										
										<div class="form-group">

										<div class="mb-3">
                				<form:textarea path="textArea" id="compose-textarea" class="textarea" placeholder="Place some text here"
                        			  style="width: 100%; height: 200px; font-size: 14px; line-height: 18px; border: 1px solid #dddddd; padding: 10px;"></form:textarea>
             					 </div>
             						 </div>


										<div class="form-group">
											<label>Introduction</label>
											<form:textarea path="introduction" class="form-control"
												rows="3" placeholder="Enter ..." />
										</div>

							<div class="form-group">
											<label>Image</label> 
											<form:input path="image" type="text" class="form-control"
												placeholder="Enter image"/>
										</div>

										<div class="form-group">
											<label>Subtitle</label>
											<form:input path="subtitle" type="text" class="form-control"
												placeholder="Enter subtitle" />
										</div>

										<div class="form-group">
											<label>Text</label>
											<form:textarea path="text" class="form-control" rows="3"
												placeholder="Enter ..." />
										</div>

										<div class="form-group">
											<label>Tags</label>
											<div>
												<form:checkboxes items="${tagList}" path="tags"
													itemValue="id" itemLabel="name"
													element="div class='form-check form-check-inline'"
													class="form-check-input" id="size-checkbox-1" />
											</div>
										</div>
										
										<div class="form-group">
											<label>Category</label>
											<form:select path="category.id" class="form-control">

												<option value="0">Please select category</option>
												<form:options items="${categoryList}" itemLabel="name"
													itemValue="id" />
											</form:select>
										</div>
										
										<div class="form-check">
											<form:checkbox path="important" class="form-check-input"
												id="exampleCheck1" />
											<label class="form-check-label" for="exampleCheck1">Mark
												as important</label>
										</div>

									</div>
										
									
									
									<div class="card-footer">
										<button type="submit" class="btn btn-primary">Save</button>
									</div>
									
									
									
									
									
								</form:form>


							</div>
							<!-- /.card -->
						</div>
						<!-- /.col -->
					</div>
					<!-- /.row -->
				</div>
				<!-- /.container-fluid -->
			</section>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->



		<!-- Main Footer -->
		<footer class="main-footer">
			<!-- To the right -->
			<div class="float-right d-none d-sm-inline">Java</div>
			<!-- Default to the left -->
			<strong>Copyright &copy; 2019 <a href="https://cubes.edu.rs">Cubes
					School</a>.
			</strong> All rights reserved.
		</footer>
	</div>
	<!-- ./wrapper -->

	<!-- REQUIRED SCRIPTS -->

	<!-- jQuery -->
	<script
		src="${pageContext.request.contextPath}/plugins/jquery/jquery.min.js"></script>
	<!-- Bootstrap 4 -->
	<script
		src="${pageContext.request.contextPath}/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- AdminLTE App -->
	<script
		src="${pageContext.request.contextPath}/dist/js/adminlte.min.js"></script>
		<script src="${pageContext.request.contextPath}/plugins/summernote/summernote-bs4.min.js"></script>
<script>
  $(function () {
    // Summernote
    $('.textarea').summernote()
  })
</script>
</body>
</html>

