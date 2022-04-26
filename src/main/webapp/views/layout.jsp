<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>IT16301</title>
<link rel="stylesheet"
	href="${ pageContext.request.contextPath }/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css"
	href="fontawesome-free-5.15.4-web/css/all.min.css">
<script src="/Assignment_Java4/js/jquery.min.js"></script>
<script src="/Assignment_Java4/js/popper.min.js"></script>
<script src="/Assignment_Java4/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
		<header class="row">
			<img class="p-0"
				src="https://styleguru.vn/wp-content/uploads/2021/03/fanpage-web-banner-6.jpg"
				class="d-block w-100">
		</header>
		<nav class="row">
			<nav class="navbar navbar-expand-lg navbar-light bg-light">
				<div class="container-fluid p-0">
					<button class="navbar-toggler" type="button"
						data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
						aria-controls="navbarSupportedContent" aria-expanded="false"
						aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"></span>
					</button>
					<div class="collapse navbar-collapse" id="navbarSupportedContent">
						<ul class="navbar-nav me-auto mb-2 mb-lg-0">
							<li class="nav-item"><a class="nav-link " href="#/!"><i
									class="fas fa-home"></i> Trang Chủ</a></li>
							<li class="nav-item"><a class="nav-link " href="#!gioithieu"><i
									class="fas fa-list-alt"></i> Giới thiệu</a></li>

							<li class="nav-item"><a class="nav-link" href="#!hoidap"><i
									class="fas fa-question"></i>Hỏi đáp</a></li>
						</ul>

						<ul class="navbar-nav ml-auto">
							<li class="nav-item dropdown"><a
								class="nav-link dropdown-toggle" href="#" id="navbarDropdown1"
								role="button" data-bs-toggle="dropdown" aria-expanded="false"><i
									class="fas fa-book"></i> Quản Lý </a>
								<ul class="dropdown-menu" aria-labelledby="navbarDropdown1">
									<li><a class="dropdown-item"
										href="/Assignment_Java4/admin/products/index">Danh
											sách sản phẩm</a></li>
									<li><a class="dropdown-item"
										href="/Assignment_Java4/admin/categories/index">Danh
											sách danh mục</a></li>
									<li><a class="dropdown-item"
										href="/Assignment_Java4/admin/users/index">Danh
											sách users</a></li>
								</ul></li>
						</ul>
						<ul class="navbar-nav ml-auto">
							<li class="nav-item dropdown"><a
								class="nav-link dropdown-toggle" href="#" id="navbarDropdown1"
								role="button" data-bs-toggle="dropdown" aria-expanded="false"><i
									class="fas fa-book"></i> Tạo mới </a>
								<ul class="dropdown-menu" aria-labelledby="navbarDropdown1">
									<li><a class="dropdown-item"
										href="/Assignment_Java4/admin/products/create">Thêm
											sản phẩm </a></li>
									<li><a class="dropdown-item"
										href="/Assignment_Java4/admin/categories/create">Thêm
											danh mục</a></li>
									<li><a class="dropdown-item"
										href="/Assignment_Java4/admin/users/create">Thêm
											users</a></li>
								</ul></li>
						</ul>
					</div>
				</div>
			</nav>
		</nav>
		<aside>
			<div class="col-10">
				<jsp:include page="${ view }"></jsp:include>
			</div>
		</aside>
		<footer class="row text-center">
			<div class="card col p-0">
				<div class="card-body bg-light align-middle">
					<p style="color: blue;">FPT Polytechnic &copy; 2022. Phạm Công Giang. All rights reserved.</p>
				</div>
			</div>
		</footer>
	</div>
	<!-- End Body -->

</body>
</html>