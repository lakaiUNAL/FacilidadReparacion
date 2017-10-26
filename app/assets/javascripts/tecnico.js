$(document).ready(function(){
	/**
	 * Modificar el fomrulario donde el tecnico agrega servicios
	 * En vez de e listado lo cambia por un campo para crear un servicio inexistente
	 */
	$("#crear-servicio").on( "click", function (e){
		e.preventDefault();
		$("#crear-servicio").fadeOut();

		$("#new_service_form").fadeIn()
	});
});