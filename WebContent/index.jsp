<%@page import="dao.DaoRestaurante"%>
<%@page import="modelo.Restaurante"%>
<%@page import="controlador.Crestaurante"%>
<%@page import="java.util.ArrayList"%>

<%@page import="javax.swing.text.Document"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<title>A la carta</title>
	<%@include file="/includes/head.jsp" %>
</head>

<%@include file="/includes/headerv2.jsp" %>

<body>

	<div id="maincontainer">
	
		<div class="buscador">
			<h1>Busca tu restaurante favorito</h1>
			<div class="textBusc">Los mejores restaurantes al alcance de un clic</div>
			<div class="busqueda">
                <form id="formBuscar" action="index.jsp" method="get">
                     <input class="buscar" type="search" id="busqueda" name="busqueda" placeholder="Restaurante, ciudad...">
                     <input class="botBusqueda" type="button" value="Buscar" onclick="submitBusqueda()">
                </form>
            </div>
		</div>
		
		<div id="secondcontainer">
		
			<div class="containerData">
		
			<%
			
			ArrayList<Restaurante> lista = new ArrayList<Restaurante>();
			
			String busqueda = request.getParameter("busqueda");
			
			if(busqueda != null){
				
				busqueda.toLowerCase();

				lista = DaoRestaurante.getInstance().buscar(busqueda);
			
			if(lista.size() != 0){
				
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
			</div>
			
			<%
				}
			}else{
			%>
			
			<h2>No se han encontrado coincidencias</h2>
			<img src="img/notFound.png">
			<h3>Pruebe otro criterio de búsqueda</h3>
				
			<%
			}}
			%>
		
		</div>
		
		</div>
		
	</div>

</body>

<%@include file="/includes/footer.jsp" %>

</html>