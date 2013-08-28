ActionMailer::Base.smtp_settings = {
 
:address =>"smtp.gmail.com",
 
:port =>587,
 
:domain =>"gmail.com",
 
:user_name =>"yenkhtn",      # only username enough
 
:password =>"yenkhung",                   # Enter your mail_id password
 
:authentication =>"plain",
 
:enable_starttls_auto =>true
 
}