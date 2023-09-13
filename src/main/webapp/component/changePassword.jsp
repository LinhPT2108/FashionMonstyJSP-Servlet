<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Fashion Monsty - Đăng nhập</title>
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
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
	rel="stylesheet" />
<link
	href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap"
	rel="stylesheet" />
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.4.0/mdb.min.css"
	rel="stylesheet" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/style.css">
</head>

<body>

	<%@include file="../layout/spinner.jsp"%>

	<%@include file="../layout/header.jsp"%>

	<div class="d-flex" style="margin-top: 150px">
		<form class="m-auto" style="width: 700px">
			<h3 class="text-primary">THÔNG TIN CÁ NHÂN</h3>
			<div class="row mb-4">
				<div class="col">
					<div class="form-outline">
						<input type="text" id="form6Example1" class="form-control" /> <label
							class="form-label" for="form6Example1">Họ và tên đệm</label>
					</div>
				</div>
				<div class="col">
					<div class="form-outline">
						<input type="text" id="form6Example2" class="form-control" /> <label
							class="form-label" for="form6Example2">Tên</label>
					</div>
				</div>
			</div>
			<div class="form-outline mb-4">
				<input type="date" id="form6Example4" class="form-control" /> <label
					class="form-label" for="form6Example4">Ngày sinh</label>
			</div>
			<div class="form-outline mb-4">
				<input type="email" id="form6Example5" class="form-control" /> <label
					class="form-label" for="form6Example5">Email</label>
			</div>
			<div class="form-outline mb-4">
				<input type="number" id="form6Example6" class="form-control" /> <label
					class="form-label" for="form6Example6">Số điện thoại</label>
			</div>
			<div class="form-outline mb-4">
				<textarea class="form-control" id="form6Example7" rows="4"></textarea>
				<label class="form-label" for="form6Example7">Địa chỉ</label>
			</div>
			<button type="submit" class="btn btn-primary btn-block mb-4">Lưu
				Lại</button>
		</form>
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

	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.4.0/mdb.min.js"></script>
</body>

</html>