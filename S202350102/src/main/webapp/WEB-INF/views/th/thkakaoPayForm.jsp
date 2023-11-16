<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header4.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구독하기</title>
</head>
<body>


 
    <!-- MODALS -->
<!--     {{> partials/modals}} -->

    <!-- NAVBAR -->
<!--     {{> navbars/navbar-topbar classList="bg-light"}} -->

    <!-- NAVBAR -->
<!--     {{> navbars/navbar classList="bg-white border-bottom"}} -->

    <!-- PROMO -->
<!--     {{> misc/promo}} -->

    <!-- BREADCRUMB (Home > Women's Clothing 부분 -->
<!--     <nav class="my-5"> -->
<!--       <div class="container"> -->
<!--         <div class="row"> -->
<!--           <div class="col-12"> -->

<!--             Breadcrumb -->
<!--             <ol class="breadcrumb mb-0 fs-xs text-gray-400"> -->
<!--               <li class="breadcrumb-item"> -->
<!--                 <a class="text-reset" href="#">Home</a> -->
<!--               </li> -->
<!--               <li class="breadcrumb-item active"> -->
<!--                 Women's Clothing -->
<!--               </li> -->
<!--             </ol> -->

<!--           </div> -->
<!--         </div> -->
<!--       </div> -->
<!--     </nav> -->

    <!-- HEADER -->
    <div class="pt-10">
      <div class="container">
        <div class="row">
          <div class="col-12">

            <!-- Heading -->
            
            <h3 class="mt-8 mb-6 text-center"><img alt="logo01" src="assets/img/logo01.png"></h3>
			
			<!-- CONTENT -->
		    <section class="py-11">
		      <div class="container">
		        <div class="row">
		          <div class="col-12">
		
		         
		
		          </div>
		        </div>
		        
		        <div class="row">
		          <div class="col-12">
		
		            <!-- Progress -->
		            <div class="row justify-content-center mt-7">
		              <div class="col-12 text-center">
		
		                <!-- Caption -->
		                <p class="fs-sm text-muted">
		                  	프리미엄 유저를 위해, 특별한 기능을 제공 합니다<br>
		                  	구독료&nbsp;:&nbsp;￦5,900
		                </p>
		
		                <!-- Progress -->
		                <div class="progress mx-auto mb-7" style="max-width: 250px;">
		      
		                </div>
		
		                <!-- Button -->
		                <form method="post" action="/thKakaoPay">
			                <button class="btn btn-sm btn-outline-dark" type="submit">
			                 	결제하기
			                </button>
						</form>
		
		    
		
		              </div>
		            </div>
		
		          </div>
		        </div>
		      </div>
		    </section>
            <!-- Slider -->
            <div class="row justify-content-center mb-12">

              <!-- Item -->
              <div class="col px-4 mx-8" style="max-width: 210px;">
                <div class="card">

                  <!-- Image -->
                  <img class="card-img-top" src="images/th/participantUp.jpg" alt="participantUp.jpg">

                  <!-- Body -->
                  <div class="card-body py-4 px-0 text-center">

                    <!-- Heading -->
                    <a class="stretched-link text-body" href="#!">
                      <h6>참여자수 증가</h6>
                    </a>

                  </div>

                </div>
              </div>


              <!-- Item -->
              <div class="col px-4 mx-4" style="max-width: 210px;">
                <div class="card">

                  <!-- Image -->
                  <img class="card-img-top" src="images/th/expUp.jpg" alt="expUp.jpg">

                  <!-- Body -->
                  <div class="card-body py-4 px-0 text-center">

                    <!-- Heading -->
                    <a class="stretched-link text-body" href="#!">
                      <h6>경험치 증가</h6>
                    </a>

                  </div>

                </div>
              </div>



              <!-- Item -->
              <div class="col px-4 mx-4" style="max-width: 210px;">
                <div class="card">

                  <!-- Image -->
                  <img class="card-img-top" src="images/th/privateRoom.jpg" alt="privateRoom.jpg">

                  <!-- Body -->
                  <div class="card-body py-4 px-0 text-center">

                    <!-- Heading -->
                    <a class="stretched-link text-body" href="#!">
                      <h6>비공개방 개설</h6>
                    </a>

                  </div>

                </div>
              </div>

              <!-- Item -->
              <div class="col px-4 mx-4" style="max-width: 210px;">
                <div class="card">

                  <!-- Image -->
                  <img class="card-img-top" src="images/th/qna24.jpg" alt="qna24.jpg">

                  <!-- Body -->
                  <div class="card-body py-4 px-0 text-center">

                    <!-- Heading -->
                    <a class="stretched-link text-body" href="#!">
                      <h6>24시간 Q&A서비스</h6>
                    </a>

                  </div>

                </div>
              </div>

            </div>

          </div>
        </div>
      </div>
    </div>



    <!-- FOOTER -->
    <%@ include file="../footer.jsp" %>

    <!-- JAVASCRIPT -->
<!--     {{> partials/scripts}} -->
 
</body>
</html>