<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/templates/taglib.jsp" %>
<%-- <c:set var="objLoginMain" value="${objLogin.getItem(userLogin)}"></c:set> --%>
<style>
a:hover{
text-decoration: none;
color:#F30E2B;
}
</style>
	<!-- START PAGE SIDEBAR -->
	<div class="page-sidebar">
			<!-- START X-NAVIGATION -->
			<ul class="x-navigation">
				<li class="xn-logo"><a href="#"></a> <a
					href="#" class="x-navigation-control"></a></li>
				<li class="xn-profile"><a href="#" class="profile-mini"> <img
						src="${pageContext.request.contextPath}/files/${objLogin.picture}"
						alt="${objLogin.username}" />
				</a>
					<div class="profile">
						<div class="profile-image">
							<img
								src="${pageContext.request.contextPath}/files/${objLogin.picture}"
								alt="${objLogin.username}" />
						</div>
						<div class="profile-data">
							<div class="profile-data-name">${userLogin}</div>
							<%-- <c:set var="objLoginMain" value="${objLogin.getItem(userLogin)}"></c:set> --%>
							<div class="profile-data-title">${objLogin.role}</div>
						</div>
						<div class="profile-controls">
							<a href="${pageContext.request.contextPath}/account/edit/${objLogin.id}" class="profile-control-left"><span
								class="fa fa-info"></span></a> <a href="${pageContext.request.contextPath}/contact"
								class="profile-control-right"><span class="fa fa-envelope"></span></a>
						</div>
					</div></li>
				<li class="xn-title">Management</li>
				<li><a href="${pageContext.request.contextPath}/employee"><span class="fa fa-users"></span>Employee</a></li>
				<li>
                    <a href="${pageContext.request.contextPath}/cat"><span class="fa fa-align-justify"></span> <span class="xn-text">Category</span></a>                        
                </li>
				<li><a href="${pageContext.request.contextPath}/device"><span class="fa fa-desktop"></span> Device</a></li>
				<li><a href="${pageContext.request.contextPath}/account"><span class="fa fa-user"></span> Account</a></li>
				<li><a href="${pageContext.request.contextPath}/contact"><span class="fa fa-file-text"></span> Contact</a></li>
				 <li><a href="${pageContext.request.contextPath}/history"><span class="fa fa-calendar"></span> History</a></li>
				 <li><a href="${pageContext.request.contextPath}/position"><span class="fa fa-columns"></span>Position</a></li>
				  <li><a href="${pageContext.request.contextPath}/team"><span class="fa fa-sitemap"></span> Team</a></li>
			</ul>
			<!-- END X-NAVIGATION -->
		</div>
	<!-- END PAGE SIDEBAR -->