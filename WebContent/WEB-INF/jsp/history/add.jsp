<%@include file="/templates/taglib.jsp"%>
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
		<h2>
			 Add History
		</h2>
	</div>
	<!-- END PAGE TITLE -->

	<!-- PAGE CONTENT WRAPPER -->
	<div class="page-content-wrap">
	<c:choose>
		<c:when test="${check eq 'error' }">
			<span class=" alert alert-success" style="font-size: 20px;">Please, check id devices and serinumber againt.</span>
		</c:when>
		<c:otherwise>
		
		</c:otherwise>
	</c:choose>
		<div class="row">
			<div class="col-md-12" id="body">
				<div class="panel panel-default" style="padding: 10px;">
					<form id = "addHis" class="form-horizontal"
						action="${pageContext.request.contextPath }/history/add"
						method="POST" onsubmit="return validateForm()">
						<div class="col-md-6">

							<div class="form-group">
								<label class="col-md-3 col-xs-12 control-label">Devices</label>
								<div class="col-md-6 col-xs-12">
									<select name="id_Equipment" class="form-control select">
										<c:forEach items="${listDevice}" var="objItem">
											<option value="${objItem.id}">${objItem.name}</option>
										</c:forEach>
									</select> <span class="help-block">Select box example</span>
								</div>
							</div>
							
							<div class="form-group">
								<label class="col-md-3 col-xs-12 control-label">Seri number</label>
								<div class="col-md-6 col-xs-12">
									<select name="seri_number" class="form-control select">
										<c:forEach items="${listDevice}" var="objItem">
											<option value="${objItem.seri_number}">${objItem.seri_number}</option>
										</c:forEach>
									</select> <span class="help-block">Select box example</span>
								</div>
							</div>
							
							<div class="form-group">
								<label class="col-md-3 col-xs-12 control-label">Timestart</label>
								<div class="col-md-6 col-xs-12">
									<div class="input-group">
										<span class="input-group-addon"><span
											class="fa fa-calendar"></span></span> <input type="text"
											name="timeStart" class="form-control datepicker" value="">
									</div>
									<span class="help-block"><form:errors
											path="objHis.timeStart" style="color:red"></form:errors></span>
								</div>
							</div>

						</div>
						
						<div class="col-md-6">
							<div class="form-group">
								<label class="col-md-3 col-xs-12 control-label">Account</label>
								<div class="col-md-6 col-xs-12">
									<select name="id_Account" class="form-control select">
									<option value="0">Choose the account</option>
										<c:forEach items="${listItems}" var="itemAccount">
											<option value="${itemAccount.id}">${itemAccount.username}</option>
										</c:forEach>
									</select> <span class="help-block">Select box example</span>
								</div>
							</div>

							<div class="form-group">
								<label class="col-md-2 col-xs-8 control-label col-md-offset-1">Fixing</label>
								<div class="col-md-1 col-xs-4">
									<input type="radio" name="action" value="0">
								</div>
								<label class="col-md-2 col-xs-8 control-label">Buying</label>
								<div class="col-md-1 col-xs-4">
									<input type="radio" name="action" value="1">
								</div>
								<label class="col-md-2 col-xs-8 control-label">Using</label>
								<div class=" col-md-1 col-xs-4">
									<input type="radio" name="action" value="2">
								</div>
							</div>

						</div>
						
						<div class="panel-footer">
							<button class="btn btn-default">Clear Form</button>
							<button class="btn btn-primary pull-right">Submit</button>
						</div>
					</form>
					 <script type="text/javascript">
	                     $( "#addHis" ).validate({
	                    	 errorPlacement: function (error, element) {
                       	      error.insertBefore(element.parent());
                       	    }, 
	                    	 rules: {
	                     	     timeStart: {
	                     	    	  required: true,
	                     	    	  date: true,
	                     	      },
	                     	  }
	                     	});
					 
						  function validateForm() {
							    var radios = document.getElementsByName("action");
							    var formValid = false;

							    var i = 0;
							    while (!formValid && i < radios.length) {
							        if (radios[i].checked) formValid = true;
							        i++;        
							    }

							    if (!formValid) alert("Please choose action!");
							    return formValid;
							}
						  </script> 
				</div>
			</div>

		</div>
