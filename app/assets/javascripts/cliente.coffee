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