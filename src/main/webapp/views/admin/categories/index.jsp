<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="true"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<c:if test="${ empty dm }">
	<p class="alert alert-warning">Không có dữ liệu</p>
</c:if>

<c:if test="${ !empty sessionScope.message }">
	<div class="alert alert-success">${ sessionScope.message }</div>
	<c:remove var="message" scope="session" />
</c:if>
<h2>LIST CATEGORY</h2>
<c:if test="${ !empty dm }">
	<table class="table">
		<thead class="table-dark">
			<th>Tên danh mục</th>
			<th>Trạng thái</th>
			<th colspan="2">Thao tác</th>
		</thead>
		<tbody>
			<c:forEach items="${ dm }" var="category">
				<tr>
					<td>${ category.ten }</td>

					<td><c:choose>
							<c:when test="${ category.trangThai == 1 }">
								<div class="btn btn-primary btn-circle"></div>
								<label>Đang hoạt động</label>
							</c:when>
							<c:when test="${ category.trangThai == 0 }">
								<div class="btn btn-danger btn-circle"></div>
								<label>Không hoạt động</label>
							</c:when>
							<c:otherwise> - </c:otherwise>
						</c:choose></td>
					<td><a class="btn btn-primary"
						href="/Assignment_Java4/admin/categories/edit?id=${ category.id }">
							Cập nhật </a>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</c:if>