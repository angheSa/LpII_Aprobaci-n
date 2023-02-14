package com.contrato.interfaces;

import java.util.List;

import com.contrato.entidad.Solicitante;


public interface SolicitanteDAO {
	public int save(Solicitante bean);
	public int update(Solicitante bean);
	public int delete(int cod);
	public Solicitante findById(int cod);
	public List<Solicitante> listAll();
	
}
