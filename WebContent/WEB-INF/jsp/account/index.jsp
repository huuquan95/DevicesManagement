
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
		<li><a href="#">Home</a></li>
		<li><a href="#">Tables</a></li>
		<li class="active">Data Tables</li>
	</ul>
	<!-- END BREADCRUMB -->

	<!-- PAGE TITLE -->
	<div class="page-title">
		<h2>
			<span class="fa fa-arrow-circle-o-left"></span> Sortable Tables
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
						<a href="<%=request.getContextPath()%>/account/add" type="button"
							class="btn btn-info">Add</a>
						<ul class="panel-controls">
							<li><a href="#" class="panel-collapse"><span
									class="fa fa-angle-down"></span></a></li>
							<li><a href="#" class="panel-refresh"><span
									class="fa fa-refresh"></span></a></li>
							<li><a href="#" class="panel-remove"><span
									class="fa fa-times"></span></a></li>
						</ul>
					</div>
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
						<c:when test="${param['msg'] eq 'notadd'}">
							<div class=" alert alert-danger" style="font-size: 20px;">Don't have Employee to Add New Account</div>
						</c:when>
						<c:when test="${param['msg'] eq null}">
						</c:when>
						<c:otherwise>
							<div class="alert alert-danger" style="font-size: 20px;">Failure</div>
						</c:otherwise>
					</c:choose>
					<div class="panel-body" id="body">
						<table class="table datatable">
							<thead>
								<tr>
									<th>ID</th>
									<th>Username</th>
									<th>Role</th>
									<th>Employee</th>
									<th>Picture</th>
									<th>Enabled</th>
									<th>Function</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="objItem" items="${listItems}">
									<tr>
										<td>${objItem.id }</td>
										<td><a type="button"
											href="${pageContext.request.contextPath}/account/detail/${objItem.id}">${objItem.username }</a></td>
										<td>${objItem.role }</td>
										<td>${objItem.name }</td>
										<td><img
											src="${pageContext.request.contextPath}/${objItem.picture }"
											alt="" /></td>
										<td id="ajaxpicture${objItem.id}">
										<c:choose>
											<c:when
												test="${objItem.enabled eq 1}">
												<img
													onclick="return getActive(${objItem.id },${objItem.enabled })"
													height="25px" width="25px"
													src="${pageContext.request.contextPath}/templates/img/icons/en.png"
													alt="" />
											</c:when> 
											<c:otherwise>
												<img
													onclick="return getActive(${objItem.id },${objItem.enabled })"
													height="25px" width="25px"
													src="${pageContext.request.contextPath}/templates/img/icons/un.png"
													alt="" />
											</c:otherwise>
										</c:choose>	
										</td>
										<td><a
											href="${pageContext.request.contextPath}/account/edit/${objItem.id}"><button
													class="btn btn-default btn-rounded btn-sm">
													<span class="fa fa-pencil"></span>
												</button></a> <a
											href="${pageContext.request.contextPath}/account/del/${objItem.id}"><button
													class="btn btn-danger btn-rounded btn-sm"
													onClick="delete_row('trow_1');">
													<span class="fa fa-times"></span>
												</button></a></td>
									</tr>
								</c:forEach>

							</tbody>
						</table>
					</div>
					<script type="text/javascript">
									function getActive(id, enabled){
										$.ajax({
											url: '${pageContext.request.contextPath}/account/active',
											type: 'POST',
											cache: false, 
											data: {
													//Dữ liệu gửi đi
												id: id,
											    enabled: enabled,
													},
											success: function(data){
												// Xử lý thành công
											
												$("#ajaxpicture"+id).html(data);
											},
											error: function (){
											// Xử lý nếu có lỗi
											//alert("Có lỗi trong quá trình xử lý");
											}
										});
										return false;
									}
								</script>
				</div>
				<!-- END DEFAULT DATATABLE -->




			</div>
		</div>
