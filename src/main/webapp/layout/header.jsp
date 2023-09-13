<%@page import="org.hibernate.internal.build.AllowSysOut"%>
<%@page import="Controllers.HQLSOption"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="javax.servlet.http.HttpSession"%>

<div class="container-fluid fixed-top px-0 wow fadeIn"
	data-wow-delay="0.1s">
	<div class="top-bar row gx-0 align-items-center d-none d-lg-flex">
		<div class="col-lg-6 px-5 text-start">
			<small><i class="fa fa-map-marker-alt me-2"></i>158/22/36
				Nguyễn Việt Hồng, An Phú, Ninh Kiều, TP. Cần Thơ</small> <small class="ms-4"><i
				class="fa fa-envelope me-2"></i>LinhptPC04737@fpt.edu.vn</small>
		</div>
		<div class="col-lg-6 px-5 text-end">
			<small>Follow us:</small> <a class="text-body ms-3"
				href="https://facebook.com/zenolka"> <i
				class="fab fa-facebook-f"></i>
			</a> <a class="text-body ms-3" href=""> <i class="fab fa-twitter"></i>
			</a> <a class="text-body ms-3" href=""><i class="fab fa-linkedin-in"></i></a>
			<a class="text-body ms-3" href=""><i class="fab fa-instagram"></i></a>
		</div>
	</div>

	<nav
		class="navbar navbar-expand-lg navbar-light py-lg-0 px-lg-5 wow fadeIn"
		data-wow-delay="0.1s">
		<a href="${pageContext.request.contextPath }/trang-chu"
			class="navbar-brand ms-4 ms-lg-0">
			<h1 class="fw-bold text-success m-0">
				F<span class="text-warning">a</span>sh<span class="text-warning">io</span>n
				M<span class="text-warning">o</span>nsty
			</h1>
		</a>
		<button type="button" class="navbar-toggler me-4"
			data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarCollapse">
			<div class="navbar-nav ms-auto p-4 p-lg-0">
				<a href="${pageContext.request.contextPath }/trang-chu"
					class="nav-item nav-link active">Trang Chủ</a> <a
					href="${pageContext.request.contextPath }/gioi-thieu"
					class="nav-item nav-link">Giới Thiệu</a> <a
					href="${pageContext.request.contextPath }/san-pham"
					class="nav-item nav-link">Sản Phẩm</a> <a
					href="${pageContext.request.contextPath }/lien-he"
					class="nav-item nav-link">Liên Hệ</a>
				<%
				session = request.getSession();
				String userID = (String) session.getAttribute("username");
				System.out.println(userID);
				if ((String) session.getAttribute("username") == null) {
				%>
				<a href="${pageContext.request.contextPath }/tai-khoan/dang-nhap"
					class="nav-item nav-link">Đăng Nhập</a> <a
					href="${pageContext.request.contextPath }/tai-khoan/dang-ky"
					class="nav-item nav-link">Đăng Ký</a>
				<%
				} else {
				%>

				<div class="nav-item dropdown">
					<a href="#" class="nav-link dropdown-toggle"
						data-bs-toggle="dropdown"><small class="fa fa-user text-body"></small>&nbsp;
						${getUser.hoTen }</a>

					<div class="dropdown-menu m-0">
						<a class="dropdown-item btn" data-bs-toggle="modal"
							data-bs-target="#staticBackdrop">Cập nhật tài khoản</a> <a
							href="${pageContext.request.contextPath }/tai-khoan/gio-hang"
							class="dropdown-item">Giỏ hàng</a> <a
							href="${pageContext.request.contextPath }/tai-khoan/dang-xuat"
							class="dropdown-item">Đăng xuất</a>
					</div>
				</div>
				<%
				}
				%>
			</div>
			<div class="d-none d-lg-flex ms-2">
				<a class="btn-sm-square bg-white rounded-circle ms-3" href=""> <small
					class="fa fa-search text-body"></small>
				</a>
			</div>
		</div>
	</nav>
</div>

<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static"
	data-bs-keyboard="false" tabindex="-1"
	aria-labelledby="staticBackdropLabel" aria-hidden="true">
	<div class="modal-dialog modal-xl">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="staticBackdropLabel">CẬP NHẬT THÔNG
					TIN</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<form
					action="${pageContext.request.contextPath }/tai-khoan/cap-nhat-thong-tin"
					method="post">
					<div class="row">
						<div class="col-md-6 mb-3">
							<label for="validationServer013username">Tài khoản</label> <input
								type="text" class="form-control" id="validationServer013username"
								placeholder="Username" name="username" readonly
								value="${getUser.maKH}">
						</div>
						<div class="col-md-6 mb-3">
							<label for="validationServer023password">Mật khẩu</label> <input
								type="password" class="form-control" id="validationServer023password"
								placeholder="Password" name="password"
								value="${getUser.matKhau}">
						</div>
						<div class="col-md-6 mb-3">
							<label for="validationServer023fullname">Họ và Tên</label> <input
								type="fullname" class="form-control" id="validationServer023fullname"
								placeholder="Fullname" name="fullname" value="${getUser.hoTen}">
						</div>
						<div class="col-md-6 mb-3">
							<label for="validationServer023email">Email</label> <input
								type="email" class="form-control" id="validationServer023email"
								placeholder="Email" name="email" value="${getUser.email}">
						</div>
						<div class="col-md-6 mb-3">
							<label for="validationServer013soDienThoai">Số điện thoại</label> <input
								type="text" class="form-control" id="validationServer013soDienThoai"
								placeholder="Nhập số điện thoại..." name="soDienThoai"
								value="${getUser.soDienThoai}">
						</div>
						<div class="col-md-6 mb-3">
							<label for="validationServer023diaChi">Địa chỉ</label> <input
								type="text" class="form-control" id="validationServer023diaChi"
								placeholder="Nhập địa chỉ..." name="diaChi"
								value="${getUser.diaChi}">
						</div>
					</div>
					<hr>
					<div class="form-row">
						<button class="btn btn-danger" data-bs-dismiss="modal">Hủy</button>
						<button type="submit" class="btn btn-primary">Lưu lại</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>