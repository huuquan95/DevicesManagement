<%@ include file="/templates/taglib.jsp" %>

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
                    <li><a href="${pageContext.request.contextPath }/cat">Category</a></li>
                    <li class="active">Detail</li>
                </ul>
                <!-- END BREADCRUMB -->

                <!-- PAGE TITLE -->
                <div class="page-title">                    
                    <h2> Device of <strong>${objCat.name} </strong></h2>
                </div>
                <!-- END PAGE TITLE -->                

                <!-- PAGE CONTENT WRAPPER -->
                <div class="page-content-wrap">                
                
                    <div class="row">
                        <div class="col-md-12">

                            <!-- START DEFAULT DATATABLE -->
                            <div class="panel panel-default">
                                <div class="panel-body" id="body"><div class="table-responsive">
                                    <table class="table datatable">
                                        <thead>
                                            <tr>
                                                <th>ID</th>
												<th>Name</th>
												<th>Made</th>
												<th>Quantity</th>
												<th>Picture</th>
												<th>Detail</th>
												<c:if test="${objLogin.role eq 'ADMIN' }"> 
												<th>Action</th></c:if>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach var="objItem" items="${listItemsByIdCat}">
                                            <tr>
										<td>${objItem.getId()}</td>
										<td>${objItem.name}</td>
										<td>${objItem.made_in}</td>
										<c:set var="quantity" value="${deviceDAO.getCount(objItem.id)}"></c:set>
										<td>${quantity}</td>
										<td><c:if test="${objItem.picture eq ''}">
												<span class="label label-warning">Updating</span>
											</c:if> <c:if test="${objItem.picture ne ''}">
												<img style="width: 60px; height: 60px"
													alt="${objItem.picture }"
													src="${pageContext.request.contextPath }/files/${objItem.picture }" />
											</c:if></td>
										<td><a
											href="${pageContext.request.contextPath }/device/detail/${objItem.id}"
											style="background-color: #A9F5F2"
											class="btn btn-default btn-rounded btn-sm">Click here</a></td>
										<c:if test="${objLogin.role eq 'ADMIN' }"> 
									    <td width="15%">
                                           <a href="${pageContext.request.contextPath }/device/edit/${objItem.id}" class="btn btn-default btn-rounded btn-sm"><span class="fa fa-pencil">Edit</span></a>
                                           <a href="${pageContext.request.contextPath }/device/del/${objItem.id}"  class="btn btn-danger btn-rounded btn-sm" onClick="return confirm('Do you want to delete all device belong to this id?')"><span class="fa fa-times">Del</span></a>
                                        </td>
                                        </c:if>
									</tr>
                                       </c:forEach>
                                        </tbody>
                                    </table></div>
                                </div>
                            </div>
                            <!-- END DEFAULT DATATABLE -->

                           

                        </div>
                         
                    </div>                                
    



                