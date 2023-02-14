package com.contrato.dao;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.contrato.utils.MySqlConexion;
import com.contrato.entidad.Oficio;
import com.contrato.interfaces.OficioDAO;

public class MySqlOficioDAO implements OficioDAO {

	@Override
	public int save(Oficio bean) {
		int salida=-1;
		Connection cn=null;
		PreparedStatement pstm=null;
		
		
		try {
			//Generar la conexion
			cn=MySqlConexion.getConectar();
			//Utilizar sentencias 
			String sql="insert into tb_oficio values(null,?,?,?,?,?,?)";
			pstm=cn.prepareStatement(sql);
			//Accediendo a los campos
			pstm.setString(1, bean.getCodOfi());
			pstm.setInt(2, bean.getCodSoli());	
			pstm.setString(3, bean.getFechaOfi());
			pstm.setString(4, bean.getAsuntoOfi());
			pstm.setString(5, bean.getNomSecre());
			
			pstm.setString(6, bean.getMens());
			
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

	@Override
	public int update(Oficio bean) {
		
		int result=-1;
		Connection cn=null;
		PreparedStatement pstm=null;
		try {
			cn=MySqlConexion.getConectar();
			String sql="update tb_oficio set codigoOficio=?,codSolicitante=?,fechaOficio=?,asuntoOficio=?,nomSecretaria=?,mensaje=? where codOficio=?";
			
			pstm=cn.prepareStatement(sql);
			//Accediendo a los campos
			pstm.setInt(1, bean.getCodigoOfico());
			pstm.setInt(2, bean.getCodSoli());
			pstm.setString(3, bean.getFechaOfi());
			pstm.setString(4, bean.getAsuntoOfi());
			pstm.setString(5, bean.getNomSecre());
			
			pstm.setString(6, bean.getMens());
			pstm.setString(7, bean.getCodOfi());
			result=pstm.executeUpdate();
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
		return result;
	}


	@Override
	public Oficio findById(String cod) {
		
		
		Oficio bean=null;
		Connection cn=null;
		PreparedStatement pstm=null;
		ResultSet rs=null;
		try {
	
			cn=MySqlConexion.getConectar();
			String sql="select *from tb_oficio where codOficio=?";
			pstm=cn.prepareStatement(sql);
			pstm.setString(1, cod);
			rs=pstm.executeQuery();
			//Validamos si existe el registro de oficio
			if(rs.next()) {
				bean=new Oficio();
				bean.setCodigoOfico(rs.getInt(1));
				bean.setCodOfi(rs.getString(2));
				bean.setCodSoli(rs.getInt(3));
				bean.setFechaOfi(rs.getString(4));
				bean.setAsuntoOfi(rs.getString(5));
				bean.setNomSecre(rs.getString(6));
				bean.setMens(rs.getString(7));
				
				
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
		return bean;
	}

	@Override
	public List<Oficio> listAll() {
	
		List<Oficio> listaOficio=new ArrayList<Oficio>();
		Oficio bean=null;
		Connection cn=null;
		PreparedStatement pstm=null;
		ResultSet rs=null;
		try {
			//Conexion y acceder a los datos
			cn=MySqlConexion.getConectar();
			String sql="select *from tb_oficio";
			pstm=cn.prepareStatement(sql);
			rs=pstm.executeQuery();
			
			while(rs.next()) {
				//Crear un objeto de Oficio
				
				
				bean=new Oficio();
				bean.setCodigoOfico(rs.getInt(1));
				bean.setCodOfi(rs.getString(2));
				bean.setCodSoli(rs.getInt(3));
				bean.setFechaOfi(rs.getString(4));
				bean.setAsuntoOfi(rs.getString(5));
				bean.setNomSecre(rs.getString(6));
				bean.setMens(rs.getString(7));
				listaOficio.add(bean);
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
		
		return listaOficio;
		
	}

	@Override
	public String generarCodigo() {
		String numero="";
		Connection cn=null;
		PreparedStatement pstm=null;
		ResultSet rs=null;
		try {
			//1.
			cn=MySqlConexion.getConectar();
			//2.
			String sql="select concat('OF',"
					+ "	substring("
					+ "    concat('0000',cast(substring(max(codOficio),3) as unsigned)+1),"
					+ "    length(concat('0000',cast(substring(max(codOficio),3) as unsigned)+1))-3)) numero"
					+ " from tb_oficio";
			//3.
			pstm=cn.prepareStatement(sql);
			rs=pstm.executeQuery();
			//6.
			if(rs.next()) {
				numero=rs.getString(1);
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
		
		return numero;
	}

	
}


	
	


