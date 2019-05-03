<%
	String userRole = new String("SUPERSTAR");
	
	if(session.getAttribute("role") != null){
		userRole = (String)session.getAttribute("role");
	}
	if(userRole.equals("faculty")){
%>
<title>Apply for Leave</title>
<jsp:include page="headerFaculty.jsp" />
<%@page import="Connection.Connect"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.ResultSetMetaData"%>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
	$(document).ready(function () {
		$(".approve").click(function () {
			var id2 = this.id;
			$.ajax({
				url: "update-approve-ajax.jsp",
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
		$(".reject").click(function () {
			var id3 = this.id;
			$.ajax({
				url: "update-reject-ajax.jsp",
				type: "post",
				data: {
					id: id3,
				},
				success: function (data) {
					location.reload(true);
				}
			});
		});
	});
</script>

<body style="height: -webkit-fill-available;">

	<a href="login.jsp">
		<div class="header" style="width: 100%; z-index: 980;" uk-sticky="" uk-sticky="bottom: #offset">
			<h1 class="uk-heading-divider"></h1>
			<h1 class="uk-heading-line uk-text-center"><span>Institute Leave Management System</span></h1>
			<h1 class="uk-heading-divider"></h1>
		</div>
	</a>
	<div class="uk-modal-container" style="padding: 0px; margin: 0px; background-color: #edf2fa;">
		<div class="container" style="height: 100%; width: 100%; padding: 0px; margin: 0px;">
			<div class="row" style="height: 100%; width: 100%;padding: 0px; margin: 0px;">
				<div class="col-sm-4 col-md-3 col-lg-2"
					style="padding: 10px; margin-top: 0px; background-color: #b3d9ff;">
					<div class="col-lg order-lg-first">
						<ul class="nav nav-tabs">
							<li class="nav-item">
								<a href="./facultyHome.jsp" class="nav-link"><i class="fe fe-home"></i> Home</a>
							</li>
							<li class="nav-item">
								<a href="facultyApplyLeave.jsp" class="nav-link active"><i class="fe fe-plus"></i> Apply
									for Leave</a>
							</li>
							<li class="nav-item">
								<a href="facultyApproveStudent.jsp" class="nav-link"><i class="fe fe-check-circle"></i>
									Approve Student</a>
							</li>
							<li class="nav-item">
								<a href="facultyRemoveStudent.jsp" class="nav-link"><i uk-icon="icon: close"></i> Remove
									Student</a>
							</li>
							<li class="nav-item">
								<a href="facultyApproveLeave.jsp" class="nav-link"><i class="fe fe-check-circle"></i>
									Approve Leave</a>
							</li>
							<li class="nav-item">
								<a href="hodLeaveRequests.jsp" class="nav-link"><i class="fe fe-check-circle"></i>
									Your Leaves</a>
							</li>
							<li class="nav-item">
								<a href="" class="nav-link"><i class="fe fe-file"></i> View Report</a>
							</li>
							<li class="nav-item">
								<a href="facultyEditProfile.jsp" class="nav-link"><i class="fe fe-user"></i> Edit
									Profile</a>
							</li>
							<li class="nav-item">
								<a href="facultyChangePassword.jsp" class="nav-link"><i class="fe fe-lock"></i> Change
									Password</a>
							</li>
							<li class="nav-item">
								<a href="logout.jsp" class="nav-link"><i class="fe fe-minus"></i> Logout</a>
							</li>
						</ul>
					</div>
				</div>

				<div class="col-sm-8 col-md-9 col-lg-10" style="margin: 0px; padding: 0px; width: 100%;">
					<div class="page">
						<div class="page-single" style="width: 100%;">
							<div class="container">
								<div class="row">
									<div class="col col-login mx-auto">
										<form class="card" action="" method="post">
											<div class="card-body p-6">
												<div class="card-title">
													<center>Apply for Leave</center>
												</div>
													<div class="form-group">
													<label class="form-label">Type of Leave</label>
													<select class="form-control custom-select" id="roleSelect">
														<option value="Casual Leave">Casual Leave</option>
														<option value="Special Casual Leave">Special Casual Leave</option>
														<option value="HalfPay Leave">Half Pay Leave</option>
														<option value="Earned Leave">Earned Leave</option>
														<option value="Medical Leave">Medical Leave</option>
													</select>
												</div>
												<div class="form-group">
													<label class="form-label">Reason</label>
													<textarea type="reason" class="form-control" id="leaveReason" name="facultyReason"
														aria-describedby="leaveReason" placeholder="Enter reason for leave"></textarea>
												</div>
												<div class="form-group">
													<label class="form-label">Leave Duration</label>
													<div class="col-sm-12" style="padding: 0px;">
														<label class="form-label">From</label>
													</div>

													<div class="col-sm" style="padding: 0px;">
														<div class="row gutters-xs">
															<div class="col-5">
																<select name="leaveFromMonth"
																	class="form-control custom-select">
																	<option value="">Month</option>
																	<option value="1">January</option>
																	<option value="2">February</option>
																	<option value="3">March</option>
																	<option value="4">April</option>
																	<option value="5">May</option>
																	<option selected="selected" value="6">June</option>
																	<option value="7">July</option>
																	<option value="8">August</option>
																	<option value="9">September</option>
																	<option value="10">October</option>
																	<option value="11">November</option>
																	<option value="12">December</option>
																</select>
															</div>
															<div class="col-3">
																<select name="leaveFromDay"
																	class="form-control custom-select">
																	<option value="">Day</option>
																	<option value="1">1</option>
																	<option value="2">2</option>
																	<option value="3">3</option>
																	<option value="4">4</option>
																	<option value="5">5</option>
																	<option value="6">6</option>
																	<option value="7">7</option>
																	<option value="8">8</option>
																	<option value="9">9</option>
																	<option value="10">10</option>
																	<option value="11">11</option>
																	<option value="12">12</option>
																	<option value="13">13</option>
																	<option value="14">14</option>
																	<option value="15">15</option>
																	<option value="16">16</option>
																	<option value="17">17</option>
																	<option value="18">18</option>
																	<option value="19">19</option>
																	<option selected="selected" value="20">20</option>
																	<option value="21">21</option>
																	<option value="22">22</option>
																	<option value="23">23</option>
																	<option value="24">24</option>
																	<option value="25">25</option>
																	<option value="26">26</option>
																	<option value="27">27</option>
																	<option value="28">28</option>
																	<option value="29">29</option>
																	<option value="30">30</option>
																	<option value="31">31</option>
																</select>
															</div>
															<div class="col-4">
																<select name="leaveFromYear"
																	class="form-control custom-select">
																	<option value="">Year</option>
																	<option value="2014">2014</option>
																	<option value="2013">2013</option>
																	<option value="2012">2012</option>
																	<option value="2011">2011</option>
																	<option value="2010">2010</option>
																	<option value="2009">2009</option>
																	<option value="2008">2008</option>
																	<option value="2007">2007</option>
																	<option value="2006">2006</option>
																	<option value="2005">2005</option>
																	<option value="2004">2004</option>
																	<option value="2003">2003</option>
																	<option value="2002">2002</option>
																	<option value="2001">2001</option>
																	<option value="2000">2000</option>
																	<option value="1999">1999</option>
																	<option value="1998">1998</option>
																	<option value="1997">1997</option>
																	<option value="1996">1996</option>
																	<option value="1995">1995</option>
																	<option value="1994">1994</option>
																	<option value="1993">1993</option>
																	<option value="1992">1992</option>
																	<option value="1991">1991</option>
																	<option value="1990">1990</option>
																	<option selected="selected" value="1989">1989
																	</option>
																	<option value="1988">1988</option>
																	<option value="1987">1987</option>
																	<option value="1986">1986</option>
																	<option value="1985">1985</option>
																	<option value="1984">1984</option>
																	<option value="1983">1983</option>
																	<option value="1982">1982</option>
																	<option value="1981">1981</option>
																	<option value="1980">1980</option>
																	<option value="1979">1979</option>
																	<option value="1978">1978</option>
																	<option value="1977">1977</option>
																	<option value="1976">1976</option>
																	<option value="1975">1975</option>
																	<option value="1974">1974</option>
																	<option value="1973">1973</option>
																	<option value="1972">1972</option>
																	<option value="1971">1971</option>
																	<option value="1970">1970</option>
																	<option value="1969">1969</option>
																	<option value="1968">1968</option>
																	<option value="1967">1967</option>
																	<option value="1966">1966</option>
																	<option value="1965">1965</option>
																	<option value="1964">1964</option>
																	<option value="1963">1963</option>
																	<option value="1962">1962</option>
																	<option value="1961">1961</option>
																	<option value="1960">1960</option>
																	<option value="1959">1959</option>
																	<option value="1958">1958</option>
																	<option value="1957">1957</option>
																	<option value="1956">1956</option>
																	<option value="1955">1955</option>
																	<option value="1954">1954</option>
																	<option value="1953">1953</option>
																	<option value="1952">1952</option>
																	<option value="1951">1951</option>
																	<option value="1950">1950</option>
																	<option value="1949">1949</option>
																	<option value="1948">1948</option>
																	<option value="1947">1947</option>
																	<option value="1946">1946</option>
																	<option value="1945">1945</option>
																	<option value="1944">1944</option>
																	<option value="1943">1943</option>
																	<option value="1942">1942</option>
																	<option value="1941">1941</option>
																	<option value="1940">1940</option>
																	<option value="1939">1939</option>
																	<option value="1938">1938</option>
																	<option value="1937">1937</option>
																	<option value="1936">1936</option>
																	<option value="1935">1935</option>
																	<option value="1934">1934</option>
																	<option value="1933">1933</option>
																	<option value="1932">1932</option>
																	<option value="1931">1931</option>
																	<option value="1930">1930</option>
																	<option value="1929">1929</option>
																	<option value="1928">1928</option>
																	<option value="1927">1927</option>
																	<option value="1926">1926</option>
																	<option value="1925">1925</option>
																	<option value="1924">1924</option>
																	<option value="1923">1923</option>
																	<option value="1922">1922</option>
																	<option value="1921">1921</option>
																	<option value="1920">1920</option>
																	<option value="1919">1919</option>
																	<option value="1918">1918</option>
																	<option value="1917">1917</option>
																	<option value="1916">1916</option>
																	<option value="1915">1915</option>
																	<option value="1914">1914</option>
																	<option value="1913">1913</option>
																	<option value="1912">1912</option>
																	<option value="1911">1911</option>
																	<option value="1910">1910</option>
																	<option value="1909">1909</option>
																	<option value="1908">1908</option>
																	<option value="1907">1907</option>
																	<option value="1906">1906</option>
																	<option value="1905">1905</option>
																	<option value="1904">1904</option>
																	<option value="1903">1903</option>
																	<option value="1902">1902</option>
																	<option value="1901">1901</option>
																	<option value="1900">1900</option>
																	<option value="1899">1899</option>
																	<option value="1898">1898</option>
																	<option value="1897">1897</option>
																</select>
															</div>
														</div>
													</div>

													<div class="col-sm-12" style="padding: 0px; margin-top: 1rem;">
														<label class="form-label">To</label>
													</div>
													<div class="col-sm" style="padding: 0px;">
														<div class="row gutters-xs">
															<div class="col-5">
																<select name="leaveToMonth"
																	class="form-control custom-select">
																	<option value="">Month</option>
																	<option value="1">January</option>
																	<option value="2">February</option>
																	<option value="3">March</option>
																	<option value="4">April</option>
																	<option value="5">May</option>
																	<option selected="selected" value="6">June</option>
																	<option value="7">July</option>
																	<option value="8">August</option>
																	<option value="9">September</option>
																	<option value="10">October</option>
																	<option value="11">November</option>
																	<option value="12">December</option>
																</select>
															</div>
															<div class="col-3">
																<select name="leaveToDay"
																	class="form-control custom-select">
																	<option value="">Day</option>
																	<option value="1">1</option>
																	<option value="2">2</option>
																	<option value="3">3</option>
																	<option value="4">4</option>
																	<option value="5">5</option>
																	<option value="6">6</option>
																	<option value="7">7</option>
																	<option value="8">8</option>
																	<option value="9">9</option>
																	<option value="10">10</option>
																	<option value="11">11</option>
																	<option value="12">12</option>
																	<option value="13">13</option>
																	<option value="14">14</option>
																	<option value="15">15</option>
																	<option value="16">16</option>
																	<option value="17">17</option>
																	<option value="18">18</option>
																	<option value="19">19</option>
																	<option selected="selected" value="20">20</option>
																	<option value="21">21</option>
																	<option value="22">22</option>
																	<option value="23">23</option>
																	<option value="24">24</option>
																	<option value="25">25</option>
																	<option value="26">26</option>
																	<option value="27">27</option>
																	<option value="28">28</option>
																	<option value="29">29</option>
																	<option value="30">30</option>
																	<option value="31">31</option>
																</select>
															</div>
															<div class="col-4">
																<select name="leaveToYear"
																	class="form-control custom-select">
																	<option value="">Year</option>
																	<option value="2014">2014</option>
																	<option value="2013">2013</option>
																	<option value="2012">2012</option>
																	<option value="2011">2011</option>
																	<option value="2010">2010</option>
																	<option value="2009">2009</option>
																	<option value="2008">2008</option>
																	<option value="2007">2007</option>
																	<option value="2006">2006</option>
																	<option value="2005">2005</option>
																	<option value="2004">2004</option>
																	<option value="2003">2003</option>
																	<option value="2002">2002</option>
																	<option value="2001">2001</option>
																	<option value="2000">2000</option>
																	<option value="1999">1999</option>
																	<option value="1998">1998</option>
																	<option value="1997">1997</option>
																	<option value="1996">1996</option>
																	<option value="1995">1995</option>
																	<option value="1994">1994</option>
																	<option value="1993">1993</option>
																	<option value="1992">1992</option>
																	<option value="1991">1991</option>
																	<option value="1990">1990</option>
																	<option selected="selected" value="1989">1989
																	</option>
																	<option value="1988">1988</option>
																	<option value="1987">1987</option>
																	<option value="1986">1986</option>
																	<option value="1985">1985</option>
																	<option value="1984">1984</option>
																	<option value="1983">1983</option>
																	<option value="1982">1982</option>
																	<option value="1981">1981</option>
																	<option value="1980">1980</option>
																	<option value="1979">1979</option>
																	<option value="1978">1978</option>
																	<option value="1977">1977</option>
																	<option value="1976">1976</option>
																	<option value="1975">1975</option>
																	<option value="1974">1974</option>
																	<option value="1973">1973</option>
																	<option value="1972">1972</option>
																	<option value="1971">1971</option>
																	<option value="1970">1970</option>
																	<option value="1969">1969</option>
																	<option value="1968">1968</option>
																	<option value="1967">1967</option>
																	<option value="1966">1966</option>
																	<option value="1965">1965</option>
																	<option value="1964">1964</option>
																	<option value="1963">1963</option>
																	<option value="1962">1962</option>
																	<option value="1961">1961</option>
																	<option value="1960">1960</option>
																	<option value="1959">1959</option>
																	<option value="1958">1958</option>
																	<option value="1957">1957</option>
																	<option value="1956">1956</option>
																	<option value="1955">1955</option>
																	<option value="1954">1954</option>
																	<option value="1953">1953</option>
																	<option value="1952">1952</option>
																	<option value="1951">1951</option>
																	<option value="1950">1950</option>
																	<option value="1949">1949</option>
																	<option value="1948">1948</option>
																	<option value="1947">1947</option>
																	<option value="1946">1946</option>
																	<option value="1945">1945</option>
																	<option value="1944">1944</option>
																	<option value="1943">1943</option>
																	<option value="1942">1942</option>
																	<option value="1941">1941</option>
																	<option value="1940">1940</option>
																	<option value="1939">1939</option>
																	<option value="1938">1938</option>
																	<option value="1937">1937</option>
																	<option value="1936">1936</option>
																	<option value="1935">1935</option>
																	<option value="1934">1934</option>
																	<option value="1933">1933</option>
																	<option value="1932">1932</option>
																	<option value="1931">1931</option>
																	<option value="1930">1930</option>
																	<option value="1929">1929</option>
																	<option value="1928">1928</option>
																	<option value="1927">1927</option>
																	<option value="1926">1926</option>
																	<option value="1925">1925</option>
																	<option value="1924">1924</option>
																	<option value="1923">1923</option>
																	<option value="1922">1922</option>
																	<option value="1921">1921</option>
																	<option value="1920">1920</option>
																	<option value="1919">1919</option>
																	<option value="1918">1918</option>
																	<option value="1917">1917</option>
																	<option value="1916">1916</option>
																	<option value="1915">1915</option>
																	<option value="1914">1914</option>
																	<option value="1913">1913</option>
																	<option value="1912">1912</option>
																	<option value="1911">1911</option>
																	<option value="1910">1910</option>
																	<option value="1909">1909</option>
																	<option value="1908">1908</option>
																	<option value="1907">1907</option>
																	<option value="1906">1906</option>
																	<option value="1905">1905</option>
																	<option value="1904">1904</option>
																	<option value="1903">1903</option>
																	<option value="1902">1902</option>
																	<option value="1901">1901</option>
																	<option value="1900">1900</option>
																	<option value="1899">1899</option>
																	<option value="1898">1898</option>
																	<option value="1897">1897</option>
																</select>
															</div>
														</div>
													</div>
												</div>

												<div class="form-group col-sm" style="padding: 0px;">
													<div class="form-label">Upload Proof Document</div>
													<div class="custom-file">
														<input type="file" class="custom-file-input"
															name="example-file-input-custom" pattern="/^(([a-zA-Z]:)|(\\{2}\w+)\$?)(\\(\w[\w].*))+(.jpeg|.JPEG|.gif|.GIF|.png|.PNG|.JPG|.jpg|.bitmap|.BITMAP|.pdf|.PDF)$/">
														<label class="custom-file-label">Choose file</label>
													</div>
												</div>

												<div class="form-group">
													<label class="form-label">Leave Application to:</label>
													<select class="form-control custom-select" id="applyTo" name="applyTo">
														<%
														Connect con=null;
														ResultSet rs=null;
														ResultSetMetaData mtdt=null;
														con=new Connect();
														String Uname = (String)session.getAttribute("facultyUsername");
														
														ResultSet rs2 = con.SelectData("select * from faculty_master where facultyEmail = '"+ Uname +"'");														
														int branch= new int();
														if(rs2.next()){
															branch=rs2.getInt("facultyBranch");
														}
														
														rs=con.SelectData("select hodID,hodName from hod_master where hodBranch = "+ branch +";");
 														mtdt=rs.getMetaData();
														while(rs.next())
														{
															int ID = rs.getInt("hodID");
													%>
														<option value="<%= ID%>"><%= rs.getString("hodName")%></option>
													<%
														}
														con.CloseConnection();
													%>
													</select>
												</div>

												<div class="form-footer">
													<button type="submit" class="btn btn-primary btn-block"
														id="submitLink" value="submit" name="facultyApplyLeave">Submit</button>
												</div>
											</div>
												<%
												try {
												Uname = (String)session.getAttribute("facultyUsername");
												
												rs2 = con.SelectData("select * from faculty_master where facultyEmail = '"+ Uname +"'");
												int appID = 1;
												if(rs2.next()){
													out.println(rs2.getInt("facultyID"));
													appID = rs2.getInt("facultyID");
												}
											
												if (request.getParameter("facultyApplyLeave") != null) {
												if (con.CheckData(
												"select * from leave_record where appID='" + appID + "' and appRole='faculty' and leaveApproved='no' and leaveRejected='no'")) {
												out.println("<script>alert('You have already applied for leave');</script>");
												}
												
												else {
												if (con.Ins_Upd_Del("insert into leave_record(appID,appRole,leaveReason,leaveFrom,leaveTo,leaveApproved,apptoID,apptoRole) VALUES("+appID+",'faculty','"+request.getParameter("facultyReason")+"','"+request.getParameter("leaveFromYear")+"-"+request.getParameter("leaveFromMonth")+"-"+request.getParameter("leaveFromDay")+"','"+request.getParameter("leaveToYear")+"-"+request.getParameter("leaveToMonth")+"-"+request.getParameter("leaveToDay")+"','no',"+request.getParameter("applyTo")+",'hod');"))
												out.println("<script>alert('Record inserted......');</script>");
												else
												out.println("<script>alert('Record was not inserted......');</script>");
												}
												}
												} catch (Exception e) {
												out.println(e);
												}
												%>
										</form>
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