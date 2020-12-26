package modelo;

import java.sql.SQLException;

import dao.DaoRestaurante;

public class Restaurante {
	
	private int id;
	private String nombre;
	private String categoria;
	private String direccion;
	private String ciudad;
	private String codigopostal;
	private String telefono;
	
	public Restaurante() {
		
	}
	
	public Restaurante(String nombre, String categoria, String direccion, String ciudad, String codigopostal, String telefono) {
		this.nombre = nombre;
		this.categoria = categoria;
		this.direccion = direccion;
		this.ciudad = ciudad;
		this.codigopostal = codigopostal;
		this.telefono = telefono;
	}
	
	public Restaurante(int id, String nombre, String categoria, String direccion, String ciudad, String codigopostal, String telefono) {
		this.id = id;
		this.nombre = nombre;
		this.categoria = categoria;
		this.direccion = direccion;
		this.ciudad = ciudad;
		this.codigopostal = codigopostal;
		this.telefono = telefono;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getCategoria() {
		return categoria;
	}

	public void setCategoria(String categoria) {
		this.categoria = categoria;
	}

	public String getDireccion() {
		return direccion;
	}

	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}
	
	public String getCiudad() {
		return ciudad;
	}

	public void setCiudad(String ciudad) {
		this.ciudad = ciudad;
	}

	public String getCodigopostal() {
		return codigopostal;
	}

	public void setCodigopostal(String codigopostal) {
		this.codigopostal = codigopostal;
	}

	public String getTelefono() {
		return telefono;
	}

	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}
	
	public void add() throws SQLException {
		
		DaoRestaurante.getInstance().daoAdd(this);
		
	}
	
	public void update() throws SQLException {
		
		DaoRestaurante.getInstance().daoUpdate(this);
		
	}

}
