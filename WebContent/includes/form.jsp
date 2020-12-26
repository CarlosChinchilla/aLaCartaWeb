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
		case "Hind�":
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
					<option value='Hind�'>Hind�</option>
					<option value='Japonesa'>Japonesa</option>
			</select></li>
			<li><label>Direcci�n: </label></li>
			<li><input class="inputs" type="text" name="direccion"
				placeholder="Direcci�n" value="<%=r.getDireccion()%>" onchange=""></li>
			<li><label>Ciudad</label></li>
			<li><select class="inputs" name="ciudad">
					<option value='<%=r.getCiudad()%>'><%=r.getCiudad()%></option>
					<option value='�lava'>�lava</option>
					<option value='Albacete'>Albacete</option>
					<option value='Alicante'>Alicante</option>
					<option value='Almer�a'>Almer�a</option>
					<option value='Asturias'>Asturias</option>
					<option value='�vila'>�vila</option>
					<option value='Badajoz'>Badajoz</option>
					<option value='Barcelona'>Barcelona</option>
					<option value='Burgos'>Burgos</option>
					<option value='C�ceres'>C�ceres</option>
					<option value='C�diz'>C�diz</option>
					<option value='Cantabria'>Cantabria</option>
					<option value='Castell�n'>Castell�n</option>
					<option value='Ceuta'>Ceuta</option>
					<option value='Ciudad Real'>Ciudad Real</option>
					<option value='C�rdoba'>C�rdoba</option>
					<option value='Cuenca'>Cuenca</option>
					<option value='Girona'>Girona</option>
					<option value='Las Palmas'>Las Palmas</option>
					<option value='Granada'>Granada</option>
					<option value='Guadalajara'>Guadalajara</option>
					<option value='Guip�zcoa'>Guip�zcoa</option>
					<option value='Huelva'>Huelva</option>
					<option value='Huesca'>Huesca</option>
					<option value='Islas Baleares'>Islas Baleares</option>
					<option value='Ja�n'>Ja�n</option>
					<option value='A Coru�a'>A Coru�a</option>
					<option value='La Rioja'>La Rioja</option>
					<option value='Le�n'>Le�n</option>
					<option value='Lleida'>Lleida</option>
					<option value='Lugo'>Lugo</option>
					<option value='Madrid'>Madrid</option>
					<option value='M�laga'>M�laga</option>
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
			<li><label>C�digo Postal</label></li>
			<li><input class="inputs" type="number" name="codigopostal"
				placeholder="C�digo Postal" value="<%=r.getCodigopostal()%>" onchange=""></li>
			<li><label>Tel�fono</label></li>
			<li><input class="inputs" type="number" name="telefono"
				placeholder="Tel�fono" value="<%=r.getTelefono()%>" onchange=""></li>
			<li><button class="button" type="button" value="Enviar"
					onclick="validacionEditar()">Editar</button></li>
		</ul>

	</form>
</div>

<%
	} else {
%>

<h2 class="etiqueta">A�adir nuevo Restaurante</h2>

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
					<option value='Hind�'>Hind�</option>
					<option value='Japonesa'>Japonesa</option>
			</select></li>
			<li><label>Direcci�n: </label></li>
			<li><input class="inputs" type="text" name="direccion"
				placeholder="Direcci�n" onchange=""></li>
			<li><label>Ciudad</label></li>
			<li><select class="inputs" name="ciudad">
					<option value='�lava'>�lava</option>
					<option value='Albacete'>Albacete</option>
					<option value='Alicante'>Alicante</option>
					<option value='Almer�a'>Almer�a</option>
					<option value='Asturias'>Asturias</option>
					<option value='�vila'>�vila</option>
					<option value='Badajoz'>Badajoz</option>
					<option value='Barcelona'>Barcelona</option>
					<option value='Burgos'>Burgos</option>
					<option value='C�ceres'>C�ceres</option>
					<option value='C�diz'>C�diz</option>
					<option value='Cantabria'>Cantabria</option>
					<option value='Castell�n'>Castell�n</option>
					<option value='Ceuta'>Ceuta</option>
					<option value='Ciudad Real'>Ciudad Real</option>
					<option value='C�rdoba'>C�rdoba</option>
					<option value='Cuenca'>Cuenca</option>
					<option value='Girona'>Girona</option>
					<option value='Las Palmas'>Las Palmas</option>
					<option value='Granada'>Granada</option>
					<option value='Guadalajara'>Guadalajara</option>
					<option value='Guip�zcoa'>Guip�zcoa</option>
					<option value='Huelva'>Huelva</option>
					<option value='Huesca'>Huesca</option>
					<option value='Islas Baleares'>Islas Baleares</option>
					<option value='Ja�n'>Ja�n</option>
					<option value='A Coru�a'>A Coru�a</option>
					<option value='La Rioja'>La Rioja</option>
					<option value='Le�n'>Le�n</option>
					<option value='Lleida'>Lleida</option>
					<option value='Lugo'>Lugo</option>
					<option value='Madrid'>Madrid</option>
					<option value='M�laga'>M�laga</option>
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
			<li><label>C�digo Postal</label></li>
			<li><input class="inputs" type="number" name="codigopostal"
				placeholder="C�digo Postal" onchange=""></li>
			<li><label>Tel�fono</label></li>
			<li><input class="inputs" type="number" name="telefono"
				placeholder="Tel�fono" onchange=""></li>
			<li><button class="button" type="button" value="Enviar"
					onclick="validacion()">A�adir</button></li>
		</ul>

	</form>
</div>

<%
	}
%>

