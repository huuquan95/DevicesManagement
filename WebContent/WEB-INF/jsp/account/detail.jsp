
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
                    <li><a href="#">Home</a></li>                    
                    <li><a href="#">Tables</a></li>
                    <li class="active">Data Tables</li>
                </ul>
                <!-- END BREADCRUMB -->

                <!-- PAGE TITLE -->
                <div class="page-title">                    
                    <h2><span class="fa fa-arrow-circle-o-left"></span> Sortable Tables</h2>
                </div>
                <!-- END PAGE TITLE -->                

                <!-- PAGE CONTENT WRAPPER -->
                <div class="page-content-wrap">                
                
                    <div class="row">
                        <div class="col-md-12">

                           <!-- START DEFAULT DATATABLE -->
                            <div class="panel panel-default">
                                <div class="panel-heading">                                
                                    <a href="<%=request.getContextPath() %>/account/add" type="button" class="btn btn-info">Add</a>
                                    <ul class="panel-controls">
                                        <li><a href="#" class="panel-collapse"><span class="fa fa-angle-down"></span></a></li>
                                        <li><a href="#" class="panel-refresh"><span class="fa fa-refresh"></span></a></li>
                                        <li><a href="#" class="panel-remove"><span class="fa fa-times"></span></a></li>
                                    </ul>                                
                                </div>
                              
                                <div class="panel-body" id="body">
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
                                            	<td>${objItem.id}</td>
                                            	<td>${objItem.seri_number}</td>
                                            	<td>${objItem.name}</td>
                                            	<td><img src="<%=request.getContextPath() %>/...../${objItem.picture}" alt="" /></td>
                                            	<td>${objItem.made_in}</td>
                                            	<td>${objItem.price}</td>
                                            	<td>${objItem.warranty}</td>
                                            	
                                                
                                               
                                            </tr>
                                            </c:forEach>
                                            
                                        </tbody>
                                    </table>
                                </div>
                                
                            </div>
                


                           

                        </div>
                    </div>                                
 
		
			



                
