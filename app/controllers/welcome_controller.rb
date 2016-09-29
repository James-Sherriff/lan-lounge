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
    @calendar = service.get_calendar(calendar_id)
		uri = URI.parse("https://www.googleapis.com/calendar/v3/calendars/primary/events/watch")
		params = {'id' => 'lan-lounge-watch', 'address'=>'https://lan-lounge.herokuapp.com/calendar_change'}
		headers = {'authorization' => current_user.access_token}

		http = Net::HTTP.new(uri.host, uri.port)
		response = http.post(uri.path, params.to_json, headers)
		output = response.body
		puts output
  end
  
  def calendar_change
    puts "Recieved calendar change"
  end
end
