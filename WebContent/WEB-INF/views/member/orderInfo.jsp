<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문내역조회</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
	integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
	integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="/css/member/orderList.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<script>
	$(document).ready(function() {
		$(window).scroll(function() {
			var scroll = $(window).scrollTop();
			if (scroll > 1) {
				$("#nav_bar").css("background", "white");
				$("#nav_bar").css("opacity", "0.5");
				$("#nav_bar").css("color", "black");
			} else {
				$("#nav_bar").css("background", "white");
				$("#nav_bar").css("opacity", "1");
			}
		})
	})
</script>
   <style>
       *{
           border: 1px solid white;
       }
    </style>
</head>
<body>
	<header>
		<div id="nav_bar">
			<div id="nav_bar_menu">
				<ul>
					<li><a href="/recommend/listview">Recommend</a></li>
                    <li><a href="/getit/Component">Self</a></li>
                    <li><a href="/other/allList">Other</a></li>
                    <li><a href="/deal/main">Used Deal</a></li>
                    <li><a href="/review/main">Community</a></li>
				</ul>
			</div>
			<div id="nav_bar_logo">
				<a href="/mainpage/view">Assemble</a>
			</div>
			<div id="nav_bar_other">
				<div id="wrap">
				<!-- 	<form action="" autocomplete="on">
						<input id="search" name="search" type="text"
							placeholder="검색어를 입력하세요."><input id="search_submit"
							value="Rechercher" type="submit">
					</form> -->
				</div>
				<c:if test="${ sessionScope.member eq null }">
					<div id="cart">

						<a href="#"><i class="fas fa-shopping-cart fa-lg"
							style="color: #3d3d3d; margin-top: 12px; margin-left: 8px;"></i></a>

					</div>
				</c:if>

				<c:if test="${ sessionScope.member ne null }">
					<div id="cart">

						<a
							href="/member/shoppingbag?userId=${sessionScope.member.memberId }"><i
							class="fas fa-shopping-cart fa-lg"
							style="color: #3d3d3d; margin-top: 12px; margin-left: 8px;"></i></a>

					</div>
				</c:if>

				<c:if test="${ sessionScope.member eq null }">
					<!-- 로그인x -->
					<div id="login">
						<div class="nav-item dropdown">
							<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
								role="button" data-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false"> <i
								class="fas fa-lg fa-user-astronaut" style='color: #3d3d3d;'></i>
							</a>
							<div class="dropdown-menu" aria-labelledby="navbarDropdown">
								<a class="dropdown-item" href="/login.html">Log In</a>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="/enroll.jsp">회원가입</a>
							</div>
						</div>
					</div>
				</c:if>

				<c:if test="${ sessionScope.member ne null }">
					<!-- 로그인o -->
					<div id="login">
						<div class="nav-item dropdown">
							<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
								role="button" data-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false"> <i
								class="fas fa-lg fa-user-astronaut" style='color: #3d3d3d;'></i>
							</a>
							<div class="dropdown-menu" aria-labelledby="navbarDropdown">
								<a class="dropdown-item"
									href="/member/mypage?userId=${sessionScope.member.memberId }">MyPage</a>
								<a class="dropdown-item"
									href="/order/info?userId=${sessionScope.member.memberId }">Order
									Info</a>

								<c:if test="${ sessionScope.member.memberId eq 'admin'}">
									<a class="dropdown-item"
										href="/WEB-INF/views/admin/adminPage.jsp">Admin Page</a>
								</c:if>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="/member/logout">LogOut</a>
							</div>
						</div>
					</div>
				</c:if>
			</div>
		</div>
	</header>
	<section>
		<div id="section_empty"></div>
		<div id="section_contents">
			<div id="section_contents_empty"></div>
			
				<br> <br> <br> <br>
				
                
                <c:forEach items="${oList }" var="order" varStatus="status">
                    <div style="transform: translate(-50%, 0%); padding: 50px 50px 10px 50px; position: relative; top: 50%; left: 50%; text-align: center; width: 700px; box-shadow: 5px 5px 10px rgba(0, 0, 0, 0.5); border-radius: 8px;"> 
                    
                        <div style="float:left; text-align:left;  width:50%; margin-left:-30px; margin-top:-45px;">${order.payDate }</div>
                        <div style="text-align:right; margin-right:-30px; margin-top:-45px; "><a href="#" style="text-decoration:none;">주문 상세보기 > </a></div>
                        
                        <div style="list-style:none; transform: translate(-50%, 0%); padding: 15px; position: relative; top: 50%; left: 50%; text-align: center; width: 650px; height: 230px; border: 1px solid lightgray; border-radius: 8px; margin: 5px;" >
                        
                            
                            <div style="text-align: left; width:100%;">
                            			<c:if
											test="${order.payYN eq 'N' } && ${order.dStatus eq null }">
											<div>입금 전</div>
										</c:if>
										<c:if
											test="${order.payYN eq 'Y' } && ${order.dStatus eq null }">
											<div>결제 완료</div>
										</c:if>
										<c:if
											test="${order.dStatus eq 'B' } && ${order.payYN eq 'Y' }">
											<div>배송 준비</div>
										</c:if>
										<c:if
											test="${order.dStatus eq 'D' } && ${order.payYN eq 'Y' }">
											<div>배송 중</div>
										</c:if>

										<c:if test="${order.dStatus eq 'C'} && ${order.payYN eq 'Y' }">
											<div>배송 완료</div>
										</c:if>

										<c:if
											test="${order.dStatus eq 'C'} && ${order.returnYN eq 'Y' }">
											<div>반품신청</div>
										</c:if>
										<c:if
											test="${order.dStatus eq 'C'} && ${order.changeYN eq 'Y' }">
											<div>교환신청</div>
										</c:if>
                            </div>
                                <div style="text-align: center;">
                                    <div style="width:25%; height:100%; padding:10px; float: left;">${order.pFileName}</div>

                                    <div style="width:75%; padding:10px; text-align: left; float: left;">
                                                <ul style="list-style:none;">
                                                    <li style="font-weight: bolder; font-size: 20px; ">${order.pName}</li>
                                                    <li style="color:dimgray;">${order.pContents}</li>
                                                    <li style="text-align: right; color:gray; font-size: 12px;">${order.pPrice}원 · ${order.pAccount }개 </li>

                                                </ul>
                                    </div>
                                </div>
                             <div style="list-style:none; width:100%; text-align:center; ">
                                            <div style=" padding: 5px 30px 5px 30px; float:left; border: 1px solid lightgray; margin:5px 5px 5px 100px;border-radius: 8px; "><a
                                                href="/member/change?orderNo=${order.orderNo}" style="text-decoration:none;">교환신청</a></div>
                                            <div style=" padding: 5px 30px 5px 30px; float:left; border: 1px solid lightgray; margin:5px;border-radius: 8px;"><a href="/member/return?orderNo=${order.orderNo }" style="text-decoration:none;">반품신청</a></div>
                                            <div style="padding: 5px 30px 5px 30px; float:left; border: 1px solid lightgray; margin:5px;border-radius: 8px;"><a href="" style="text-decoration:none;">배송조회</a></div>
				            </div>
                        </div>
                        <div style="transform:translate(-50%, 50%); padding:5px; position:relative;
                        top: 50%;
                        left: 50%;
                        width:250px;
                        border: 1px solid lightgray; 
                        border-radius: 8px;
                        text-align:center;" >
				        <a href="/review/writeform" style="text-decoration:none; ">구매후기 쓰기</a>
                        </div>
                    <br>
                    </div>
                    <br><br>
                </c:forEach>
        </div>
	</section>
	<footer>
		<div id="empty_space2"></div>
		<div id="footer_icon">
			<h3>Assemble</h3>
		</div>
		<div id="footer_contents">
			<ul>
				<li>(주)어셈블</li>
				<li>대표이사: 노유진</li>
				<li>서울특별시 중구 남대문로 120 대일빌딩 2F,3F</li>
				<li>사업자등록번호: XXX-XX-XXXXXX</li>
				<li>COPYRIGHT © TENBYTEN ALL RIGHTS RESERVED.</li>
			</ul>
		</div>
		<div id="footer_icon">
			<div id="footer_icon_split">
				<i class="fas fa-headset fa-5x"></i>
			</div>
			<div id="footer_empty"></div>
			<div id="footer_icon_split">
				<i class="fas fa-money-check-alt fa-4x"></i>
			</div>
		</div>
		<div id="footer_contents">
			<div id="footer_contents1">
				<ul>
					<li class="phone">02-1234-5678</li>
					<li class="time">평일 09:00~18:00 / 점심시간 12:00~13:00</li>
					<li class="notice">주말 및 공휴일은 휴무입니다.</li>
				</ul>
			</div>
			<div id="footer_empty"></div>
			<div id="footer_contents1">
				<ul>
					<li class="account">국민은행 01234567-00-1234567</li>
					<li class="account_holder">예금주: 노유진</li>
				</ul>
			</div>
		</div>
		<div id="empty_space2"></div>
	</footer>
</body>
</html>