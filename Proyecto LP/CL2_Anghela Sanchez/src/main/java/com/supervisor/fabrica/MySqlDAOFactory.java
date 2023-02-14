package com.supervisor.fabrica;

import com.supervisor.dao.MySqlSucursalDAO;
import com.supervisor.dao.MySqlSupervisorDAO;
import com.supervisor.interfaces.SucursalDAO;
import com.supervisor.interfaces.SupervisorDAO;

public class MySqlDAOFactory extends DAOFactory {

	@Override
	public SupervisorDAO getSupervisorDAO() {
		// TODO Auto-generated method stub
		return new MySqlSupervisorDAO();
	}

	@Override
	public SucursalDAO getSucursalDAO() {
		// TODO Auto-generated method stub
		return new MySqlSucursalDAO();
	}

}
