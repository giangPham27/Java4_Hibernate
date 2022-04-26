<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="true"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<c:if test="${ !empty sessionScope.error }">
	<div class="alert alert-danger">${ sessionScope.error }</div>
	<c:remove var="error" scope="session" />
</c:if>

<form method="POST"
	action="/Assignment_Java4/admin/products/update?id=${ product.id }">
	<h2>CREATE PRODUCT</h2>
	<div class="mt-2 row">
		<label class="col-2">Tên sản phẩm:</label>
		<div class="col-10">
			<input class="form-control" type="text" name="ten"
				value="${ product.ten }" />
		</div>
	</div>
	<div class="mt-2 row">
		<label class="col-2">Số lượng:</label>
		<div class="col-10">
			<input class="form-control" type="text" name="soLuong"
				value="${ product.soLuong }" />
		</div>
	</div>
	<div class="mt-2 row">
		<label class="col-2">Đơn giá (/1 sản phẩm):</label>
		<div class="col-10">
			<input class="form-control" type="text" name="donGia"
				value="${ product.donGia }" />
		</div>
	</div>
	<div class="mt-2 row">
		<label class="col-2">Màu sắc:</label>
		<div class="col-10">
			<input class="form-control" type="text" name="mauSac"
				value="${ product.mauSac }" />
		</div>
	</div>
	<div class="mt-2 row">
		<label class="col-2">Kích thước(Size):</label>
		<div class="col-10">
			<input class="form-control" type="text" name="kichThuoc"
				value="${ product.kichThuoc }" />
		</div>
	</div>
	<div class="mt-2 row">
		<label class="col-2" for="avatar">Ảnh đại diện</label>
		<div class="col-10">
			<input class="form-control" type="file" name="img"
				value="${ product.img }" />
		</div>
	</div>
	<div class="mt-2 row">
		<button class="btn btn-primary col-1">Cập nhập</button>
	</div>
</form>