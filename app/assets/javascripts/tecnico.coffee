$ document
	.on "turbolinks:load", () ->
		$ ".informaction-calendar-cliente"
			.popover {
				html: true,
				trigger: "focus",
				placement: "bottom",
				content:  ->
					$ "#contenido"
						.html()
			}

		$ "#crear-servicio"
			.on "click", (e) ->
				e.preventDefault()
				$ "#crear-servicio" 
					.fadeOut()
				$ "#new_service_form"
					.fadeIn()
		return