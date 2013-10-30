package mx.gob.inr.farmacia

import mx.gob.inr.utils.Partida;
import mx.gob.inr.utils.domain.Articulo;

class ArticuloFarmacia extends Articulo {

	Partida partida
	
	static mapping = {
		id column:'cve_art'
		version false		
		table 'articulo'
		partida column:'partida'
		cache true
	}
	
}