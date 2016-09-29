class NotificationMailer < ApplicationMailer
	
	def calendar_change_email(params)
		@params = params
		mail(to: "jamessherriff@warwickshire.gov.uk", subject: "Calendar change")
	end
end
