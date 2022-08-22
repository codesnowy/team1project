<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<%@include file="/WEB-INF/inc/header.jsp" %>

<meta charset="UTF-8">
<title>자유게시판</title>
</head>
<body>
<%@include file="/WEB-INF/inc/top.jsp" %>
<div class="container">
	<div class="row mt-5">
	<div class="table_container">
		<div class="row mt-5"></div>
		<table class="table table-bordered ">
	    <tbody>
			<tr>
				<td class ="content">${board.boCate }<b> ${board.boTitle }</b>
				</td>
			</tr>
			<tr>
				<td>
					<p class="text-muted">작성자 : ${board.boMemId }<br>
					작성일 : ${board.boModDate ne null ? board.boModDate : board.boRegDate}
					</p>
				</td>
			</tr>  	  
			<tr>
				<td class ="content">
				<div class="row mt-5"></div>
				<p style="white-space: pre-line;">${board.boContent }</p>
				</td>
			</tr>
			<tr>
				<td>
					<a href="boardList.wow">
						<button type="button" class="btn btn-primary btn-sm">목록</button>
					</a>
					<c:if test="${board.boMemId eq USER_INFO.userId }">
						<a href="boardEdit.wow?boNo=${board.boNo}">
						<button type="button" class="btn btn-primary btn-sm">수정</button>
						</a>
					</c:if>
				</td>
			</tr>
	    </tbody>
	    </table>
	</div>
</div>
<!-- 여기서부터 댓글 보기 영역 -->
<div id="id_reply_list_area"></div>
<div class="text-center" id="id_reply_list_more">
	<a id="btn_reply_list_more"
		class="btn btn-sm btn-default"> 
		<span	class="glyphicon glyphicon-chevron-down" aria-hidden="true"></span>
		더보기
	</a>
</div>
<!-- 댓글 수정용 Modal 부분-->
<div class="modal fade" id="id_reply_edit_modal" role="dialog">
	<div class="modal-dialog" role="document">
		<!-- Modal content-->
		<div class="modal-content">
			<form name="frm_reply_edit"
				action="<c:url value='reply/replyModify'/>" method="post"
				onclick="return false;">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">×</button>
					<h4 class="modal-title">댓글수정</h4>
				</div>
				<div class="modal-body">
					<input type="hidden" name="reNo" value="">
					<textarea rows="3" name="reContent" class="form-control"></textarea>
					<input type="hidden" name="reMemId" value="${USER_INFO.userId }">
				</div>
				<div class="modal-footer">
					<button id="btn_reply_modify" type="button"
						class="btn btn-sm btn-info">저장</button>
					<button type="button" class="btn btn-default btn-sm"
						data-dismiss="modal">닫기</button>
				</div>
			</form>
		</div>
	</div>
</div>
<!-- 여기서부터 댓글 쓰기 부분-->	
	<div class="panel">
			<div class="panel-body">
				<form name="frm_reply" action="<c:url value='reply/replyRegist' />"
					method="post" onclick="return false;">
					<input type="hidden" name="reParentNo" value="${board.boNo}">
					<input type="hidden" name="reMemId" value="${USER_INFO.userId }">  
					<div class="form-group">
						<label>댓글</label>
						<div>
							<textarea rows="3" name="reContent" class="form-control" 
							${USER_INFO eq null ? "readonly='readonly'" : "" }></textarea>
						</div>
						<div>
							<button id="btn_reply_regist" type="button"	class="btn btn-sm btn-info">등록</button>
						</div>
					</div>
				</form>
			</div>
		</div>
</div> <!-- container 끝 -->
<script type="text/javascript">
	var params={"curPage":1, "rowSizePerPage" : 5 ,"reParentNo": ${board.boNo} };
	/* 댓글 리스트 */
	function fn_reply_list(){
        $.ajax({
             url:"<c:url value='/reply/replyList.wow'/>"
        	, data:params
        	, success: function(data) {
        		let list = data.result;
				console.log("ajax : ", data);
				let str="";
				$.each(list, function(i, element) {
					  str+='<div class="row" data-re-no="'+ element.reNo +'">';
				     str+='<div class="col-sm-2 text-right" >'+element.reMemId+'</div>';
				     str+='<div class="col-sm-6"><pre>'+element.reContent+'</pre></div>';
				     str+='<div class="col-sm-2" >'+element.reRegdata +'</div>';
					  str+='<div class="col-sm-2">';
	 			     if(element.reMemId == '${USER_INFO.userId}'){		
				     		str+=   '<button name="btn_reply_edit" type="button" class=" btn btn-sm btn-info" >수정</button>';
				     		str+=  '<button name="btn_reply_delete" type="button" class="btn btn-sm btn-danger" >삭제</button>';
				    	} 
		    		  str+= '</div>';
				     str+= '<hr>';
				     str+= '</div>';	
				});
	  			$("#id_reply_list_area").append(str);
				params.curPage+=1;
            } //success
        }); //ajax
    }//function fn_reply_list
   /* 창이 열리면 리스트 가져오기 */ 
  $(function(){  	
  	fn_reply_list();  
  	/* 더보기 누르면 리스트 더 가져오기 */
    $("#id_reply_list_more").on("click",function(e){
    	e.preventDefault();
    	fn_reply_list();
	});
  	/* 댓글 등록 */
        $("#btn_reply_regist").on("click",function(e){
        	e.preventDefault();
			//가장가까운 form찾은 후 ajax 호출(data는 form.serialize(), )
			form=$(this).closest("form[name='frm_reply']");
			
			 $.ajax({
				 url:"<c:url value='/reply/replyRegist.wow'/>"
				 ,data : form.serialize()
		    //성공 : 등록 글 내용부분 지우기,  댓글영역초기화( list_area.html('), curPage=1, fn_reply_list)
				 , success: function(data) {
					 console.log(data);
					 form.find("textarea[name='reContent']").val('');
					 $("#id_reply_list_area").html('');
					 params.curPage=1;
					 fn_reply_list();
           
				 } //실패 : error : req.status==401이면 login으로   location.href
				 ,error: function(req,st,err) {
					 if(req.status == 401){
						 location.href="<c:url value='/login/login.wow'/>"
					 }				
				}				 
			 }); //ajax 끝           
        });//등록버튼
        
        $("#id_reply_list_area").on("click", 'button[name="btn_reply_edit"]'
    			,function(e){
    		//modal 아이디=id_reply_edit_modal
    		//현재 버튼의  상위 div(하나의 댓글 전체)를 찾으세요
    		// 그 div에서 현재 댓글의 내용 =modal에 있는 textarea에 복사 
    		// 그 div태그의 data-re-no에 있는 값   $().data('re-no')
    		//=modal에 있는  < input name=reNo>태그에 값으로 복사  
    		//2개 복사했으면   $('#id_reply_edit_modal').modal('show')
    		$btn=$(this);  //수정버튼
    		$div=$btn.closest('div.row');   //버튼의 댓글 div
    		$modal=$('#id_reply_edit_modal'); //modal div 
    		$pre=$div.find('pre'); 
    		 var content=$pre.html(); 
    		 $textarea=$modal.find('textarea'); 
    		
    		 $textarea.val(content);  
    		 var reNo=$div.data('re-no');	
    		 $modal.find('input[name=reNo]').val(reNo);
    		 $modal.modal('show');
    	});//수정버튼  	

    	//모달창 저장 버튼
    	$("#btn_reply_modify").on("click", function(e){
    		e.preventDefault(); 
    		$form= $(this).closest('form[name="frm_reply_edit"]');
    		$.ajax({
    			url : "<c:url value='/reply/replyModify.wow'/>"
    			,type : "POST"
    			,data : $form.serialize()
    			,dataType : "JSON"
    			,success: function(){
    				$modal=$('#id_reply_edit_modal'); 
    				$modal.modal('hide');
    				
    				var reNo=$modal.find('input[name=reNo]').val();
    				var reContent=$modal.find('textarea').val();
    				$("#id_reply_list_area").find("div[data-re-no='"+reNo+"']").find("pre").html(reContent);
    			}
    		});//ajax
    	});//모달창 저장버튼  	
    	
    	//삭제버튼
    	$("#id_reply_list_area").on("click", 'button[name="btn_reply_delete"]'
    			,function(e){
    		e.preventDefault();
    		$div=$(this).closest('.row');
    		reNo=$div.data('re-no');
    		reMemId="${USER_INFO.userId}";
    		$.ajax({
    			url : "<c:url value='/reply/replyDelete.wow'/>"
    			,type : "POST"
    			,data : {"reNo" : reNo, "reMemId" : reMemId}
    			,dataType : 'JSON'
    			,success : function(){
    				$div.remove();
    			}
    		});//ajax
    	}); //삭제버튼
    });	
</script>
</body>
</html>