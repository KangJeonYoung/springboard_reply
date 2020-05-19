<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="../includes/header.jsp" %>    
    
<div class="row">
	<div class="col-lg-12">
		<h1 class = "page-header">Board Register</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
	<div class="col-lg-12">
		<div class ="panel panel-default">
		
			<div class="panel-heading">Board Register</div>
			<!-- /.panel-heading -->
			<div class="panel-body">
			
				<form role="form" action="/replies/modify" method="post">
					<div class="row">
					<div class="col-md-6 pr-1">
					<div class="form-group">
						<label>번호(게시글 번호)</label> <input class="form-control" name='bno'
						value = '<c:out value="${replies.bno }"/>' readonly = "readonly">
					</div>
					</div>
					<div class="col-md-6 pr-1">
					<div class="form-group">
						<label>작성자</label> <input class="form-control" name='replyer'
						value = '<c:out value="${replies.replyer }"/>' readonly = "readonly">
					</div>	
					</div>
					</div>			
					
					<div class="form-group">
						<label>댓글 내용</label> 
						<textarea class="form-control" rows="3" name='content'>
						<c:out value="${replies.reply }" />						
						</textarea>
					</div>
					
					<div class="row">
					<div class="col-md-6 pr-1">					
					<div class="form-group">
						<label>작성 일</label> <input class="form-control" name='regDate'
						value = '<fmt:formatDate pattern = "yyyy/MM/dd" 
						value="${replies.replyDate}"/>' readonly = "readonly">
					</div>
					</div>
					<div class="col-md-6 pr-1">		
					<div class="form-group">
						<label>수정 일</label> <input class="form-control" name='updateDate'
						value = '<fmt:formatDate pattern = "yyyy/MM/dd" 
						value="${replies.updateDate}"/>' readonly = "readonly">
					</div>					
					</div>
					</div>
					
					
					<button type="submit" date-oper='modify' class ="btn btn-default">수정</button>
					<button type="submit" date-oper='list' class ="btn btn-default">리스트</button>					
				</form>					
				
				
			</div>
			<!-- end panel-body -->
		</div>
		<!-- end panel-body -->
	</div>
	<!-- end panel -->
</div>
<!-- /.row -->

	<script type="text/javascript">
		$(document).ready(function(){
			var formObj = $("form");
			
			$('button').on("click", function(e){
				e.prevenDefault();
			
				var operation = $(this).data("oper");
				console.log("operation : " + operation);
				debugger;
				
				if(operation === 'remove'){
					formObj.attr("action", "/board/remove");
				}else if(operation === 'list'){
					//move to list
					formObj.attr("action", "/board/list").attr("method", "get");
					formObj.empty();
				}
				formObj.submit();
			});
		});
	</script>
		

<%@include file="../includes/footer.jsp"%>

