ActionMailer::Base.smtp_settings = {  
  :address   => "smtp.mailgun.org",
  :port      => 587,
  :user_name => ENV['username'],
  :password  => ENV['password']

}