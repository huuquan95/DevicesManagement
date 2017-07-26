<%@include file="/templates/taglib.jsp"%>
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
	</ul>
	<!-- END BREADCRUMB -->

	<!-- PAGE TITLE -->
	<div class="page-title">
		<h2>
			<span class="fa fa-arrow-circle-o-left"></span> Employee
		</h2>
	</div>
	<!-- END PAGE TITLE -->

	<!-- PAGE CONTENT WRAPPER -->
	<div class="page-content-wrap">
		<c:choose>
			<c:when test="${param['msg'] eq 'add'}">
				<div class=" alert alert-success" style="font-size: 20px;">Add
					Success</div>
			</c:when>
			<c:when test="${param['msg'] eq 'edit'}">
				<div class=" alert alert-success" style="font-size: 20px;">Update
					Success</div>
			</c:when>
			<c:when test="${param['msg'] eq 'del'}">
				<div class=" alert alert-success" style="font-size: 20px;">Delete
					Success</div>
			</c:when>
			<c:when test="${param['msg'] eq 'exist'}">
				<div class=" alert alert-success" style="font-size: 20px;">Id
					emplyee existed</div>
			</c:when>
			<c:when test="${param['msg'] eq 'wrong'}">
				<div class=" alert alert-success" style="font-size: 20px;">Your
					access be not allow</div>
			</c:when>
			<c:when test="${param['msg'] eq null}">
			</c:when>
			<c:otherwise>
				<div class="alert alert-danger" style="font-size: 20px;">Failure</div>
			</c:otherwise>
		</c:choose>
		<div class="row">
			<div class="col-md-12" id="body">

				<!-- START DEFAULT DATATABLE -->
				<div class="panel panel-default">
					<div class="panel-heading">
						<c:if test="${check ne null}">
							<a href="${pageContext.request.contextPath }/employee/add"
								type="button" class="btn btn-info">Add</a>
						</c:if>
						<ul class="panel-controls">
							<li><a href="#" class="panel-collapse"><span
									class="fa fa-angle-down"></span></a></li>
							<li><a href="#" class="panel-refresh"><span
									class="fa fa-refresh"></span></a></li>
							<li><a href="#" class="panel-remove"><span
									class="fa fa-times"></span></a></li>
						</ul>
					</div>
					<div class="panel-body" id="body">
						<div class="table-responsive">
							<table class="table datatable">
								<thead>
									<tr>
										<th>ID</th>
										<th>Name</th>
										<th>Position</th>
										<th>Date birth</th>
										<th>Address</th>
										<th>Team</th>
										<th>Phone</th>
										<th>Avatar</th>
										<th>Function</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${listItems}" var="item">
										<tr>
											<td>${item.getId()}</td>
											<td>${item.getName()}</td>
											<td><c:choose>
													<c:when
														test="${item.getNamePos() eq null or item.getNamePos() eq ''}">
														<span class="label label-success">New</span>
													</c:when>
													<c:otherwise>${item.getNamePos()}</c:otherwise>
												</c:choose></td>
											<td>${item.getBirthday()}</td>
											<td>${item.getAddress()}</td>
											<td><c:choose>
													<c:when
														test="${item.getNameTeam() eq null or item.getNameTeam() eq ''}">
														<span class="label label-success">New</span>
													</c:when>
													<c:otherwise>${item.getNameTeam()}</c:otherwise>
												</c:choose></td>
											<td>${item.getPhone()}</td>
											<td><c:choose>
													<c:when test="${item.getPicture() eq ''}">
														<span class="label label-danger">Null</span>
													</c:when>
													<c:otherwise>
														<img style="width: 60px; height: 50px;" alt=""
															src="${pageContext.request.contextPath}/files/${item.getPicture()}" />
													</c:otherwise>
												</c:choose></td>

											<td><c:if test="${check ne null}">
													<a
														href="${pageContext.request.contextPath }/employee/edit/${item.getId()}"
														title="">
														<button class="btn btn-default btn-rounded btn-sm">
															<span class="fa fa-pencil"></span>
														</button>
													</a>
													<a
														href="${pageContext.request.contextPath }/employee/del/${item.getId()}"
														title="">
														<button class="btn btn-danger btn-rounded btn-sm">
															<span class="fa fa-times"></span>
														</button>
													</a>
												</c:if> <c:if test="${check eq null}">
													<c:if test="${idObjLogin eq item.getId()}">
														<a
															href="${pageContext.request.contextPath }/employee/edit/${item.getId()}"
															title="">
															<button class="btn btn-default btn-rounded btn-sm">
																<span class="fa fa-pencil"></span>
															</button>
														</a>
													</c:if>
												</c:if></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<!-- END DEFAULT DATATABLE -->




			</div>
		</div>