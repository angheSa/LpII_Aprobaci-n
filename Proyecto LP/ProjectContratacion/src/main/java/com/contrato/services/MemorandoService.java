package com.contrato.services;

import java.util.List;

import com.contrato.entidad.Expediente;
import com.contrato.entidad.Memorando;

import com.contrato.fabrica.DAOFactory;
import com.contrato.interfaces.ExpedienteDAO;
import com.contrato.interfaces.MemorandoDAO;

public class MemorandoService {
	private DAOFactory fabrica=DAOFactory.getDAOFactory(1);
	private ExpedienteDAO objExpediente=fabrica.getExpedienteDAO();
	private MemorandoDAO objMemorando=fabrica.getMemorandoDAO();

	
	//métodos de servicio
	public int registrar(Memorando bean) {
		return objMemorando.save(bean);
	}
	public int actualizar(Memorando bean) {
		return objMemorando.update(bean);
	}
	
	public Memorando buscarPorId(String cod) {
		return objMemorando.findById(cod);
	}
	public List<Expediente> listExpedientes(){
		return objExpediente.listAll();
	}
	public List<Memorando> listMemorandos(){
		return objMemorando.listAll();
	}
	public String codigoMemorando() {
		return objMemorando.generarCodigoMemo();
	}
}
