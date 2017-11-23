$ document
	.on "turbolinks:load", () ->
  	$ ".bnr-slide"
  		.owlCarousel {
  			items: 0.5,
  			navText: ['','']
  			}