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
				<li class="active">Home</li>
			</ul>
			<!-- END BREADCRUMB -->

			<!-- PAGE CONTENT WRAPPER -->
			<div class="page-content-wrap">

				<!-- START WIDGETS -->
				<div class="row">
					<div class="col-md-3">

						<!-- START WIDGET SLIDER -->
						<div class="widget widget-default widget-carousel">
							<div class="owl-carousel" id="owl-example">
								<div>
									<div class="widget-title">Total Devices</div>
									<div class="widget-subtitle">27/08/2014 15:23</div>
									<c:if test="${numberOfDevices ne null or numberOfDevices ne ''}">
										<div class="widget-int">${numberOfDevices}</div>
									</c:if>
								</div>
								<div>
									<div class="widget-title">Total Category</div>
									<div class="widget-subtitle">Visitors</div>
									<c:if test="${numberOfCat ne null or numberOfCat ne ''}">
										<div class="widget-int">${numberOfCat}</div>
									</c:if>
								</div>
								<div>
									<div class="widget-title">New</div>
									<div class="widget-subtitle">Visitors</div>
									<div class="widget-int">1,977</div>
								</div>
							</div>
							<div class="widget-controls">
								<a href="#" class="widget-control-right widget-remove"
									data-toggle="tooltip" data-placement="top"
									title="Remove Widget"><span class="fa fa-times"></span></a>
							</div>
						</div>
						<!-- END WIDGET SLIDER -->

					</div>
					<div class="col-md-3">

						<!-- START WIDGET MESSAGES -->
						<div class="widget widget-default widget-item-icon"
							onclick="location.href='pages-messages.html';">
							<div class="widget-item-left">
								<span class="fa fa-envelope"></span>
							</div>
							<div class="widget-data">
								<div class="widget-int num-count">${sizeMessage}</div>
								<div class="widget-title">New messages</div>
								<div class="widget-subtitle">In your mailbox</div>
							</div>
							<div class="widget-controls">
								<a href="#" class="widget-control-right widget-remove"
									data-toggle="tooltip" data-placement="top"
									title="Remove Widget"><span class="fa fa-times"></span></a>
							</div>
						</div>
						<!-- END WIDGET MESSAGES -->

					</div>
					<div class="col-md-3">

						<!-- START WIDGET REGISTRED -->
						<div class="widget widget-default widget-item-icon"
							onclick="location.href='pages-address-book.html';">
							<div class="widget-item-left">
								<span class="fa fa-user"></span>
							</div>
							<div class="widget-data">
								<div class="widget-int num-count">${sizeEmployee}</div>
								<div class="widget-title">Registred users</div>
								<div class="widget-subtitle">On your website</div>
							</div>
							<div class="widget-controls">
								<a href="#" class="widget-control-right widget-remove"
									data-toggle="tooltip" data-placement="top"
									title="Remove Widget"><span class="fa fa-times"></span></a>
							</div>
						</div>
						<!-- END WIDGET REGISTRED -->

					</div>
					<div class="col-md-3">

						<!-- START WIDGET CLOCK -->
						<div class="widget widget-info widget-padding-sm">
							<div class="widget-big-int plugin-clock">00:00</div>
							<div class="widget-subtitle plugin-date">Loading...</div>
							<div class="widget-controls">
								<a href="#" class="widget-control-right widget-remove"
									data-toggle="tooltip" data-placement="left"
									title="Remove Widget"><span class="fa fa-times"></span></a>
							</div>
							<div class="widget-buttons widget-c3">
								<div class="col">
									<a href="#"><span class="fa fa-clock-o"></span></a>
								</div>
								<div class="col">
									<a href="#"><span class="fa fa-bell"></span></a>
								</div>
								<div class="col">
									<a href="#"><span class="fa fa-calendar"></span></a>
								</div>
							</div>
						</div>
						<!-- END WIDGET CLOCK -->

					</div>
				</div>
				<!-- END WIDGETS -->

					<div class="row">
						<div class="col-md-7">
							<img
									src="${pageContext.request.contextPath}/templates/img/ENCLAVE.png"
									class="img-responsive img-text" />
						</div>
						<div class="col-md-5">
							<h3>Enclave company</h3>
							<p>We are Enclave:10, a company of and by software
									engineering professionals. We invest in our people, our
									facilities, and our capabilities. We provide Offshore
									Development Centers (ODC) for information technology
									outsourcing (ITO) and Information Technology Intensive
									Operations (ITIO). We also provide technical and management
									support for our assigned personnel and teams. We require and
									provide continuing education and professional development.</p>
						</div>
					</div>