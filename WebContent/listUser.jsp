<%@page import="dao.DaoUsuario"%>
<%@page import="modelo.Usuario"%>
<%@page import="controlador.Crestaurante"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<title>Lista Usuarios</title>
	<%@include file="/includes/head.jsp" %>
</head>

<%@include file="/includes/adminCheck.jsp" %>

<%@include file="/includes/header.jsp" %>

<body>

	<div id="maincontainerlista">
		<h2 class="etiqueta">LISTA DE USUARIOS</h2>
		
		<%@include file="/includes/navAdmin.jsp" %>
		
		<div class="containerData">
		
			<%
			ArrayList<Usuario> lista = new ArrayList<Usuario>();
			
			lista = DaoUsuario.getInstance().list();
			
			if(lista.size() == 0){%>
			
				<h2>No hay usuarios en la base de datos</h2>
				
			<%}else{
			for(Usuario u:lista){
			%>
			
			<div class="usuariosPack">
			
				<div class="datosUser">
					<div class="datosUserIn">
						<img src="img/userv2.png">
						<div><label class="nomUser"><%=u.getEmail() %></label></div>
					</div>
				</div>
			
				<div class="botonesLista">
					<a class="botonAdminList" href='Clogin?id=<%= u.getId() %>&opcion=1'><label>ELIMINAR</label><img src="img/delete.png"></a>
				</div>
			</div>
			
			<%
			}}
			%>
		
		</div>
		
	</div>
	
	<div id="secondContainerUser"></div>
	
</body>

<%@include file="/includes/footer.jsp" %>

</html>