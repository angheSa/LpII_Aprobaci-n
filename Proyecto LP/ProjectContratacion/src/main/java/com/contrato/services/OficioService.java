package com.contrato.services;

import java.util.List;

import com.contrato.entidad.Oficio;
import com.contrato.entidad.Solicitante;
import com.contrato.fabrica.DAOFactory;
import com.contrato.interfaces.OficioDAO;
import com.contrato.interfaces.SolicitanteDAO;

public class OficioService {
		private DAOFactory fabrica=DAOFactory.getDAOFactory(1);
		private OficioDAO objOficio=fabrica.getOficioDAO();
		private SolicitanteDAO objSolici=fabrica.getSolicitanteDAO();

		
		//métodos de servicio
		public int registrar(Oficio bean) {
			return objOficio.save(bean);
		}
		public int actualizar(Oficio bean) {
			return objOficio.update(bean);
		}
		
		public Oficio buscarPorId(String cod) {
			return objOficio.findById(cod);
		}
		public List<Oficio> listOficios(){
			return objOficio.listAll();
		}
		public List<Solicitante> listarTodos(){
			return objSolici.listAll();
		}
		public String codigoOficio() {
			return objOficio.generarCodigo();
		}
}
