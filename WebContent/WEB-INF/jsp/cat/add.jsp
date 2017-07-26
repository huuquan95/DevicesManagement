
    <%@ include file="/templates/taglib.jsp" %>
    <script type="text/javascript">
    function checkID(){
    	var x=document.frm.name.value;
    	var check=true;
		 if (x == '') {
			document.getElementById("erCat").innerHTML = "Please input!";
			check=false;
		}
		 return check;
}
</script>
<script type="text/javascript">
function check(str,id) {
	  var mikExp = /[$\\@\!\\\#%\^\&\*\(\)\[\]\+\_\{\}\`\~\=\|]/;
	  for (var i = 0; i < str.length; i++) {
	    var temp = str.substring(i, i + 1);
	    if (temp.search(mikExp) != -1) {
	      return str.substring(0, i);
	    }
	  }
	  if (str == '') {
			document.getElementById(id).innerHTML = "Please input!";
		}else{
			document.getElementById(id).innerHTML = "";
		}
	  return str;
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
                    <li><a href="${pageContext.request.contextPath }/home">Home</a></li>                    
                    <li><a href="${pageContext.request.contextPath }/cat">Category</a></li>
                    <li class="active">add</li>
                </ul>
                <!-- END BREADCRUMB -->

                <!-- PAGE TITLE -->
                <div class="page-title">                    
                    <h2>  Add Category</h2>
                </div>
                <!-- END PAGE TITLE -->                

                <!-- PAGE CONTENT WRAPPER -->
                <div class="page-content-wrap">                
                
                    <div class="row">
                        <div class="col-md-12">
							<div class="panel panel-default" style="padding:10px;">
							<div class="panel-body" id="body"><div class="table-responsive">
                                <form onsubmit="return checkID()" name="frm" id="frm" class="form-horizontal" action="" method="post">
                                    <div class="col-md-12">
                                    <div class="form-group">
                                        <label class="col-md-3 col-xs-12 control-label">Name</label>
                                        <div class="col-md-6 col-xs-12">                                            
                                            <div class="input-group">
                                                <span class="input-group-addon"><span class="fa fa-pencil"></span></span>
                                                <input onfocus="this.value=check(this.value,'erCat');" onkeyup="this.value=check(this.value,'erCat');"  type="text" name="name" class="form-control"/>
                                            </div>                                         
                                            <span id="erCat" style="color:red" class="help-block">
                                            <form:errors path="objItem.name" style="color:red"></form:errors>
                                            <c:if test="${param['check'] eq 'err' }">
			                                    <p style="color:red">This name is exist</p>
			                                </c:if>
                                            </span>
                                        </div>
                                    </div>
                                    </div>
                                    <div class="panel-footer">
                                    <button type="reset" class="btn btn-default">Clear Form</button>
                                    <!-- <input type="submit" name="submit" value="Submit"/>  -->                                    
                                    <button type="submit" name="submit" class="btn btn-primary pull-right">Submit</button>
                                </div>                                        
                                </form>                                
                            </div></div></div>
                        </div>
                         
                    </div>                                


    




                


                
