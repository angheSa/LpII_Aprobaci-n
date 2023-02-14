package com.contrato.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class MySqlConexion {
	
	public static Connection getConectar() {
		Connection cn=null;
		try {
			String url,user,pass;
			Class.forName("com.mysql.cj.jdbc.Driver");
			url="jdbc:mysql://localhost:3306/proyecto_aprobacion?serverTimezone=UTC";
			user="root";
			pass="mysql";
			//establacer la conexión a la BD. 
			cn=DriverManager.getConnection(url,user,pass);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		return cn;
	}
}

