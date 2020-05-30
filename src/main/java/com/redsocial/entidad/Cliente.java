package com.redsocial.entidad;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;


@Entity
@Table(name = "cliente")
public class Cliente {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "codcliente")
	private int codCliente;
	
	@Column(name = "nomCliente")
	private String nomCliente;
	
	@Column(name = "apeCliente")
	private String apeCliente;
	
	@Column(name = "dniCliente")
	private String dniCliente;
	
	@Column(name = "fecnac")
	private Date fecnac;
	
	@ManyToOne
	@JoinColumn(name ="codtipo")
	private Tipo tipo;
	
	
	public int getCodCliente() {
		return codCliente;
	}
	public void setCodCliente(int codCliente) {
		this.codCliente = codCliente;
	}
	public String getNomCliente() {
		return nomCliente;
	}
	public void setNomCliente(String nomCliente) {
		this.nomCliente = nomCliente;
	}
	public String getApeCliente() {
		return apeCliente;
	}
	public void setApeCliente(String apeCliente) {
		this.apeCliente = apeCliente;
	}
	public String getDniCliente() {
		return dniCliente;
	}
	public void setDniCliente(String dniCliente) {
		this.dniCliente = dniCliente;
	}
	public Date getFecnac() {
		return fecnac;
	}
	public void setFecnac(Date fecnac) {
		this.fecnac = fecnac;
	}
	public Tipo getTipo() {
		return tipo;
	}
	public void setTipo(Tipo tipo) {
		this.tipo = tipo;
	}
	

}
