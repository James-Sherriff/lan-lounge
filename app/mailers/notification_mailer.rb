class NotificationMailer < ApplicationMailer
	
	def calendar_change_email(params)
		@params = params
    mg_client = Mailgun::Client.new ENV['action_gun_key']
    message_params = {:from => "postmaster@sandbox2bce1d2550dd4a858452a68a5269f473.mailgun.org", :to => "jamessherriff@warwickshire.gov.uk", :subject => "Calendar change", :text => "Your calendar has changed"}
		mg_client.send_message "lan-lounge.herokuapp.com", message_params
	end
end
