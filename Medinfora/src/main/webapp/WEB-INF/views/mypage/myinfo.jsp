<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<% String ctxPath = request.getContextPath(); %>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<link rel="stylesheet" href="<%=ctxPath%>/resources/css/mypage/myinfo.css">
<script src="<%=ctxPath%>/resources/js/mypage/myinfo.js"></script>

<form style="margin: 0;" name ="configForm" method="post">
	<input type="hidden" name="userid" value="${sessionScope.loginuser.userid}" />
	<div class="infoitem">
	
		<div class="inneritem">
			<div class="sidetitle">
				내정보
			</div>
			<div class="main_contain">
			
				<div class="item_title">
					이름
				</div>
				<div class="item_input">
					${sessionScope.loginuser.name}
				</div>
				
				<div class="item_title">
					회원상태
				</div>
				<div class="item_input">
					<c:if test="${sessionScope.loginuser.mIdx==0}">
						관리자
					</c:if>
					<c:if test="${sessionScope.loginuser.mIdx==1}">
						일반회원
						<c:if test="${sessionScope.loginuser.loginmethod==1}">
							&nbsp;(카카오)
						</c:if>
					</c:if>
					<c:if test="${sessionScope.loginuser.mIdx==2}">
						의료회원
					</c:if>
				</div>
				
				<div class="item_title">
					이메일
				</div>
				<div class="item_input">
					${sessionScope.loginuser.email}
				</div>
				
				<div class="item_title">
					연락처
				</div>
				<c:if test="${sessionScope.loginuser.mIdx!=2}">
					<div class="item_input">
						<input type="text" class="item_inputtag" name="mobile" value="${sessionScope.loginuser.mobile}" />
					</div>
				</c:if>
				<c:if test="${sessionScope.loginuser.mIdx==2}">
					<div class="item_input">
						${sessionScope.loginuser.mobile}
					</div>
				</c:if>
				<div class="item_title">
				</div>
				<div class="item_input" id="mobile_waring" style="color: #DC3545;"></div>
				
				<c:if test="${sessionScope.loginuser.mIdx==1}">
					<div class="item_title">
						주소
					</div>
					<div class="item_input">
						<input id="address" type="text" class="item_inputtag" name="address" value="${sessionScope.loginuser.address}" readonly="readonly" onclick="javascript:search()" />
					</div>
					<div class="item_title">
					</div>
					<div class="item_input">
						<input id="detailaddress" type="text" class="item_inputtag" name="detailaddress" value="${sessionScope.loginuser.detailAddress}" />
					</div>
					<div class="item_title">
					</div>
					<div class="item_input" id="address_waring" style="color: #DC3545;"></div>
				</c:if>
				
				<c:if test="${sessionScope.loginuser.mIdx==2}">
					<div class="item_title">
						주소
					</div>
					<div class="item_input">
						${sessionScope.loginuser.address}
					</div>
				</c:if>
				<c:if test="${sessionScope.loginuser.mIdx!=2}">
					<div class="save_liner">
						<button type="button" class="item_btn" onclick="javascript:infoChange('${sessionScope.loginuser.mIdx}');">수정</button>
					</div>
				</c:if>
			</div>
		</div>
		<c:if test="${sessionScope.loginuser.loginmethod==0}">
			<div class="inneritem">
				<div class="sidetitle">
					비밀번호 변경
				</div>
				<div class="main_contain">
					<div class="item_title">
						현재 비밀번호
					</div>
					<div class="item_input">
						<input type="password" class="item_inputtag" name="Nowpwd" />
					</div>
					<div class="item_title">
					</div>
					<div class="item_input" id="Nowpwd_waring" style="color: #DC3545;"></div>
					<div class="item_title">
						새 비밀번호
					</div>
					<div class="item_input">
						<input type="password" class="item_inputtag" name="pwd" />
					</div>
					<div class="item_title">
					</div>
					<div class="item_input" id="pwd_waring" style="color: #DC3545;"></div>
					<div class="item_title">
						새 비밀번호 확인
					</div>
					<div class="item_input">
						<input type="password" class="item_inputtag" name="pwdRepect" />
					</div>
					<div class="item_title">
					</div>
					<div class="item_input" id="pwdRepect_waring" style="color: #DC3545;"></div>
					<div class="save_liner">
						<button type="button" class="item_btn" onclick="javascript:pwdChange()">변경</button>
					</div>
				</div>
			</div>
		</c:if>
	</div>
</form>