<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<c:if test="${ !empty sessionScope.error }">
	<div class="alert alert-danger">${ sessionScope.error }</div>
	<c:remove var="error" scope="session" />
</c:if>
<form method="POST"
	action="/Assignment_Java4/admin/categories/store">
	<h2>CREATE CATEGORY</h2>
	<div class="mt-2 row">
		<label class="col-2">Tên danh mục:</label>
		<div class="col-10">
			<input class="form-control" type="text" name="ten" autocomplete="off" />
		</div>
	</div>
	<div class="mt-2 row">
		<label class="col-2">Người tạo:</label>
		<div class="col-10">
			<select class="form-control" name="user_id" >
				<c:forEach items="${ ds }" var="user">
					<option value="${ user.id }">${ user.hoTen }</option>
				</c:forEach>
			</select>
		</div>
	</div>
	<div class="mt-2 row">
		<label class="col-2">Trạng thái:</label>
		<div class="col-10">
			<input type="radio" name="trangThai" value="1" /> <label>Đang
				hoạt động</label> <input type="radio" name="trangThai" value="0" /> <label>Không
				hoạt động</label>
		</div>
	</div>
	<div class="mt-2 row">
		<button class="btn btn-primary col-1">Thêm mới</button>
		<button type="reset" class="btn btn-secondary col-1">Xóa form</button>
	</div>
</form>
