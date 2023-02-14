package com.contrato.interfaces;

import java.util.List;
import com.contrato.entidad.Expediente;

public interface ExpedienteDAO {
	
		public int save(Expediente bean);
		public int update(Expediente bean);
		public Expediente findById(String cod);
		public List<Expediente> listAll();
		public String generarCodigoExpe();
		public List<Expediente> listAllByEstado(String estado);
}
