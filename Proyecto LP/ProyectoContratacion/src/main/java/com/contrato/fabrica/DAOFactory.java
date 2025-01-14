package com.contrato.fabrica;

import com.contrato.interfaces.ExpedienteDAO;
import com.contrato.interfaces.OficioDAO;
import com.contrato.interfaces.SolicitanteDAO;
import com.contrato.interfaces.UsuarioDAO;

public abstract class DAOFactory {
	// los posibles or�genes de datos
    public static final int MYSQL = 1;
    public static final int ORACLE = 2;
    public static final int DB2 = 3;
    public static final int SQLSERVER = 4;
    public static final int XML = 5;
    // Existir� un m�todo get por cada DAO que exista en el sistema
    public abstract SolicitanteDAO getSolicitanteDAO();
    public abstract OficioDAO getOficioDAO();
    public abstract UsuarioDAO getUsuarioDAO();
    public abstract ExpedienteDAO getExpedienteDAO();
   // public abstract BuscarSolicitanteDAO getBuscarSolicitanteDAO();
   
    public static DAOFactory getDAOFactory(int whichFactory){
        switch(whichFactory){
       	case MYSQL:
        	   return new MySqlDAOFactory();
        	case XML:
        	    //return new XmlDAOFactory();
        	case ORACLE:
        	    //return new OracleDAOFactory();
        	/*case DB2:
        	    return new Db2DAOFactory();*/
        	case SQLSERVER:
        	    return null;
        	/*case XML:
        	    return new XmlDAOFactory();*/
        	default:
        	    return null;
        }
     }
}
