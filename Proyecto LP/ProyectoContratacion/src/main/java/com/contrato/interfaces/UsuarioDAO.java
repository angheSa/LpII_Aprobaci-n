package com.contrato.interfaces;

import java.util.List;

import com.contrato.entidad.Menu;
import com.contrato.entidad.Usuario;

public interface UsuarioDAO {
	public Usuario iniciarSesion(String login,String clave);
	public List<Menu> traerMenusPorUsuario(int codUsu);
}
