<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="true"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<c:if test="${ empty pro }">
	<p class="alert alert-warning">Không có bản ghi</p>
</c:if>
<c:if test="${ !empty sessionScope.error }">
	<div class="alert alert-danger">${ sessionScope.error }</div>
	<c:remove var="error" scope="session" />
</c:if>
<c:if test="${ !empty sessionScope.message }">
	<div class="alert alert-success">${ sessionScope.message }</div>
	<c:remove var="message" scope="session" />
</c:if>
<h2>LIST PRODUCT</h2>
<c:if test="${ !empty pro }">
	<table class="table">
		<thead class="table-primary">
			<th>Tên sản phẩm</th>
			<th>Số lượng</th>
			<th>Đơn giá</th>
			<th>Màu sắc</th>
			<th>Kích thước</th>
			<th>Hình ảnh</th>
			<th colspan="2">Thao tác</th>
		</thead>
		<tbody>
			<c:forEach items="${ pro }" var="product">
				<tr>
					<td>${ product.ten }</td>
					<td>${ product.soLuong }</td>
					<td>${ product.donGia }</td>
					<td>${ product.mauSac }</td>
					<td>${ product.kichThuoc }</td>
					<td><img
						src="/Assignment_Java4/views/images/logos/${ product.img}"
						width="130px"></td>
					<td><a class="btn btn-primary"
						href="/Assignment_Java4/admin/products/edit?id=${ product.id }">
							Cập nhật </a> <a class="btn btn-danger"
						href="/Assignment_Java4/admin/products/delete?id=${ product.id }"data-bs-toggle="modal" data-bs-target="#staticBackdrop${ product.id }">
							Xóa
						</a>
							<div class="modal fade" id="staticBackdrop${ product.id }"
							data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
							aria-labelledby="staticBackdropLabel" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<h3 class="modal-title" id="staticBackdropLabel">
											<span class="text-warning">Warning: </span>Are u sure?
										</h3>
										<button type="button" class="btn-close"
											data-bs-dismiss="modal" aria-label="Close"></button>
									</div>
									<div class="modal-body" style="font-size: 16px">
										<div class="row">
											<img
												src="${ pageContext.request.contextPath }/images/ADAV.jsp"
												class="img-fluid rounded-start pb-3" alt="">
										</div>
										Are you sure you want to delete this user?
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-outline-dark"
											data-bs-dismiss="modal">Close</button>
										<a type="button" class="btn btn-outline-primary"
											href="/Assignment_Java4/admin/products/delete?id=${ product.id }">Delete
											sure</a>
									</div>
								</div>
							</div>
						</div>
							</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

</c:if>
