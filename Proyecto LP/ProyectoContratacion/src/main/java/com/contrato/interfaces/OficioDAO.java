package com.contrato.interfaces;

import com.contrato.entidad.Oficio;

import java.util.List;

public interface OficioDAO {
	//metodo a usar
	public int save(Oficio bean);
	public int update(Oficio bean);
	public int delete(int cod);
	public Oficio findById(int cod); //Usar con JSON
	public List<Oficio> listAll();

}
