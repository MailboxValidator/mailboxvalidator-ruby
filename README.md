MailboxValidator Ruby Module
============================

This Ruby module provides an easy way to call the MailboxValidator API which validates if an email address is a valid one.

This module can be used in many types of projects such as:

 - validating a user's email during sign up
 - cleaning your mailing list prior to an email marketing campaign
 - a form of fraud check

Installation
============

To install this module type the following:

   gem install mailboxvalidator-ruby

Dependencies
============

An API key is required for this module to function.

Go to http://www.mailboxvalidator.com/plans#api to sign up for a FREE API plan and you'll be given an API key.

Usage
=====

```ruby
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
	puts "is_catchall: #{mbv.result.is_catchall}"
	puts "mailboxvalidator_score: #{mbv.result.mailboxvalidator_score}"
	puts "time_taken: #{mbv.result.time_taken}"
	puts "status: #{mbv.result.status}"
	puts "credits_available: #{mbv.result.credits_available}"
	puts "error_code: #{mbv.result.error_code}"
	puts "error_message: #{mbv.result.error_message}"
end
```

Functions
=========

### new

Creates a new instance of the MailboxValidator object.

### query_single

Performs email validation on the supplied email address.

Result Fields
=============

### email_address

The input email address.

### domain

The domain of the email address.

### is_free

Whether the email address is from a free email provider like Gmail or Hotmail.
Return values: True, False

### is_syntax

Whether the email address is syntactically correct.
Return values: True, False

### is_domain

Whether the email address has a valid MX record in its DNS entries.
Return values: True, False, -  (- means not applicable)

### is_smtp

Whether the mail servers specified in the MX records are responding to connections.
Return values: True, False, -  (- means not applicable)

### is_verified

Whether the mail server confirms that the email address actually exist.
Return values: True, False, -  (- means not applicable)

### is_server_down

Whether the mail server is currently down or unresponsive.
Return values: True, False, -  (- means not applicable)

### is_greylisted

Whether the mail server employs greylisting where an email has to be sent a second time at a later time.
Return values: True, False, -  (- means not applicable)

### is_disposable

Whether the email address is a temporary one from a disposable email provider.
Return values: True, False, -  (- means not applicable)

### is_suppressed

Whether the email address is in our blacklist.
Return values: True, False, -  (- means not applicable)

### is_role

Whether the email address is a role-based email address like admin@example.net or webmaster@example.net.
Return values: True, False, -  (- means not applicable)

### is_high_risk

Whether the email address contains high risk keywords.
Return values: True, False, -  (- means not applicable)

### is_catchall

Whether the email address is a catch-all address.
Return values: True, False, Unknown, -  (- means not applicable)

### mailboxvalidator_score

Email address reputation score. Score > 0.70 means good; score > 0.40 means fair; score <= 0.40 means poor.

### time_taken

The time taken to get the results in seconds.

### status

Whether our system think the email address is valid based on all the previous fields.
Return values: True, False

### credits_available

The number of credits left to perform validations.

### error_code

The error code if there is any error. See error table below.

### error_message

The error message if there is any error. See error table below.

Errors
======

| error_code | error_message |
| ---------- | ------------- |
| 100 | Missing parameter. |
| 101 | API key not found. |
| 102 | API key disabled. |
| 103 | API key expired. |
| 104 | Insufficient credits. |
| 105 | Unknown error. |

Copyright
=========

Copyright (C) 2017 by MailboxValidator.com, support@mailboxvalidator.com
