class NotificationMailer < ApplicationMailer
	require 'mailgun'
	def calendar_change_email(params)
		@params = params
    mg_client = Mailgun::Client.new "key-58f9a358ddb5394fcb0dcccf0fe450a3"
    message_params = {:from => "postmaster@sandbox2bce1d2550dd4a858452a68a5269f473.mailgun.org", :to => "jamessherriff@warwickshire.gov.uk", :subject => "Calendar change", :text => "Your calendar has changed"}
		mg_client.send_message "smtp.mailgun.org", message_params
	end
end
