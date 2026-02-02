<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp</title>
<style>
	table,th,td{
		border: 1px solid black;
		border-collapse: collapse;
	}
	table{
		width: 500px;
		text-align: center;
	}
	th,td{
		width: 100px;
		height: 40px;
	}
</style>
</head>
<body>
	<h2>스크립트릿</h2>
	<table>
		<tr>
			<td>순번</td>
			<td>번호</td>
		</tr>
		<%
		for(int i=0;i<10;i++){
		%>
		<tr>
			<td><% out.println(i+1); %></td>
			<td><% out.println((i+1)*(i+1)); %></td>
			<%-- <td><%= (i+1)*(i+1) %></td> --%>
		</tr>
		<% } %>
	</table>
	
	<table>
		<%
		for(int i=2;i<10;i++) {
		%>
		<tr>
			<td colspan="5"><% out.println(i); %>단</td>
		</tr>
		<% for(int j=1;j<10;j++){ %>
		<tr>
			<td><% out.println(i); %></td>
			<td><% out.println("X"); %></td>
			<td><% out.println(j); %></td>
			<td><% out.println("="); %></td>
			<td><% out.println(i*j); %></td>
		</tr>
		<%} %>
		<%} %>
		
	</table>
</body>
</html>