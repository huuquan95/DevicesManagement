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
		<li class="active">Contact</li>
	</ul>
	<!-- END BREADCRUMB -->

	<!-- PAGE TITLE -->
	<div class="page-title">
		<h2>Contact</h2>
	</div>
	<!-- END PAGE TITLE -->

	<!-- PAGE CONTENT WRAPPER -->
	<div class="page-content-wrap">

		<div class="row">
			<div class="col-md-12">

				<!-- START DEFAULT DATATABLE -->
				<div class="panel panel-default">
					<div class="panel-heading">

						<c:choose>
							<c:when test="${objLogin.getRole() eq 'USER'}">

								<a href="${pageContext.request.contextPath}/contact/add"
									type="button" class="btn btn-info">Add</a>

							</c:when>
							<c:otherwise>

								<td>${objItem.getStatus()}</td>

							</c:otherwise>
						</c:choose>

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
						<div class="table-responsive">
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

											<c:choose>
												<c:when
													test="${objLogin.getRole() eq 'ADMIN' && objItem.getStatus() ne 'resolved'}">

													<td id="td_Status${objItem.getId()}"><select
														id="status${objItem.getId()}" name="status"
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
												</c:when>
												<c:otherwise>
													<td>${objItem.getStatus()}</td>
												</c:otherwise>
											</c:choose>

											<td>${objItem.getDescription()}</td>
											<td><c:choose>
													<c:when test="${objItem.getStatus() eq 'resolved'}">
														<a
															href="${pageContext.request.contextPath }/contact/del/${objItem.id}"
															class="btn btn-danger btn-rounded btn-sm"
															onClick="return confirm('Do you want to delete?')"><span
															class="fa fa-times"></span></a>
													</c:when>
													<c:otherwise>
														<a id="td_Del${objItem.getId()}"
															href="${pageContext.request.contextPath }/contact/del/${objItem.id}"
															class="btn btn-danger btn-rounded btn-sm"
															onClick="return confirm('Do you want to delete?')"
															disabled><span class="fa fa-times"></span></a>
													</c:otherwise>
												</c:choose></td>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<!-- END DEFAULT DATATABLE -->
			</div>

		</div>
		<script type="text/javascript">
		
		function changeStatus(id){
			
			var idSelect="status"+id;
			var idTd="td_Status"+id;
			var idDel="td_Del"+id;		
			var se = document.getElementById(idSelect);
			var status = se.options[se.selectedIndex].text;
			
			$.ajax({
				url: '${pageContext.request.contextPath}/contact/edit',
				type: 'POST',
				cache: false, 
				data: {
					id: id,
				    status: status,
				},
				success: function(data){
					
					$("#"+idTd).html(data);
					if(data == "resolved")
						document.getElementById(idDel).removeAttribute("disabled");
					
					if(data.indexOf("in progress")!=-1)
						document.getElementById("numberOfNewMessages").innerHTML= parseInt(document.getElementById("numberOfNewMessages").innerHTML)-1;
				},
				error: function (){
					
					alert("Have some errors");
				}
			});
		}
		</script>