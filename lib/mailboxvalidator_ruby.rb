#!/usr/bin/ruby
require 'cgi'
require 'net/http'
require 'json'
require 'ostruct'

module MailboxValidator
	class MBV
		attr_accessor :apikey
		attr_reader :result, :error
		
		def initialize(apikey = "")
			@apikey = apikey
			@error = nil
		end
		
		def query_single(email)
			@email = CGI.escape(email)
			uri = URI("https://api.mailboxvalidator.com/v1/validation/single?key=#{@apikey}&email=#{@email}")
			
			begin
				Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
					request = Net::HTTP::Get.new uri
					response = http.request request
					
					if response.code == "200"
						@result = JSON.parse(response.body, object_class: OpenStruct)
						@error = nil
					else
						@error = "#{response.code} - #{response.message}"
						@result = nil
					end
				end
			rescue Exception => e
				@error = e.message
				@result = nil
			end
		end
	end
end
