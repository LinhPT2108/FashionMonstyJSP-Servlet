<%@page import="org.hibernate.internal.build.AllowSysOut"%>
<%@page import="Utils.Login"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<div class="container-xxl py-5">
	<div class="container">
		<div class="row g-0 gx-5 align-items-end">
			<div class="col-lg-6">
				<div class="section-header text-start mb-5 wow fadeInUp"
					data-wow-delay="0.1s" style="max-width: 500px;">
					<h1 class="display-5 mb-3">Sản Phẩm</h1>
					<p>Sản phẩm thời trang uy tín và chất lượng.</p>
				</div>
			</div>
			<div class="col-lg-6 text-start text-lg-end wow slideInRight"
				data-wow-delay="0.1s">
				<ul class="nav nav-pills d-inline-flex justify-content-end mb-5">
					<li class="nav-item me-2"><a
						class="btn btn-outline-primary border-2 active"
						data-bs-toggle="pill" href="#tab-1">Áo</a></li>
					<li class="nav-item me-2"><a
						class="btn btn-outline-primary border-2" data-bs-toggle="pill"
						href="#tab-2">Quần </a></li>
					<li class="nav-item me-0"><a
						class="btn btn-outline-primary border-2" data-bs-toggle="pill"
						href="#tab-3">Giày</a></li>
				</ul>
			</div>
		</div>
		<div class="tab-content">
			<div id="tab-1" class="tab-pane fade show p-0 active">
				<div class="row g-4">
					<c:forEach var="aothun" items="${AoThuns }">
						<div class="col-xl-3 col-lg-4 col-md-6 wow fadeInUp"
							data-wow-delay="0.1s">
							<div class="product-item">
								<div class="position-relative bg-light overflow-hidden">
									<img class="img-fluid w-100"
										src="${pageContext.request.contextPath}/resources/img/${aothun.getAnhSP()[0].anhSP} " />
									<div
										class="bg-secondary rounded text-white position-absolute start-0 top-0 m-4 py-1 px-3">
										New</div>
								</div>
								<div class="text-center p-4">
									<a class="d-block h5 mb-2"
										href="${pageContext.request.contextPath}/san-pham/?id=${aothun.maSP}">${aothun.tenSP }</a>
									<span class="text-danger me-1"><fmt:formatNumber
											type="number" pattern="###,###"
											value="${aothun.giaBan*(1-aothun.giamGia)}" /> đ</span> <span
										class="text-body text-decoration-line-through">${aothun.giaBan }
										đ</span>
								</div>
								<div class="d-flex border-top">
									<small class="w-50 text-center border-end py-2"> <a
										class="text-body"
										href="${pageContext.request.contextPath}/san-pham/?id=${aothun.maSP}"><i
											class="fa fa-eye text-primary me-2"></i>Xem chi tiết</a>
									</small> <small class="w-50 text-center py-2"> <%
 if (Login.isLogin) {
 %> <a role="button"
										href="${pageContext.request.contextPath}/tai-khoan/them-vao-gio/?id=${aothun.maSP}"
										class="text-body" type="button"> <i
											class="fa fa-shopping-bag text-primary me-2"></i>Thêm vào giỏ
											hàng
									</a> <%
 } else {
 %>
										<button class="text-body p-0 border-0 bg-transparent"
											type="button" data-bs-toggle="modal" data-bs-target="#login">
											<i class="fa fa-shopping-bag text-primary me-2"></i>Thêm vào
											giỏ hàng
										</button> <%
 }
 %>
									</small>
								</div>
							</div>
						</div>
					</c:forEach>
					<div class="col-12 text-center wow fadeInUp" data-wow-delay="0.1s">
						<a class="btn btn-primary rounded-pill py-3 px-5" href="">Xem
							thêm</a>
					</div>
				</div>
			</div>

			<div id="tab-2" class="tab-pane fade show p-0">
				<div class="row g-4">
					<c:forEach var="productQuan" items="${Quans }">
						<div class="col-xl-3 col-lg-4 col-md-6 wow fadeInUp"
							data-wow-delay="0.1s">
							<div class="product-item">
								<div class="position-relative bg-light overflow-hidden">
									<img class="img-fluid w-100"
										src="${pageContext.request.contextPath}/resources/img/${productQuan.getAnhSP()[0].anhSP}"
										alt="">
									<div
										class="bg-secondary rounded text-white position-absolute start-0 top-0 m-4 py-1 px-3">
										New</div>
								</div>
								<div class="text-center p-4">
									<a class="d-block h5 mb-2"
										href="${pageContext.request.contextPath}/san-pham/?id=${productQuan.maSP}">${productQuan.tenSP }</a>
									<span class="text-danger me-1"><fmt:formatNumber
											type="number" pattern="###,###"
											value="${productQuan.giaBan*(1-productQuan.giamGia)}" /> đ</span> <span
										class="text-body text-decoration-line-through">${productQuan.giaBan }
										đ</span>
								</div>
								<div class="d-flex border-top">
									<small class="w-50 text-center border-end py-2"> <a
										class="text-body"
										href="${pageContext.request.contextPath}/san-pham/?id=${productQuan.maSP}"><i
											class="fa fa-eye text-primary me-2"></i>Xem chi tiết</a>
									</small> <small class="w-50 text-center py-2"> <%
 if (Login.isLogin) {
 %> <a role="button"
										href="${pageContext.request.contextPath}/tai-khoan/them-vao-gio/?id=${productQuan.maSP}"
										class="text-body" type="button"> <i
											class="fa fa-shopping-bag text-primary me-2"></i>Thêm vào giỏ
											hàng
									</a> <%
 } else {
 %>
										<button class="text-body p-0 border-0 bg-transparent"
											type="button" data-bs-toggle="modal" data-bs-target="#login">
											<i class="fa fa-shopping-bag text-primary me-2"></i>Thêm vào
											giỏ hàng
										</button> <%
 }
 %>
									</small>
								</div>
							</div>
						</div>
					</c:forEach>

					<div class="col-12 text-center">
						<a class="btn btn-primary rounded-pill py-3 px-5" href="">Xem
							thêm</a>
					</div>
				</div>
			</div>
			<div id="tab-3" class="tab-pane fade show p-0">
				<div class="row g-4">
					<c:forEach var="productGiay" items="${GiayS}">
						<div class="col-xl-3 col-lg-4 col-md-6 wow fadeInUp"
							data-wow-delay="0.1s">
							<div class="product-item">
								<div class="position-relative bg-light overflow-hidden">
									<img class="img-fluid w-100"
										src="${pageContext.request.contextPath}/resources/img/${productGiay.getAnhSP()[0].anhSP}"
										alt="">
									<div
										class="bg-secondary rounded text-white position-absolute start-0 top-0 m-4 py-1 px-3">
										New</div>
								</div>
								<div class="text-center p-4">
									<a class="d-block h5 mb-2"
										href="${pageContext.request.contextPath}/san-pham/?id=${productGiay.maSP}">${productGiay.tenSP }</a>
									<span class="text-danger me-1"><fmt:formatNumber
											type="number" pattern="###,###"
											value="${productGiay.giaBan*(1-productGiay.giamGia)}" /> đ</span> <span
										class="text-body text-decoration-line-through">${productGiay.giaBan }
										đ</span>
								</div>
								<div class="d-flex border-top">
									<small class="w-50 text-center border-end py-2"> <a
										class="text-body"
										href="${pageContext.request.contextPath}/san-pham/?id=${productGiay.maSP}"><i
											class="fa fa-eye text-primary me-2"></i>Xem chi tiết</a>
									</small> <small class="w-50 text-center py-2"> <%
 if (Login.isLogin) {
 %> <a role="button"
										href="${pageContext.request.contextPath}/tai-khoan/them-vao-gio/?id=${productGiay.maSP}"
										class="text-body" type="button"> <i
											class="fa fa-shopping-bag text-primary me-2"></i>Thêm vào giỏ
											hàng
									</a> <%
 } else {
 %>
										<button class="text-body p-0 border-0 bg-transparent"
											type="button" data-bs-toggle="modal" data-bs-target="#login">
											<i class="fa fa-shopping-bag text-primary me-2"></i>Thêm vào
											giỏ hàng
										</button> <%
 }
 %>
									</small>
								</div>
							</div>
						</div>
					</c:forEach>
					<div class="col-12 text-center">
						<a class="btn btn-primary rounded-pill py-3 px-5" href="">Xem
							thêm</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>