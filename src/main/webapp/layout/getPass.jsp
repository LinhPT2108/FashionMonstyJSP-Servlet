<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
									Quên Mật Khẩu</p>
								<form class="mx-1 mx-md-4"
									action="${pageContext.request.contextPath}/tai-khoan/quen-mat-khau"
									method="post">
									<div class="d-flex flex-row align-items-center mb-4">
										<i class="fas fa-envelope fa-lg me-3 fa-fw"></i>
										<div class="form-outline flex-fill mb-0">
											<input type="email" id="email" name="email"
												class="form-control" /> <label class="form-label"
												for="email">Email</label>
										</div>
									</div>
									<div class="text-center text-lg-center mt-1 pt-2">
										<button type="submit" class="btn btn-primary btn-lg"
											style="padding-left: 2.5rem; padding-right: 2.5rem;">Lấy
											Lại Mật Khẩu</button>
										<p class="small fw-bold mt-2 pt-1 mb-0">
											Quay lại trang <a
												href="${pageContext.request.contextPath }/tai-khoan/dang-nhap"
												class="link-danger">Đăng nhập</a>
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