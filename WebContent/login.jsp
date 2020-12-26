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

	<div id="maincontainerLogin">
	
		<div class="loginVent">
			<h2>Inicia sesión</h2>
			<div class="login">
                <form id="formLogin" action="Clogin" method="post">
                	<input type="hidden" name="user" value="1">
                    <input class="loginInput" type="text" id="emailLog" name="email" placeholder="Email">
                    <input class="loginInputPass" type="password" id="passLog" name="password" placeholder="Contraseña">
                    
                    <input class="botLogin" type="button" value="Iniciar sesión" onclick="submitLogin()">
                </form>
                     
                <div class="textLog">¿Nuevo en "A la Carta"? </div> <a class="textReg" href="registro.jsp"> ¡Registrate!</a>
                     
            </div>
		</div>
		
		<div id="secondcontainerLog"></div>
		
	</div>

</body>

<%@include file="/includes/footer.jsp" %>

</html>