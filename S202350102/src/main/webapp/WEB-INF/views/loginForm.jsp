<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
 <meta charset="UTF-8">
</head>
<body class="bg-light">
	
	<!-- MODALS  -->
	
	 <!-- 비밀번호 리셋 MODAL -->
	 
    <div class="modal fade" id="modalPasswordReset" tabindex="-1" role="dialog" aria-hidden="true">
      <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
    
          <!-- Close -->
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
            <i class="fe fe-x" aria-hidden="true"></i>
          </button>
    
          <!-- Header-->
          <div class="modal-header lh-fixed fs-lg">
            <strong class="mx-auto">비밀번호 찾기</strong>
          </div>
    
          <!-- Body -->
          <div class="modal-body text-center">
    
            <!-- Text -->
            <p class="mb-7 fs-sm text-gray-500">
              	아이디와 이메일을 입력해주세요 <br>
              	해당 이메일로 새로운 비밀번호를 발급 받으실 수 있습니다
            </p>
    
            <!-- Form -->
            <form action="/sendMailForResetPswd">
    			
    		  <!-- 아이디 -->
              <div class="form-group">
                <label class="visually-hidden" for="modalPasswordResetEmail">
                  	아이디 *
                </label>
                <input class="form-control form-control-sm" id="modalPasswordResetEmail" name="user_id" type="text"  placeholder="아이디 " required>
              </div>
              		
              <!-- Email -->
              <div class="form-group">
                <label class="visually-hidden" for="modalPasswordResetEmail">
                  	이메일 *
                </label>
                <input class="form-control form-control-sm" id="modalPasswordResetEmail" name="email" type="email" placeholder="이메일 you@xxx.xxx" required>
              </div>
              
           
    
              <!-- Button type ="submit을" 안걸어도 알아서 연동됨 ;; 왜지?-->
              <button class="btn btn-sm btn-dark">
                	비밀번호 리셋
              </button>
    
            </form>
    
          </div>
    
        </div>
    
      </div>
    </div>
    
    <!-- 아이디 찾기 MODAL  -->
    
     <div class="modal fade" id="modalFindId" tabindex="-1" role="dialog" aria-hidden="true">
      <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
    
          <!-- Close -->
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
            <i class="fe fe-x" aria-hidden="true"></i>
          </button>
    
          <!-- Header-->
          <div class="modal-header lh-fixed fs-lg">
            <strong class="mx-auto">아이디 찾기</strong>
          </div>
    
          <!-- Body -->
          <div class="modal-body text-center">
    
            <!-- Text -->
            <p class="mb-7 fs-sm text-gray-500">
              	이름과 이메일을 입력해주세요 
              	
            </p>
    
            <!-- Form -->
<!--             <form action="findId"> -->
    			
    		  <!-- 아이디 -->
              <div class="form-group">
                <label class="visually-hidden" for="user_name">
                  	이름 *
                </label>
                <input class="form-control form-control-sm" id="user_name" name="user_name" type="text"  placeholder="이름  " required>
              </div>
              		
              <!-- Email -->
              <div class="form-group">
                <label class="visually-hidden" for="email">
                  	이메일 *
                </label>
                <input class="form-control form-control-sm" id="email" name="email" type="email" placeholder="이메일 you@xxx.xxx" required>
              </div>
              
           
    
              <!-- Button type ="submit을" 안걸어도 알아서 연동됨 ;; 왜지?-->
              <button class="btn btn-sm btn-dark" onclick="return findId_click()">
                	아이디 찾기
              </button>
    
<!--             </form> -->
    
          </div>
    
        </div>
    
      </div>
    </div>
    
    
    
    <!-- NAVBAR -->
	<c:import url="/WEB-INF/views/header4.jsp"/>

    <!-- NAVBAR -->
<!--     {{> navbars/navbar classList="bg-white"}} -->
 	
     <!-- CONTENT -->
    <section class="py-12">
      <div class="container">
        <div class="row">
          <div class="col-12 col-md-6" style="float: none; margin:0 auto;">

            <!-- Card -->
            <div class="card card-lg mb-10 mb-md-0">
              <div class="card-body">

                <!-- Heading -->
                <h6 class="mb-7">로그인</h6>

                <!-- Form -->
                <form action="login" method="post">
                  <div class="row">
                    
                    <div class="col-12">
                      <!-- Email -->
                      <div class="form-group">
                        <label class="visually-hidden" for="user_id">
                         	아이디 *
                        </label>
                        <input class="form-control form-control-sm" id="user_id" type="text"  name="user_id"  placeholder="ID *" required>
                      </div>
                    </div>
                   
					<div class="col-12">
                      <!-- Password -->
                      <div class="form-group">
                        <label class="visually-hidden" for="loginPassword">
                          	비밀번호 *
                        </label>
                        <input class="form-control form-control-sm" id="loginPassword" type="password" name="user_pswd" placeholder="Password *" required>
                      </div>
                    </div>
                   
                    <div class="col-12 col-md">
                      <!-- Remember -->
                      <div class="form-group">
                        <div class="form-check">
                          <input class="form-check-input" id="loginRemember" type="checkbox">
                          <label class="form-check-label" for="loginRemember">
                            	아이디 기억하기
                          </label>
                        </div>
                      </div>
                    </div>
                    
                   <!-- Link -->
                    <div class="col-12 col-md-auto">
                      <div class="form-group">
                      	<a class="fs-sm text-reset" href="/signUp">회원가입 </a>
                      	<small class="fs-sm text-reset"> | </small>
                        <a class="fs-sm text-reset" data-bs-toggle="modal" href="#modalFindId">아이디 찾기 </a>
                        <small class="fs-sm text-reset"> | </small>
                        <a class="fs-sm text-reset" data-bs-toggle="modal" href="#modalPasswordReset">비밀번호 찾기 </a>
                      </div>
                    </div>
                    
                    <div class="col-12">
                      <!-- Button -->
                      <button class="btn btn-sm btn-dark" type="submit" >
                        	로그인
                      </button>				  
                    </div>
                  </div>
                 
                </form>

              </div>
            </div>

          </div>
        </div>
      </div>
    </section>

    <!-- FOOTER -->
    <c:import url="/WEB-INF/views/footer.jsp"/>


    <!-- JAVASCRIPT -->
	<script type="text/javascript">

	function findId_click(){
		var user_name 	= $('#user_name').val()
		var email 		= $('#email').val()
		var str 		= "";
		var str2		= "";
			   if(user_name == "" ) {
				   alert("이름을 입력해주세요");
				   document.getElementById('user_name').focus();
				   return false;
			   } else if(email == "" ) {
				   alert("이메일을 입력해주세요");
				   document.getElementById('email').focus();
				   return false;
			   }
		$.ajax({
			url			:	"/findId",
			type		:	"POST",
			data		:	{"user_name" : user_name, "email" : email},
			dataType	:	"json",
			success 	:	function(data){
								if(data == ""){
									alert("회원이 존재하지 않습니다");
									$('#user_name').val('');
									$('#email').val('');
								} else if (data != '0') {
									var jsonStr = JSON.stringify(data);
									$(data).each(
											function() {
												str2 = this.user_id + "\n"
												str += str2;
											}
									)
									alert("회원님의 아이디 : \n" + str);
									$('#user_name').val('');
									$('#email').val('');
									$('#modalFindId').modal('hide');
								}
			}
		});
	};
	
	function chk(){
		var user_name 	= document.getElementById('user_name').value;
		var email		= document.getElementById('email').value;
			   if(user_name == "" ) {
				   alert("이름을 입력해주세요");
				   document.getElementById('user_name').focus();
				   return false;
			   } else if(email == "" ) {
				   alert("이메일을 입력해주세요");
				   document.getElementById('email').focus();
				   return false;
			   }
	
	}
	// 문자열 비교할때 EL표기법에도 "${chk}" 큰따옴표 처리하면 됨
	function chkIdPassword(){
		if("${chk}" == "wrongValue"){
			alert('아이디 또는 비밀번호가 틀렸습니다')
		}
		if("${chk}" == "delId"){
			alert('탈퇴한 회원입니다')
		}
		if("${chk}" == ""){
			return true;
		}
	}
	</script>
	 
	 <!-- JSTL + onload 이벤트를 통해 로그인 검증 구현  -->
	 <c:choose>
     	<c:when test="${ result == 'wrongValue'}">
	     	<script type="text/javascript">
	     		window.onload=function() {
	     			alert("아이디나 비밀번호가 틀렸습니다. 다시 로그인 해주세요");
	     		}
	     	</script>
     	</c:when>
     </c:choose>
     <c:choose>
     	<c:when test="${ result == 'delId'}">
	     	<script type="text/javascript">
	     		window.onload=function() {
	     			alert("탈퇴한 회원입니다 ");
	     		}
	     	</script>
     	</c:when>
    </c:choose>
     
   <!-- F5(새로고침)시 loginForm으로 이동  -->  
   <script type="text/javascript">
   document.onkeydown = fkey;
   document.onkeypress = fkey;
   document.onkeyup = fkey; 
   var wasPressed = false; 
   function fkey(e){    
	   e = e || window.event;    
	   if(wasPressed) return;     
	   if(e.keyCode == 116){        
		   location.href = "loginForm";    
		   }
	   }
   </script>  
     
  <!--  아이디 기억하기 -->
  <script type="text/javascript">
	$(document).ready(function(){
  		  
	  	// 1.view단 loginForm.jsp에 Remember me 체크박스 생성
		
	    
		// 2.저장된 쿠키값을 가져와서 ID 칸에 넣어준다. 없으면 공백으로 들어감.
		var key = getCookie("key");
		$("#user_id").val(key); 
		
		// 3.그 전에 ID를 저장해서 처음 페이지 로딩 시, 입력 칸에 저장된 ID가 표시된 상태라면,
		if($("#user_id").val() != ""){ 
		    $("#loginRemember").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
		}   	  

		// 4.아이디 저장하기 부분을 체크했다면 값을 쿠키에 보관한다, 체크 해제했다면 쿠키를 제거한다.
		$("#loginRemember").change(function(){ // 체크박스에 변화가 있다면,
		    if($("#loginRemember").is(":checked")){ // ID 저장하기 체크했을 때,
		        setCookie("key", $("#user_id").val(), 7); // 7일 동안 쿠키 보관
		    }else{ // ID 저장하기 체크 해제 시,
		        deleteCookie("key");
		    }
		});
		
		// 5.아이디 저장하기를 체크한 상태에서 아이디를 입력하는 경우에도 쿠키에 저장한다
		$("#user_id").keyup(function(){ // ID 입력 칸에 ID를 입력할 때,
		    if($("#loginRemember").is(":checked")){ // ID 저장하기를 체크한 상태라면,
		        setCookie("key", $("#user_id").val(), 7); // 7일 동안 쿠키 보관
		    }
		});

		// 6.쿠키 저장, 쿠키 가져오기, 쿠키 삭제등의 함수를 구현한다
		// 쿠키 저장하기 
		// setCookie => saveid함수에서 넘겨준 시간이 현재시간과 비교해서 쿠키를 생성하고 지워주는 역할
		function setCookie(cookieName, value, exdays) {
			var exdate = new Date();
			exdate.setDate(exdate.getDate() + exdays);
			var cookieValue = escape(value)
					+ ((exdays == null) ? "" : "; expires=" + exdate.toGMTString());
			document.cookie = cookieName + "=" + cookieValue;
		}
		
		// 쿠키 삭제
		function deleteCookie(cookieName) {
			var expireDate = new Date();
			expireDate.setDate(expireDate.getDate() - 1);
			document.cookie = cookieName + "= " + "; expires="
					+ expireDate.toGMTString();
		}
		    
		// 쿠키 가져오기
		function getCookie(cookieName) {
			cookieName = cookieName + '=';
			var cookieData = document.cookie;
			var start = cookieData.indexOf(cookieName);
			var cookieValue = '';
			if (start != -1) { // 쿠키가 존재하면
				start += cookieName.length;
				var end = cookieData.indexOf(';', start);
				if (end == -1) // 쿠키 값의 마지막 위치 인덱스 번호 설정 
					end = cookieData.length;
		               console.log("end위치  : " + end);
				cookieValue = cookieData.substring(start, end);
			}
			return unescape(cookieValue);
		}
	});
  </script>   
  </body>
	
</html>