package com.supervisor.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.supervisor.entidad.Supervisor;
import com.supervisor.interfaces.SupervisorDAO;
import com.supervisor.utils.MySqlConexion;


public class MySqlSupervisorDAO  implements SupervisorDAO{

	@Override
	public List<Supervisor> listAllBySucursal(String sucursal) {
		List<Supervisor> lista=new ArrayList<Supervisor>();
		Connection cn=null;
		PreparedStatement pstm=null;
		ResultSet rs=null;
		try {
			cn=MySqlConexion.getConectar();
			String sql="select s.cod_supervisor , s.nom_supervisor,s.ape_supervisor,s.dni_supervisor,s.num_hijos,s.sueldo,su.nom_sucursal from tb_supervisor s join tb_sucursal su on s.cod_sucursal=su.cod_sucursal where su.nom_sucursal=?";
			pstm=cn.prepareStatement(sql);
			pstm.setString(1, sucursal);
			rs=pstm.executeQuery();
			while(rs.next()) {
				Supervisor supervisor=new Supervisor();
				supervisor.setCodigo(rs.getInt(1));
				supervisor.setNombres(rs.getString(2));
				supervisor.setApellidos(rs.getString(3));
				supervisor.setDni(rs.getInt(4));
				supervisor.setHijos(rs.getInt(5));
				supervisor.setSueldo(rs.getDouble(6));
				supervisor.setNombreSucursal(rs.getString(7));
				lista.add(supervisor);
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

	@Override
	public int deleteByCodigo(int cod) {
		int salida=-1;
		Connection cn=null;
		PreparedStatement pstm=null;
		try {
			cn=MySqlConexion.getConectar();
			String sql="delete from tb_supervisor where cod_supervisor=?";
			pstm=cn.prepareStatement(sql);
			pstm.setInt(1, cod);
			
			salida=pstm.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			try {
				if(pstm!=null) pstm.close();
				if(cn!=null) cn.close();
			} catch (SQLException e2) {
				e2.printStackTrace();
			}
		}
		return salida;
	}

}
