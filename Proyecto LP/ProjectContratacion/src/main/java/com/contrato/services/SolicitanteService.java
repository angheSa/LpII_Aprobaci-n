package com.contrato.services;

import java.util.List;

import com.contrato.entidad.Solicitante;
import com.contrato.fabrica.DAOFactory;
import com.contrato.interfaces.SolicitanteDAO;

public class SolicitanteService {
	private DAOFactory fabrica=DAOFactory.getDAOFactory(1);
	//PASO 2: definir dao a utilizar
	private SolicitanteDAO objSolici=fabrica.getSolicitanteDAO();
	
	//métodos de servicio
	
	public int registrar(Solicitante bean) {
		return objSolici.save(bean);
	}
	public int actualizar(Solicitante bean) {
		return objSolici.update(bean);
	}
	public int eliminarPorId(int cod) {
		return objSolici.delete(cod);
	}
	public Solicitante buscarPorId(int cod) {
		return objSolici.findById(cod);
	}
	public List<Solicitante> listarTodos(){
		return objSolici.listAll();
	}
	

}
