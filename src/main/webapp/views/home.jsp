<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>IT16301</title>
	<link rel="stylesheet"
		href="${ pageContext.request.contextPath }/css/bootstrap.min.css" />
	<link rel="stylesheet"
		href="${ pageContext.request.contextPath }/css/style.css" />
</head>
<body>
<header>
        <div class="container-fluid" id="navbar">
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
          <div class="container-fluid p-0">
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
              <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
              <ul class="navbar-nav me-auto mb-2 mb-lg-0" >
                <li class="nav-item">
                  <a class="nav-link active" aria-current="page" href="#0">Trang Chủ</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link active" aria-current="page" href="#1">Khóa Học</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link active" aria-current="page" href="#2">Giới Thiệu</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link active" aria-current="page" href="#3">Liên Hệ</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link active" aria-current="page" href="#4">Hỏi Đáp</a>
                </li>
                <li class="nav-item dropdown">
                  <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                    Tài Khoản
                  </a>
                  <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <li><a class="dropdown-item" href="#5">Đăng Nhập</a></li>
                    <li><a class="dropdown-item" href="Dangky.html">Đăng Ký</a></li>
                    <li><hr class="dropdown-divider"></li>
                    <li><a class="dropdown-item" href="qltk.html">Quản Lý Tài Khoản</a></li>
                  </ul>
                </li>
              </ul>
              <form class="d-flex">
                <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                <button class="btn btn-outline bg-light" type="submit">Search</button>
              </form>
            </div>
          </div>
        </nav>
        </div>
        <div class="container-fluid" id="banner" style="background-color: #ededed;">
            <img class="img-fluid" src="" alt="">
        </div>
    </header>
    <div>
      <jsp:include page="${ view }"></jsp:include>
      <jsp:include page="${ view1 }"></jsp:include>
      </div>
      <footer class="panel panel-default row" style="background-color: #000055;">
        <div class="panel-heading text-center" style="color: white;">
          <p>FPT Polytechnic &copy; 2022. Phạm Công Giang</p>
        </div>
      </footer>
	<script src="${ pageContext.request.contextPath }/js/jquery.min.js"></script>
	<script src="${ pageContext.request.contextPath }/js/popper.min.js"></script>
	<script src="${ pageContext.request.contextPath }/js/bootstrap.min.js"></script>
</body>
</html>