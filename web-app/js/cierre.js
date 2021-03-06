$(document).ready(function() {
	
	 $("#fechaCierre").datepicker(
				{dateFormat: 'dd/mm/yy',
				 showButtonPanel: true,
				 changeMonth: true,
			     changeYear: true});
	
	
	$("#generar").click( function() {
		
		if($("#fechaCierre").valid()){		
			this.disabled = true
			generarCierre();
		}
	});
	
	validar();		
	progressCierre()	
});

function validar(){
	$("#formPadre").validate({
		
		ignore: [],
		
        rules: {
        	fechaCierre: {required:true,validateDate:true,dateToday:true,checkCierre:true}  
        },
		messages: {
			fechaCierre : {required:"Requerido"}
		}
  });
}


function generarCierre(){
	
	progressValue()
	
	var request = $.ajax({
		type:'POST',		
		url: url + '/generarCierrre',
		async:true,
		data:{				
			fechaCierre:$('#fechaCierre').val()
		},
		dataType:"json"	        
	});
	
	request.done(function(data) {
	});
} 

function progressValue(){
	
	var progressbar = $("#progressbar"), progressLabel = $(".progress-label");
	
	var timer = $.timer(function() {
		 $.getJSON( url + "/consultarValue",{})
			.done(function( json ) {
				//alert(json.value)
				var val = progressbar.progressbar("value") || 0;
				console.log("Value " + parseInt(json.value))
				progressbar.progressbar("value", parseInt(json.value));
				if (val == 100) {
					timer.stop()
				}
				 
			})

	 });

	timer.set({ time : 1000, autostart : true });
	
}

function progressCierre() {
	
	var progressbar = $("#progressbar"), progressLabel = $(".progress-label");
	
	progressbar.progressbar({
		value : false,
		change : function() {
			progressLabel.text(progressbar.progressbar("value") + "%");
		},
		complete : function() {
			progressLabel.text("Cierre Finalizado!");
			$("#generar").prop('disabled', false)
		}
	});
	
}