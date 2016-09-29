class NotificationMailer < ApplicationMailer
	require 'mailgun_rails'
	def calendar_change_email(params)
		@params = params
    mail({ :from => "postmaster@sandbox2bce1d2550dd4a858452a68a5269f473.mailgun.org", :to => "jamessherriff@warwickshire.gov.uk", :subject => "Calendar update", :text => "Calendar updates"})
	end
end
