<%
	String userRole = new String("SUPERSTAR");

	if(session.getAttribute("role") != null){
		userRole = (String)session.getAttribute("role");
	}
	if(userRole.equals("admin")){
%>
<title>Approve Users</title>
<jsp:include page="headerAdmin.jsp" />

<%@page import="Connection.Connect"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.ResultSetMetaData"%>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
	$(document).ready(function () {
		$(".approveStudent").click(function () {
			var id2 = this.id;
			$.ajax({
				url: "update-approve-student-ajax.jsp",
				type: "post",
				data: {
					id: id2,
				},
				success: function (data) {
					location.reload(true);
				}
			});
		});
	});
	$(document).ready(function () {
		$(".approveFaculty").click(function () {
			var id2 = this.id;
			$.ajax({
				url: "update-approve-faculty-ajax.jsp",
				type: "post",
				data: {
					id: id2,
				},
				success: function (data) {
					location.reload(true);
				}
			});
		});
	});
	$(document).ready(function () {
		$(".approveWarden").click(function () {
			var id2 = this.id;
			$.ajax({
				url: "update-approve-warden-ajax.jsp",
				type: "post",
				data: {
					id: id2,
				},
				success: function (data) {
					location.reload(true);
				}
			});
		});
	});
	$(document).ready(function () {
		$(".approveHod").click(function () {
			var id2 = this.id;
			$.ajax({
				url: "update-approve-hod-ajax.jsp",
				type: "post",
				data: {
					id: id2,
				},
				success: function (data) {
					location.reload(true);
				}
			});
		});
	});
</script>


<body style="height: 100vh;">
	<div class="header" style="width: 100%; z-index: 980;" uk-sticky="">
		<h1 class="uk-heading-divider"></h1>
		<h1 class="uk-heading-line uk-text-center"><span>Institute Leave Management System</span></h1>
		<h1 class="uk-heading-divider"></h1>
	</div>

	<div class="page" style="padding: 0px; margin: 0px; height: -webkit-fill-available; background-color: #edf2fa;">
		<div class="container" style="padding: 0px; margin: 0px; height: -webkit-fill-available;">
			<div class="row" style="height: 100%; width: 100%;padding: 0px; margin: 0px;">
				<div class="col-sm-4 col-md-3 col-lg-2"
					style="padding: 10px; margin-top: 0px; background-color: #b3d9ff; height: -webkit-fill-available;">
					<div class="col-lg order-lg-first">
						<ul class="nav nav-tabs">
							<li class="nav-item">
								<a href="./adminHome.jsp" class="nav-link"><i class="fe fe-home"></i> Home</a>
							</li>
							<li class="nav-item">
								<a href="adminApproveUsers.jsp" class="nav-link active"><i
										class="fe fe-check-circle"></i> Approve User</a>
							</li>
							<li class="nav-item">
								<a href="adminRemoveUsers.jsp" class="nav-link"><i uk-icon="icon: close"></i> Remove
									User</a>
							</li>
							<li class="nav-item">
								<a href="adminApproveLeave.jsp" class="nav-link"><i class="fe fe-check-circle"></i>
									Approve Leave</a>
							</li>
							<li class="nav-item">
								<a href="adminAddAdmin.jsp" class="nav-link"><i class="fe fe-plus"></i> Add Admin</a>
							</li>
							<li class="nav-item">
								<a href="adminViewReports.jsp" class="nav-link"><i class="fe fe-file"></i> View Report</a>
							</li>
							<li class="nav-item">
								<a href="adminEditProfile.jsp" class="nav-link"><i class="fe fe-user"></i> Edit
									Profile</a>
							</li>

							<li class="nav-item">
								<a href="adminChangePassword.jsp" class="nav-link"><i class="fe fe-lock"></i> Change
									Password</a>
							</li>
							<li class="nav-item">
								<a href="logout.jsp" class="nav-link"><i class="fe fe-minus"></i> Logout</a>
							</li>
						</ul>
					</div>
				</div>
				<div class="col-sm col-md col-lg" style="margin-top: 1%; padding-left: 10%; width: 100%;">
					<div class="container">
						<div class="row">
							<div class="col-12">

								<div class="card"
									style="margin: 0.05rem;  padding-top: 0.75rem; height: 75vh; width: 61vw; position: inherit;">
									<div class="table-responsive">
										<table
											class="table table-hover table-outline table-vcenter table-hcenter card-table">
											<thead>
												<tr>
													<th>Role</i></th>
													<th>Name</th>
													<th>Contact</th>
													<th>Email</th>
													<th>Branch</th>
													<th></th>
													<th></th>
												</tr>
											</thead>
											<tbody>
												<%
												 Connect con=null;
												 ResultSet rs=null;
												 ResultSetMetaData mtdt=null;
												 con=new Connect();
												 rs=con.SelectData("select * from hod_master where isApprovedHod='no'");
												 mtdt=rs.getMetaData();
													while(rs.next())
													{
														String hodName=rs.getString("hodName");
														String hodContact=rs.getString("hodContact");
														String hodEmail=rs.getString("hodEmail");
														int hodBranch=rs.getInt("hodBranch");
												%>
												<tr>
													<td>HoD</td>
													<td><%out.println(hodName);%></td>
													<td><%out.println(hodContact);%></td>
													<td><%out.println(hodEmail);%></td>
													<td><%
														ResultSet rs2 = con.SelectData("select branchName from branch_info where branchCode="+rs.getInt("hodBranch"));
														ResultSetMetaData mtdt2 = rs2.getMetaData();
														String branch=null;
														if(rs2.next()){
														branch = rs2.getString("branchName");
														}
														out.println(branch);
														%></td>
														<td style="padding: 0px;">
														<ul class="uk-iconnav">
															<li><button style="border: 0px;" class="approveHod" id="<%=rs.getInt(1)%>" uk-icon="icon: check"></button></li>
														</ul>
													</td>
													<td style="padding: 0px;">
														<ul class="uk-iconnav">
															<li><button style="border: 0px;" uk-icon="icon: close"></button></li>
														</ul>
													</td>
													<%-- <td style="padding: 0px;">
														<ul class="uk-iconnav">
															<li><button style="border: 0px;" uk-icon="icon: check"></button></li>
														</ul>
													</td>
													<td style="padding: 0px;">
														<ul class="uk-iconnav">
															<li><button style="border: 0px;" uk-icon="icon: close"></button></li>
														</ul>
													</td> --%>
												</tr>
												<%
													}
												 rs=con.SelectData("select * from faculty_master where isApprovedFaculty='no'");
												 mtdt=rs.getMetaData();
													while(rs.next())
													{
														String facultyName=rs.getString("facultyName");
														String facultyContact=rs.getString("facultyContact");
														String facultyEmail=rs.getString("facultyEmail");
														int facultyBranch=rs.getInt("facultyBranch");
												%>
												<tr>
													<td>Faculty</td>
													<td><%out.println(facultyName);%></td>
													<td><%out.println(facultyContact);%></td>
													<td><%out.println(facultyEmail);%></td>
													<td><%
														ResultSet rs2 = con.SelectData("select branchName from branch_info where branchCode="+rs.getInt("facultyBranch"));
														ResultSetMetaData mtdt2 = rs2.getMetaData();
														String branch=null;
														if(rs2.next()){
														branch = rs2.getString("branchName");
														}
														out.println(branch);%></td>
														<td style="padding: 0px;">
														<ul class="uk-iconnav">
															<li><button style="border: 0px;" class="approveFaculty" id="<%=rs.getInt(1)%>" uk-icon="icon: check"></button></li>
														</ul>
													</td>
													<td style="padding: 0px;">
														<ul class="uk-iconnav">
															<li><button style="border: 0px;" uk-icon="icon: close"></button></li>
														</ul>
													</td>
													<%-- <td style="padding: 0px;">
														<ul class="uk-iconnav">
															<li><button style="border: 0px;" uk-icon="icon: check"></button></li>
														</ul>
													</td>
													<td style="padding: 0px;">
														<ul class="uk-iconnav">
															<li><button style="border: 0px;" uk-icon="icon: close"></button></li>
														</ul>
													</td> --%>
												</tr>
												<%
														}
														rs=con.SelectData("select * from warden_master where isApprovedWarden='no'");
														mtdt=rs.getMetaData();
														while(rs.next())
														{
															String wardenName=rs.getString("wardenName");
															String wardenContact=rs.getString("wardenContact");
															String wardenEmail=rs.getString("wardenEmail");
															String wardenBranch="-";
													%>
												<tr>
													<td>Warden</td>
													<td><%out.println(wardenName);%></td>
													<td><%out.println(wardenContact);%></td>
													<td><%out.println(wardenEmail);%></td>
													<td><%out.println("-");%></td>
													<td style="padding: 0px;">
														<ul class="uk-iconnav">
															<li><button style="border: 0px;" class="approveWarden" id="<%=rs.getInt(1)%>" uk-icon="icon: check"></button></li>
														</ul>
													</td>
													<td style="padding: 0px;">
														<ul class="uk-iconnav">
															<li><button style="border: 0px;" uk-icon="icon: close"></button></li>
														</ul>
													</td>
													<%-- <td style="padding: 0px;">
														<ul class="uk-iconnav">
															<li><button style="border: 0px;" uk-icon="icon: check"></button></li>
														</ul>
													</td>
													<td style="padding: 0px;">
														<ul class="uk-iconnav">
															<li><button style="border: 0px;" uk-icon="icon: close"></button></li>
														</ul>
													</td> --%>
												</tr>
												<%
													}
													rs=con.SelectData("select * from student_master where isApprovedStudent='no'");
													mtdt=rs.getMetaData();
													while(rs.next())
													{
														String studentName=rs.getString("studentName");
														String studentContact=rs.getString("studentContact");
														String studentEmail=rs.getString("studentEmail");
														int studentBranch=rs.getInt("studentBranch");
												%>
												<tr>
													<td>Student</td>
													<td><%out.println(studentName);%></td>
													<td><%out.println(studentContact);%></td>
													<td><%out.println(studentEmail);%></td>
													<td><%
														ResultSet rs2 = con.SelectData("select branchName from branch_info where branchCode="+rs.getInt("studentBranch"));
														ResultSetMetaData mtdt2 = rs2.getMetaData();
														String branch=null;
														if(rs2.next()){
														branch = rs2.getString("branchName");
														}
														out.println(branch);
														%></td>
													<td style="padding: 0px;">
														<ul class="uk-iconnav">
															<li><button style="border: 0px;" class="approveStudent" id="<%=rs.getInt(1)%>" uk-icon="icon: check"></button></li>
														</ul>
													</td>
													<td style="padding: 0px;">
														<ul class="uk-iconnav">
															<li><button style="border: 0px;" uk-icon="icon: close"></button></li>
														</ul>
													</td>
												</tr>
												<%
													}
													con.CloseConnection();
												%>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
	</div>
</body>

</html>
<%
	}
	else{
		out.println("<script>alert('SESSION INVALID!!! PLEASE LOGIN AGAIN!!!!!');</script>");
		response.sendRedirect("login.jsp");
	}
%>
