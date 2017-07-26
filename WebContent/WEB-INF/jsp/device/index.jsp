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
         <li class="active">Devices</li>
     </ul>
     <!-- END BREADCRUMB -->

	<!-- PAGE TITLE -->
	<div class="page-title">
		<h2>
			 Devices
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
	<c:when test="${param['msg'] eq 'err'}">
		<div class=" alert alert-success" style="font-size: 20px;">Error.Try
								Again</div>
	</c:when>
</c:choose>

		<div class="row">
			<div class="col-md-12">

				<!-- START DEFAULT DATATABLE -->
				<div class="panel panel-default">
				<c:if test="${objLogin.role eq 'ADMIN' }"> 
					<div class="panel-heading">

						<a href="${pageContext.request.contextPath }/device/add"
							type="button" class="btn btn-info">Add</a>
						<%-- <c:if test="${param['msg'] eq 'add' }">
							<div style="color: blue; font-size: 20px; text-align: center">Add
								Success</div>
						</c:if>
						<c:if test="${param['msg'] eq 'edit' }">
							<div style="color: blue; font-size: 20px; text-align: center">Edit
								Success</div>
						</c:if>
						<c:if test="${param['msg'] eq 'del' }">
							<div style="color: blue; font-size: 20px; text-align: center">Del
								Success</div>
						</c:if>
						<c:if test="${param['msg'] eq 'err' }">
							<div style="color: blue; font-size: 20px; text-align: center">Error.Try
								Again</div>
						</c:if> --%>
					</div></c:if> 
					<div class="panel-body" id="body"><div class="table-responsive">
						<table class="table datatable">
							<thead>
								<tr>
									<th>ID</th>
									<th>Name</th>
									<th>Category</th>
									<th>Made</th>
									<th>Quantity</th>
									<th>Picture</th>
									<th>Detail</th>
									<c:if test="${objLogin.role eq 'ADMIN' }"> 
									<th>Action</th></c:if>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="objItem" items="${listItems}">
									<tr>
										<td><a
											href="${pageContext.request.contextPath }/device/detail/${objItem.id}">${objItem.getId()}</a></td>
										<td><a
											href="${pageContext.request.contextPath }/device/detail/${objItem.id}">${objItem.name}</a></td>
										<td>${objItem.cname}</td>
										<td>${objItem.made_in}</td>
										<c:set var="quantity" value="${mainDAO.getCount(objItem.id)}"></c:set>
										<td>${quantity}</td>
										<td><c:if test="${objItem.picture eq ''}">
												<span class="label label-warning">Updating</span>
											</c:if> <c:if test="${objItem.picture ne ''}">
												<img style="width: 70px; height: 70px"
													alt="${objItem.picture }"
													src="${pageContext.request.contextPath }/files/${objItem.picture }" />
											</c:if></td>
										<td><a
											href="${pageContext.request.contextPath }/device/detail/${objItem.id}"
											style="background-color: #A9F5F2"
											class="btn btn-default btn-rounded btn-sm">Click here</a></td>
										<c:if test="${objLogin.role eq 'ADMIN' }"> 
										<td width="15%"><a
											href="${pageContext.request.contextPath }/device/edit/${objItem.id}"
											class="btn btn-default btn-rounded btn-sm"><span
												class="fa fa-pencil"></span></a> <a
											href="${pageContext.request.contextPath }/device/del/${objItem.id}"
											class="btn btn-danger btn-rounded btn-sm"
											onClick="return confirm('Do you want to delete all device belong to this id?')"><span
												class="fa fa-times"></span></a></td></c:if>
									</tr>
								</c:forEach>

							</tbody>
						</table></div>
					</div>
				</div>
				<!-- END DEFAULT DATATABLE -->


			</div>

		</div>

		
