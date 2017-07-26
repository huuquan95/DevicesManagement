<%@include file = "/templates/taglib.jsp" %>

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
                    <h2>History</h2>
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
                                    <a href="${pageContext.request.contextPath }/history/add" type="button" class="btn btn-info">Add New</a>
                                </c:if>
                                    <ul class="panel-controls">
                                        <li><a href="#" class="panel-collapse"><span class="fa fa-angle-down"></span></a></li>
                                        <li><a href="#" class="panel-refresh"><span class="fa fa-refresh"></span></a></li>
                                        <li><a href="#" class="panel-remove"><span class="fa fa-times"></span></a></li>
                                    </ul>                                
                                </div>
                               <div class="panel-body" id="body"><div class="table-responsive">
                                    <table class="table datatable">
                                        <thead>
                                            <tr>
                                                <th>ID</th>
                                                <th>Devices</th>
                                                 <th>Seri number</th>
                                                <th>actions</th>s
                                                <c:if test="${check ne null}">
													<th>Function</th>
												</c:if>	
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${listHis}" var="objItem">
                                            <tr>
                                                <td>${objItem.id }</td>
                                                <td>${objItem.name }</td>
                                                <td>${objItem.seri_number }</td>
	                                            <td>
	                                                <c:choose>
	                                                	<c:when test="${objItem.action eq 0 }">
	                                                		<span class="label label-danger">Fixing</span>
	                                                	</c:when>
	                                                	<c:when test="${objItem.action eq 1}">
	                                                		<span class="label label-success">Buying</span>
	                                                	</c:when>
	                                                	<c:otherwise>
	                                                		<span class="label label-info">Using</span>
	                                                	</c:otherwise>
	                                                </c:choose>
	                                            </td>
	                                             <c:if test="${check ne null}">
		                                                <td>
		                                                          <a href="${pageContext.request.contextPath }/history/detail/${objItem.id}"
													title=""><button class="btn btn-default btn-rounded btn-sm"><span class="glyphicon glyphicon-list-alt"></span></button></a>
		                                                        <a href="${pageContext.request.contextPath }/history/del/${objItem.id}"
													title=""><button class="btn btn-danger btn-rounded btn-sm" onClick="delete_row('trow_1');"><span class="fa fa-times"></span></button></a>
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

    



                
