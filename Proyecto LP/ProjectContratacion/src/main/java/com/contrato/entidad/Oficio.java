package com.contrato.entidad;



public class Oficio {
	//Declaraci�n de variables
	private int codSoli,codigoOfico;
	private String codOfi,asuntoOfi,nomSecre,mens,fechaOfi;;


	public String getFechaOfi() {
		return fechaOfi;
	}
	public void setFechaOfi(String fechaOfi) {
		this.fechaOfi = fechaOfi;
	}
	public int getCodigoOfico() {
		return codigoOfico;
	}
	public void setCodigoOfico(int codigoOfico) {
		this.codigoOfico = codigoOfico;
	}
	
	
	public String getMens() {
		return mens;
	}
	public void setMens(String mens) {
		this.mens = mens;
	}
	//M�todos get and set
	public int getCodSoli() {
		return codSoli;
	}
	public void setCodSoli(int codSoli) {
		this.codSoli = codSoli;
	}

	public String getCodOfi() {
		return codOfi;
	}
	public void setCodOfi(String codOfi) {
		this.codOfi = codOfi;
	}
	public String getAsuntoOfi() {
		return asuntoOfi;
	}
	public void setAsuntoOfi(String asuntoOfi) {
		this.asuntoOfi = asuntoOfi;
	}
	public String getNomSecre() {
		return nomSecre;
	}
	public void setNomSecre(String nomSecre) {
		this.nomSecre = nomSecre;
	}



	
}
