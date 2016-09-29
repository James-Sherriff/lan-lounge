class WelcomeController < ApplicationController
  require 'google/apis/calendar_v3'
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
  end
  
end
