package mx.gob.inr.farmacia

import java.util.Date;

import javax.annotation.PostConstruct;

import mx.gob.inr.farmacia.ArticuloFarmacia;
import mx.gob.inr.farmacia.CatAreaFarmacia;
import mx.gob.inr.farmacia.EntradaDetalleFarmacia;
import mx.gob.inr.farmacia.SalidaFarmacia;
import mx.gob.inr.farmacia.SalidaDetalleFarmacia;
import mx.gob.inr.utils.AutoCompleteService;
import mx.gob.inr.utils.UtilService;
import mx.gob.inr.utils.domain.Salida;
import mx.gob.inr.utils.services.SalidaService;

class SalidaFarmaciaService extends SalidaService<SalidaFarmacia> {
	
	UtilService utilService
	EntradaFarmaciaService entradaFarmaciaService
	AutoCompleteService autoCompleteService
			
	static transactional = true	
	
	public SalidaFarmaciaService(){
		super(SalidaFarmacia,SalidaDetalleFarmacia, EntradaDetalleFarmacia, ArticuloFarmacia, CatAreaFarmacia,CierreFarmacia)						
	}
	
	@PostConstruct
	public void init(){
		super.utilService = this.utilService
		super.entradaService =  this.entradaFarmaciaService
		super.autoCompleteService = this.autoCompleteService	
	}
}
