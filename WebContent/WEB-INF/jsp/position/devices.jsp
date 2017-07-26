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
<<<<<<< HEAD


                <!-- PAGE TITLE -->
                <div class="page-title">                    
                    <h2><span class="fa fa-arrow-circle-o-left"></span>  </h2>
=======
			
			<!-- START BREADCRUMB -->
			<ul class="breadcrumb">
				<li><a href="${pageContext.request.contextPath }/home">Home</a></li>
		        <li><a href="${pageContext.request.contextPath }/position">Position</a></li>                     
				<li class="active">Devices of ${nameEm} </li>
			</ul>
			<!-- END BREADCRUMB -->

                <!-- PAGE TITLE -->
                <div class="page-title">                    

                    <h2><span class="fa fa-arrow-circle-o-left"></span> Device of <strong> ${nameEm}</strong> </h2>

>>>>>>> master
                </div>
                <!-- END PAGE TITLE -->                

                <!-- PAGE CONTENT WRAPPER -->
                <div class="page-content-wrap">                
                
                    <div class="row">
                        <div class="col-md-12">

                            <!-- START DEFAULT DATATABLE -->
                            <div class="panel panel-default">
                               
                                <div class="panel-body">
                                    <table class="table datatable">
                                        <thead>
                                            <tr>
                                                <th>ID</th>
												<th>Name</th>
												<th>Made</th>
											
												<th>Picture</th>
<<<<<<< HEAD
												<th>Detail</th>
												
=======

>>>>>>> master
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach var="objItem" items="${listItems}">
                                            <tr>
										<td>${objItem.getId()}</td>
										<td>${objItem.name}</td>
										<td>${objItem.made_in}</td>
										
				
										<td><c:if test="${objItem.picture eq ''}">
												<span class="label label-warning">Updating</span>
											</c:if> <c:if test="${objItem.picture ne ''}">
												<img style="width: 60px; height: 60px"
													alt="${objItem.picture }"
													src="${pageContext.request.contextPath }/files/${objItem.picture }" />
											</c:if></td>
<<<<<<< HEAD
										<td><a
											href="${pageContext.request.contextPath }/device/detail/${objItem.id}"
											style="background-color: #A9F5F2"
											class="btn btn-default btn-rounded btn-sm">Click here</a></td>
									   
=======

>>>>>>> master
									</tr>
                                       </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <!-- END DEFAULT DATATABLE -->

                           

                        </div>
                         
                    </div>                                
<script type="text/javascript">
    function  Confirm(){
    	
    }
</script>
    



                
