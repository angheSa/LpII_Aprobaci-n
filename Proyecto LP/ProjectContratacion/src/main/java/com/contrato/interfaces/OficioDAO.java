package com.contrato.interfaces;

import com.contrato.entidad.Oficio;

import java.util.List;

public interface OficioDAO {
	//metodo a usar
	public int save(Oficio bean);
	public int update(Oficio bean);
	
	public Oficio findById(String cod); //Usar con JSON
	public List<Oficio> listAll();
	public String generarCodigo();

}
