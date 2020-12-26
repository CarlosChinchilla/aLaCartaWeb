<%@include file="/includes/session.jsp" %>

<header id="headerMain">

    <div id="menuM" class="superior">
    
    	<ul id="menuMovil">
    	
    		<li><a class="supBot">AYUDA</a><img src="img/quest.png"></li>
    		
    		<%if(session.getAttribute("email") == null){ %>
    		
    		<li><a class="supBot" href="login.jsp">LOGIN</a><img src="img/user.png"></li>
    		
    		<% }else{ %>
    		
    		<li><a class="supBot" href="killSession.jsp">CERRAR SESIÓN</a><img src="img/logout.png"></li>
    		
    		<% } %>
    		
    		<%
    		if(session.getAttribute("permiso") != null){
    			if((int)session.getAttribute("permiso") == 76){ 
    			%>
    		
    		<li><a class="supBot" href="admin.jsp?ad=0">ADMIN</a><img src="img/logowhite.png"></li>
    		
    		<% }} %>
    		
    	</ul>

    </div>

    <div class="superior2">

        <a href="index.jsp"><img class="logo" src="img/logo.png"><img class="logoLetter" src="img/fullLogov3.png"></a>

		<div id="movMenu">
			<a class="botonMenu"><img class="logo" src="img/menuMov.png" onclick="menu()"></a>
		</div>

    </div>

</header>