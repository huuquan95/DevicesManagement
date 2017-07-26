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
<<<<<<< HEAD
		<li><a href="#">Home</a></li>
		<li><a href="#">Tables</a></li>
		<li class="active">Data Tables</li>
=======
		<li><a href="${pageContext.request.contextPath }/home">Home</a></li>
        <li><a href="${pageContext.request.contextPath }/position">Position</a></li>                     
		<li class="active">Employee of ${nameRole } </li>
>>>>>>> master
	</ul>
	<!-- END BREADCRUMB -->

	<!-- PAGE TITLE -->
	<div class="page-title">
		<h2>
<<<<<<< HEAD
			<span class="fa fa-arrow-circle-o-left"></span> Sortable Tables
=======
			 Role : ${nameRole }
>>>>>>> master
		</h2>
	</div>
	<!-- END PAGE TITLE -->

	<!-- PAGE CONTENT WRAPPER -->
	<div class="page-content-wrap">
		
		<div class="row">
			<div class="col-md-12">

				<!-- START DEFAULT DATATABLE -->
				<div class="panel panel-default">
					<div class="panel-heading">
					
					</div>
					<div class="panel-body">
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
									
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${listItems}" var="item">
									<tr>
										<td>${item.getId()}</td>
										<td><a href="${pageContext.request.contextPath }/position/devices/${item.id}">${item.getName()}</a></td>
										<td><c:choose>
												<c:when test="${item.getNamePos() eq null or item.getNamePos() eq ''}">
													<span class="label label-success">New</span>
												</c:when>
												<c:otherwise>${item.getNamePos()}</c:otherwise>
											</c:choose></td>
										<td>${item.getBirthday()}</td>
										<td>${item.getAddress()}</td>
										<td><c:choose>
												<c:when test="${item.getNameTeam() eq null or item.getNameTeam() eq ''}">
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

						
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
				<!-- END DEFAULT DATATABLE -->




			</div>
		</div>