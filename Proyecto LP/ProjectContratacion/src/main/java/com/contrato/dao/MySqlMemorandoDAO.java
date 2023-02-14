package com.contrato.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.contrato.entidad.Memorando;
import com.contrato.interfaces.MemorandoDAO;
import com.contrato.utils.MySqlConexion;

public class MySqlMemorandoDAO implements MemorandoDAO{

	@Override
	public int save(Memorando bean) {
		int salida=-1;
		Connection cn=null;
		PreparedStatement pstm=null;
		try {
			//Generar la conexion
			cn=MySqlConexion.getConectar();
			//Utilizar sentencias 
			String sql="insert into tb_memorando values(null,?,?,?,?,?,?)";
			pstm=cn.prepareStatement(sql);
			//Accediendo a los campos
			pstm.setString(1,bean.getCodMemo());
			pstm.setString(2, bean.getFechMemo());
			pstm.setString(3, bean.getAsuntMemo());
			pstm.setString(4, bean.getNomGere());
			pstm.setString(5, bean.getCodExpe());
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
	public int update(Memorando bean) {
		int result=-1;
		Connection cn=null;
		PreparedStatement pstm=null;
		try {
			cn=MySqlConexion.getConectar();
			String sql="update tb_memorando set codigoMemorando=?, fechaMemo=?,asuntoMemo=?,nomGerente=?,codExpediente=?,mensaje=? where codMemo=?";
			
			pstm=cn.prepareStatement(sql);
			//Accediendo a los campos
			pstm.setInt(1, bean.getCodigoMemorando());
			pstm.setString(2, bean.getFechMemo());
			pstm.setString(3, bean.getAsuntMemo());
			pstm.setString(4, bean.getNomGere());
			pstm.setString(5, bean.getCodExpe());
			pstm.setString(6, bean.getMens());
			pstm.setString(7,bean.getCodMemo());
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
	public Memorando findById(String cod) {
		Memorando bean=null;
		Connection cn=null;
		PreparedStatement pstm=null;
		ResultSet rs=null;
		try {
	
			cn=MySqlConexion.getConectar();
			String sql="select *from tb_memorando where codMemo=?";
			pstm=cn.prepareStatement(sql);
			pstm.setString(1, cod);
			rs=pstm.executeQuery();
			//Validamos si existe el registro de expediente
			if(rs.next()) {
				bean=new Memorando();
				bean.setCodigoMemorando(rs.getInt(1));
				bean.setCodMemo(rs.getString(2));
				bean.setFechMemo(rs.getString(3));
				bean.setAsuntMemo(rs.getString(4));
				bean.setNomGere(rs.getString(5));
				bean.setCodExpe(rs.getString(6));
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
	public List<Memorando> listAll() {
		List<Memorando> listaExpe=new ArrayList<Memorando>();
		Memorando bean=null;
		Connection cn=null;
		PreparedStatement pstm=null;
		ResultSet rs=null;
		try {
			//Conexion y acceder a los datos
			cn=MySqlConexion.getConectar();
			String sql="select *from tb_memorando";
			pstm=cn.prepareStatement(sql);
			rs=pstm.executeQuery();
			
			while(rs.next()) {
				//Crear un objeto de expediente
				bean=new Memorando();
				bean.setCodigoMemorando(rs.getInt(1));
				bean.setCodMemo(rs.getString(2));
				bean.setFechMemo(rs.getString(3));
				bean.setAsuntMemo(rs.getString(4));
				bean.setNomGere(rs.getString(5));
				bean.setCodExpe(rs.getString(6));
				bean.setMens(rs.getString(7));
				listaExpe.add(bean);
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
		
		return listaExpe;
	}

	@Override
	public String generarCodigoMemo() {
		String numero="";
		Connection cn=null;
		PreparedStatement pstm=null;
		ResultSet rs=null;
		try {
			//1.
			cn=MySqlConexion.getConectar();
			//2.
			String sql="select concat('ME',"
					+ "	substring("
					+ "    concat('0000',cast(substring(max(codMemo),3) as unsigned)+1),"
					+ "    length(concat('0000',cast(substring(max(codMemo),3) as unsigned)+1))-3)) numero"
					+ " from tb_memorando";
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
