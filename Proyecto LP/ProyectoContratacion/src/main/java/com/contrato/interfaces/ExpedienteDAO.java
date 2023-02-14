package com.contrato.interfaces;

import java.util.List;
import com.contrato.entidad.Expediente;

public interface ExpedienteDAO {
	
		public int save(Expediente bean);
		public int update(Expediente bean);
		public int delete(int cod);
		public Expediente findById(int cod);
		public List<Expediente> listAll();

}
