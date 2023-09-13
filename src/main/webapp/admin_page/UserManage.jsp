<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
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
					<h1 class="mt-4">QUẢN LÝ NGƯỜI DÙNG</h1>
					<div class="card mb-4">
						<div class="card-header">
							<i class="fas fa-table me-1"></i> Thông Tin Khách Hàng
						</div>
						<div class="card-body">
							<form class="container" action="" method="post">
								<div class="row">
									<input type="hidden" name="maKH" value=${getUserEdit.maKH } />
									<div class="col-md-6 mb-3">
										<label for="validationServer023">Họ và Tên</label> <input
											type="fullname" class="form-control" id="validationServer023"
											placeholder="Nhập họ tên..." name="hoTen"
											value="${getUserEdit.hoTen}">
									</div>
									<div class="col-md-6 mb-3">
										<label for="validationServer013">Số điện thoại</label> <input
											type="text" class="form-control" id="validationServer013"
											placeholder="Nhập số điện thoại..." name="soDienThoai"
											${disableID?'readonly':''} value="${getUserEdit.soDienThoai}">
									</div>
									<div class="col-md-6 mb-3">
										<label for="validationServer023">Địa chỉ</label> <input
											type="text" class="form-control" id="validationServer023"
											placeholder="Nhập địa chỉ..." name="diaChi"
											value="${getUserEdit.diaChi}">
									</div>
									<div class="col-md-6 mb-3">
										<label for="validationServer023">Email</label> <input
											type="email" class="form-control" id="validationServer023"
											placeholder="Nhập email..." name="email"
											value="${getUserEdit.email}">
									</div>
									<fmt:formatDate pattern="yyyy-MM-dd"
										value="${getUserEdit.ngaySinh}" var="ngaySinhFormatted" />
									<div class="col-md-6 col-xs-12">
										<label for="validationServer023">Ngày sinh</label> <input
											type="date" class="form-control" id="validationServer023"
											placeholder="Nhập ngày sinh..." name="ngaySinh"
											value="${ngaySinhFormatted }">
									</div>
									<div class="col-md-6 col-xs-12 row">
										<div class="col-md-4 col-xs-12">
											<label for="">Giới tính:</label>
											<div class="d-flex">
												<div class="form-check form-check-inline">
													<input class="form-check-input" type="radio"
														name="gioiTinh" id="nam"
														${getUserEdit.gioiTinh.equals("Nam")?'checked':''}
														value="Nam"> <label class="form-check-label"
														for="nam">Nam</label>
												</div>
												<div class="form-check form-check-inline">
													<input class="form-check-input" type="radio"
														name="gioiTinh" id="nu"
														${getUserEdit.gioiTinh.equals("Nữ")?'checked':''}
														value="Nữ"> <label class="form-check-label"
														for="nu">Nữ</label>
												</div>
											</div>
										</div>
										<div class="col-md-4 col-xs-12">
											<label for="">Vai trò:</label>
											<div class="d-flex">
												<div class="form-check form-check-inline">
													<input class="form-check-input" type="radio" name="role"
														id="admin" ${getUserEdit.role==true?'checked':''}
														value="true"> <label class="form-check-label"
														for="admin">Admin</label>
												</div>
												<div class="form-check form-check-inline">
													<input class="form-check-input" type="radio" name="role"
														id="user" ${getUserEdit.role==false?'checked':''}
														value="false"> <label
														class="form-check-label text-nowrap" for="user">Người
														dùng</label>
												</div>
											</div>
										</div>
									</div>

								</div>
								<hr>
								<div class="form-row">
									<button class="btn btn-primary mb-2 mt-3"
										${statusUser==false? 'disabled':'' }
										formaction="${pageContext.request.contextPath }/admin/quan-ly-nguoi-dung/them-moi">Thêm
										mới</button>
									<button class="btn btn-warning mb-2 mt-3"
										${statusUser==true? 'disabled':'' }
										formaction="${pageContext.request.contextPath }/admin/quan-ly-nguoi-dung/cap-nhat">Cập
										nhật</button>
									<button class="btn btn-danger mb-2 mt-3"
										${statusUser==true? 'disabled':'' }
										formaction="${pageContext.request.contextPath }/admin/quan-ly-nguoi-dung/delete">Delete</button>
									<button class="btn btn-dark mb-2 mt-3"
										formaction="${pageContext.request.contextPath }/admin/quan-ly-nguoi-dung/reset">Reset</button>
								</div>
							</form>
							<div class="table-responsive">
								<table id="datatablesSimple"
									class="table table-hover table-striped">
									<thead>
										<tr>
											<th>Họ và Tên</th>
											<th>Giới Tính</th>
											<th>Số Điện Thoại</th>
											<th>Email</th>
											<th>Địa Chỉ</th>
											<th>Ngày Sinh</th>
											<th>Vai Trò</th>
											<th>Thao Tác</th>
										</tr>
									</thead>
									<tfoot>
										<tr>
											<th>Họ và Tên</th>
											<th>Giới Tính</th>
											<th>Số Điện Thoại</th>
											<th>Email</th>
											<th>Địa Chỉ</th>
											<th>Ngày Sinh</th>
											<th>Vai Trò</th>
											<th>Thao Tác</th>
										</tr>
									</tfoot>
									<tbody>
										<c:forEach var="user" items="${listUsers}">
											<tr>
												<td>${user.hoTen}</td>
												<td>${user.gioiTinh}</td>
												<td>${user.soDienThoai}</td>
												<td>${user.email}</td>
												<td>${user.diaChi}</td>
												<td><fmt:formatDate pattern="dd-MM-yyyy"
														value="${user.ngaySinh}" /></td>
												<td>${user.role==false?'Người dùng':'Admin'}</td>
												<td><a
													href="${pageContext.request.contextPath }/admin/quan-ly-nguoi-dung/edit/?id=${user.maKH }"><i
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