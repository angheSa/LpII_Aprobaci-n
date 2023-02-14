package com.contrato.entidad;

public class Expediente {
	//Declaración de variables
	private int codExpediente,codOficio;
	private String fechaExpe,nomSecretria,contratoTiempo,estadoExpe;
	
	//Métodos get and set

	
	public String getFechaExpe() {
		return fechaExpe;
	}
	public void setFechaExpe(String fechaExpe) {
		this.fechaExpe = fechaExpe;
	}

	public int getCodExpediente() {
		return codExpediente;
	}
	public void setCodExpediente(int codExpediente) {
		this.codExpediente = codExpediente;
	}
	public int getCodOficio() {
		return codOficio;
	}
	public void setCodOficio(int codOficio) {
		this.codOficio = codOficio;
	}
	public String getNomSecretria() {
		return nomSecretria;
	}
	public void setNomSecretria(String nomSecretria) {
		this.nomSecretria = nomSecretria;
	}

	public String getContratoTiempo() {
		return contratoTiempo;
	}
	public void setContratoTiempo(String contratoTiempo) {
		this.contratoTiempo = contratoTiempo;
	}
	public String getEstadoExpe() {
		return estadoExpe;
	}
	public void setEstadoExpe(String estadoExpe) {
		this.estadoExpe = estadoExpe;
	}
	}
