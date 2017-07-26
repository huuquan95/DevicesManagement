
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
					<li><a href="${pageContext.request.contextPath }/account">Account</a></li>
			        <li class="active">Devices of ${devicesofName }</li>
                </ul>
                <!-- END BREADCRUMB -->

                <!-- PAGE TITLE -->
                <div class="page-title">                    
                    <h2> Devices of <strong>${devicesofName }</strong>  </h2>
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
                                                <th>Seri-Number</th>
                                                <th>Name</th>
                                                 <th>Picture</th>
                                                <th>Made-in</th>
                                                <th>Price</th>
                                                <th>Warranty</th>
                                               
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach var="objItem" items="${objDevice}">
                                       <tr>
                                            	<td><a
											href="${pageContext.request.contextPath }/device/detail/${objItem.id}">${objItem.id}</a></td>
                                            	<td>${objItem.seri_number}</td>
                                            	<td>${objItem.name}</td>
                                            	<td><img height="70px" width="70px" src="${pageContext.request.contextPath}/files/${objItem.picture}" alt="" /></td>
                                            	<td>${objItem.made_in}</td>
                                            	<td>${objItem.price}</td>
                                            	<td>${objItem.warranty}</td>
                                            	
                                                
                                               
                                            </tr>
                                            </c:forEach>
                                            
                                        </tbody>
                                    </table></div>
                                </div>
                                
                            </div>
                


                           

                        </div>
                    </div>                                
 
		
			



                
