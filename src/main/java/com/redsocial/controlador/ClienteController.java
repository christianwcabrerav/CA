package com.redsocial.controlador;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.redsocial.entidad.Cliente;

import com.redsocial.entidad.Tipo;
import com.redsocial.servicio.ClienteServicio;

import com.redsocial.servicio.TipoServicio;

@Controller
public class ClienteController {

	@Autowired
	private ClienteServicio clienteServicio;
	
	@Autowired
	private TipoServicio tipoServicio;
	
	
	
	
	
	
	
	
	/*nuevos metodos */
	
	@RequestMapping("/verCliente")
	public String ver2() {
		return "registraCliente";
	}
	
	@RequestMapping("/cargaTipo")
	@ResponseBody
	public List<Tipo> listaTipo() {
		return tipoServicio.listaTipo();
	}
	
		
	@RequestMapping("/registraCliente")
	public String metRegistra(Cliente obj,HttpSession session) {
		Cliente aux = clienteServicio.insertaCliente(obj);
		if(aux == null) {
			session.setAttribute("MENSAJE", "Registro erróneo");
		}else {
			session.setAttribute("MENSAJE", "Registro exitos");
		}
		return "redirect:verCliente";
	}


	
	
}
