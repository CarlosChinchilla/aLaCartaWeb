<%@page import="dao.DaoRestaurante"%>
<%@page import="modelo.Restaurante"%>
<%@page import="controlador.Crestaurante"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<title>Lista Restaurantes</title>
	<%@include file="/includes/head.jsp" %>
</head>

<%@include file="/includes/adminCheck.jsp" %>

<%@include file="/includes/header.jsp" %>

<body>

	<div id="maincontainerlista">
		<h2 class="etiqueta">LISTA DE RESTAURANTES</h2>
		
		<%@include file="/includes/navAdmin.jsp" %>
		
		<div class="containerData">
		
			<%
			ArrayList<Restaurante> lista = new ArrayList<Restaurante>();
			
			lista = DaoRestaurante.getInstance().list();
			
			if(lista.size() == 0){%>
			
				<h2>No hay restaurantes en la base de datos</h2>
				
			<%}else{
			for(Restaurante r:lista){
			%>
			
			<div class="restaurantePack">
			
				<%switch(r.getCategoria()){
				case "Americana":%>
					<div class="imgRest"><img  src="img/americana.png"></div>
					<%break;
				case "China":%>
					<div class="imgRest"><img  src="img/china.png"></div>
					<%break;
				case "Hindú":%>
					<div class="imgRest"><img  src="img/hindu.png"></div>
					<%break;
				case "Japonesa":%>
					<div class="imgRest"><img  src="img/japo.png"></div>
					<%break;
				default:%>
					<div class="imgRest"><img  src="img/rest.png"></div>
					<%break;
				}
				%>
				
				<div class="datosRest">
					<div><label class="nomRest"><%=r.getNombre() %></label></div>
					<div><label class="catRest">Comida <%=r.getCategoria() %></label></div>
					<div class="marginTop"><label class="dirRest"><%=r.getDireccion() %>, <%=r.getCiudad() %>, <%=r.getCodigopostal() %></label></div>
					<div><label class="telRest"><%=r.getTelefono() %></label></div>
				</div>
			
				<div class="botonesLista">
					<a class="botonAdminList" href='newrest.jsp?id=<%= r.getId() %>'><label>EDITAR</label><img src="img/edit.png"></a>
					<a class="botonAdminList" href='Crestaurante?id=<%= r.getId() %>&opcion=2'><label>ELIMINAR</label><img src="img/delete.png"></a>
				</div>
			</div>
			
			<%
			}}
			%>
		
		</div>
		
	</div>
	
	<div id="secondContainerRest"></div>
	
</body>

<%@include file="/includes/footer.jsp" %>

</html>