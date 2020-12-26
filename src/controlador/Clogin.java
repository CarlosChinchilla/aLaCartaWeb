package controlador;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DaoRestaurante;
import dao.DaoUsuario;
import modelo.Usuario;

/**
 * Servlet implementation class Clogin
 */
@WebServlet("/Clogin")
public class Clogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Clogin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		int id = Integer.parseInt(request.getParameter("id"));
		int opcion = Integer.parseInt(request.getParameter("opcion"));
		
		switch (opcion) {
			case 1: //eliminar
				
				try {
					
					DaoUsuario.getInstance().daoDelete(id);
					
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
	
				response.sendRedirect("listUser.jsp");
				
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
		
		int user = Integer.parseInt(request.getParameter("user"));
		
		Usuario u = new Usuario();
		
		u.setEmail(request.getParameter("email"));
		u.setPassword(request.getParameter("password"));
		
		try {
			//si el id es 0 es una nueva entrada
			if(user == 0) {
				u.add();
				response.sendRedirect("login.jsp");
			//si no es 0 es una actualizacion
			}else {
				if(u.comprobarLogin()) {
					
					request.setAttribute("email", u.getEmail());
					request.setAttribute("permiso", DaoUsuario.getInstance().permisoUser(u));
					request.getRequestDispatcher("index.jsp").forward(request, response);
					
					//response.sendRedirect("index.jsp");
					
				}else {
					response.sendRedirect("login.jsp");
				}
				
			}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		
	}

}
