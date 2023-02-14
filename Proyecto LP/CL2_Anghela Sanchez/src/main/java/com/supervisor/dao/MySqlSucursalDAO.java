package com.supervisor.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.supervisor.entidad.Sucursal;

import com.supervisor.interfaces.SucursalDAO;
import com.supervisor.utils.MySqlConexion;


public class MySqlSucursalDAO  implements SucursalDAO{

	@Override
	public List<Sucursal> listAll() {
		List<Sucursal> lista=new ArrayList<Sucursal>();
		Connection cn=null;
		PreparedStatement pstm=null;
		ResultSet rs=null;
		try {
			cn=MySqlConexion.getConectar();
			String sql="select*from tb_sucursal";
			pstm=cn.prepareStatement(sql);
			rs=pstm.executeQuery();
			while(rs.next()) {
				Sucursal suc=new Sucursal();
				suc.setCodigo(rs.getInt(1));
				suc.setNombre(rs.getString(2));
				lista.add(suc);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			try {
				if(rs!=null) rs.close();
				if(pstm!=null) pstm.close();
				if(cn!=null) cn.close();
			} catch (SQLException e2) {
				e2.printStackTrace();
			}
		}
		
		return lista;
	}

}
