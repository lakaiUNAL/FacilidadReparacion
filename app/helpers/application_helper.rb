module ApplicationHelper
	def get_notifications
		if flash.any?
			flash
		else 
			nil
		end
	end
end
