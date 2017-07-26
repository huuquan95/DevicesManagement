
<%@ include file="/templates/taglib.jsp"%>
<!-- PAGE CONTENT -->
<div class="page-content">

	<!-- START X-NAVIGATION VERTICAL -->
	<ul class="x-navigation x-navigation-horizontal x-navigation-panel">
		<!-- TOGGLE NAVIGATION -->
		<li class="xn-icon-button"><a href="#"
			class="x-navigation-minimize"><span class="fa fa-dedent"></span></a>
		</li>
		<!-- END TOGGLE NAVIGATION -->

		<!-- SIGN OUT -->
		<li class="xn-icon-button pull-right"><a href="#"
			class="mb-control" data-box="#mb-signout"><span
				class="fa fa-sign-out"></span></a></li>
		<!-- END SIGN OUT -->


	</ul>
	<!-- END X-NAVIGATION VERTICAL -->

	<!-- START BREADCRUMB -->
	<ul class="breadcrumb">
		<li><a href="${pageContext.request.contextPath }/home">Home</a></li>                    
					<li><a href="${pageContext.request.contextPath }/account">Account</a></li>
			        <li class="active">Edit</li>
	</ul>
	<!-- END BREADCRUMB -->

	<!-- PAGE TITLE -->
	<div class="page-title">
		<h2>
			  Edit Account
		</h2>
	</div>
	<!-- END PAGE TITLE -->

	<!-- PAGE CONTENT WRAPPER -->
	<div class="page-content-wrap">

		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-default" style="padding: 10px;">
				<c var="objItem" items="${objItem}">
					<form action="${pageContext.request.contextPath}/account/edit/${objItem.id}"
						class="form-horizontal" role="form" method="post">
						
						
						
						<div class="col-md-12">
							<div class="form-group">
								<label class="col-md-3 col-xs-12 control-label">Username</label>
								<div class="col-md-6 col-xs-12">
									<div class="input-group">
										<span class="input-group-addon"><span
											class="fa fa-pencil">  </span></span> 
											<input type="text"
											name="username" class="form-control" value="${objItem.username }"/>
									</div>
									<span class="help-block">This is sample of text field</span>
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-3 col-xs-12 control-label">The New Password</label>
								<div class="col-md-6 col-xs-12">
									<div class="input-group">
										<span class="input-group-addon"><span
											class="fa fa-pencil"></span></span> <input type="password"
											name="password" class="form-control" value=""/>
									</div>
									<span class="help-block">This is sample of text field</span>
								</div>
							</div>
							
							<div class="form-group">
								<label class="col-md-3 col-xs-12 control-label">Role</label>
								<div class="col-md-6 col-xs-12">
									<select class="form-control select" name="role">
										 
                                               <c:choose>
                                               <c:when test="${objItem.role=='User' }">
                                               	<option selected="selected" value="User">User</option>
                                               	<option>Admin</option>
                                               	</c:when>
                                               	 <c:otherwise>
                                               	 <option>User</option>
                                               	<option>Admin</option>
                                               	</c:otherwise>
                                               	</c:choose>
                                               
									</select> <span class="help-block">Select box example</span>
								</div>
							</div>
							
						</div>
						</c>
						<div class="panel-footer">
							<button class="btn btn-default">Clear Form</button>
							<button class="btn btn-primary pull-right">Submit</button>
						</div>
					</form>
				</div>
			</div>

		</div>
