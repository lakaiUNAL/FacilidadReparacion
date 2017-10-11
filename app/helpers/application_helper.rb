module ApplicationHelper
	def get_notifications
		debugger
		if flash.any?
			flash
		else 
			nil
		end
	end
end
