<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Fashion Monsty - Admin - Lấy lại mật khẩu</title>
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
	<div class="m-auto mt-4 card text-center" style="width: 300px;">
		<div class="card-header h5 text-white bg-primary">Lấy lại mật
			khẩu</div>
		<div class="card-body px-5">
			<p class="card-text py-2">Nhập địa chỉ email của bạn và chúng tôi
				sẽ gửi bạn một email với các hướng dẫn để thiết lập lại mật khẩu của
				bạn.</p>
			<div class="form-outline">
				<input type="email" id="typeEmail" class="form-control my-3" /> <label
					class="form-label" for="typeEmail">Nhập Email</label>
			</div>
			<a href="#" class="btn btn-primary w-100">Lấy lại mật khẩu</a>
			<div class="d-flex justify-center mt-4">
				<a class="m-auto" href="${pageContext.request.contextPath }/admin">Đăng nhập</a>
			</div>
		</div>
	</div>
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.4.0/mdb.min.js"></script>
</body>
</html>