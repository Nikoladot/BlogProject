<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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

  <title>Blog list</title>

  <!-- Font Awesome Icons -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/fontawesome-free/css/all.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/adminlte.min.css">
  <!-- Google Font: Source Sans Pro -->
  <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
</head>
<body class="hold-transition sidebar-mini">
<div class="wrapper">


  <!-- Navbar -->
  <nav class="main-header navbar navbar-expand navbar-white navbar-light">
    <!-- Left navbar links -->
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
      </li>
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
    <a href="index3.html" class="brand-link">
      <img src="${pageContext.request.contextPath}/dist/img/AdminLTELogo.png" alt="Cubes School Logo" class="brand-image img-circle elevation-3"
           style="opacity: .8">
      <span class="brand-text font-weight-light">Cubes School</span>
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
            <h1>Blogs</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">Blog list</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-md-12">
            <div class="card">
              <div class="card-header">
                <h3 class="card-title">All Blogs</h3>
                <div class="card-tools">
                  <a href="blog-form" class="btn btn-success">
                    <i class="fas fa-plus-square"></i>
                    Add new blog
                  </a>
                </div>
            
                 
                      <!-- select -->
                      <div class="card-tools" style="margin-right: 30px;">
                       <form action="blog-list-sort" >
                       <ul class="margin">
                       <li class="btn-group">
                        <select  class="custom-select" name="order">
                          <option value="1">By Date</option>
                          <option value="2">By Title</option>
                          <option value="3">By Author</option>                         
                          <option value="4">By Reviews</option>
                          <option value="5">Important</option>
                          <option value="6">Unimportant</option>
                        </select>
                        </li>
                        <li class="btn-group">
                        <input class="btn btn-block btn-info" type="submit" value="Sort">
                        </li>
                        </ul>
                        </form>
</div>
                     
                
               
                <!-- /.form-group -->
        
                    
                 
                  
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                <table class="table table-bordered">
                  <thead>                  
                    <tr>
                      
                      <th style="text-center">Title</th>   
                      <th class="text-center">Author</th>                  
                      <th class="text-center">Image</th>
                      <th class="text-center">Description</th>
                      <th class="text-center">Reviews</th>
                      <th class="text-center">Comments</th>
                      <th class="text-center">Actions</th>
                    </tr>
                  </thead>
                  <tbody>
                  
                  <c:forEach var="blog" items="${blogList}">
                    <tr>                             
                      <td>
                        <strong>${blog.title}</strong>
                      </td>
                      <td class="text-center">${blog.user.name} ${blog.user.surname}</td>
                      <td class="text-center"><img src="${blog.image}"
						style="max-width: 80px;"></td>
                      <td class="text-center">${blog.description}</td>
                      <td class="text-center">${blog.review}</td>
                      <td class="text-center">${blog.comments.size()}</td>
                      <td class="text-center">
                        <div class="btn-group">   
                        
                        <c:if test="${blog.important}">
                        <a title="make unimporant" href="blog-important-change?id=${blog.id}" class="btn btn-info">
                            <i class="fas fa-star"></i>
                          </a>  
                          </c:if>
                          <c:if test="${!blog.important}">
                        <a title="make imporant"href="blog-important-change?id=${blog.id}" class="btn btn-info">
                            <i class="far fa-star"></i>
                          </a>  
                          </c:if>
                        <a title="comment list" href="blog-comments-list?id=${blog.id}" class="btn btn-info">
                            <i class="far fa-comments"></i>    
                          </a>     
                        
                          <a title="update blog" href="blog-form-update?id=${blog.id}" class="btn btn-info">
                            <i class="fas fa-edit"></i>
                          </a>
                          <button type="button" class="btn btn-info" data-toggle="modal" data-target="#delete-modal-${blog.id}">
                            <i class="fas fa-trash"></i>
                          </button>
                        </div>
                      </td>
                    </tr>    
	<div class="modal fade" id="delete-modal-${blog.id}">
     <div class="modal-dialog">
       <div class="modal-content">
         <div class="modal-header">
           <h4 class="modal-title">Delete Blog</h4>
           <button type="button" class="close" data-dismiss="modal" aria-label="Close">
             <span aria-hidden="true">&times;</span>
           </button>
         </div>
         <div class="modal-body">
           <p>Are you sure you want to delete blog?</p>
           <strong></strong>
         </div>
         <div class="modal-footer justify-content-between">
           <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
           <a href="blog-delete?id=${blog.id}"
				class="btn btn-danger">Delete</a>
         </div>
       </div>
       <!-- /.modal-content -->
     </div>
     <!-- /.modal-dialog -->
   </div>
                    
                    </c:forEach>                
                  </tbody>
                  
                </table>
              </div>
              <!-- /.card-body -->
              <div class="card-footer clearfix">
                
              </div>
            </div>
            <!-- /.card -->
          </div>
          <!-- /.col -->
        </div>
        <!-- /.row -->
      </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->


    <!-- /.modal -->
  </div>
  <!-- /.content-wrapper -->

  

  <!-- Main Footer -->
  <footer class="main-footer">
    <!-- To the right -->
    <div class="float-right d-none d-sm-inline">
      PHP Laravel
    </div>
    <!-- Default to the left -->
    <strong>Copyright &copy; 2019 <a href="https://cubes.edu.rs">Cubes School</a>.</strong> All rights reserved.
  </footer>
</div>
<!-- ./wrapper -->

<!-- REQUIRED SCRIPTS -->
<script>
  $(function () {
    //Initialize Select2 Elements
    $('.select2').select2()

    //Initialize Select2 Elements
    $('.select2bs4').select2({
      theme: 'bootstrap4'
    })

    //Datemask dd/mm/yyyy
    $('#datemask').inputmask('dd/mm/yyyy', { 'placeholder': 'dd/mm/yyyy' })
    //Datemask2 mm/dd/yyyy
    $('#datemask2').inputmask('mm/dd/yyyy', { 'placeholder': 'mm/dd/yyyy' })
    //Money Euro
    $('[data-mask]').inputmask()

    //Date range picker
    $('#reservation').daterangepicker()
    //Date range picker with time picker
    $('#reservationtime').daterangepicker({
      timePicker: true,
      timePickerIncrement: 30,
      locale: {
        format: 'MM/DD/YYYY hh:mm A'
      }
    })
    //Date range as a button
    $('#daterange-btn').daterangepicker(
      {
        ranges   : {
          'Today'       : [moment(), moment()],
          'Yesterday'   : [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
          'Last 7 Days' : [moment().subtract(6, 'days'), moment()],
          'Last 30 Days': [moment().subtract(29, 'days'), moment()],
          'This Month'  : [moment().startOf('month'), moment().endOf('month')],
          'Last Month'  : [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
        },
        startDate: moment().subtract(29, 'days'),
        endDate  : moment()
      },
      function (start, end) {
        $('#reportrange span').html(start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY'))
      }
    )

    //Timepicker
    $('#timepicker').datetimepicker({
      format: 'LT'
    })
    
    //Bootstrap Duallistbox
    $('.duallistbox').bootstrapDualListbox()

    //Colorpicker
    $('.my-colorpicker1').colorpicker()
    //color picker with addon
    $('.my-colorpicker2').colorpicker()

    $('.my-colorpicker2').on('colorpickerChange', function(event) {
      $('.my-colorpicker2 .fa-square').css('color', event.color.toString());
    });

    $("input[data-bootstrap-switch]").each(function(){
      $(this).bootstrapSwitch('state', $(this).prop('checked'));
    });

  })
</script>

<!-- jQuery -->
<script src="${pageContext.request.contextPath}/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="${pageContext.request.contextPath}/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="${pageContext.request.contextPath}/dist/js/adminlte.min.js"></script>
</body>
</html>

