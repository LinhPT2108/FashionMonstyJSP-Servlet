<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<title>Fashion Monsty - Giỏ hàng</title>
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
</head>

<body>

	<%@include file="../layout/spinner.jsp"%>

	<%@include file="../layout/header.jsp"%>

	<div class="container mb-5"
		style="margin-top: 150px; min-height: 300px">
		<c:if test="${empty cart.products}">
			<h3 class="text-success text-center">Giỏ hàng trống !</h3>
		</c:if>

		<c:if test="${not empty cart.products}">
			<div class="card mb-4">
				<div class="card-header">
					<i class="fas fa-table me-1"></i> Giỏ hàng
				</div>
				<div class="card-body p-0">
					<div class="table-responsive">
						<table id="datatablesSimple"
							class="table table-hover table-striped mb-0">
							<tr>
								<th class="text-center">STT</th>
								<th>Tên sản phẩm</th>
								<th class="text-center">Giá bán</th>
								<th class="text-center">Thao tác</th>
							</tr>
							<c:forEach var="product" items="${cart.products}"
								varStatus="status">
								<tr>
									<td class="text-center">${status.index+1 }</td>
									<td>${product.tenSP}</td>
									<td class="text-center">${product.giaBan}</td>
									<td class="text-center"><a
										href="${pageContext.request.contextPath }/tai-khoan/xoa-khoi-gio/?id=${product.maSP }"><i
											class="fa-solid fa-trash"></i> Xóa</a></td>
								</tr>
							</c:forEach>
						</table>
					</div>
				</div>
			</div>
			<div class="d-flex justify-content-end">
				<button class="btn btn-danger mb-3">Thanh Toán</button>
			</div>
		</c:if>
	</div>


	<%@include file="../layout/footer.jsp"%>

	<%@include file="../layout/backToTop.jsp"%>

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
</body>

</html>