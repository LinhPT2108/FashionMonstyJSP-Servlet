<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Login - Admin</title>
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
	rel="stylesheet" />
<link
	href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap"
	rel="stylesheet" />
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.4.0/mdb.min.css"
	rel="stylesheet" />
</head>

<body>
	<section class="h-100 gradient-form">
		<div class="container py-5 h-100">
			<div
				class="row d-flex justify-content-center align-items-center h-100">
				<div class="col-xl-10">
					<div class="card rounded-3 text-black">
						<div class="row g-0">
							<div class="col-lg-6">
								<div class="card-body p-md-5 mx-md-4">

									<div class="text-center">
										<img
											src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-login-form/lotus.webp"
											style="width: 185px;" alt="logo">
										<h4 class="mt-1 mb-5 pb-1">We are The Fashion Monsty</h4>
									</div>

									<form action="${pageContext.request.contextPath }/admin/dang-nhap" method="post">
										<div class="form-outline mb-4">
											<input type="email" id="form2Example11" name="username" value="${username }"
												class="form-control py-2" /> <label class="form-label" 
												for="form2Example11">Email</label>
										</div>

										<div class="form-outline mb-4">
											<input type="password" id="form2Example22" name="password" value="${password }"
												class="form-control py-2" /> <label class="form-label"
												for="form2Example22">Mật khẩu</label>
										</div>
										<div class="text-danger">${error}</div>
										<div class="form-check mb-3">
											<input class="form-check-input me-2" type="checkbox"
												id="remember" name="remember" value="remember" /> <label
												class="form-check-label" for="remember"> Duy trì
												đăng nhập </label>
										</div>
										<div class="text-center pt-1 mb-5 pb-1">
											<button
												class="btn btn-primary btn-block fa-lg btn-success mb-3 fs-5"
												type="submit">Đăng Nhập</button>
											<a class="text-muted"
												href="${pageContext.request.contextPath }/admin/lay-lai-mat-khau">Quên
												mật khẩu?</a>
										</div>

									</form>

								</div>
							</div>
							<div class="col-lg-6 d-flex align-items-center bg-success">
								<div class="text-white px-3 py-4 p-md-5 mx-md-4 w-100">
									<h4 class="mb-4 text-center">
										Chào mừng bạn đến với trang <br> quản trị <strong
											style="color: black">Fashion Monsty</strong>
									</h4>
									<p class="small mb-0"></p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.4.0/mdb.min.js"></script>
</body>

</html>