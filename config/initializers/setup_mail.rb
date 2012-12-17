ActionMailer::Base.perform_deliveries = true
ActionMailer::Base.raise_delivery_errors = true

ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
:address => "smtp.gmail.com",
:port => 587,
:domain => "localhost",
:user_name => "dennistel90@gmail.com",
:password => "dennis1234",
:authentication => "plain",
:enable_starttls_auto => true
}