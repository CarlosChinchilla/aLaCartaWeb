package controlador;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DaoRestaurante;
import modelo.Restaurante;

/**
 * Servlet implementation class Cseries
 */
@WebServlet("/Crestaurante")
public class Crestaurante extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public Crestaurante() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		int id = Integer.parseInt(request.getParameter("id"));
		String busqueda = request.getParameter("busqueda");
		int opcion = Integer.parseInt(request.getParameter("opcion"));
		
		switch (opcion) {
			case 1: //buscar
				
				response.sendRedirect("index.jsp?busqueda="+busqueda);
				
				break;
				
			case 2: //eliminar

				try {
					
					DaoRestaurante.getInstance().daoDelete(id);
					
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
	
				response.sendRedirect("listRest.jsp");
				
				break;
	
			default:
				break;
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		
		int id = Integer.parseInt(request.getParameter("id"));
		
		Restaurante r = new Restaurante();
		
		r.setId(id);
		r.setNombre(request.getParameter("nombre"));
		r.setCategoria(request.getParameter("categoria"));
		r.setDireccion(request.getParameter("direccion"));
		r.setCiudad(request.getParameter("ciudad"));
		r.setCodigopostal(request.getParameter("codigopostal"));
		r.setTelefono(request.getParameter("telefono"));
		
		try {
			//si el id es 0 es una nueva entrada
			if(id == 0) {
				r.add();
				response.sendRedirect("listRest.jsp");
			//si no es 0 es una actualizacion
			}else {
				r.update();
				response.sendRedirect("listRest.jsp");
			}
		} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		
	}

}
