<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <!-- footer_main -->
<div class="row footer">
	<div class="col-md-12 top_footer">
		<h3 class="underline">
			DEVICES MANAGEMENT<span class="glyphicon glyphicon-open float_right">
			</span> <a href="logout" class="float_right font_20">Logout&nbsp|&nbsp</a>
		</h3>
	</div>
	<div class="col-md-6">
		<h3>Development Team</h3>
		<table class="tbl">
			<tr>
				<td style="width: 30%" class="color_cyan">Kevin</td>
				<td>kevin@gmail.com</td>
			</tr>
			<tr>
				<td class="color_cyan">Martin</td>
				<td>martin@gmail.com</td>
			</tr>
			<tr>
				<td class="color_cyan">Quinto</td>
				<td>quinto@gmail.com</td>
			</tr>
			<tr>
				<td class="color_cyan">Tina</td>
				<td>tina@gmail.com</td>
			</tr>
			<tr>
				<td class="color_cyan">Torres</td>
				<td>torres@gmail.com</td>
			</tr>
		</table>

	</div>
	<div class="col-md-6">
		<h3>Enclave Company</h3>
		<h5>
			Address: <span>453 - 455 Hoang Dieu Street, Danang, Vietnam</span>
		</h5>
		<h5>
			Phone: <span>+84 (945) 15 1000</span>
		</h5>
		<h5>
			Skype: <span>EnclaveIT.Danang.XO</span>
		</h5>
		<h5>
			Website: <span>www.enclaveit.com</span>
		</h5>
	</div>
	<div class="col-md-12 bot_footer">
		<center>
			<h4 style="font-weight: bold;">Copyright@ by Ahihi Team - 2017</h4>
		</center>
	</div>
</div>
		
		<!-- end footer_main -->		        
	       
                </div>
                <!-- PAGE CONTENT WRAPPER -->    
		
			 

	</div>
	<!-- END PAGE CONTENT -->
	
	</div>
	<!-- END PAGE CONTAINER -->
	
   
	<div class="message-box animated fadeIn" data-sound="alert"
		id="mb-signout">
		<div class="mb-container">
			<div class="mb-middle">
				<div class="mb-title">
					<span class="fa fa-sign-out"></span> Log <strong>Out</strong> ?
				</div>
				<div class="mb-content">
					<p>Are you sure you want to log out?</p>
					<p>Press No if youwant to continue work. Press Yes to logout
						current user.</p>
				</div>
				<div class="mb-footer">
					<div class="pull-right">
						<a href="${pageContext.request.contextPath}/login" class="btn btn-success btn-lg">Yes</a>
						<button class="btn btn-default btn-lg mb-control-close">No</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- END MESSAGE BOX-->

	<!-- START PRELOADS -->
	<audio id="audio-alert"
		src="${pageContext.request.contextPath}/templates/audio/alert.mp3"
		preload="auto"></audio>
	<audio id="audio-fail"
		src="${pageContext.request.contextPath}/templates/audio/fail.mp3"
		preload="auto"></audio>
	<!-- END PRELOADS -->

	<!-- START SCRIPTS -->
	<!-- START PLUGINS -->
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/templates/js/plugins/jquery/jquery.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/templates/js/plugins/jquery/jquery-ui.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/templates/js/plugins/bootstrap/bootstrap.min.js"></script>
	<!-- END PLUGINS -->

	<!-- START THIS PAGE PLUGINS-->
	<script type='text/javascript'
		src='${pageContext.request.contextPath}/templates/js/plugins/icheck/icheck.min.js'></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/templates/js/plugins/mcustomscrollbar/jquery.mCustomScrollbar.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/templates/js/plugins/scrolltotop/scrolltopcontrol.js"></script>
    <script type="text/javascript" 
    	src="${pageContext.request.contextPath}/templates/js/plugins/datatables/jquery.dataTables.min.js"></script>    
		

	<script type="text/javascript"
		src="${pageContext.request.contextPath}/templates/js/plugins/morris/raphael-min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/templates/js/plugins/morris/morris.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/templates/js/plugins/rickshaw/d3.v3.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/templates/js/plugins/rickshaw/rickshaw.min.js"></script>
	<script type='text/javascript'
		src='${pageContext.request.contextPath}/templates/js/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js'></script>
	<script type='text/javascript'
		src='${pageContext.request.contextPath}/templates/js/plugins/jvectormap/jquery-jvectormap-world-mill-en.js'></script>
	<script type='text/javascript'
		src='${pageContext.request.contextPath}/templates/js/plugins/bootstrap/bootstrap-datepicker.js'></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/templates/js/plugins/owl/owl.carousel.min.js"></script>

	<script type="text/javascript"
		src="${pageContext.request.contextPath}/templates/js/plugins/moment.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/templates/js/plugins/daterangepicker/daterangepicker.js"></script>
		
		<script type='text/javascript' src='${pageContext.request.contextPath}/templates/js/plugins/bootstrap/bootstrap-select.js'></script>        

        <script type='text/javascript' src='${pageContext.request.contextPath}/templates/js/plugins/validationengine/languages/jquery.validationEngine-en.js'></script>
        <script type='text/javascript' src='${pageContext.request.contextPath}/templates/js/plugins/validationengine/jquery.validationEngine.js'></script>        

        <script type='text/javascript' src='${pageContext.request.contextPath}/templates/js/plugins/jquery-validation/jquery.validate.js'></script>                

        <script type='text/javascript' src='${pageContext.request.contextPath}/templates/js/plugins/maskedinput/jquery.maskedinput.min.js'></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/templates/js/plugins/bootstrap/bootstrap-file-input.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/templates/js/plugins/bootstrap/bootstrap-select.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/templates/js/plugins/tagsinput/jquery.tagsinput.min.js"></script>
	<!-- END THIS PAGE PLUGINS-->

        


	<!-- START TEMPLATE -->

	<script type="text/javascript"
		src="${pageContext.request.contextPath}/templates/js/plugins.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/templates/js/actions.js"></script>


	<script type="text/javascript"
		src="${pageContext.request.contextPath}/templates/js/demo_dashboard.js"></script>
	<!-- END TEMPLATE -->
	<!-- END SCRIPTS -->
	
	
</body>

<!-- Mirrored from themifycloud.com/demos/templates/joli/ by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 09 Jun 2017 03:11:44 GMT -->
</html>