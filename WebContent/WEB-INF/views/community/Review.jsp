<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Community</title>
<!-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous"> -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="/css/community/review.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
    
<script>
    $(document).ready(function(){
      $(window).scroll(function(){
        var scroll = $(window).scrollTop();
        if (scroll > 1) {
          $("#nav_bar").css("background" , "white");
          $("#nav_bar").css("opacity" , "0.5");
          $("#nav_bar").css("color" , "black");
        }
        else{
          $("#nav_bar").css("background" , "white");
          $("#nav_bar").css("opacity" , "1");  
        }
      })
    })
</script>
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
                    <li><a href="/qna/main">Community</a></li>
				</ul>
			</div>
			<div id="nav_bar_logo">
				<a href="/mainpage/view">Assemble</a>
			</div>
			<div id="nav_bar_other">
				<div id="wrap">
					<form action="" autocomplete="on">
						<input id="search" name="search" type="text"
							placeholder="???????????? ???????????????."><input id="search_submit"
							value="Rechercher" type="submit">
					</form>
				</div>
			<c:if test="${ sessionScope.member eq null }">
            <div id="cart">
               
               <a href="#"><i class="fas fa-shopping-cart fa-lg"
                  style="color: #3d3d3d; margin-top: 12px; margin-left: 8px;"></i></a>

            </div>
            </c:if>
            
            <c:if test="${ sessionScope.member ne null }">
            <div id="cart">
               
               <a href="/member/shoppingbag?userId=${sessionScope.member.memberId }"><i class="fas fa-shopping-cart fa-lg"
                  style="color: #3d3d3d; margin-top: 12px; margin-left: 8px;"></i></a>

            </div>
            </c:if>

            <c:if test="${ sessionScope.member eq null }">
               <!-- ?????????x -->
               <div id="login">
                  <div class="nav-item dropdown" >
                     <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
                        role="button" data-toggle="dropdown" aria-haspopup="true"
                        aria-expanded="false"> <i
                        class="fas fa-lg fa-user-astronaut" style='color: #3d3d3d;'></i>
                     </a>
                     <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="/login.html">Log In</a>
                           <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="/enroll.jsp">????????????</a>
                     </div>
                  </div>
               </div>
            </c:if>

            <c:if test="${ sessionScope.member ne null }">
               <!-- ?????????o -->
               <div id="login">
                  <div class="nav-item dropdown" >
                     <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
                        role="button" data-toggle="dropdown" aria-haspopup="true"
                        aria-expanded="false"> <i
                        class="fas fa-lg fa-user-astronaut" style='color: #3d3d3d;'></i>
                     </a>
                     <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="/member/mypage?userId=${sessionScope.member.memberId }">MyPage</a> 
                        <a class="dropdown-item" href="/order/info?userId=${sessionScope.member.memberId }">Order Info</a>
                        
                        <c:if test="${ sessionScope.member.memberId eq 'admin'}">
                        <a class="dropdown-item" href="/WEB-INF/views/admin/adminPage.jsp">Admin Page</a>
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
        <div id="main_image"
			style="text-align: center; margin-top: 1%;">
			<img src="/img/review.gif" alt="..." style="width: 70%; height: 100%;">
		</div>
        <div id="section_title2">
        
        <!--  ----------------------------------------------------------------------------------------------------------------------------------------------------------- -->
            <p>Community</p>
            <p><a href="/qna/main">QnA</a> | <a href="/review/main" style="font-weight: bold;">??????</a></p>
            <div id="wrap2">
               <form action="/review/search" method="get" autocomplete="on">
               <input id="search" name="search1" type="text" placeholder="???????????? ???????????????.">
               <input id="search_submit" value="Rechercher" type="submit"> 
               </form>
            </div>
            <hr style="width: 80%;">
        </div>
        <div id="empty_space1"></div>
        <table class="table table-hover" id="tb-list">
			<thead>
			  <tr>
			    <th scope="col">No</th>
			    <th scope="col">??????</th>
			    <th scope="col">?????????</th>
			    <th scope="col">????????????</th>
			    <th scope="col">?????????</th>
			  </tr>
			</thead>
			<tbody>
				<c:forEach items="${list }" var="rv" varStatus="index">
					<tr>
					    <th scope="row">${rv.reviewNo }</th>
					    <td><a href="/review/select?reviewNo=${rv.reviewNo }" style="color: black;">${rv.rTitle }</a></td>
					    <td>${rv.memberId }</td>
					    <td>${rv.rDate }</td>
					    <td>${rv.viewCnt }</td>
				  	</tr>
				</c:forEach>
			</tbody>
		</table>
    	<div id="section_title2">
        	<nav aria-label="Page navigation example" id="paging">
        		<ul class="pagination">
        			${ pageNavi }
        		</ul>
        	</nav>
        	<div class="btn-group-toggle" id="input_btn" data-toggle="buttons">
        	<form action="/review/writeform" method="get">
			    <button type="submit" class="btn btn-outline-dark">????????????</button>
			</form>
			</div>
	    </div>
	    
    </section>
    <footer>
        <div id="empty_space2"></div>
        <div id="footer_icon">
            <h3>Assemble</h3>
        </div>
	    <div id="footer_contents">
            <ul>
                <li>(???)?????????</li>
                <li>????????????: ?????????</li>
                <li>??????????????? ?????? ???????????? 120 ???????????? 2F,3F</li>
                <li>?????????????????????: XXX-XX-XXXXXX</li>
                <li>COPYRIGHT ?? TENBYTEN ALL RIGHTS RESERVED.</li>
            </ul>
        </div>
        <div id="footer_icon">
            <div id="footer_icon_split">
                <i class="fas fa-headset fa-5x"></i>
            </div>
            <div id="footer_empty"></div>
            <div id="footer_empty"></div>
            <div id="footer_icon_split">
                <i class="fas fa-money-check-alt fa-4x"></i>
            </div>
        </div>
        <div id="footer_contents">
            <div id="footer_contents1">
                <ul>
                    <li class="phone">02-1234-5678</li>
                    <li class="time">?????? 09:00~18:00 / ???????????? 12:00~13:00</li>
                    <li class="notice">?????? ??? ???????????? ???????????????.</li>
                </ul>
            </div>
            <div id="footer_empty"></div>
            <div id="footer_empty"></div>
            <div id="footer_contents1">
                <ul>
                    <li class="account">???????????? 01234567-00-1234567</li>
                    <li class="account_holder">?????????: ?????????</li>
                </ul>
            </div>
        </div>
        <div id="empty_space2"></div>
    </footer>
</body>
</html>