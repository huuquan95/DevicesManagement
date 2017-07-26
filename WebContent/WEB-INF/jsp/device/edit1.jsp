<%@include file="/templates/taglib.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
function check() {
	var str=document.frm.price.value;
	for (var i = 0; i < str.length; i++) {
	    var temp = str.substring(i, i + 1);
	    if (!((temp >= 0 && temp <= 9))) {
	      return str.substring(0, i);
	    }
	  }
	  return str;
	}
</script>
<script type="text/javascript">
function format_curency(a) {
    a.value = a.value.replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1.");
}  
</script>
<script type="text/javascript">
    function check(){
    	var check=true;
    	var seri=document.frm.seri_number.value;
    	var price=document.frm.price.value;
    	var warranty=document.frm.warranty.value;
    	var status=document.frm.status.value;
    	var isnew=document.frm.isnew.value;
    	
		if (seri == '') {
			document.getElementById("erSeri").innerHTML = "Please input!";
			check = false;
		}
		
		if (price == '') {
			document.getElementById("erPrice").innerHTML = "Please input!";
			check = false;
		}else{
			for (var i = 0; i < price.length; i++) {
			    var temp = price.substring(i, i + 1);
			    if (!((temp >= 0 && temp <= 9))) {
			      price=price.substring(0, i);
			    }
			  }
			document.frm.price.value=price;
		}
		
		if (warranty == '') {
			document.getElementById("erWarranty").innerHTML = "Please input!";
			check = false;
		}
		
		 if (status==-1) {
			document.getElementById("erStatus").innerHTML = "Please choose it!";
			check = false;
		} 
		if (isnew == '') {
			document.getElementById("erIsnew").innerHTML = "Please choose it!";
			check = false;
		} 
		return check;
	}
</script>

			  <!-- START BREADCRUMB -->
               <ul class="breadcrumb">
                    <li><a href="${pageContext.request.contextPath }/home">Home</a></li>                    
                    <li><a href="${pageContext.request.contextPath }/device">Devices</a></li>
                    <li><a href="${pageContext.request.contextPath }/device/detail/${iddetail}">Detail</a></li>
                    <li class="active">Edit Devices</li>
                </ul>
                <!-- END BREADCRUMB -->

                <!-- PAGE TITLE -->
                <div class="page-title">                    
                    <h2>Add Device</h2>
                </div>
                <!-- END PAGE TITLE -->                

                <!-- PAGE CONTENT WRAPPER -->
                <div class="page-content-wrap">                
                
                    <div class="row">
                        <div class="col-md-12">
							<div class="panel panel-default" style="padding:10px;">
							<div class="panel-body" id="body"><div class="table-responsive">
                                <form onsubmit="return check()" name="frm" class="form-horizontal" action="" method="post" enctype="multipart/form-data">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                        <label class="col-md-3 col-xs-12 control-label">Seri Number</label>
                                        <div class="col-md-6 col-xs-12">                                            
                                            <div class="input-group">
                                                <span class="input-group-addon"><span class="fa fa-pencil"></span></span>
                                                <input name="seri_number" value="${objDeviceEdit.seri_number }" disabled="disabled" type="text" class="form-control"/>
                                            </div>                                            
                                            <span id="erSeri" style="color:red" class="help-block">
                                            </span>
                                        </div>
                                    </div>
                                      <div class="form-group">
                                        <label class="col-md-3 col-xs-12 control-label">Account</label>
                                        <div class="col-md-6 col-xs-12">                                                                                            
                                           <select name="idAccount" class="form-control select">
	                                            <c:forEach items="${listAccounts }" var="objAccount">
	                                            <c:choose>
	                                               <c:when test="${objDeviceEdit.idAccount eq objAccount.id }">
	                                               	<option selected="selected" value="${objAccount.id }">${objAccount.username  }</option>
	                                               	</c:when>
	                                               	 <c:otherwise>
	                                               	<option value="${objAccount.id }">${objAccount.username }</option>
	                                               	</c:otherwise>
                                               	</c:choose>
	                                            </c:forEach>
                                            </select>
                                             <span class="help-block" id="erIdAccount" style="color:red"></span> 
                                        </div>
                                    </div>
                                      <div class="form-group">
                                        <label class="col-md-3 col-xs-12 control-label">Price</label>
                                        <div class="col-md-6 col-xs-12">                                            
                                            <div class="input-group">
                                                <span class="input-group-addon"><span class="fa fa-pencil"></span></span>
                                                <input name="price" value="${objDeviceEdit.price }" onChange="format_curency(this);" type="text" class="form-control"/>
                                            </div>                                            
                                            <span class="help-block" id="erPrice" style="color:red"></span>
                                        </div>
                                    </div>
                                    </div>
                                    <div class="col-md-6">                   
                                      <div class="form-group">
                                        <label class="col-md-3 col-xs-12 control-label">Warranty</label>
                                        <div class="col-md-6 col-xs-12">                                            
                                            <div class="input-group">
                                                <span class="input-group-addon"><span class="fa fa-pencil"></span></span>
                                                <input name="warranty"  value="${objDeviceEdit.warranty }" type="text" class="form-control"/>
                                            </div>                                            
                                            <span class="help-block" id="erWarranty" style="color:red"></span>
                                        </div>
                                    </div>
                                        <div class="form-group">
                                        <label class="col-md-3 col-xs-12 control-label">Is New</label>
                                        <div class="col-md-6 col-xs-12">  
                                       		<c:choose>
                                               <c:when test="${objDeviceEdit.isnew eq 1 }">
                                               	<input type="radio" name="isnew" checked="checked" value="1"> New
  												<input type="radio" name="isnew" value="0" style="margin-left:30px"> Old
                                               	</c:when>
                                               	 <c:otherwise>
                                               	 <input type="radio" name="isnew" value="1"> New
  												<input type="radio" name="isnew" checked="checked" value="0" style="margin-left:30px"> Old
                                               	</c:otherwise>
                                             	</c:choose>                                                                                          
                                            <span id="erIsnew" style="color:red" class="help-block">
                                            </span> 
                                        </div>
                                    </div>
                                     <div class="form-group">
                                        <label class="col-md-3 col-xs-12 control-label">Status</label>
                                        <div class="col-md-6 col-xs-12">                                                                                            
                                            <select name="status" class="form-control select">
                                                <option value="-1">--Choose status--</option>
                                                <c:choose>
	                                               <c:when test="${objDeviceEdit.status eq 'In use' }">
		                                               	<option selected="selected" value="${objDeviceEdit.status }">${objDeviceEdit.status }</option>
		                                               	<option value="No use">No use</option>
	                                                	<option value="Break">Break</option>
	                                               	</c:when>
	                                               	<c:when test="${objDeviceEdit.status eq 'No use' }">
		                                               	<option selected="selected" value="${objDeviceEdit.status }">${objDeviceEdit.status }</option>
		                                               	<option value="In use">In use</option>
	                                                	<option value="Break">Break</option>
	                                               	</c:when>
	                                               	 <c:otherwise>
		                                               	<option selected="selected" value="${objDeviceEdit.status }">${objDeviceEdit.status }</option>
		                                               	<option value="In use">In use</option>
	                                               		 <option value="No use">No use</option>
	                                               	</c:otherwise>
	                                               	</c:choose>
                                            </select>
                                            <span id="erStatus" style="color:red" class="help-block"></span>
                                        </div>
                                    </div>
                                    	
                                      </div>         
                                    <div class="panel-footer">
                                    <button type="reset" class="btn btn-default">Clear Form</button>
                                    <button type="submit" name="submit" class="btn btn-primary pull-right">Submit</button>
                                </div>                                        
                                </form>      </div></div>                          
                            </div>
                        </div>
                         
                    </div>                                

    



                
