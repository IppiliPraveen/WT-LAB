<%@page import="com.java.jsp.Employ"%>
<%@page import="com.java.jsp.EmployDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		EmployDAO dao = new EmployDAO();
		int empno = Integer.parseInt(request.getParameter("empno"));
		Employ employ = dao.searchEmploy(empno);
	%>
	<form method="get" action="UpdateEmploy.jsp">
		<center>
			Employ No : 
			<input type="number" name="empno" readonly="readonly" value=<%=empno %> />
			<br/><br/>
			Employ Name : 
			<input type="text" name="name" value=<%=employ.getName() %> /> <br/><br/>
			Gender :
			<input type='text' name="gender" value=<%=employ.getGender() %> /> <br/><br/>
			Department : 
			<input type="text" name="dept" value=<%=employ.getDept() %> /> <br/><br/>
			Designation : 
			<input type="text" name="desig" value=<%=employ.getDesig() %> /> <br/><br/> 
			Basic : 
			<input type="number" name="basic" value=<%=employ.getBasic() %> /> <br/><br/>
			<input type="submit" value="Update Employ" />
		</center>
	</form>
	<%
		if (request.getParameter("empno")!=null && request.getParameter("basic")!=null) {
			Employ employUpdate = new Employ();
			employUpdate.setEmpno(Integer.parseInt(request.getParameter("empno")));
			employUpdate.setName(request.getParameter("name"));
			employUpdate.setGender(request.getParameter("gender"));
			employUpdate.setDept(request.getParameter("dept"));
			employUpdate.setDesig(request.getParameter("desig"));
			employUpdate.setBasic(Integer.parseInt(request.getParameter("basic")));
			dao.updateEmploy(employUpdate);
	%>
		<jsp:forward page="EmployTable.jsp"/>
	<%
		}
		
	%>
</body>
</html>