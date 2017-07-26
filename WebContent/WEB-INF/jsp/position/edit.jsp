
    <%@ include file="/templates/taglib.jsp" %>
    <script type="text/javascript">
        
        
var mikExp = /[$\\@\!\\\#%\^\&\*\(\)\[\]\+\_\{\}\`\~\=\|]/;
function check(val) {
var strPass = val.value;
var strLength = strPass.length;
var lchar = val.value.charAt((strLength) - 1);
if(lchar.search(mikExp) != -1) {
var tst = val.value.substring(0, (strLength) - 1);
val.value = tst;
   }
}

</script>

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
<<<<<<< HEAD
                    <li><a href="#">Home</a></li>                    
                    <li><a href="#">Tables</a></li>
                    <li class="active">Data Tables</li>
=======
                    <li><a href="${pageContext.request.contextPath }/home">Home</a></li>
                    <li><a href="${pageContext.request.contextPath }/position">Position</a></li>                     
        			<li class="active">Edit</li>
>>>>>>> master
                </ul>
                <!-- END BREADCRUMB -->

                <!-- PAGE TITLE -->
                <div class="page-title">                    
<<<<<<< HEAD
                    <h2><span class="fa fa-arrow-circle-o-left"></span> Update Position</h2>
=======
                    <h2> Edit Position</h2>
>>>>>>> master
                </div>
                <!-- END PAGE TITLE -->                

                <!-- PAGE CONTENT WRAPPER -->
                <div class="page-content-wrap">                
                
                    <div class="row">
                        <div class="col-md-12">
							<div class="panel panel-default" style="padding:10px;">
                                <form id="frm" class="form-horizontal" action="" method="post">
                                    <div class="col-md-12">
                                    <div class="form-group">
                                        <label class="col-md-3 col-xs-12 control-label">Name</label>
                                        <div class="col-md-6 col-xs-12">                                            
                                            <div class="input-group">
                                                <span class="input-group-addon"><span class="fa fa-pencil"></span></span>
                                                <input onKeyUp="return check(this)" value="${objItem.namePos}" type="text" name="namePos" class="form-control"/>
                                            </div>                                         
                                            <span class="help-block">
                                            <form:errors path="objItemUpdate.name" style="color:red"></form:errors>
                                            <c:if test="${param['msg'] eq 'err' }">
			                                    <p style="color:red">Edit Unsuccessfully.</p>
			                                </c:if>
                                            </span>
                                        </div>
                                    </div>
                                    </div>
                                    <div class="panel-footer">
                                    <button type="reset" class="btn btn-default">Clear Form</button>
                                    <!-- <input type="submit" name="submit" value="Submit"/>  -->                                    
                                    <button type="submit" name="submit" class="btn btn-primary pull-right">Update</button>
                                </div>                                        
                                </form>                                
                            </div>
                        </div>
                         
                    </div>                                


    




                


                