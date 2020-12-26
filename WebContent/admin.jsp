<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <title>Administración</title>
	<%@include file="/includes/head.jsp" %>
</head>

<%@include file="/includes/adminCheck.jsp" %>

<%@include file="/includes/header.jsp" %>

<body>

	<div id="maincontaineradmin">
	
		<h2 class="etiqueta">MENÚ DE ADMINISTRACIÓN</h2>
		
		<%@include file="/includes/navAdmin.jsp" %>
	
	    <div class="menuAdmin">
	    
	    <%
	    
	    if(request.getParameter("ad") != null){
	    
	    	switch (request.getParameter("ad")) {
	    		
	    		case "0":
	    	
	    %>
	
	        <a class="botonAdmin" href="newrest.jsp?id=0">AÑADIR RESTAURANTE</a>
	
	        <a class="botonAdmin" href="listRest.jsp">GESTIONAR RESTAURANTES</a>
	
	    <%
	    
	    		break;
	    
	    		case "1":
	    			
	    %>
	    
	        <a class="botonAdmin" href="listUser.jsp">GESTIONAR USUARIOS</a>
	
	    <%		
	    		break;
	    	
	    }}
	    
	    %>
	    
	    </div>
    
    </div>
    
    <div id="secondContainerAdmin"></div>

</body>

<%@include file="/includes/footer.jsp" %>

</html>