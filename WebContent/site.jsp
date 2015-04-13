<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="edu.neu.cs5200.hmw5.dao.*,edu.neu.cs5200.hmw5.models.*,java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>site Dao</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
</head>
<body>
	<div class="container"> 
    <h1>Sites</h1>
    
    <%
    siteDao dao = new siteDao();
    String action = request.getParameter("action");
    String id = request.getParameter("id");
    String name = request.getParameter("name");
    String latitude = request.getParameter("latitude");
   	String longitude = request.getParameter("longitude");
   	
    if("create".equals(action))
    {
    	Site site = new Site();
    	site.setName(name);
    	site.setLatitude(Integer.parseInt(latitude));
 		site.setLongitude(Integer.parseInt(longitude));
 		dao.createSite(site);
    }
    else if("delete".equals(action))
    {
    	dao.removeSite(Integer.parseInt(id));
    }
    else if("update".equals(action))
    {
    	Site site = new Site();
    	site.setName(name);
    	site.setLatitude(Integer.parseInt(latitude));
 		site.setLongitude(Integer.parseInt(longitude));
 		dao.updateSite(Integer.parseInt(id), site);
    }
    List<Site> sites = dao.findAllSites();
    %>
 	<form action="site.jsp">
 	<table class="table table-striped">
 		<thead>  
 			<tr>
 				<th>Id</th>
 				<th>Name</th>
 				<th>Latitude</th>
 				<th>Longitude</th> 
 			</tr>
 			<tr>
 				<th><input class="form-control" name="id" value="<%=id%>" readonly/></th>
 				<th><input class="form-control" name="name" placeholder="Title" value="<%=name%>"/></th>
 				<th><input class="form-control" name="latitude" placeholder="Poster URL" value="<%=latitude%>"/></th>
 				<th><input class="form-control" name="longitude" placeholder="Release Date" value="<%=longitude%>"/></th>
 				<th>
 					<button class="btn btn-success" name="action" value="create">Add</button>
 					<button class="btn btn-primary" name="action" value="update">Update</button>
 				</th>
 			</tr>
 		</thead>
 		<tbody>
 		<%
 		for(Site site: sites)
 		{
 		%>
 			<tr>
 				<td><%=site.getId() %></td>
 				<td><a href="tower2site.jsp?id=<%=site.getId()%>"><%=site.getName() %></td>
 				<td><%=site.getLatitude() %></td>
 				<td><%=site.getLongitude() %></td>
 				<td>
 					<a class="btn btn-danger" href="site.jsp?action=delete&id=<%=site.getId() %>">Delete</a>
 					<a class="btn btn-warning" href="site.jsp?action=select&id=<%=site.getId() %>&name=<%=site.getName()%>&latitude=<%=site.getLatitude()%>&longitude=<%=site.getLongitude()%>">Select</a>
 				</td>
 			</tr>
 		<%
 		}
 		%>
 	</table>
	</form> 
	</div>	
</body>
</html>