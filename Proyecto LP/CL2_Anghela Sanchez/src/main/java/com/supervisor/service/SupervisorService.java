package com.supervisor.service;

import java.util.List;

import com.supervisor.entidad.Sucursal;
import com.supervisor.entidad.Supervisor;
import com.supervisor.fabrica.DAOFactory;
import com.supervisor.interfaces.SucursalDAO;
import com.supervisor.interfaces.SupervisorDAO;


public class SupervisorService {
	private DAOFactory fabrica=DAOFactory.getDAOFactory(1);
	private SupervisorDAO objSuper=fabrica.getSupervisorDAO();
	private SucursalDAO objSucur=fabrica.getSucursalDAO();
	
	public List<Sucursal> listarSucursal() {
		return objSucur.listAll();
	}
	public List<Supervisor> listarSupervisorPorSucursal(String sucursal) {
		return objSuper.listAllBySucursal(sucursal);
	}
	public int eliminarSupervisorPorCodigo(int cod) {
		return objSuper.deleteByCodigo(cod);
	}
	
}
