<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="container-fluid p-0 mb-5 wow fadeIn" data-wow-delay="0.1s">
	<div id="header-carousel" class="carousel slide"
		data-bs-ride="carousel">
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img class="w-100" src="${pageContext.request.contextPath}/resources/img/slideshow_3.jpg" alt="Image">
			</div>
			<div class="carousel-item">
				<img class="w-100" src="${pageContext.request.contextPath}/resources/img/slideshow_2.jpg" alt="Image">
			</div>
		</div>
		<button class="carousel-control-prev" type="button"
			data-bs-target="#header-carousel" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button"
			data-bs-target="#header-carousel" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Next</span>
		</button>
	</div>
</div>