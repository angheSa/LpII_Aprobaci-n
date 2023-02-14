package com.contrato.fabrica;

import com.contrato.dao.MySqlExpedienteDAO;
import com.contrato.dao.MySqlMemorandoDAO;
import com.contrato.dao.MySqlOficioDAO;
import com.contrato.dao.MySqlSolicitanteDAO;
import com.contrato.dao.MySqlUsuarioDAO;
import com.contrato.interfaces.ExpedienteDAO;
import com.contrato.interfaces.MemorandoDAO;
import com.contrato.interfaces.OficioDAO;
import com.contrato.interfaces.SolicitanteDAO;
import com.contrato.interfaces.UsuarioDAO;

public class MySqlDAOFactory extends DAOFactory {

	@Override
	public SolicitanteDAO getSolicitanteDAO() {
		// TODO Auto-generated method stub
		return new MySqlSolicitanteDAO();
	}

	@Override
	public OficioDAO getOficioDAO() {
		// TODO Auto-generated method stub
		return new MySqlOficioDAO();
	}

	@Override
	public UsuarioDAO getUsuarioDAO() {
		// TODO Auto-generated method stub
		return new MySqlUsuarioDAO();
	}
	@Override
	public ExpedienteDAO getExpedienteDAO() {
		// TODO Auto-generated method stub
		return new MySqlExpedienteDAO();
	}

	@Override
	public MemorandoDAO getMemorandoDAO() {
		// TODO Auto-generated method stub
		return new MySqlMemorandoDAO();
	}

}
