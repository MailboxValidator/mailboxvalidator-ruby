require "mailboxvalidator_ruby"

apikey = "MY_API_KEY"
email = "example@example.com"

mbv = MailboxValidator::MBV.new()
mbv.apikey = apikey
mbv.query_single(email)

if mbv.error != nil
	puts "Error: #{mbv.error}"
elsif mbv.result != nil
	puts "email_address: #{mbv.result.email_address}"
	puts "domain: #{mbv.result.domain}"
	puts "is_free: #{mbv.result.is_free}"
	puts "is_syntax: #{mbv.result.is_syntax}"
	puts "is_domain: #{mbv.result.is_domain}"
	puts "is_smtp: #{mbv.result.is_smtp}"
	puts "is_verified: #{mbv.result.is_verified}"
	puts "is_server_down: #{mbv.result.is_server_down}"
	puts "is_greylisted: #{mbv.result.is_greylisted}"
	puts "is_disposable: #{mbv.result.is_disposable}"
	puts "is_suppressed: #{mbv.result.is_suppressed}"
	puts "is_role: #{mbv.result.is_role}"
	puts "is_high_risk: #{mbv.result.is_high_risk}"
	puts "status: #{mbv.result.status}"
	puts "credits_available: #{mbv.result.credits_available}"
	puts "error_code: #{mbv.result.error_code}"
	puts "error_message: #{mbv.result.error_message}"
end