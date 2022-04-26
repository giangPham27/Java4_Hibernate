<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<form method="POST"
	action="/Assignment_Java4/admin/categories/update?id=${ category.id }">
	<h2>UPDATE CATEGORY</h2>
	<div class="mt-2 row">
		<label class="col-2">Tên danh mục:</label>
		<div class="col-10">
			<input class="form-control" type="text" name="ten"
				value="${ category.ten }" />
		</div>
	</div>
	<div class="mt-2 row">
		<label class="col-2">Trạng thái:</label>
		<div class="col-10">
			<input type="radio" name="trangThai" value="1"
				${ category.trangThai == 1 ? "checked" : "" } /> <label>Đang
				hoạt động</label> <input type="radio" name="trangThai" value="0"
				${ category.trangThai == 0 ? "checked" : "" } /> <label>Không
				hoạt động</label>
		</div>
	</div>
	<div class="mt-2 row">
		<button class="btn btn-primary col-1">Cập nhập</button>
	</div>

</form>