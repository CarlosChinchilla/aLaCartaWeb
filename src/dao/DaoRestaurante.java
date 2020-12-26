package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import modelo.Restaurante;

public class DaoRestaurante {
	
	private Connection con = null;
	public static DaoRestaurante instance = null;
	
	
	public DaoRestaurante() throws SQLException{
		
		con = DBConnection.getConnection();
		
	}
	
	public static DaoRestaurante getInstance() throws SQLException {
		
		if(instance == null) {
			
			instance = new DaoRestaurante();
			
		}
		
		return instance;
	}
	
	/**
	 * metodo que comunica con MySQL para insertar el objeto
	 * 
	 * @param r Objeto Restaurante a insertar
	 * @throws SQLException 
	 */
	public void daoAdd(Restaurante r) throws SQLException {
		
		//codigo JDBC
		PreparedStatement ps = con.prepareStatement("INSERT INTO restaurantes (nombre, categoria, direccion, ciudad, codigopostal, telefono) VALUES (?,?,?,?,?,?)");
		
		ps.setString(1, r.getNombre());
		ps.setString(2, r.getCategoria());
		ps.setString(3, r.getDireccion());
		ps.setString(4, r.getCiudad());
		ps.setString(5, r.getCodigopostal());
		ps.setString(6, r.getTelefono());
		
		ps.executeUpdate();
		
		ps.close();
		
	}
	
	/**
	 * metodo que comunica con MySQL para actualizar el objeto
	 * 
	 * @param r Objeto Restaurante a actualizar
	 * @throws SQLException 
	 */
	public void daoUpdate(Restaurante r) throws SQLException {
		
		if(r.getId() != 0) {
			
			PreparedStatement ps = con.prepareStatement("UPDATE restaurantes SET nombre=?, categoria=?, direccion=?, ciudad=?, codigopostal=?, telefono=? WHERE id=?");
		
			ps.setString(1, r.getNombre());
			ps.setString(2, r.getCategoria());
			ps.setString(3, r.getDireccion());
			ps.setString(4, r.getCiudad());
			ps.setString(5, r.getCodigopostal());
			ps.setString(6, r.getTelefono());
			ps.setInt(7, r.getId());
			
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
			
			PreparedStatement ps = con.prepareStatement("DELETE FROM restaurantes WHERE id=?");

			ps.setInt(1, id);
			
			ps.executeUpdate();
			
			ps.close();
		}
		
	}
	
	public ArrayList<Restaurante> list() throws SQLException{
		
		PreparedStatement ps = con.prepareStatement("SELECT * from restaurantes");
		
		ResultSet rs = ps.executeQuery();
		
		ArrayList<Restaurante> result = new ArrayList<Restaurante>();
		
		while(rs.next()) {
			
			result.add(new Restaurante(rs.getInt("id"), rs.getString("nombre"), rs.getString("categoria"), rs.getString("direccion"), rs.getString("ciudad"), rs.getString("codigopostal"), rs.getString("telefono")));
		}
		
		return result;
		
	}
	
	public Restaurante oneRest(int id) throws SQLException{
		
		PreparedStatement ps = con.prepareStatement("SELECT * from restaurantes WHERE id=?");
		
		ps.setInt(1, id);
	
		ResultSet rs = ps.executeQuery();
		
		Restaurante r = new Restaurante();
		
		if(rs.next()){
			r.setNombre(rs.getString("nombre"));
			r.setCategoria(rs.getString("categoria"));
			r.setDireccion(rs.getString("direccion"));
			r.setCiudad(rs.getString("ciudad"));
			r.setCodigopostal(rs.getString("codigopostal"));
			r.setTelefono(rs.getString("telefono"));
		}
		
		return r;
		
	}
	
	public ArrayList<Restaurante> buscar(String busqueda) throws SQLException{
		
		//busqueda = "'%"+busqueda+"%'";
		//System.out.println(busqueda);
		
		PreparedStatement ps = con.prepareStatement("SELECT * from restaurantes WHERE lower(nombre)=? OR lower(ciudad)=?;");
		
		ps.setString(1, busqueda);
		ps.setString(2, busqueda);
		
		ResultSet rs = ps.executeQuery();
		
		ArrayList<Restaurante> result = new ArrayList<Restaurante>();
		
		while(rs.next()) {
			
			result.add(new Restaurante(rs.getInt("id"), rs.getString("nombre"), rs.getString("categoria"), rs.getString("direccion"), rs.getString("ciudad"), rs.getString("codigopostal"), rs.getString("telefono")));
		}
		
		return result;
		
	}
}
