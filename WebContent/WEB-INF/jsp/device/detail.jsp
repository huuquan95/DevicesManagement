<%@include file="/templates/taglib.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
<script type="text/javascript">
function Change(idAccount,seri) {
	var result = confirm("Do you want to change it?");
	if(result){
		$.ajax({
			url: '${pageContext.request.contextPath }/device/change',
			type: 'Post',
			cache: false,
			data:{
				aidAccount:idAccount, aseri:seri
			},
			success:function(data){
				$('#change-'+seri).html(data);
				alert("You did change it");
			},
			error:function(){
				alert("Error");
			}
		});
	}else{
		alert("It haven't yet changed");
	}
	}
</script>
			  <!-- START BREADCRUMB -->
                <ul class="breadcrumb">
                    <li><a href="${pageContext.request.contextPath }/home">Home</a></li>                    
                    <li><a href="${pageContext.request.contextPath }/device">Devices</a></li>
                    <li class="active">Detail</li>
                </ul>
                <!-- END BREADCRUMB -->

                <!-- PAGE TITLE -->
                <div class="page-title">                    
                    <h2> Devices</h2>
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
	<c:when test="${param['msg'] eq null}">
	</c:when>
	<c:otherwise>
		<div class="alert alert-danger" style="font-size: 20px;">Failure</div>
	</c:otherwise>
</c:choose>

		<div class="row">
			<div class="col-md-12">

				<!-- START DEFAULT DATATABLE -->
				<div class="panel panel-default">
				<c:if test="${objLogin.role eq 'ADMIN' }"> 
					<div class="panel-heading">

						<a
							href="${pageContext.request.contextPath }/device/detail/add/${idDetail}"
							type="button" class="btn btn-info">Add</a>
					</div></c:if> 
					
					<div class="panel-body" id="body"><div class="table-responsive">
                                    <table id="example" class="table datatable" style="text-align:center">
                                        <thead>
                                            <tr>
                                                <th>Name</th>
                                                <th>Seri Number</th>
                                                <!-- <th>ID Account</th> -->
                                                <th>Username</th>
                                                <th>IsNew</th>
                                                <th>Status</th>
                                                <th>Price</th>
                                                <th>Warranty</th>
                                                <th>Date</th>
                                                <c:if test="${objLogin.role eq 'ADMIN' }">
                                                <th>Action</th></c:if>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach var="objItem" items="${listItemDetails}">
                                            <tr>
                                            <fmt:parseDate value="${objItem.date_start}" pattern="yyyy-MM-dd HH:mm:ss" var="myDate"/>
											<fmt:formatDate value="${myDate}" var="date_start" pattern="yyyy-MM-dd"/>
                                               <td>${objItem.name }</td>
                                                <td>${objItem.seri_number }</td>
                                                <%-- <td>
                                                    <c:if test="${objItem.idAccount ne -1}">${objItem.idAccount}</c:if>
                                                </td> --%>
                                                <c:if test="${objLogin.role eq 'ADMIN' }">
                                                <td  id="change${objItem.seri_number }">
                                                	<select onchange="return Change(this.value,'${objItem.seri_number}')" name="idAccount" class="form-control select">
		                                            <c:forEach items="${listAccounts }" var="objAccount">
		                                            <c:choose>
		                                               <c:when test="${objItem.idAccount eq objAccount.id }">
		                                               	<option selected='selected' value="${objAccount.id }">${objAccount.username  }</option>
		                                               	</c:when>
		                                               	 <c:otherwise>
		                                               	<option value="${objAccount.id }">${objAccount.username }</option>
		                                               	</c:otherwise>
	                                               	</c:choose>
		                                            </c:forEach>
	                                            	</select>
                                                </td>
                                                </c:if>
                                                
                                                <c:if test="${objLogin.role eq 'USER' }">
                                                <td>
                                                	<select disabled="disabled" name="idAccount" class="form-control select">
		                                            <c:forEach items="${listAccounts }" var="objAccount">
		                                            <c:choose>
		                                               <c:when test="${objItem.idAccount eq objAccount.id }">
		                                               	<option selected='selected' value="${objAccount.id }">${objAccount.username  }</option>
		                                               	</c:when>
		                                               	 <c:otherwise>
		                                               	<option value="${objAccount.id }">${objAccount.username }</option>
		                                               	</c:otherwise>
	                                               	</c:choose>
		                                            </c:forEach>
	                                            	</select>
                                                </td>
                                                </c:if>
                                                
                                                <c:choose>
                                               <c:when test="${objItem.isnew eq 1}">
                                               		<td><span class="label label-info">New</span></td>
                                               	</c:when>
                                               	 <c:otherwise>
                                               	 	<td><span class="label label-default">Old</span></td>
                                               	</c:otherwise>
                                             	</c:choose>
                                                <td>${objItem.status}</td>
                                                <td>${objItem.price}$</td>
                                                <td>${objItem.warranty}</td>
                                                <td width="15%">${date_start}</td>
                                                <c:if test="${objLogin.role eq 'ADMIN' }">
                                                <td>
                                                    <a href="${pageContext.request.contextPath }/device/detail/edit/${objItem.seri_number}" class="btn btn-default btn-rounded btn-sm"><span class="fa fa-pencil"></span></a>
                                                    <a href="${pageContext.request.contextPath }/device/detail/del/${objItem.seri_number}"  class="btn btn-danger btn-rounded btn-sm" onClick="return confirm('Do you want delete?')"><span class="fa fa-times"></span></a>
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

    



                
