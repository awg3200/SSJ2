<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>챌린지 리스트</title>
<%@ include file="/WEB-INF/views/header4.jsp" %>

<script type="text/javascript">
	
	// 모달 값 지우기
	// 모달창을 끌 때, hidden.bs.modal이라는 이벤트가 발생하고 이때 함수를 실행시킨다
	// 해당모달의 input창의 모든 값을 비운다
	// $(document).ready(function() : 이부분을 사용하지않으면 문서가 모달 이벤트 수신할 때 아래코드가 준비되지 않아 작동 안할수있음, 문서가준비된 이후 코드가 작동하도록 보장하기위해 jQuery의 document.ready 이벤트 사용
	$(document).ready(function() {
		$('.modal').on('hidden.bs.modal', function(e) {
			$(this).find('input').val('');
		});
	});
	
	// 필터별 정렬
	function fn_sortOpt(){
		var sortOpt = $('#sortOpt').val()
 		var state_md 	= 	${chg.state_md}
 		var chg_lg 		= 	${chg.chg_lg}
 		var chg_md 		= 	${chg.chg_md}
		var currentPage	=	${page.currentPage}
		
		location.href= 'thChgList?state_md='+state_md
								+'&chg_lg='+chg_lg
								+'&chg_md='+chg_md
								+'&sortOpt='+sortOpt
								+'&currentPage='+currentPage;
	}

	// yr 작성
	// 찜하기 기능
	function chgPick(p_index) {

		$.ajax({
			url : "/chgPickPro",
			type : "POST",
			data : {chg_id : p_index},
			dataType : 'json',
			success : function(chgPickResult) {
				if(chgPickResult.chgPick > 0) {
					$("#chgPick" + p_index).removeClass("btn-white-primary").addClass("btn-primary");
				} else {
					$("#chgPick" + p_index).removeClass("btn-primary").addClass("btn-white-primary");
				}

			},
			error : function() {
				alert("찜하기 오류");
			}
		});
	}

	// 비공개방 비밀번호 확인
	function confirmPswd(p_index){
		var input_priv_pswd = $('#input_priv_pswd'+p_index).val()
		var chg_priv_pswd 	= $('#chg_priv_pswd'+p_index).val();
		var chg_id			= $('#chg_id'+p_index).val();
		if(input_priv_pswd == chg_priv_pswd){
			location.href = "chgDetail?chg_id="+chg_id
		} else {
			alert('비밀번호가 틀렸습니다');
			$('#modalMatchPswd'+p_index).modal('hide');
			return false;
		}	
	}
	
	
	
	// 현재 페이지 그대로 이동
	function moveCurrentPage() {
		var sortOpt 	= 	$('#sortOpt').val()
 		var state_md 	= 	${chg.state_md}
 		var chg_lg 		= 	${chg.chg_lg}
 		var chg_md 		= 	${chg.chg_md}
		var currentPage	=	${page.currentPage}
		
		location.href= 'thChgList?state_md='+state_md
								+'&chg_lg='+chg_lg
								+'&chg_md='+chg_md
								+'&sortOpt='+sortOpt
								+'&currentPage='+currentPage;
	}
	// 다른 페이지로 이동
	function movePage(p_index) {
		var sortOpt 	= 	$('#sortOpt').val()
 		var state_md 	= 	${chg.state_md}
 		var chg_lg 		= 	${chg.chg_lg}
 		var chg_md 		= 	${chg.chg_md}
		//	movaPage에 index를 넣어서 페이지이동 시킴
 		var pageNum		=	document.getElementById('movePage'+p_index).innerText
		
		location.href= 'thChgList?state_md='+state_md
								+'&chg_lg='+chg_lg
								+'&chg_md='+chg_md
								+'&sortOpt='+sortOpt
								+'&currentPage='+pageNum;
	}
	
	// 이전 블럭 이동
	function movePrevBlock() {
		var sortOpt 	= 	$('#sortOpt').val()
 		var state_md 	= 	${chg.state_md}
 		var chg_lg 		= 	${chg.chg_lg}
 		var chg_md 		= 	${chg.chg_md}
		var pageNum		=	${page.startPage - page.pageBlock }

		location.href= 'thChgList?state_md='+state_md
								+'&chg_lg='+chg_lg
								+'&chg_md='+chg_md
								+'&sortOpt='+sortOpt
								+'&currentPage='+pageNum;
	}
	
	// 다음 블럭 이동
	function moveNextBlock() {
		var sortOpt 	= 	$('#sortOpt').val()
 		var state_md 	= 	${chg.state_md}
 		var chg_lg 		= 	${chg.chg_lg}
 		var chg_md 		= 	${chg.chg_md}
		var pageNum		=	${page.startPage + page.pageBlock }

		location.href= 'thChgList?state_md='+state_md
								+'&chg_lg='+chg_lg
								+'&chg_md='+chg_md
								+'&sortOpt='+sortOpt
								+'&currentPage='+pageNum;
	}
	

</script>
</head>

<body>

    
    
    <section class="py-11">
      <div class="container">
        <div class="row">
			<%@ include file="/WEB-INF/views/chgSidebar.jsp" %>
        
        
        
          
      
         
		  <div class="col-12 col-md-8 col-lg-9">
			<!-- Header -->
            <div class="row align-items-center mb-7">
              <div class="col-12 col-md">

                <!-- Heading -->

                	<h3 class="mb-1">챌린지
		                <c:choose>
		                	<c:when test="${chg.chg_md == ''}"></c:when>	
		                	<c:when test="${chg.chg_md == 100}"> - 운동</c:when>
		                	<c:when test="${chg.chg_md == 101}"> - 공부</c:when>
		                	<c:when test="${chg.chg_md == 102}"> - 취미</c:when>
		                	<c:when test="${chg.chg_md == 103}"> - 습관</c:when>
		                </c:choose>
                	</h3>

              </div>
              <div class="col-12 col-md-auto">

                <!-- 필터 조회 -->
                <select class="form-select form-select-xs" id="sortOpt" onchange="fn_sortOpt()"> 
                  <option value="create_date" 	<c:if test="${sortOpt eq 'create_date' }">	selected="selected"</c:if>>최신등록순</option>
                  <option value="pick_cnt" 		<c:if test="${sortOpt eq 'pick_cnt' }">		selected="selected"</c:if>>찜순</option>
                  <option value="participants" 	<c:if test="${sortOpt eq 'participants' }">	selected="selected"</c:if>>참여자순</option>
                </select>

              </div>
            </div> 
             
            <!-- 챌린지 리스트 조회  -->
            <div class="row">
	            <c:set var="num" value="${page.total-page.start+1 }"></c:set>
	            	<c:forEach var="chg" items="${listChg }" varStatus="status">
			            <div class="col-6 col-md-4">
						
			               <!-- Card -->
			              <div class="card mb-7">
			
			                <!-- Image -->
			                <div class="card-img">
			
								<!-- YR 작성 -->
								<!-- 찜하기 -->
								<c:choose>
									<c:when test="${sessionScope.user_num != null}">
										<!-- 로그인 한 상태 -->
										<c:choose>
											<c:when test="${chg.pickyn > 0}">
												<!-- 찜하기 있음 -->
												<button type="button" class="btn btn-xs btn-circle btn-primary card-action card-action-end" data-toggle="button" onclick="chgPick(${chg.chg_id})" id="chgPick${chg.chg_id}">
													<i class="fe fe-heart"></i>
												</button>
											</c:when>
								
											<c:otherwise>
												<!-- 찜하기 없음 -->
												<button type="button" class="btn btn-xs btn-circle btn-white-primary card-action card-action-end" data-toggle="button" onclick="chgPick(${chg.chg_id})" id="chgPick${chg.chg_id}">
													<i class="fe fe-heart"></i>
												</button>
											</c:otherwise>
										</c:choose>
									</c:when>
								
									<c:otherwise>
										<!-- 로그인 안 한 상태 -->
										<button type="button" class="btn btn-xs btn-circle btn-white-primary card-action card-action-end" data-toggle="button"
											onclick="location.href='/loginForm'">
											<i class="fe fe-heart"></i>
										</button>
									</c:otherwise>
								</c:choose>
			
			                  <!-- Button -->
			                  <button class="btn btn-xs w-100 btn-dark card-btn" 
			                  	<c:if test="${chg.chg_public == 1 }"> 
			                  		data-bs-toggle="modal" 
			                  		data-bs-target="#modalMatchPswd${status.index }"
			                  	</c:if>
			                  	<c:if test="${chg.chg_public == 0 }"> 
			                  		onclick ="location.href='chgDetail?chg_id=${chg.chg_id }'"
			                  	</c:if>
			             	  >
			                    <i class="fe me-2 mb-1"></i>챌린지에 도전하세요!
			                  </button>
			
			                  <!-- Image -->
			                  <a class="text-body" <c:if test="${chg.chg_public == 1 }"> href="#modalMatchPswd${status.index }" data-bs-toggle="modal"</c:if>
			                  					   <c:if test="${chg.chg_public == 0 }"> href="/chgDetail?chg_id=${chg.chg_id }"</c:if>
			                  					   >
			                  <c:if test="${chg.thumb != null}">
			             		<c:if test="${chg.thumb == 'assets/img/chgDfaultImg.png'}">
			                  		<img class="card-img-top" src="assets/img/chgDfaultImg.png" alt="chgDfault" style="width: 100%; height: 250px; border-radius: 10px;">
			                  	</c:if>
			                  	<c:if test="${chg.thumb != 'assets/img/chgDfaultImg.png'}">
			                  		<img class="card-img-top" src="${pageContext.request.contextPath}/upload/${chg.thumb}" alt="thumb" style="width: 100%; height: 250px; border-radius: 10px;" >
			                  	</c:if>
			                  </c:if>
			                  <c:if test="${chg.thumb == null}">
			                  	<img class="card-img-top" src="assets/img/chgDfaultImg.png" alt="chgDfault" style="width: 100%; height: 250px; border-radius: 10px;">
			                  </c:if>

							  </a>
			              </div>
			              
			              <!-- Body -->
			              <div class="card-body fw-bold text-start px-0 py-2">
			                <a class="text-body fw-bolder fs-6" <c:if test="${chg.chg_public == 1 }"> href="#modalMatchPswd${status.index }" data-bs-toggle="modal"</c:if>
			                									<c:if test="${chg.chg_public == 0 }"> href="/chgDetail?chg_id=${chg.chg_id }"</c:if>
			                									id="title">${num}.${chg.title }</a>
			                <div> 
			                 <fmt:formatDate value="${chg.create_date }" pattern="yyyy-MM-dd"></fmt:formatDate>
			                  ~ 
			                 <fmt:formatDate value="${chg.end_date }" pattern="yyyy-MM-dd"></fmt:formatDate>
			                 </div>
			                <div>참여인원: ${chg.chlgerCnt}명</div>
			                <div>찜수: ${chg.pick_cnt }</div>
			              </div>
							
			            </div>
			            	
					  </div>
					 
					  
					 <!-- MODAL -->
					 <!-- 비공개방  -->
				     <div class="modal fade" id="modalMatchPswd${status.index }" tabindex="-1" role="dialog" aria-hidden="true">
				      <div class="modal-dialog modal-dialog-centered" role="document">
				        <div class="modal-content">
				    
				          <!-- Close -->
				          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
				            <i class="fe fe-x" aria-hidden="true"></i>
				          </button>
				    
				          <!-- Header-->
				          <div class="modal-header lh-fixed fs-lg">
				            <strong class="mx-auto">비공개 방</strong>
				          </div>
				    
				          <!-- Body -->
				          <div class="modal-body text-center">
				    
				            <!-- Text -->
				            <p class="mb-7 fs-sm text-gray-500">
				              	비밀번호를 입력해 주세요 
				              	
				            </p>
				    
				
				    			
				    		  <!-- 모달 -->
				              <div class="form-group">
				                <label class="visually-hidden" for="input_priv_pswd${status.index }">
				                  	비밀번호 *
				                </label>
				                <input class="form-control form-control-sm" id="input_priv_pswd${status.index }" name="input_priv_pswd" type="text"  placeholder="비밀번호 " required>
				                <c:if test="${chg.chg_public == 1 }">
				                	<input class="form-control form-control-sm" id="chg_priv_pswd${status.index }" name="chg_priv_pswd" type="hidden" value="${chg.priv_pswd }">
				                	<input class="form-control form-control-sm" id="chg_id${status.index }" name="chg_id" type="hidden" value="${chg.chg_id }">
				                </c:if>
				              </div>
				     
				              <button class="btn btn-sm btn-dark" onclick="return confirmPswd(${status.index })">
				                	확인
				              </button>
				    
				    
				          </div>
				    
				        </div>
				    
				      </div>
				    </div>
				     <c:set var="num" value="${num -1 }"></c:set>
				</c:forEach>
				
				<!-- 페이지네이션  -->
				 <nav class="d-flex justify-content-center justify-content-md-center">
      	   		 <ul class="pagination pagination-sm text-gray-400">
      	   		 <!-- 이전 블럭 이동 -->
				  	<c:if test="${page.startPage > page.pageBlock }">
				  		<li class="page-item">
							<a class="page-link page-link-arrow" href="#" onclick="movePrevBlock()">
							<i class="fa fa-caret-left"></i></a>
						</li>
					</c:if>
					
				    <c:forEach var="i" begin="${page.startPage }" end="${page.endPage }" varStatus="status">
						<li class="page-item">
							<c:if test="${i == page.currentPage }">
								<a class="page-link" onclick="moveCurrentPage()" href="#" id="moveCurrentPage"><b class="text-primary">${i}</b></a>
							</c:if>
							<c:if test="${i != page.currentPage }">
								<a class="page-link" onclick="movePage(${status.index })" href="#" id="movePage${status.index }">${i}</a>
							</c:if>
						</li>
					</c:forEach>
					<!-- 다음 블럭 이동 -->
				    <c:if test="${page.endPage < page.totalPage }">
				    	<li class="page-item">
							<a class="page-link page-link-arrow" href="#" onclick="moveNextBlock()">
							<i class="fa fa-caret-right"></i></a>
						</li>
					</c:if>
				 </ul>
		  		</nav>
			</div>
		
      </div>
      	  
    </div>
  </div>
</section>
</body>
<%@ include file="/WEB-INF/views/footer.jsp" %>
</html>