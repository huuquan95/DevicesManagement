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
			<span class="fa fa-arrow-circle-o-left"></span> Contact
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
						<a href="${pageContext.request.contextPath}/contact/add"
							type="button" class="btn btn-info">Add</a>
						<c:if test="${param['msg'] eq 'add' }">
							<div style="color: blue; font-size: 20px; text-align: center">Add
								Success</div>
						</c:if>
						<c:if test="${param['msg'] eq 'del' }">
							<div style="color: blue; font-size: 20px; text-align: center">Del
								Success</div>
						</c:if>
						<c:if test="${param['msg'] eq 'err' }">
							<div style="color: blue; font-size: 20px; text-align: center">Error.Try
								Again</div>
						</c:if>
					</div>
					<div class="panel-body" id="body">
						<table class="table datatable">
							<thead>
								<tr>
									<th>ID</th>
									<th>Employee</th>
									<th>Status</th>
									<th>Description</th>
									<th>Actions</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="objItem" items="${listItems}">
									<tr>
										<td>${objItem.getId()}</td>
										<td>${objItem.getUserName()}</td>
										<td id="td_Status"><select id="status" name="status"
											onchange="changeStatus(${objItem.getId()})"
											class="form-control" style="width: 70%;">
												<c:if test="${objItem.getStatus() eq 'new'}">
													<option value="new" selected="selected">new</option>
													<option value="in progress">in progress</option>
												</c:if>
												<c:if test="${objItem.getStatus() eq 'in progress'}">
													<option value="in progress" selected="selected">in
														progress</option>
													<option value="resolved">resolved</option>
												</c:if>
												<c:if test="${objItem.getStatus() eq 'resolved'}">
													<option value="resolved" selected="selected">resolved</option>
												</c:if>
										</select></td>
										<td>${objItem.getDescription()}</td>
										<td><a
											href="${pageContext.request.contextPath }/contact/del/${objItem.id}"
											class="btn btn-danger btn-rounded btn-sm"
											onClick="return confirm('Do you want delete?')"><span
												class="fa fa-times"></span></a></td>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
				<!-- END DEFAULT DATATABLE -->
			</div>

		</div>
		<script type="text/javascript">
		function changeStatus(id){
			var se = document.getElementById("status");
			var status = se.options[se.selectedIndex].text;
			alert(id+" "+status);
			$.ajax({
				url: '${pageContext.request.contextPath}/contact/edit',
				type: 'POST',
				cache: false, 
				data: {
						//Dữ liệu gửi đi
					id: id,
				    status: status,
						},
				success: function(data){
					// Xử lý thành công
				
					$("td_Status").html(data);
				},
				error: function (){
				// Xử lý nếu có lỗi
				alert("Có lỗi trong quá trình xử lý");
				}
			});
		}
		</script>
