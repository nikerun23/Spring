<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../include/header.jsp"%>
<script type="text/javascript">

$(document).ready(function(){
	var frmObj = $("form[role='form']");
	
	console.log(frmObj);
	
	$(".btn-warning").on("click", function(){
		frmObj.attr("action", "/board/modify");
		frmObj.attr("method", "get");
		frmObj.submit();
	});
	
	$(".btn-danger").on("click", function(){
		frmObj.attr("action", "/board/remove");
		frmObj.submit();
	});
	
	$(".btn-primary").on("click", function(){
		self.location = "/board/listAll";
	});
	
});

</script>
<!-- Main content -->
<section class="content">
	<div class="row">
		<!-- left column -->
		<div class="col-md-12">
			<!-- general form elements -->
			<div class="box">
				<div class="box-header with-border">
					<h3 class="box-title">READ BOARD</h3>
				</div>

				<form role="form" method="post">
					<input type="hidden" name="bno" value="${boardVO.bno}">
				</form>
					<div class="box-body">
						<div class="form-group">
							<label for="exampleInputEmail1">Title</label> <input type="text"
								name='title' class="form-control" value="${boardVO.title}" readonly="readonly">
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">Content</label>
							<textarea class="form-control" name="content" rows="3" readonly="readonly">${boardVO.content}</textarea>
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">Writer</label> <input type="text"
								name="writer" class="form-control" value="${boardVO.writer}" readonly="readonly">
						</div>
					</div>
					<!-- /.box-body -->
					<div class="box-footer">
						<button type="submit" class="btn btn-warning">Modify</button>
						<button type="submit" class="btn btn-danger">REMOVE</button>
						<button type="submit" class="btn btn-primary">LIST ALL</button>
					</div>
			</div>
		</div>
		<!--/.col (left) -->
	</div>
	<!-- /.row -->
</section>
<!-- /.content -->


<%@include file="../include/footer.jsp"%>

