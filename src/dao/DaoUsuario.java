package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import modelo.Usuario;

public class DaoUsuario {
	
	private Connection con = null;
	public static DaoUsuario instance = null;
	
	
	public DaoUsuario() throws SQLException{
		
		con = DBConnection.getConnection();
		
	}
	
	public static DaoUsuario getInstance() throws SQLException {
		
		if(instance == null) {
			
			instance = new DaoUsuario();
			
		}
		
		return instance;
	}
	
	/**
	 * metodo que comunica con MySQL para insertar el objeto
	 * 
	 * @param r Objeto Restaurante a insertar
	 * @throws SQLException 
	 */
	public void daoAdd(Usuario u) throws SQLException {
		
		//codigo JDBC
		PreparedStatement ps = con.prepareStatement("INSERT INTO usuarios (email, password) VALUES (?,?)");
		
		ps.setString(1, u.getEmail());
		ps.setString(2, u.getPassword());
		
		ps.executeUpdate();
		
		ps.close();
		
	}
	
	/**
	 * metodo que comunica con MySQL para actualizar el objeto
	 * 
	 * @param r Objeto Restaurante a actualizar
	 * @throws SQLException 
	 */
	public void daoUpdate(Usuario u) throws SQLException {
		
		if(u.getId() != 0) {
			
			PreparedStatement ps = con.prepareStatement("UPDATE usuarios SET email=?, password=? WHERE id=?");
		
			ps.setString(1, u.getEmail());
			ps.setString(2, u.getPassword());
			
			ps.executeUpdate();
			
			ps.close();
		}
	}
	
	/**
	 * metodo que comunica con MySQL para borrar el objeto
	 * 
	 * @param id id del Objeto Restaurante a borrar
	 * @throws SQLException 
	 */
	public void daoDelete(int id) throws SQLException {
		
		if(id != 0) {
			
			PreparedStatement ps = con.prepareStatement("DELETE FROM usuarios WHERE id=?");

			ps.setInt(1, id);
			
			ps.executeUpdate();
			
			ps.close();
		}
		
	}
	
	public ArrayList<Usuario> list() throws SQLException{
		
		PreparedStatement ps = con.prepareStatement("SELECT * from usuarios");
		
		ResultSet rs = ps.executeQuery();
		
		ArrayList<Usuario> result = new ArrayList<Usuario>();
		
		while(rs.next()) {
			
			result.add(new Usuario(rs.getInt("id"), rs.getString("email"), rs.getString("password")));
		}
		
		return result;
	}
	
	public boolean comprobacionLogin(Usuario u) throws SQLException{
		
		boolean existUser = false;
		
		PreparedStatement ps = con.prepareStatement("SELECT * from usuarios WHERE email=? AND password=?");
		
		ps.setString(1, u.getEmail());
		ps.setString(2, u.getPassword());
	
		ResultSet rs = ps.executeQuery();

		if(rs.next()){
			existUser = true;
		}
		
		return existUser;	
	}
	
	public int permisoUser(Usuario u) throws SQLException{
		
		int permiso = 0;
		
		PreparedStatement ps = con.prepareStatement("SELECT permiso from usuarios WHERE email=? AND password=?");
		
		ps.setString(1, u.getEmail());
		ps.setString(2, u.getPassword());
	
		ResultSet rs = ps.executeQuery();

		if(rs.next()){
			permiso = rs.getInt("permiso");
		}
		
		return permiso;	
	}
}
