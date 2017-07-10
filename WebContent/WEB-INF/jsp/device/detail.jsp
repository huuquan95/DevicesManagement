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
	/* alert(idAccount);
	alert(seri); */
	 $.ajax({
		url: '${pageContext.request.contextPath }/device/change',
		type: 'Post',
		cache: false,
		data:{
			aidAccount:idAccount, aseri:seri
		},
		success:function(data){
			$('#change-'+seri).html(data);
		},
		error:function(){
			alert("Error");
		}
	}); 
	}
</script>
			 

                <!-- PAGE TITLE -->
                <div class="page-title">                    
                    <h2><span class="fa fa-arrow-circle-o-left"></span> Devices</h2>
                </div>
                <!-- END PAGE TITLE -->                

                <!-- PAGE CONTENT WRAPPER -->
                <div class="page-content-wrap">                
                
                    <div class="row">
                        <div class="col-md-12">

                            <!-- START DEFAULT DATATABLE -->
                            <div class="panel panel-default">
					<div class="panel-heading">
						<a
							href="${pageContext.request.contextPath }/device/detail/add/${idDetail}"
							type="button" class="btn btn-info">Add</a>
						<c:if test="${param['msg'] eq 'add' }">
							<div style="color: blue; font-size: 20px; text-align: center">Add
								Success</div>
						</c:if>
						<c:if test="${param['msg'] eq 'edit' }">
							<div style="color: blue; font-size: 20px; text-align: center">Edit
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
					<div class="panel-body">
                                    <table class="table datatable" style="text-align:center">
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
                                                <th>Action</th>
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
                                                <td id="change${objItem.seri_number }">
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
                                                <td>
                                                    <a href="${pageContext.request.contextPath }/device/detail/edit/${objItem.seri_number}" class="btn btn-default btn-rounded btn-sm"><span class="fa fa-pencil">Edit</span></a>
                                                    <a href="${pageContext.request.contextPath }/device/detail/del/${objItem.seri_number}"  class="btn btn-danger btn-rounded btn-sm" onClick="return confirm('Do you want delete?')"><span class="fa fa-times">Del</span></a>
                                                 </td>
                                            </tr>
                                          </c:forEach>  
                                            
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <!-- END DEFAULT DATATABLE -->

                           

                        </div>
                         
                    </div>                                

    



                