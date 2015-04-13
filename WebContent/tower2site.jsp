<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="edu.neu.cs5200.hmw5.dao.*,edu.neu.cs5200.hmw5.models.*,java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Towers related to this site</title>
</head>
<body>
	<div>
		<h1>Towers for this site</h1>
		
		<%
		siteDao dao = new siteDao();
		
		String id = request.getParameter("id");
		int idInt = Integer.parseInt(id);
		
		Site siteNum = dao.findSite(idInt);
		System.out.println(siteNum.getName());
		//findTowerReferencesThisSite
		List<Tower> towers = siteNum.getTowers();
		%>
		<% 
		for(Tower tower : towers){
		%>
			<tr>
				<td><%=tower.getId() %></td>
				<td><%=tower.getName() %></td>
				<td><%=tower.getHeight() %></td>
				<td><%=tower.getSides() %></td>
				<td><%=tower.getSite().getId() %></td>
			</tr>
		<% 
		}
		%>
	</div>
</body>
</html>