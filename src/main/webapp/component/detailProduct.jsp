<%@page import="Utils.Login"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Chi tiết sản phẩm</title>
<link rel="stylesheet" type="text/css"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">

<link
	href="${pageContext.request.contextPath}/resources/img/favicon.ico"
	rel="icon">

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;500&family=Lora:wght@600;700&display=swap"
	rel="stylesheet">

<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
	rel="stylesheet">

<link
	href="${pageContext.request.contextPath}/resources/lib/animate/animate.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/lib/owlcarousel/assets/owl.carousel.min.css"
	rel="stylesheet">

<link
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css"
	rel="stylesheet">

<link href="${pageContext.request.contextPath}/resources/css/style.css"
	rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/detail-product.css">
</head>
<body>
	<%@include file="../layout/spinner.jsp"%>
	<%@include file="../layout/header.jsp"%>
	<div class="mb-5 container h-150px">
		<div class="row d-flex justify-content-center">
			<div class="card">
				<div class="row">
					<div class="col-lg-6 col-md-12 p-0 m-0"
						style="background-color: rgb(238, 238, 238);">
						<div class="images p-3">
							<div class="text-center p-4">
								<img id="main-image"
									src="${pageContext.request.contextPath}/resources/img/${sp_detail.getAnhSP().get(0).anhSP}"
									width="480" />
							</div>
							<div class="thumbnail text-center">
								<c:forEach var="imageProduct" items="${sp_detail.getAnhSP()}">
									<img onclick="change_image(this)"
										src="${pageContext.request.contextPath}/resources/img/${imageProduct.anhSP}"
										width="70">
								</c:forEach>
							</div>
						</div>
					</div>
					<div class="col-lg-6 col-md-12 p-0">
						<div class="product h-100 p-4">
							<div class="d-flex justify-content-between align-items-center">
								<div class="d-flex align-items-center fs-4">
									<a href="${pageContext.request.contextPath}/san-pham"
										class="btn p-0" role="button"><i class="bi bi-arrow-left"></i>
										<span class="ml-1">Back</span></a>
								</div>
							</div>
							<div class="mt-4 mb-3">
								<span class="text-uppercase text-muted brand fs-4 lh-lg">JEAN</span>
								<h3 class="text-uppercase lh-lg">${sp_detail.tenSP }</h3>
								<div class="price d-flex flex-row align-items-center">
									<span class="act-price text-danger"><fmt:formatNumber
											type="number" pattern="###,###"
											value="${sp_detail.giaBan*(1-sp_detail.giamGia)}" /> đ</span>
									<div class="ml-2">
										<small class="dis-price me-1"><fmt:formatNumber
												type="number" pattern="###,###" value="${sp_detail.giaBan }" />
											đ</small> <span> <fmt:formatNumber type="number" pattern="##"
												value="${sp_detail.giamGia*100}" />% <strong
											class="text-secondary">OFF</strong>
										</span>
									</div>
								</div>
							</div>
							<br />
							<div class="about">
								<h3 class="text-primary">Đặc điểm nổi bật</h3>
								<h5>
									<span class="lh-lg">- Chất liệu tốt.</span> <br> <span
										class="lh-lg">- đẹp hơn, bền hơn, mượt hơn gấp 2 lần
										Cotton thường.</span> <br> <span class="lh-lg">- Không
										nhăn, không co rút sau giặt.</span> <br> <span class="lh-lg">-
										Tỉ mỉ trong từng đường may, đảm bảo sẽ không còn chỉ thừa. </span> <br>
									<span class="lh-lg"> - Pha Spandex giúp co giãn 4 chiều
										theo từng đường nét cử động.</span> <br>
								</h5>
							</div>

							<div class="sizes mt-5">
								<h6 class="text-uppercase">Size</h6>
								<label class="radio"> <input type="radio" name="size"
									value="S" checked> <span>S</span>
								</label> <label class="radio"> <input type="radio" name="size"
									value="M"> <span>M</span>
								</label> <label class="radio"> <input type="radio" name="size"
									value="L"> <span>L</span>
								</label> <label class="radio"> <input type="radio" name="size"
									value="XL"> <span>XL</span>
								</label> <label class="radio"> <input type="radio" name="size"
									value="XXL"> <span>XXL</span>
								</label>
							</div>
							<div class="cart mt-4 align-items-center">
								<%
								if (Login.isLogin) {
								%>
								<a role="button"
									href="${pageContext.request.contextPath}/tai-khoan/them-vao-gio/?id=${sp_detail.maSP}"
									class="btn btn-danger text-uppercase mr-2 px-4" type="button">
									<i class="fa fa-shopping-bag text-primary me-2"></i>Thêm vào
									giỏ hàng
								</a>
								<%
								} else {
								%>
								<button class="btn btn-danger text-uppercase mr-2 px-4"
									type="button" data-bs-toggle="modal" data-bs-target="#login">
									<i class="fa fa-shopping-bag text-white me-2"></i>Thêm vào
									giỏ hàng
								</button>
								<%
								}
								%>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="login" data-bs-backdrop="static"
		data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="staticBackdropLabel">Thông
						báo</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">Bạn cần phải đăng nhập để thực hiện
					chức năng này !</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Hủy</button>
					<a role="button"
						href="${pageContext.request.contextPath}/tai-khoan/dang-nhap"
						class="btn btn-primary">Đồng ý</a>
				</div>
			</div>
		</div>
	</div>
	<%@include file="../layout/footer.jsp"%>
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/lib/wow/wow.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/lib/easing/easing.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/lib/waypoints/waypoints.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/lib/owlcarousel/owl.carousel.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
	<script type="text/javascript">
		function change_image(image) {
			var container = document.getElementById("main-image");
			container.src = image.src;
		}
		document.addEventListener("DOMContentLoaded", function(event) {
		});
	</script>
</body>
</html>