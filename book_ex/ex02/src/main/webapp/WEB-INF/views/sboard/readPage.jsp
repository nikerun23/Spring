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
		frmObj.attr("action", "/sboard/modifyPage");
		frmObj.attr("method", "get");
		frmObj.submit();
	});
	
	$(".btn-danger").on("click", function(){
		frmObj.attr("action", "/sboard/removePage");
		frmObj.attr("method", "get");
		frmObj.submit();
	});
	
	$(".btn-primary").on("click", function(){
		frmObj.attr("action", "/sboard/list");
		frmObj.attr("method", "get");
		frmObj.submit();
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

				<form role="form" action="modifyPage" method="post">
					<input type="hidden" name="bno" value="${boardVO.bno}">
					<input type="hidden" name="page" value="${cri.page}">
					<input type="hidden" name="perPageNum" value="${cri.perPageNum}">
					<input type="hidden" name="searchType" value="${cri.searchType}">
					<input type="hidden" name="keyword" value="${cri.keyword}">
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
					<button type="submit" class="btn btn-primary">LIST PAGE</button>
				</div>
			</div>
			
			<div class="row">
				<div class="col-md-12">
					<div class="box box-success">
						<div class="box-header">
							<h3 class="box-title">ADD NEW REPLY</h3>
						</div>
						<div class="box-body">
							<label for="exampleInputEmail1">Writer</label> <input
								class="form-control" type="text" placeholder="USER ID"
								id="newReplyWriter"> <label for="exampleInputEmail1">Reply
								Text</label> <input class="form-control" type="text"
								placeholder="REPLY TEXT" id="newReplyText">
						</div>
						<!-- /.box-body -->
						<div class="box-footer">
							<button type="button" class="btn btn-primary" id="replyAddBtn">ADD
								REPLY</button>
						</div>
					</div>
		
					<!-- The time line -->
					<ul class="timeline">
						<!-- timeline time label -->
						<li class="time-label" id="repliesDiv"><span class="bg-green">
								Replies List </span></li>
					</ul>
					<div class='text-center'>
						<ul id="pagination" class="pagination pagination-sm no-margin ">
		
						</ul>
					</div>
				</div>
				<!-- /.col -->
			</div>
		</div>
		<!--/.col (left) -->
	</div>
	<!-- /.row -->
</section>
<!-- /.content -->


<%@include file="../include/footer.jsp"%>

