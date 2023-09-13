<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Fashion Monsty - Admin</title>
<style>
#image-preview {
	width: 300px;
	height: 300px;
}

#image-preview img {
	width: 100%;
}
</style>

<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath }/admin_page/css/styles.css"
	rel="stylesheet" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"
	crossorigin="anonymous"></script>



</head>

<body class="sb-nav-fixed">
	<%@include file="../layout/admin_layout/admin_header.jsp"%>
	<div id="layoutSidenav">

		<div id="layoutSidenav_nav">
			<%@include file="../layout/admin_layout/admin_left.jsp"%>
		</div>

		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid px-4">
					<h1 class="mt-4">Quản Lý Sản Phẩm</h1>
					<div class="card mb-4">
						<div class="card-header">
							<i class="fas fa-table me-1"></i> Thông Tin Sản Phẩm
						</div>
						<div class="card-body">
							<form class="container" action="" method="post" enctype="multipart/form-data">
								<div class="row">
									<input type="hidden" name="maSP" value=${getProductEdit.maSP } />
									<div class="col-lg-3 col-xs-12">

										<div class="form-group">
											<label for="image-upload">Chọn Hình Ảnh:</label> <input
												type="file" class="form-control-file" id="image-upload" name="productImage" accept="image/*">

											<div id="image-preview" class="mt-3"></div>
										</div>
									</div>
									<div class="col-lg-9 col-xs-12 row">
										<div class="col-md-6">
											<label for="validationServer013">Tên sản phẩm</label> <input
												type="text" class="form-control" id="validationServer013"
												placeholder="Nhập tên sản phẩm..." name="productName"
												value="${getProductEdit.tenSP}">
										</div>
										<div class="col-md-6">
											<label for="validationServer023">Giá bán</label> <input
												type="number" class="form-control" min=0 step=1000
												max=100000000 id="validationServer023"
												placeholder="Nhập giá bán..." name="productPrice"
												value="${getProductEdit.giaBan}">
										</div>
										<div class="col-md-6">
											<label for="validationServer023">Số lượng</label> <input
												type="number" class="form-control" min=0 step=1 max=10000
												id="validationServer023" placeholder="Nhập số lượng..."
												name="productAmount" value="${getProductEdit.soLuong}">
										</div>
										<div class="col-md-6">
											<label for="validationServer023">Giảm giá</label> <input
												type="number" class="form-control" min=0 step=0.05 max=1
												id="validationServer023" placeholder="Nhập giảm giá..."
												name="productDiscount" value="${getProductEdit.giamGia}">
										</div>
										<div class="col-md-6 mb-3">
											<label for="productType" class="form-label">Loại sản
												phẩm</label> <select class="form-select form-select-lg"
												name="productType" id="productType">
												<option selected>Chọn loại sản phẩm</option>
												<c:forEach var="productType" items="${getListProductType}">
													<option
														${getProductEdit.loaiSanPham.maLoaiSP==productType.maLoaiSP?'selected':''}
														value="${productType.maLoaiSP}">
														${productType.tenLoaiSP}</option>
												</c:forEach>
											</select>
										</div>
									</div>
								</div>
								<hr>
								<div class="form-row">
									<button class="btn btn-primary mb-2 mt-3"
										${statusProduct==false? 'disabled' :'' }
										formaction="${pageContext.request.contextPath }/admin/quan-ly-san-pham/them-moi">Thêm
										mới</button>
									<button class="btn btn-warning mb-2 mt-3"
										${statusProduct==true? 'disabled' :'' }
										formaction="${pageContext.request.contextPath }/admin/quan-ly-san-pham/cap-nhat">Cập
										nhật</button>
									<button ${statusProduct==true? 'disabled' :'' }
										formaction="${pageContext.request.contextPath }/admin/quan-ly-san-pham/delete"
										class="btn btn-danger mb-2 mt-3">Delete</button>
									<button
										formaction="${pageContext.request.contextPath }/admin/quan-ly-san-pham/reset"
										class="btn btn-dark mb-2 mt-3">Reset</button>
								</div>
							</form>
							<div class="table-responsive">
								<table id="datatablesSimple"
									class="table table-hover table-striped">
									<thead>
										<tr>
											<th>MÃ Sản Phẩm</th>
											<th>Tên Sản Phẩm</th>
											<th>Giá Bán</th>
											<th>Số Lượng</th>
											<th>Giảm Giá</th>
											<th>Loại hàng</th>
											<th>Thao Tác</th>
										</tr>
									</thead>
									<tfoot>
										<tr>
											<th>MÃ Sản Phẩm</th>
											<th>Tên Sản Phẩm</th>
											<th>Giá Bán</th>
											<th>Số Lượng</th>
											<th>Giảm Giá</th>
											<th>Loại hàng</th>
											<th>Thao Tác</th>

										</tr>
									</tfoot>
									<tbody>
										<c:forEach var="product" items="${listProduct}">
											<tr>
												<td>${product.maSP }</td>
												<td>${product.tenSP }</td>
												<td>${product.giaBan }</td>
												<td>${product.soLuong }</td>
												<td>${product.loaiSanPham.tenLoaiSP }</td>
												<td>${product.giamGia }</td>
												<td><a
													href="${pageContext.request.contextPath }/admin/quan-ly-san-pham/edit/?id=${product.maSP}"><i
														class="far fa-edit"></i> Sửa</a></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>

							</div>
						</div>
					</div>
				</div>
			</main>
			<%@include file="../layout/admin_layout/admin_footer.jsp"%>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script
		src="${pageContext.request.contextPath }/admin_page/js/scripts.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
		crossorigin="anonymous"></script>
	<script
		src="${pageContext.request.contextPath }/admin_page/demo/chart-area-demo.js"></script>
	<script
		src="${pageContext.request.contextPath }/admin_page/demo/chart-bar-demo.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"
		crossorigin="anonymous"></script>
	<script
		src="${pageContext.request.contextPath }/admin_page/js/datatables-simple-demo.js"></script>
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<script>
		$(document).ready(function() {
			$('#image-upload').on('change', function(e) {
				var file = e.target.files[0];
				if (file.type.includes('image')) {
					var reader = new FileReader();
					reader.onload = function(e) {
						var image = $('<img>').attr('src', e.target.result);
						$('#image-preview').html(image);
					};
					reader.readAsDataURL(file);
				}
			});
		});
	</script>
</body>

</html>

</html>