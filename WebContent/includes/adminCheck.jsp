
<%
if(session.getAttribute("permiso") == null){

	response.sendRedirect("index.jsp");
	
}



if(session.getAttribute("permiso") != null){
    
	if((int)session.getAttribute("permiso") != 76){ 
		
		response.sendRedirect("index.jsp");
    		
	}
}
    			
%>