  ActionMailer::Base.smtp_settings = {  
    :address              => "smtp.gmail.com",       
    :port                 => 587,                         
    :user_name            => "empoweredreentryadvice@gmail.com",  # ENV['YAHOO_ADDR']
    :password             => "passWORD",       # ENV['YAHOO_PWD']
    :authentication       => "plain",  
    :enable_starttls_auto => true  
  }