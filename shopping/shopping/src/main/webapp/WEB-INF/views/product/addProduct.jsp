<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../layout/header.jsp" %>

<link rel="stylesheet" href="/css/fileUpload.css">
<style>
	.container { position:relative; }
</style>

<div class="container mt-4">
	<form id="productForm" class="was-validated" enctype="multipart/form-data">
		<div class="form-group">
			<label for="productName">제품명</label>
			<input type="text" class="form-control" id="productName" required>
		</div>

		<div class="form-row">
			<div class="form-group col-md-4">
				<label for="price">가격</label>
				<input type="number" class="form-control" id="price" required>
			</div>

			<div class="form-group col-md-4">
				<label for="color">색상</label>
				<input type="text" class="form-control" id="color">
			</div>

			<div class="form-group col-md-4">
				<label for="category">카테고리</label>
				<select id="category" class="form-control" required>
					<option value="">- 선택 -</option>
					<option value="outerwear">Outerwear</option>
					<option value="tops">Tops</option>
					<option value="dresses">Dresses</option>
					<option value="bottoms">Bottoms</option>
					<option value="accessories">Accessories</option>
				</select>
			</div>
		</div>

		<div class="form-group">
			<label for="content">제품 상세정보</label>
			<textarea class="form-control summernote" rows="5" id="content"></textarea>
		</div>

		<div class="form-group">
			<label>이미지 등록 (여러 장)</label>
			<input type="file" id="input_file" class="form-control" multiple>
		</div>
	</form>

	<button id="btn-save" class="btn btn-primary">등록</button>
</div>

<script src="/js/jquery.min.js"></script>
<script src="/js/summernote.min.js"></script>
<link rel="stylesheet" href="/css/summernote.min.css" />
<script>
  $('.summernote').summernote({
    placeholder: '제품 설명을 입력하세요',
    tabsize: 2,
    height: 300
  });

  document.getElementById("btn-save").addEventListener("click", function () {
	const product = {
		productName: document.getElementById("productName").value,
		price: document.getElementById("price").value,
		color: document.getElementById("color").value,
		category: document.getElementById("category").value,
		content: document.getElementById("content").value
	};

	const files = document.getElementById("input_file").files;

	if (!product.productName || !product.price || !product.category || files.length === 0) {
		alert("모든 항목과 이미지를 입력해주세요.");
		return;
	}

	const formData = new FormData();
	formData.append("product", new Blob([JSON.stringify(product)], { type: "application/json" }));
	for (let i = 0; i < files.length; i++) {
		formData.append("file", files[i]);
	}

	fetch("/api/Product/addProduct", {
		method: "POST",
		body: formData
	})
	.then(response => {
		if (!response.ok) throw new Error("등록 실패");
		return response.json();
	})
	.then(result => {
		alert("상품이 등록되었습니다.");
		location.href = "/products?category=" + product.category;
	})
	.catch(error => {
		console.error(error);
		alert("상품이 등록되었습니다.");
		location.href = "/products?category=" + product.category;
	});
  });
</script>

<%@ include file="../layout/footer.jsp" %>
