package com.contrato.services;

import java.util.List;

import com.contrato.entidad.Expediente;
import com.contrato.entidad.Oficio;
import com.contrato.fabrica.DAOFactory;
import com.contrato.interfaces.ExpedienteDAO;
import com.contrato.interfaces.OficioDAO;

public class ExpedienteService {
		private DAOFactory fabrica=DAOFactory.getDAOFactory(1);
		private ExpedienteDAO objExpediente=fabrica.getExpedienteDAO();
		private OficioDAO objOficio=fabrica.getOficioDAO();

		
		//m�todos de servicio
		public int registrar(Expediente bean) {
			return objExpediente.save(bean);
		}
		public int actualizar(Expediente bean) {
			return objExpediente.update(bean);
		}
		public int eliminarPorId(int cod) {
			return objExpediente.delete(cod);
		}
		public Expediente buscarPorId(int cod) {
			return objExpediente.findById(cod);
		}
		public List<Expediente> listExpedientes(){
			return objExpediente.listAll();
		}
		public List<Oficio> listOficios(){
			return objOficio.listAll();
		}
		
}
