<%

if(request.getAttribute("email") != null){
	
	String email = (String) request.getAttribute("email");
	int permiso = (int) request.getAttribute("permiso");
	
	session.setAttribute("email", email);
	session.setAttribute("permiso", permiso);
	
}

/*
System.out.println(request.getAttribute("email"));
System.out.println(request.getAttribute("permiso"));

System.out.println("-------");

System.out.println(session.getAttribute("email"));
System.out.println(session.getAttribute("permiso"));

System.out.println("-------");
*/

%>