<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script src="//code.jquery.com/jquery-1.11.2.min.js"></script>
<title>Test Site RESTful</title>
</head>
<body>
	<h1>Test Site RESTful</h1>
	<a href="api/site">Find All Sites</a>
	<br />
	<a href="api/site/1">Find Site with ID = 1</a>
	<br />
	<a href="api/site/2">Find Site with ID = 2</a>

	<script>
		$(function(){
			var site = {
					name: "Gao",
					latitude: 456,
					longitude: 888
			};
			//removeSite(33);
			createSite(site);
			//updateSite(3,site);
		});
		
		function createSite(site) {
			$.ajax({
				url : "api/site",
				type : "post",
				dataType : "json",
				data : JSON.stringify(site),
				contentType : "application/json",
				
				success : function(response) {
					console.log("create successfully!");
				},
				error : function(response) {
					console.log(response);
				}
			});
		}
		
		function updateSite(id, site) {
			$.ajax({
				url : "api/site/" + id,
				type : "put",
				dataType : "json",
				data : JSON.stringify(site),
				contentType : "application/json",
				success : function(response) {
					console.log("update successfully!");
				},
				error : function(response) {
					console.log(response);
				}
			});
		}
		
		function removeSite(id) {
			$.ajax({
				url : "api/site/" + id,
				type : "delete",
				dataType : "json",
				contentType : "application/json",
				success : function(response) {
					console.log("delete successfully!");
				},
				error : function(response) {
					console.log(response);
				}
			});
		}   

	</script>
</body>
</html>