
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
		        <li class="active">Position</li>
			</ul>
			<!-- END BREADCRUMB -->

                <!-- PAGE TITLE -->
                <div class="page-title">                    
<<<<<<< HEAD
                    <h2><span class="fa fa-arrow-circle-o-left"></span> Role</h2>
=======

                    <h2>Position</h2>

>>>>>>> master
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
	<c:when test="${param['msg'] eq 'err'}">
		<div class=" alert alert-success" style="font-size: 20px;">Error.Try
								Again</div>
	</c:when>
</c:choose>

                    <div class="row">
                        <div class="col-md-12">

                            <!-- START DEFAULT DATATABLE -->
                            <div class="panel panel-default">
                            <c:if test="${objLogin.role eq 'ADMIN' }"> 
                                <div class="panel-heading">                                
                                    <a href="${pageContext.request.contextPath }/position/add" type="button" class="btn btn-info">Add</a>
<<<<<<< HEAD
                                    <ul class="panel-controls">
                                        <li><a href="#" class="panel-collapse"><span class="fa fa-angle-down"></span></a></li>
                                        <li><a href="#" class="panel-refresh"><span class="fa fa-refresh"></span></a></li>
                                        <li><a href="#" class="panel-remove"><span class="fa fa-times"></span></a></li>
                                    </ul>                                
                                </div>
=======
                                </div></c:if>
>>>>>>> master
                                <div class="panel-body">
                                    <table class="table datatable">
                                        <thead>
                                            <tr>
                                                <th>ID</th>
                                                <th>Name</th>
                                                <c:if test="${objLogin.role eq 'ADMIN' }"> 
                                                <th>Actions</th></c:if>
                                            </tr>
                                        </thead>
                                        <tbody>
                                             <c:forEach var="objItem" items="${listItems}">
                                            <tr>
                                                <td>${objItem.id }</td>
                                                <td><a href="${pageContext.request.contextPath }/position/employees/${objItem.id}">${objItem.namePos }</a></td>
<<<<<<< HEAD
                                                <td>
                                                        <a href="${pageContext.request.contextPath }/position/edit/${objItem.id}" class="btn btn-default btn-rounded btn-sm"><span class="fa fa-pencil"></span></a>
                                                        <a href="${pageContext.request.contextPath }/position/del/${objItem.id}"  class="btn btn-danger btn-rounded btn-sm" onClick="return confirm('Do you want delete?')"><span class="fa fa-times"></span></a>
                                                    </td>
=======
                                                <c:if test="${objLogin.role eq 'ADMIN' }"> 
                                                <td>
                                                        <a href="${pageContext.request.contextPath }/position/edit/${objItem.id}" class="btn btn-default btn-rounded btn-sm"><span class="fa fa-pencil"></span></a>
                                                        <a href="${pageContext.request.contextPath }/position/del/${objItem.id}"  class="btn btn-danger btn-rounded btn-sm" onClick="return confirm('Do you want delete?')"><span class="fa fa-times"></span></a>
                                                    </td></c:if>
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

    
 
