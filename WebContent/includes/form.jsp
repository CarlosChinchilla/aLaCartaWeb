<%@page import="dao.DaoRestaurante"%>
<%@page import="modelo.Restaurante"%>

<%
	int id = Integer.parseInt(request.getParameter("id"));

if (id != 0) {

	Restaurante r = new Restaurante();
	r = DaoRestaurante.getInstance().oneRest(id);
%>

<h2 class="etiqueta">Editar Restaurante</h2>

<%@include file="/includes/navAdmin.jsp" %>

<div class="containerData">

	<div class="restaurantePack">

		<%
			switch (r.getCategoria()) {
		case "Americana":
		%>
		<div class="imgRest">
			<img src="img/americana.png">
		</div>
		<%
			break;
		case "China":
		%>
		<div class="imgRest">
			<img src="img/china.png">
		</div>
		<%
			break;
		case "Hindú":
		%>
		<div class="imgRest">
			<img src="img/hindu.png">
		</div>
		<%
			break;
		case "Japonesa":
		%>
		<div class="imgRest">
			<img src="img/japo.png">
		</div>
		<%
			break;
		default:
		%>
		<div class="imgRest">
			<img src="img/rest.png">
		</div>
		<%
			break;
		}
		%>

		<div class="datosRest">
			<div>
				<label class="nomRest"><%=r.getNombre()%></label>
			</div>
			<div>
				<label class="catRest">Comida <%=r.getCategoria()%></label>
			</div>
			<div class="marginTop">
				<label class="dirRest"><%=r.getDireccion()%>, <%=r.getCiudad()%>,
					<%=r.getCodigopostal()%></label>
			</div>
			<div>
				<label class="telRest"><%=r.getTelefono()%></label>
			</div>
		</div>
	</div>
</div>

<div id="form">
	<form id="formRestEd" name="edRest" action="Crestaurante" method="post">

		<ul>
			<li><input type="hidden" name="id" value="<%=id%>"></li>
			<li><label>Restaurante: </label></li>
			<li><input class="inputs" type="text" name="nombre"
				placeholder="Nombre restaurante" value="<%=r.getNombre()%>"
				onchange=""></li>
			<li><label>Categoria: </label></li>
			<li><select class="inputs" name="categoria" value="<%=r.getCategoria()%>">
					<option value='<%=r.getCategoria()%>'><%=r.getCategoria()%></option>
					<option value='Americana'>Americana</option>
					<option value='China'>China</option>
					<option value='Hindú'>Hindú</option>
					<option value='Japonesa'>Japonesa</option>
			</select></li>
			<li><label>Dirección: </label></li>
			<li><input class="inputs" type="text" name="direccion"
				placeholder="Dirección" value="<%=r.getDireccion()%>" onchange=""></li>
			<li><label>Ciudad</label></li>
			<li><select class="inputs" name="ciudad">
					<option value='<%=r.getCiudad()%>'><%=r.getCiudad()%></option>
					<option value='Álava'>Álava</option>
					<option value='Albacete'>Albacete</option>
					<option value='Alicante'>Alicante</option>
					<option value='Almería'>Almería</option>
					<option value='Asturias'>Asturias</option>
					<option value='Ávila'>Ávila</option>
					<option value='Badajoz'>Badajoz</option>
					<option value='Barcelona'>Barcelona</option>
					<option value='Burgos'>Burgos</option>
					<option value='Cáceres'>Cáceres</option>
					<option value='Cádiz'>Cádiz</option>
					<option value='Cantabria'>Cantabria</option>
					<option value='Castellón'>Castellón</option>
					<option value='Ceuta'>Ceuta</option>
					<option value='Ciudad Real'>Ciudad Real</option>
					<option value='Córdoba'>Córdoba</option>
					<option value='Cuenca'>Cuenca</option>
					<option value='Girona'>Girona</option>
					<option value='Las Palmas'>Las Palmas</option>
					<option value='Granada'>Granada</option>
					<option value='Guadalajara'>Guadalajara</option>
					<option value='Guipúzcoa'>Guipúzcoa</option>
					<option value='Huelva'>Huelva</option>
					<option value='Huesca'>Huesca</option>
					<option value='Islas Baleares'>Islas Baleares</option>
					<option value='Jaén'>Jaén</option>
					<option value='A Coruña'>A Coruña</option>
					<option value='La Rioja'>La Rioja</option>
					<option value='León'>León</option>
					<option value='Lleida'>Lleida</option>
					<option value='Lugo'>Lugo</option>
					<option value='Madrid'>Madrid</option>
					<option value='Málaga'>Málaga</option>
					<option value='Melilla'>Melilla</option>
					<option value='Murcia'>Murcia</option>
					<option value='Navarra'>Navarra</option>
					<option value='Ourense'>Ourense</option>
					<option value='Palencia'>Palencia</option>
					<option value='Pontevedra'>Pontevedra</option>
					<option value='Salamanca'>Salamanca</option>
					<option value='Segovia'>Segovia</option>
					<option value='Sevilla'>Sevilla</option>
					<option value='Soria'>Soria</option>
					<option value='Tarragona'>Tarragona</option>
					<option value='Santa Cruz de Tenerife'>Santa Cruz de
						Tenerife</option>
					<option value='Teruel'>Teruel</option>
					<option value='Toledo'>Toledo</option>
					<option value='Valencia'>Valencia</option>
					<option value='Valladolid'>Valladolid</option>
					<option value='Vizcaya'>Vizcaya</option>
					<option value='Zamora'>Zamora</option>
					<option value='Zaragoza'>Zaragoza</option>
			</select></li>
			<li><label>Código Postal</label></li>
			<li><input class="inputs" type="number" name="codigopostal"
				placeholder="Código Postal" value="<%=r.getCodigopostal()%>" onchange=""></li>
			<li><label>Teléfono</label></li>
			<li><input class="inputs" type="number" name="telefono"
				placeholder="Teléfono" value="<%=r.getTelefono()%>" onchange=""></li>
			<li><button class="button" type="button" value="Enviar"
					onclick="validacionEditar()">Editar</button></li>
		</ul>

	</form>
</div>

<%
	} else {
%>

<h2 class="etiqueta">Añadir nuevo Restaurante</h2>

<%@include file="/includes/navAdmin.jsp" %>

<div id="form">
	<form id="formRest" name="newRest" action="Crestaurante" method="post">

		<ul>
			<li><input type="hidden" name="id" value="0"></li>
			<li><label>Restaurante: </label></li>
			<li><input class="inputs" type="text" name="nombre"
				placeholder="Nombre restaurante" onchange=""></li>
			<li><label>Categoria: </label></li>
			<li><select class="inputs" name="categoria">
					<option value='Americana'>Americana</option>
					<option value='China'>China</option>
					<option value='Hindú'>Hindú</option>
					<option value='Japonesa'>Japonesa</option>
			</select></li>
			<li><label>Dirección: </label></li>
			<li><input class="inputs" type="text" name="direccion"
				placeholder="Dirección" onchange=""></li>
			<li><label>Ciudad</label></li>
			<li><select class="inputs" name="ciudad">
					<option value='Álava'>Álava</option>
					<option value='Albacete'>Albacete</option>
					<option value='Alicante'>Alicante</option>
					<option value='Almería'>Almería</option>
					<option value='Asturias'>Asturias</option>
					<option value='Ávila'>Ávila</option>
					<option value='Badajoz'>Badajoz</option>
					<option value='Barcelona'>Barcelona</option>
					<option value='Burgos'>Burgos</option>
					<option value='Cáceres'>Cáceres</option>
					<option value='Cádiz'>Cádiz</option>
					<option value='Cantabria'>Cantabria</option>
					<option value='Castellón'>Castellón</option>
					<option value='Ceuta'>Ceuta</option>
					<option value='Ciudad Real'>Ciudad Real</option>
					<option value='Córdoba'>Córdoba</option>
					<option value='Cuenca'>Cuenca</option>
					<option value='Girona'>Girona</option>
					<option value='Las Palmas'>Las Palmas</option>
					<option value='Granada'>Granada</option>
					<option value='Guadalajara'>Guadalajara</option>
					<option value='Guipúzcoa'>Guipúzcoa</option>
					<option value='Huelva'>Huelva</option>
					<option value='Huesca'>Huesca</option>
					<option value='Islas Baleares'>Islas Baleares</option>
					<option value='Jaén'>Jaén</option>
					<option value='A Coruña'>A Coruña</option>
					<option value='La Rioja'>La Rioja</option>
					<option value='León'>León</option>
					<option value='Lleida'>Lleida</option>
					<option value='Lugo'>Lugo</option>
					<option value='Madrid'>Madrid</option>
					<option value='Málaga'>Málaga</option>
					<option value='Melilla'>Melilla</option>
					<option value='Murcia'>Murcia</option>
					<option value='Navarra'>Navarra</option>
					<option value='Ourense'>Ourense</option>
					<option value='Palencia'>Palencia</option>
					<option value='Pontevedra'>Pontevedra</option>
					<option value='Salamanca'>Salamanca</option>
					<option value='Segovia'>Segovia</option>
					<option value='Sevilla'>Sevilla</option>
					<option value='Soria'>Soria</option>
					<option value='Tarragona'>Tarragona</option>
					<option value='Santa Cruz de Tenerife'>Santa Cruz de
						Tenerife</option>
					<option value='Teruel'>Teruel</option>
					<option value='Toledo'>Toledo</option>
					<option value='Valencia'>Valencia</option>
					<option value='Valladolid'>Valladolid</option>
					<option value='Vizcaya'>Vizcaya</option>
					<option value='Zamora'>Zamora</option>
					<option value='Zaragoza'>Zaragoza</option>
			</select></li>
			<li><label>Código Postal</label></li>
			<li><input class="inputs" type="number" name="codigopostal"
				placeholder="Código Postal" onchange=""></li>
			<li><label>Teléfono</label></li>
			<li><input class="inputs" type="number" name="telefono"
				placeholder="Teléfono" onchange=""></li>
			<li><button class="button" type="button" value="Enviar"
					onclick="validacion()">Añadir</button></li>
		</ul>

	</form>
</div>

<%
	}
%>

