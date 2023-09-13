<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
	<div class="sb-sidenav-menu">
		<div class="nav">
			<div class="sb-sidenav-menu-heading">Quản lý</div>
			<a class="nav-link"
				href="${pageContext.request.contextPath }/admin/quan-ly-nguoi-dung">
				<div class="sb-nav-link-icon">
					<i class="fas fa-chart-area"></i>
				</div> Người dùng
			</a> <a class="nav-link"
				href="${pageContext.request.contextPath }/admin/quan-ly-san-pham">
				<div class="sb-nav-link-icon">
					<i class="fas fa-table"></i>
				</div> Sản phẩm
			</a> <a class="nav-link"
				href="${pageContext.request.contextPath }/admin/quan-ly-loai-san-pham">
				<div class="sb-nav-link-icon">
					<i class="fas fa-table"></i>
				</div> Loại sản phẩm
			</a>
			<div class="sb-sidenav-menu-heading">Thống kê</div>
			<a class="nav-link" href="#!">
				<div class="sb-nav-link-icon">
					<i class="fas fa-chart-area"></i>
				</div> Sản phẩm bán chạy
			</a> <a class="nav-link" href="#!">
				<div class="sb-nav-link-icon">
					<i class="fas fa-table"></i>
				</div> Sản phẩm hot nhất
			</a> <a class="nav-link" href="#!">
				<div class="sb-nav-link-icon">
					<i class="fas fa-table"></i>
				</div> Sản phẩm mới
			</a><a class="nav-link"
				href="${pageContext.request.contextPath }/admin/thong-ke-doanh-thu">
				<div class="sb-nav-link-icon">
					<i class="fas fa-table"></i>
				</div> Doanh thu
			</a>
		</div>
	</div>
	<div class="sb-sidenav-footer">
		<div class="small">Logged in as:</div>
		${getUser.hoTen }
	</div>
</nav>