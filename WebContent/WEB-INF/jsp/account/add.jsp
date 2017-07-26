
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
         <li class="active">Add New Account</li>
	</ul>
	<!-- END BREADCRUMB -->

	<!-- PAGE TITLE -->
	<div class="page-title">
		<h2>
			 Add Account
		</h2>
	</div>
	<!-- END PAGE TITLE -->

	<!-- PAGE CONTENT WRAPPER -->
	<div class="page-content-wrap">

		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-default" style="padding: 10px;">
					<form action="${pageContext.request.contextPath}/account/add"
						class="form-horizontal" role="form" method="post">
						<div class="col-md-12">
							<div class="form-group">
								<label class="col-md-3 col-xs-12 control-label">Username</label>
								<div class="col-md-6 col-xs-12">
									<div class="input-group">
										<span class="input-group-addon"><span
											class="fa fa-pencil"></span></span> <input type="text"
											name="username" class="form-control" />
									</div>
									<span class="help-block">This is sample of text field</span>
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-3 col-xs-12 control-label">Password</label>
								<div class="col-md-6 col-xs-12">
									<div class="input-group">
										<span class="input-group-addon"><span
											class="fa fa-pencil"></span></span> <input type="password"
											name="password" class="form-control" />
									</div>
									<span class="help-block">This is sample of text field</span>
								</div>
							</div>
							
							<div class="form-group">
								<label class="col-md-3 col-xs-12 control-label">Role</label>
								<div class="col-md-6 col-xs-12">
									<select class="form-control select" name="role">
										<option >Admin</option>
										<option>User</option>
									</select> <span class="help-block">Select box example</span>
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-3 col-xs-12 control-label">Employee</label>
								<div class="col-md-6 col-xs-12">
									<select class="form-control select" name="id_Employee">
										<c:forEach var="objItem" items="${listItem}">
											<option value="${objItem.id}">${objItem.name}(${objItem.id})</option>

										</c:forEach>
									</select> <span class="help-block">Select box example</span>
								</div>
							</div>
						</div>
						<div class="panel-footer">
							<button class="btn btn-default">Clear Form</button>
							<button class="btn btn-primary pull-right">Submit</button>
						</div>
					</form>
				</div>
			</div>

		</div>
