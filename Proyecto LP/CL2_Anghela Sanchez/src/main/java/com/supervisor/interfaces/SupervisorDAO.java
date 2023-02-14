package com.supervisor.interfaces;

import java.util.List;

import com.supervisor.entidad.Supervisor;


public interface SupervisorDAO {
	public List<Supervisor> listAllBySucursal(String sucursal);
	public int deleteByCodigo(int cod);
}
