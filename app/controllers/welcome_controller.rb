class WelcomeController < ApplicationController
  require 'google/apis/calendar_v3'
	require 'uri'
	require 'net/http'
  def index
    auth = request.env['omniauth.auth']
  end
  
  def view_calendar
    service = Google::Apis::CalendarV3::CalendarService.new
    service.client_options.application_name = "lan-lounge"
    service.authorization = current_user.access_token
    
    calendar_id = 'primary'
    puts service.methods(true).to_s
    @response = service.list_events(calendar_id,max_results: 10,
                               single_events: true,
                               order_by: 'startTime',
                               time_min: Time.now.iso8601)
    @calendar = service.get_calendar(calendar_id)
		
		channel = Google::Apis::CalendarV3::Channel.new(address: "https://lan-lounge.herokuapp.com/calendar_change",id: "lan-lounge-channel", type: "web_hook")
		webhook = service.watch_event('primary', channel, single_events: true, time_min: Time.now.iso8601)
  end
  
  def calendar_change
		logger.fatal "Calendar Change"
    NotificationMailer.calendar_change_email(@params).deliver_later
  end
end
