class NotificationMailer < ApplicationMailer
	default from: "postmaster@sandbox2bce1d2550dd4a858452a68a5269f473.mailgun.org"
	
	def calendar_change_email(params)
		@params = params
		mail(to: "jamessherriff@warwickshire.gov.uk", subject: "Calendar change")
	end
end
