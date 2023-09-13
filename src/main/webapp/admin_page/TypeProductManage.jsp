<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Fashion Monsty - Admin</title>
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath }/admin_page/css/styles.css"
	rel="stylesheet" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"
	crossorigin="anonymous"></script>
</head>

<body class="sb-nav-fixed">
	<%@include file="../layout/admin_layout/admin_header.jsp"%>
	<div id="layoutSidenav">

		<div id="layoutSidenav_nav">
			<%@include file="../layout/admin_layout/admin_left.jsp"%>
		</div>

		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid px-4">
					<h1 class="mt-4">Quản Lý Loại Sản Phẩm</h1>
					<form action="" method="post" class="">

						<div class="mb-3">
							<label for="" class="form-label">Tên loại sản phẩm</label> <input
								type="text" class="form-control" name="typeProduct" id=""
								value="${loaisp.tenLoaiSP }" style="width: 280px"
								aria-describedby="helpId" placeholder="">
								<input
								type="hidden" name="typeID" 
								value="${loaisp.maLoaiSP }" >
							<button class="btn btn-primary mb-2 mt-3"
								${statusUpdateTypeP==false? 'disabled':'' }
								formaction="${pageContext.request.contextPath }/admin/quan-ly-loai-san-pham/them-moi">Thêm
								mới</button>
							<button class="btn btn-warning mb-2 mt-3"
								${statusUpdateTypeP==true? 'disabled':'' }
								formaction="${pageContext.request.contextPath }/admin/quan-ly-loai-san-pham/cap-nhat">Cập
								nhật</button>
							<button ${statusUpdateTypeP==true? 'disabled':'' }
								formaction="${pageContext.request.contextPath }/admin/quan-ly-loai-san-pham/delete"
								class="btn btn-danger mb-2 mt-3">Delete</button>
							<button
								formaction="${pageContext.request.contextPath }/admin/quan-ly-loai-san-pham/reset"
								class="btn btn-dark mb-2 mt-3">Reset</button>
						</div>

					</form>
					<div class="card mb-4">
						<div class="card-header">
							<i class="fas fa-table me-1"></i> Thông Tin Loại Sản Phẩm
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<table id="datatablesSimple"
									class="table table-hover table-striped">
									<thead>
										<tr>
											<th>Mã Loại Sản Phẩm</th>
											<th>Tên Loại Sản Phẩm</th>
											<th>Thao Tác</th>
										</tr>
									</thead>
									<tfoot>
										<tr>
											<th>Mã Loại Sản Phẩm</th>
											<th>Tên Loại Sản Phẩm</th>
											<th>Thao Tác</th>
										</tr>
									</tfoot>
									<tbody>
										<c:forEach var="typeProduct" items="${listProductType }">
											<tr>
												<td>${typeProduct.maLoaiSP }</td>
												<td>${typeProduct.tenLoaiSP }</td>
												<td><a
													href="${pageContext.request.contextPath }/admin/quan-ly-loai-san-pham/edit/?id=${typeProduct.maLoaiSP }"><i
														class="far fa-edit"></i> Sửa</a></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>

							</div>
						</div>
					</div>
				</div>
			</main>
			<%@include file="../layout/admin_layout/admin_footer.jsp"%>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script
		src="${pageContext.request.contextPath }/admin_page/js/scripts.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
		crossorigin="anonymous"></script>
	<script
		src="${pageContext.request.contextPath }/admin_page/demo/chart-area-demo.js"></script>
	<script
		src="${pageContext.request.contextPath }/admin_page/demo/chart-bar-demo.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"
		crossorigin="anonymous"></script>
	<script
		src="${pageContext.request.contextPath }/admin_page/js/datatables-simple-demo.js"></script>
</body>

</html>

</html>