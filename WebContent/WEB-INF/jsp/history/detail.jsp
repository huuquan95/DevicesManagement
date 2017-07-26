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
			Edit History
		</h2>
	</div>
	<!-- END PAGE TITLE -->

	<!-- PAGE CONTENT WRAPPER -->
	<div class="page-content-wrap">

		<div class="row">
			<div class="col-md-12" id="body">
				<div class="panel panel-default" style="padding: 10px;">

					<form class="form-horizontal"
						action="${pageContext.request.contextPath }/history/update/${objHisDetail.id}"
						method="POST"  role="form">
						<div class="col-md-6">
							<div class="form-group">
								<label class="col-md-3 col-xs-12 control-label">Id
									History</label>
								<div class="col-md-6 col-xs-12">
									<div class="input-group">
										<span class="input-group-addon"><span
											class="fa fa-pencil"></span></span> <input disabled="disabled"
											type="text" value="${objHisDetail.id}" name="id"
											class="form-control" />
									</div>
									<span class="help-block">This is sample of text field</span>
								</div>
							</div>

							<div class="form-group">
								<label class="col-md-3 col-xs-12 control-label">Name devices</label>
								<div class="col-md-6 col-xs-12">
									 <select name = "id_Equipment" class="form-control select">
									 <c:forEach items="${listDev}" var="itemDev">
										<c:choose>
											 <c:when test="${itemDev.id eq objHisDetail.id_Equipment}">
										 		<c:set value="selected = 'selected'" var="activeDev"></c:set>
										 	</c:when>
										 	<c:otherwise>
										 		<c:set value="" var="activeDev"></c:set>
										 	</c:otherwise>
										</c:choose>
									 	<option ${activeDev} value = "${itemDev.id}" >${itemDev.name}</option>
									 </c:forEach>
                                     </select> <span class="help-block">Select box example</span>
								</div>
							</div>

							<div class="form-group">
								<label class="col-md-3 col-xs-12 control-label">Category</label>
								<div class="col-md-6 col-xs-12">
									 <select name = "idCat" class="form-control select">
									 	<c:forEach items="${listCat}" var="itemCat">
										<c:choose>
											 <c:when test="${itemCat.id eq objHisDetail.idCat}">
										 		<c:set value="selected = 'selected'" var="activeCat"></c:set>
										 	</c:when>
										 	<c:otherwise>
										 		<c:set value="" var="activeCat"></c:set>
										 	</c:otherwise>
										</c:choose>
									 	<option ${activeCat} value = "${itemCat.id}" >${itemCat.name}</option>
									 </c:forEach>
                                            </select> <span class="help-block">Select box example</span>
								</div>
							</div>
							
							<div class="form-group">
								<label class="col-md-3 col-xs-12 control-label">Time history</label>
								<div class="col-md-6 col-xs-12">
									<div class="input-group">
										<span class="input-group-addon"><span
											class="fa fa-calendar"></span></span>
											<fmt:formatDate pattern="yyyy-MM-dd" value="${objHisDetail.timeStart}" var = "timeStart" />
											 <input type="text"
											class="form-control datepicker"
											value="${timeStart}" name="timeStart">
									</div>
									<span class="help-block"><form:errors path = "objHis.timeStart" style="color:red"></form:errors></span>
								</div>
							</div>

						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label class="col-md-3 col-xs-12 control-label">Seri number</label>
								<div class="col-md-6 col-xs-12">
									 <select name = "seri_number" class="form-control select">
										 <c:forEach items="${listDev}" var="itemDev">
											<c:choose>
												 <c:when test="${itemDev.seri_number eq objHisDetail.seri_number}">
											 		<c:set value="selected = 'selected'" var="activeSeri"></c:set>
											 	</c:when>
											 	<c:otherwise>
											 		<c:set value="" var="activeSeri"></c:set>
											 	</c:otherwise>
											</c:choose>
										 	<option ${activeSeri} value = "${itemDev.seri_number}" >${itemDev.seri_number}</option>
										 </c:forEach>
                                     </select> <span class="help-block">Select box example</span>
								</div>
							</div>


							<div class="form-group">
								<label class="col-md-3 col-xs-12 control-label">Username</label>
								<div class="col-md-6 col-xs-12">
									 <select name = "id_Account" class="form-control select">
									 <c:forEach items ="${listAcc}" var = "itemAcc">
										 <c:choose>
									 		<c:when test="${itemAcc.id eq objHisDetail.id_Account}">
									 			<c:set value="selected = 'selected'" var="activeAcc"></c:set>
										 	</c:when>
										 	<c:otherwise>
										 		<c:set value="" var="activeAcc"></c:set>
										 	</c:otherwise>
									 	</c:choose>
									 	<option ${activeAcc} value = "${itemAcc.id}" >${itemAcc.username}</option>
									 </c:forEach>
                                            	
                                            </select> <span class="help-block">Select box example</span>
								</div>
							</div>
							
							<div class="form-group">
								<label class="col-md-3 col-xs-12 control-label">Date start of devices</label>
								<div class="col-md-6 col-xs-12">
									<div class="input-group">
										<span class="input-group-addon"><span
											class="fa fa-calendar"></span></span>
											<fmt:formatDate pattern="yyyy-MM-dd" value="${objHisDetail.date_start}" var = "date_start" />
											 <input type="text"
											class="form-control datepicker"
											value="${date_start}" name="date_start">
									</div>
									<span class="help-block"><form:errors path = "objHis.date_start" style="color:red"></form:errors></span>
								</div>
							</div>
							
							<div class="form-group">
							<c:choose>
								<c:when test = "${objHisDetail.action eq 0}">
									<label class="col-md-2 col-xs-8 control-label col-md-offset-1">Fixing</label>
									<div class="col-md-1 col-xs-4">
										<input checked type="radio" name="action" value="0">
									</div>
									<label class="col-md-2 col-xs-8 control-label">Buying</label>
									<div class="col-md-1 col-xs-4">
										<input type="radio" name="action" value="1">
									</div>
									<label class="col-md-2 col-xs-8 control-label">Using</label>
									<div class=" col-md-1 col-xs-4">
										<input type="radio" name="action" value="2">
									</div>
								</c:when>
								<c:when test = "${objHisDetail.action eq 1}">
									<label class="col-md-2 col-xs-8 control-label col-md-offset-1">Fixing</label>
									<div class="col-md-1 col-xs-4">
										<input  type="radio" name="action" value="0">
									</div>
									<label class="col-md-2 col-xs-8 control-label">Buying</label>
									<div class="col-md-1 col-xs-4">
										<input checked type="radio" name="action" value="1">
									</div>
									<label class="col-md-2 col-xs-8 control-label">Using</label>
									<div class=" col-md-1 col-xs-4">
										<input type="radio" name="action" value="2">
									</div>
								</c:when>
								<c:otherwise>
									<label class="col-md-2 col-xs-8 control-label col-md-offset-1">Fixing</label>
									<div class="col-md-1 col-xs-4">
										<input  type="radio" name="action" value="0">
									</div>
									<label class="col-md-2 col-xs-8 control-label">Buying</label>
									<div class="col-md-1 col-xs-4">
										<input type="radio" name="action" value="1">
									</div>
									<label class="col-md-2 col-xs-8 control-label">Using</label>
									<div class=" col-md-1 col-xs-4">
										<input checked type="radio" name="action" value="2">
									</div>
								</c:otherwise>
							</c:choose>
								
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
