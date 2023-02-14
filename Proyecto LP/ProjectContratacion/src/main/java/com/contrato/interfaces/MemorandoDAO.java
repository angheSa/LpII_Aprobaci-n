package com.contrato.interfaces;

import java.util.List;


import com.contrato.entidad.Memorando;

public interface MemorandoDAO {
	public int save(Memorando bean);
	public int update(Memorando bean);
	
	public Memorando findById(String cod);
	public List<Memorando> listAll();
	public String generarCodigoMemo();
	
}
