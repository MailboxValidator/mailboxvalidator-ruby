Gem::Specification.new do |s|
  s.name        = 'mailboxvalidator_ruby'
  s.version     = '2.0.0'
  s.required_ruby_version = '>= 2.0.0'
  s.summary     = "MailboxValidator API wrapper"
  s.description = "Enable users to block disposal email, detect free email and validate if an email is valid"
  s.author      = "MailboxValidator"
  s.email       = 'support@mailboxvalidator'
  s.files       = ["lib/mailboxvalidator_ruby.rb","spec/mailboxvalidator_ruby_webservice_spec.rb","spec/spec_helper.rb","README.rdoc"]
  s.homepage    = 'https://www.mailboxvalidator.com/ruby'
  s.license     = 'MIT'
end
