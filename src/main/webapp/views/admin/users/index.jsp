<%@ page language="java"
         contentType="text/html;
         charset=UTF-8"
         session="true"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<c:if test="${ empty ds }">
	<p class="alert alert-warning">Không có bản ghi</p>
</c:if>
<c:if test="${ !empty sessionScope.error }" >
     <div class="alert alert-danger">
           ${ sessionScope.error }
     </div>
      <c:remove var = "error" scope="session"/>
 </c:if>
 <c:if test="${ !empty sessionScope.message }" >
     <div class="alert alert-success">
           ${ sessionScope.message }
     </div>
     <c:remove var = "message" scope="session"/>
 </c:if>
 
<c:if test="${ !empty ds }">
	<table class="table">
		<thead class="table-primary">
			<th scope="col">Họ tên</th>
			<th scope="col">Địa chỉ</th>
			<th scope="col">SĐT</th>
			<th scope="col">Email</th>
			<th scope="col">Giới tính</th>
			<th scope="col">Vai trò</th>
			<th colspan="2">Thao tác</th>
		</thead>
		<tbody>
			<c:forEach var="obj" items="${ ds }">
				<tr>
					<td>${ obj.hoTen }</td>
					<td>${ obj.diaChi }</td>
					<td>${ obj.sdt }</td>
					<td>${ obj.email }</td>
					<td>
						<c:choose>
							<c:when test="${ obj.gioiTinh == 1 }">Nam</c:when>
							<c:when test="${ obj.gioiTinh == 0 }">Nữ</c:when>
							<c:otherwise> - </c:otherwise>
						</c:choose>
					</td>
					<td>
						<c:choose>
							<c:when test="${ obj.vaiTro == 1 }">Admin</c:when>
							<c:when test="${ obj.vaiTro == 0 }">User</c:when>
							<c:otherwise> - </c:otherwise>
						</c:choose>
					</td>
					<td>
						<a class="btn btn-primary"
	href="/Assignment_Java4/admin/users/edit?id=${ obj.id }"
							>
							Cập nhật
						</a>
					</td>
					<td>
						<a class="btn btn-danger" id = ${obj.id }
	href="/Assignment_Java4/admin/users/delete?id=${ obj.id }"
						data-bs-toggle="modal" data-bs-target="#staticBackdrop${ obj.id }">
							Xóa
						</a>
						<div class="modal fade" id="staticBackdrop${ obj.id }"
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
										Are you sure you want to delete?
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-outline-dark"
											data-bs-dismiss="modal">Close</button>
										<a type="button" class="btn btn-outline-primary"
											href="/Assignment_Java4/admin/users/delete?id=${ obj.id }">Delete
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
