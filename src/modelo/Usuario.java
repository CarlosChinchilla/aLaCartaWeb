package modelo;

import java.sql.SQLException;

import dao.DaoUsuario;

public class Usuario {
	
	private int id;
	private String email;
	private String password;
	
	public Usuario() {
		
	}
	
	public Usuario(String email) {
		this.email = email;
	}

	public Usuario(String email, String password) {
		this.email = email;
		this.password = password;
	}

	public Usuario(int id, String email, String password) {
		this.id = id;
		this.email = email;
		this.password = password;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
	public void add() throws SQLException {
		
		DaoUsuario.getInstance().daoAdd(this);
		
	}
	
	public void update() throws SQLException {
		
		DaoUsuario.getInstance().daoUpdate(this);
		
	}
	
	public boolean comprobarLogin() throws SQLException {
		
		return DaoUsuario.getInstance().comprobacionLogin(this);
		
	}

}
