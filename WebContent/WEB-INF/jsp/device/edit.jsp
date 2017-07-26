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
    	var id=document.frm.id.value;
    	var name=document.frm.name.value;
    	var madein=document.frm.made_in.value;
    	var idCat=document.frm.idCat.value;
    	
	    if (id == '') {
			document.getElementById("erIdEquipment").innerHTML = "Please input!";
			check = false;
		}
		if (name == '') {
			document.getElementById("erName").innerHTML = "Please input!";
			check = false;
		}
		
		if (madein == '') {
			document.getElementById("erMadein").innerHTML = "Please input!";
			check = false;
		}
		if (idCat == -1) {
			document.getElementById("erIdCat").innerHTML = "Please choose it!";
			check = false;
		} 
		return check;
	}
</script>

			<!-- START BREADCRUMB -->
                <ul class="breadcrumb">
                    <li><a href="${pageContext.request.contextPath }/home">Home</a></li>                    
                    <li><a href="${pageContext.request.contextPath }/device">Devices</a></li>
                    <li class="active">Edit Devices</li>
                </ul>
                <!-- END BREADCRUMB -->

                <!-- PAGE TITLE -->
                <div class="page-title">                    
                    <h2>Edit Devices</h2>
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
                                        <label class="col-md-3 col-xs-12 control-label">ID Device</label>
                                        <div class="col-md-6 col-xs-12">                                            
                                            <div class="input-group">
                                                <span class="input-group-addon"><span class="fa fa-pencil"></span></span>
                                                <input name="id" value="${objItem.id}" disabled="disabled" type="text" class="form-control"/>
                                            </div>                                            
                                            <span id="erIdEquipment" style="color:red" class="help-block">
                                            <%-- <form:errors path="objItem.id" style="color:red"></form:errors> --%>
                                            
                                            </span>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-3 col-xs-12 control-label">Name</label>
                                        <div class="col-md-6 col-xs-12">                                            
                                            <div class="input-group">
                                                <span class="input-group-addon"><span class="fa fa-pencil"></span></span>
                                                <input name="name" value="${objItem.name }" type="text" class="form-control"/>
                                            </div>                                            
                                            <span id="erName" style="color:red" class="help-block">
                                            </span>
                                        </div>
                                    </div>
                                     <div class="form-group">
                                        <label class="col-md-3 col-xs-12 control-label">Made in</label>
                                        <div class="col-md-6 col-xs-12">                                            
                                            <div class="input-group">
                                                <span class="input-group-addon"><span class="fa fa-pencil"></span></span>
                                                <input name="made_in" value="${objItem.made_in }" type="text" class="form-control"/>
                                            </div>                                            
                                            <span id="erMadein" style="color:red" class="help-block">
                                            </span>
                                        </div>
                                    </div>
                                    </div>
                                    <div class="col-md-6">                   
                                    <div class="form-group">
                                        <label class="col-md-3 col-xs-12 control-label">Category</label>
                                        <div class="col-md-6 col-xs-12">                                                                                            
                                            <select name="idCat" class="form-control select">
	                                            <option value="-1">--Choose category--</option>
	                                            <c:forEach items="${listCats }" var="objCat">
	                                            	<c:choose>
	                                               <c:when test="${objItem.idCat eq objCat.id }">
	                                               	<option selected="selected" value="${objCat.id }">${objCat.name }</option>
	                                               	</c:when>
	                                               	 <c:otherwise>
	                                               	<option value="${objCat.id }">${objCat.name }</option>
	                                               	</c:otherwise>
	                                               	</c:choose>
	                                            </c:forEach>
                                            </select>
                                            <span id="erIdCat" style="color:red" class="help-block"></span>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-3 col-xs-12 control-label">Picture</label>
                                        <div class="col-md-6 col-xs-12">                                                                                                                                        
                                            <input type="file" class="fileinput btn-primary" value="${objItem.picture }" name="filename" id="filename" title="Browse file"/>
                                            <span class="help-block"></span>
                                        </div>
                                       </div>
                                    	
                                      </div>         
                                    <div class="panel-footer">
                                    <button type="reset" class="btn btn-default">Clear Form</button>
                                    <button type="submit" name="submit" class="btn btn-primary pull-right">Update</button>
                                </div>                                        
                                </form>                                
                            </div></div></div>
                        </div>
                         
                    </div>                                

    



                
