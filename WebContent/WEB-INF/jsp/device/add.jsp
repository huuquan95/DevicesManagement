<%@include file="/templates/taglib.jsp"%>
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
			var str = document.frm.price.value;
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
		
		function checkID(x, id) {
			if (x == '') {
				document.getElementById(id).innerHTML = "Please input!";
			} else {
				document.getElementById(id).innerHTML = "";
			}
		}
		
		function check() {
			
			var check = true;
			var id = document.frm.id.value;
			var seri = document.frm.seri_number.value;
			var name = document.frm.name.value;
			//var idAccount = document.frm.idAccount.value;
			var madein = document.frm.made_in.value;
			var price = document.frm.price.value;
			var warranty = document.frm.warranty.value;
			var status = document.frm.status.value;
			var idCat = document.frm.idCat.value;
			var isnew = document.frm.isnew.value;

			if (id == '') {
				document.getElementById("erIdEquipment").innerHTML = "Please input!";
				check = false;
			}
			if (seri == '') {
				document.getElementById("erSeri").innerHTML = "Please input!";
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

			/* if (idAccount == -1) {
				document.getElementById("erIdAccount").innerHTML = "Please choose it!";
				check = false;
			} */
			if (price == '') {
				document.getElementById("erPrice").innerHTML = "Please input!";
				check = false;
			} else {
				for (var i = 0; i < price.length; i++) {
					var temp = price.substring(i, i + 1);
					if (!((temp >= 0 && temp <= 9))) {
						price = price.substring(0, i);
					}
				}
				document.frm.price.value = price;
			}

			if (warranty == '') {
				document.getElementById("erWarranty").innerHTML = "Please input!";
				check = false;
			}

			if (status == -1) {
				document.getElementById("erStatus").innerHTML = "Please choose it!";
				check = false;
			}
			if (idCat == -1) {
				document.getElementById("erIdCat").innerHTML = "Please choose it!";
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
		<li class="active">Add Devices</li>
	</ul>
	<!-- END BREADCRUMB -->

	<!-- PAGE TITLE -->
	<div class="page-title">
		<h2>Add Devices</h2>
	</div>
	<div style="text-align: center">
		<c:if test="${param['check'] eq 'err' }">
			<div style="color: red; font-size: 20px; text-align: center">This
				device exists!!</div>
		</c:if>
	</div>
	<!-- END PAGE TITLE -->

	<!-- PAGE CONTENT WRAPPER -->
	<div class="page-content-wrap">

		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-default" style="padding: 10px;">
					<div class="panel-body" id="body">
						<div class="table-responsive">
							<form onsubmit="return check()" name="frm"
								class="form-horizontal"
								action="${pageContext.request.contextPath}/device/add"
								method="post" enctype="multipart/form-data">
								<div class="col-md-6">
									<div class="form-group">
										<label class="col-md-3 col-xs-12 control-label">ID
											Device</label>
										<div class="col-md-6 col-xs-12">
											<div class="input-group">
												<span class="input-group-addon"><span
													class="fa fa-pencil"></span></span> <input name="id"
													onfocus="checkID(this.value,'erIdEquipment')"
													onkeyup="checkID(this.value,'erIdEquipment')" type="text"
													class="form-control" />
											</div>
											<span id="erIdEquipment" style="color: red"
												class="help-block"> <form:errors path="objItem.id"
													style="color:red"></form:errors>

											</span>
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 col-xs-12 control-label">Seri
											Number</label>
										<div class="col-md-6 col-xs-12">
											<div class="input-group">
												<span class="input-group-addon"><span
													class="fa fa-pencil"></span></span> <input
													onfocus="checkID(this.value,'erSeri')"
													onkeyup="checkID(this.value,'erSeri')" name="seri_number"
													type="text" class="form-control" />
											</div>
											<span id="erSeri" style="color: red" class="help-block">
												<%-- <form:errors path="objItem.seri_number" style="color:red"></form:errors> --%>
											</span>
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 col-xs-12 control-label">Name</label>
										<div class="col-md-6 col-xs-12">
											<div class="input-group">
												<span class="input-group-addon"><span
													class="fa fa-pencil"></span></span> <input
													onfocus="checkID(this.value,'erName')"
													onkeyup="checkID(this.value,'erName')" name="name"
													type="text" class="form-control" />
											</div>
											<span id="erName" style="color: red" class="help-block">
												<%-- <form:errors path="objItem.name" style="color:red"></form:errors> --%>
											</span>
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 col-xs-12 control-label">Made
											in</label>
										<div class="col-md-6 col-xs-12">
											<div class="input-group">
												<span class="input-group-addon"><span
													class="fa fa-pencil"></span></span> <input
													onfocus="checkID(this.value,'erMadein')"
													onkeyup="checkID(this.value,'erIdEquipment')"
													name="made_in" type="text" class="form-control" />
											</div>
											<span id="erMadein" style="color: red" class="help-block">
											</span>
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 col-xs-12 control-label">Account</label>
										<div class="col-md-6 col-xs-12">
											<select name="idAccount" class="form-control select">
												<c:forEach items="${listAccounts }" var="objAccount">
													<option value="${objAccount.id }">${objAccount.username }</option>
												</c:forEach>
											</select> <span class="help-block" id="erIdAccount" style="color: red"></span>
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 col-xs-12 control-label">Price</label>
										<div class="col-md-6 col-xs-12">
											<div class="input-group">
												<span class="input-group-addon"><span
													class="fa fa-pencil"></span></span> <input name="price"
													onfocus="checkID(this.value,'erPrice')"
													onkeyup="checkID(this.value,'erPrice')"
													onChange="format_curency(this);" type="text"
													class="form-control" />
											</div>
											<span class="help-block" id="erPrice" style="color: red"></span>
										</div>
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label class="col-md-3 col-xs-12 control-label">Warranty</label>
										<div class="col-md-6 col-xs-12">
											<div class="input-group">
												<span class="input-group-addon"><span
													class="fa fa-pencil"></span></span> <input
													onfocus="checkID(this.value,'erWarranty')"
													onkeyup="checkID(this.value,'erWarranty')" name="warranty"
													type="text" class="form-control" />
											</div>
											<span class="help-block" id="erWarranty" style="color: red"></span>
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 col-xs-12 control-label">Is New</label>
										<div class="col-md-6 col-xs-12">
											<input type="radio" name="isnew" value="1"> New <input
												type="radio" name="isnew" value="0"
												style="margin-left: 30px"> Old <span id="erIsnew"
												style="color: red" class="help-block"> <%-- <form:errors path="objItem.isnew" style="color:red"></form:errors> --%>
											</span>
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 col-xs-12 control-label">Status</label>
										<div class="col-md-6 col-xs-12">
											<select name="status" class="form-control select">
												<option value="-1">--Choose status--</option>
												<option value="No use">No use</option>
												<option value="In use">In use</option>
												<option value="Break">Break</option>
											</select> <span id="erStatus" style="color: red" class="help-block"></span>
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 col-xs-12 control-label">Category</label>
										<div class="col-md-6 col-xs-12">
											<select name="idCat" class="form-control select">
												<option value="-1">--Choose category--</option>
												<c:forEach items="${listCats }" var="objCat">
													<option value="${objCat.id }">${objCat.name }</option>
												</c:forEach>
											</select> <span id="erIdCat" style="color: red" class="help-block"></span>
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 col-xs-12 control-label">Picture</label>
										<div class="col-md-6 col-xs-12">
											<input type="file" class="fileinput btn-primary"
												name="filename" id="filename" title="Browse file" /> <span
												class="help-block"></span>
										</div>
									</div>

								</div>
								<div class="panel-footer">
									<button type="reset" class="btn btn-default">Clear
										Form</button>
									<button type="submit" name="submit"
										class="btn btn-primary pull-right">Submit</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>

		</div>
