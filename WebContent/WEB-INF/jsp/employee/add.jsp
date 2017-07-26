<%@include file = "/templates/taglib.jsp" %>
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
                </ul>
                <!-- END BREADCRUMB -->

                <!-- PAGE TITLE -->
                <div class="page-title">                    
                    <h2> Add Employee</h2>
                </div>
                <!-- END PAGE TITLE -->                

                <!-- PAGE CONTENT WRAPPER -->
                <div class="page-content-wrap">                
                
                    <div class="row">
                        <div class="col-md-12" id="body">
							<div class="panel panel-default" style="padding:10px;">
							<div class="panel-body" id="body"><div class="table-responsive">
                                <form id = "addEmployee" class="form-horizontal" action = "${pageContext.request.contextPath }/employee/add" method = "POST"  enctype = "multipart/form-data">

                                    <div class="col-md-6">
                                        <div class="form-group">
                                        <label class="col-md-3 col-xs-12 control-label">Id Employee</label>
                                        <div class="col-md-6 col-xs-12">                                            
                                            <div class="input-group">
                                                <span class="input-group-addon"><span class="fa fa-pencil"></span></span>
                                                <input type="text" name = "id" class="form-control"/>
                                                
                                            </div>                                            
                                            <span class="help-block"><form:errors path = "objEmployee.id" style="color:red"></form:errors></span>
                                        </div>
                                    	</div>
                                    	
                                        <div class="form-group">
                                        <label class="col-md-3 col-xs-12 control-label">Name</label>
                                        <div class="col-md-6 col-xs-12">                                            
                                            <div class="input-group">
                                                <span class="input-group-addon"><span class="fa fa-pencil"></span></span>
                                                <input type="text" name = "name" class="form-control"/>
                                                 
                                            </div>                                            
                                            <span class="help-block"><form:errors path = "objEmployee.name" style="color:red"></form:errors></span>
                                        </div>
                                    	</div>
                                        
                                        <div class="form-group">
                                        <label class="col-md-3 col-xs-12 control-label">Postion</label>
                                        <div class="col-md-6 col-xs-12">                                                                                            
                                            <select name = "id_Position" class="form-control select">
                                            <c:forEach items="${listPosition}" var="objItemPos">
                                            	<option value = "${objItemPos.id}" >${objItemPos.namePos}</option>
                                            </c:forEach>
                                            </select>
                                            <span class="help-block">Select box example</span>
                                        </div>
                                    </div>
                                    
                                    <div class="form-group">                                        
                                        <label class="col-md-3 col-xs-12 control-label">Datebirth</label>
                                        <div class="col-md-6 col-xs-12">
                                            <div class="input-group">
                                                <span class="input-group-addon"><span class="fa fa-calendar"></span></span>
                                                <input type="text" name = "birthday" class="form-control datepicker" value="">
                                            </div>
                                            <span class="help-block"><form:errors path = "objEmployee.birthday" style="color:red"></form:errors></span>
                                        </div>
                                    </div>    
                                    <div class="form-group">
                                        <label class="col-md-3 col-xs-12 control-label">Email</label>
                                        <div class="col-md-6 col-xs-12">                                            
                                            <div class="input-group">
                                                <span class="input-group-addon"><span class="fa fa-pencil"></span></span>
                                                <input type="email" name = "email" class="form-control"/>

                                            </div>                                            
                                            <span class="help-block"><form:errors path = "objEmployee.email" style="color:red"></form:errors></span>
                                        </div>
                                    	</div>
                                    	
                                    </div>
                                       <div class="col-md-6">                                                                                                    
                                        <div class="form-group">
                                        <label class="col-md-3 col-xs-12 control-label">Address</label>
                                        <div class="col-md-6 col-xs-12">                                            
                                            <div class="input-group">
                                                <span class="input-group-addon"><span class="fa fa-pencil"></span></span>
                                                <input type="text" name = "address" class="form-control"/>
                                            </div>                                            
                                            <span class="help-block"><form:errors path = "objEmployee.address" style="color:red"></form:errors></span>
                                        </div>
                                    	</div>
                                    	
                                        <div class="form-group">
                                        <label class="col-md-3 col-xs-12 control-label">Id team</label>
                                        <div class="col-md-6 col-xs-12">                                                                                            
                                            <select name = "id_Team" class="form-control select">
                                            <c:forEach items="${listTeam}" var="objItemTeam">
                                            	<option value = "${objItemTeam.id}" >${objItemTeam.name}</option>	
                                            </c:forEach>
                                            </select>
                                            <span class="help-block">Select box example</span>
                                        </div>
                                    	</div>
                                        
                                        <div class="form-group">
                                        <label class="col-md-3 col-xs-12 control-label">Phone</label>
                                        <div class="col-md-6 col-xs-12">                                            
                                            <div class="input-group">
                                                <span class="input-group-addon"><span class="fa fa-pencil"></span></span>
                                                <input type="text" name = "phone" class="form-control"/>
                                                               
                                            </div>                                            
                                            <span class="help-block"><form:errors path = "objEmployee.phone" style="color:red"></form:errors>   </span>
                                        </div>
                                    	</div>
                                    	
                                    	
                                    	<div class="form-group">
                                        <label class="col-md-3 col-xs-12 control-label">Avatar</label>
                                        <div class="col-md-6 col-xs-12">                                                                                                                                        
                                            <input type="file" class="fileinput btn-primary" name="img"  title="Browse file"/>
                                            <span class="help-block">Input type file</span>
                                        </div>
                                        </div>
                                    	
                                      </div>         
                                    <div class="panel-footer">
                                    <button class="btn btn-default">Clear Form</button>                                    
                                    <button id = "validate" class="btn btn-primary pull-right">Submit</button>
                                </div>                                        
                                </form>    </div></div>   
                                <script type="text/javascript">
	                                $( "#addEmployee" ).validate({
	                                		errorPlacement: function (error, element) {
	                                	      error.insertBefore(element.parent());
	                                	    },
	                                	  rules: {
	                                		  id: {
	                                	     	 required: true
	                                	      },
	                                	      name: {
	                                	    	 required: true  
	                                	      },
	                                	      birthday: {
	                                	    	  required: true,	
	                                	    	  date: true,
	                                	      },
	                                	      email:{
	                                	    	  required: true,
	                                	    	  email:true,
	                                	      },
	                                	      address:{
	                                	    	  required: true 
	                                	      },
	                                	      phone:{
	                                	    	  required: true,
	                                	    	  number: true,
	                                	    	  minlength: 10,
	                                	    	  maxlength: 11,
	                                	      }
	                                	  },
	                                	});
	                                
                                </script>                         
                            </div>
                        </div>
                         
                    </div>                                

    



                
