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

	<section style="margin-top: 100px">
		<div class="container-fluid h-custom">
			<div
				class="row d-flex justify-content-center align-items-center h-100">
				<div class="col-md-9 col-lg-6 col-xl-5">
					<img
						src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-login-form/draw2.webp"
						class="img-fluid" alt="Sample image">
				</div>
				<div class="col-md-8 col-lg-6 col-xl-4 offset-xl-1">
					<form action="dang-nhap" method="post">
						<div
							class="d-flex flex-row align-items-center justify-content-center justify-content-lg-start">
							<p class="lead fw-normal mb-0 me-3">Đăng nhập với</p>
							<button type="button" class="btn btn-primary btn-floating mx-1">
								<i class="fab fa-facebook-f"></i>
							</button>

							<button type="button" class="btn btn-primary btn-floating mx-1">
								<i class="fab fa-twitter"></i>
							</button>

							<button type="button" class="btn btn-primary btn-floating mx-1">
								<i class="fab fa-linkedin-in"></i>
							</button>
						</div>

						<div class="divider d-flex align-items-center my-4">
							<p class="text-center fw-bold mx-3 mb-0">Hoặc</p>
						</div>

						<div class="form-outline mb-4">
							<input type="email" id="username"
								class="form-control form-control-lg" name="username" value="${username }"/> <label
								class="form-label" for="username">Email</label>
						</div>
						<div class="form-outline mb-3">
							<input type="password" id="password"
								class="form-control form-control-lg" name="password" value="${password }"/> <label
								class="form-label" for="password">Mật Khẩu</label>
						</div>
						<div class="error text-danger">${error}</div>
						<div class="d-flex justify-content-between align-items-center">
							<div class="form-check mb-0">
								<input class="form-check-input me-2" type="checkbox"
									id="remember" name="remember" /> <label class="form-check-label"
									for="remember"> Duy trì đăng nhập </label>
							</div>
							<a
								href="${pageContext.request.contextPath }/tai-khoan/quen-mat-khau"
								class="text-body">Quên mật khẩu?</a>
						</div>

						<div class="text-center text-lg-start mt-4 pt-2">
							<button type="submit" class="btn btn-primary btn-lg"
								style="padding-left: 2.5rem; padding-right: 2.5rem;">Đăng
								Nhập</button>
							<p class="small fw-bold mt-2 pt-1 mb-0">
								Chưa có tài khoản? <a
									href="${pageContext.request.contextPath }/tai-khoan/dang-ky"
									class="link-danger">Đăng ký ngay</a>
							</p>
						</div>
					</form>
				</div>
			</div>
		</div>
	</section>

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