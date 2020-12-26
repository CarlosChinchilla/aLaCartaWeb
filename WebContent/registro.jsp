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
	
		<div class="loginVent ventReg">
			<h2>Registrate en "A la Carta"</h2>
			<div class="login">
                <form id="formReg" action="Clogin" method="post">
                	<input type="hidden" name="user" value="0">
                    <input class="loginInput" type="text" id="emailLog" name="email" placeholder="Email">
                    <input class="loginInputPass" type="password" id="passLog" name="password" placeholder="Contraseña">
                    <input class="loginInputPass" type="password" id="passLogRep" name="passLogRep" placeholder="Confirmar contraseña">
                    
                    <input class="botLogin" type="button" value="Crear cuenta" onclick="submitRegistro()">
                </form>
                     
                <div class="textLog">¿Ya tienes una cuenta? </div> <a class="textReg" href="login.jsp"> Inicia sesión</a>
                     
            </div>
		</div>
		
		<div id="secondcontainerReg"></div>
		
	</div>

</body>

<%@include file="/includes/footer.jsp" %>

</html>