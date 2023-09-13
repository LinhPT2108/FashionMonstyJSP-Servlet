<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Fashion Monsty - Đăng ký thành viên</title>
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

	<section style="margin-top: 150px;" style="background-color: #eee;">
		<div class="container h-100">
			<div
				class="row d-flex justify-content-center align-items-center h-100">
				<div class="col-lg-12 col-xl-11">
					<div class="card text-black" style="border-radius: 25px;">
						<div class="card-body p-md-5">
							<div class="row justify-content-center">
								<div class="col-md-10 col-lg-6 col-xl-5 order-2 order-lg-1">

									<p
										class="text-center text-primary h1 fw-bold mb-5 mx-1 mx-md-4 mt-4">
										Đăng Ký Thành Viên</p>

									<form action="dang-ky" method="post" class="mx-1 mx-md-4">

										<div class="d-flex flex-row align-items-center mb-4">
											<i class="fas fa-user fa-lg me-3 fa-fw"></i>
											<div class="form-outline flex-fill mb-0">
												<input type="text" id="fullname" name="fullname"
													value="${fullname }" class="form-control" /> <label
													class="form-label" for="fullname">Họ và Tên</label>
											</div>
										</div>
										<div class="mb-4">
											<div class="d-flex flex-row align-items-center">
												<i class="fas fa-envelope fa-lg me-3 fa-fw"></i>
												<div class="form-outline flex-fill mb-0">
													<input type="email" id="email" name="email"
														value="${email }" class="form-control" /> <label
														class="form-label" for="email">Email</label>
												</div>
											</div>
											<div class="text-danger"
												style="margin-left: 2.5rem !important;">${errorEmail }</div>
										</div>

										<div class="d-flex flex-row align-items-center mb-4">
											<i class="fas fa-lock fa-lg me-3 fa-fw"></i>
											<div class="form-outline flex-fill mb-0">
												<input type="password" id="password" name="password"
													value="${password }" class="form-control" /> <label
													class="form-label" for="password">Mật Khẩu</label>
											</div>
										</div>
										<div class="mb-4">
											<div class="d-flex flex-row align-items-center">
												<i class="fas fa-key fa-lg me-3 fa-fw"></i>
												<div class="form-outline flex-fill mb-0">
													<input type="password" id="confirmPassword"
														value="${confirmPassword }" name="confirmPassword"
														class="form-control" /> <label class="form-label"
														for="confirmPassword">Nhập Lại Mật Khẩu</label>
												</div>
											</div>
											<div class="text-danger"
												style="margin-left: 2.5rem !important;">${errorPassword }</div>
										</div>
										<div class="form-check d-flex justify-content-center mb-3">
											<input class="form-check-input me-2" type="checkbox" value=""
												id="termsOfService" /> <label class="form-check-label"
												for="termsOfService"> Tôi đồng ý với tất cả <a
												href="#!">Điều khoản Dịch vụ.</a>
											</label>
										</div>

										<div class="text-center text-lg-center mt-1 pt-2">
											<button type="submit" class="btn btn-primary btn-lg"
												style="padding-left: 2.5rem; padding-right: 2.5rem;">Đăng
												Ký</button>
											<p class="small fw-bold mt-2 pt-1 mb-0">
												Đã có tài khoản? <a
													href="${pageContext.request.contextPath }/dang-nhap"
													class="link-danger">Đăng nhập ngay</a>
											</p>
										</div>

									</form>

								</div>
								<div
									class="col-md-10 col-lg-6 col-xl-7 d-flex align-items-center order-1 order-lg-2">

									<img
										src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-registration/draw1.webp"
										class="img-fluid" alt="Sample image">

								</div>
							</div>
						</div>
					</div>
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