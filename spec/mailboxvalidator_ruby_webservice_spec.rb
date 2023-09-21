require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "MailboxvalidatorRuby" do
  it "work correctly with invalid api key" do
    if $api_key == 'YOUR_API_KEY'
      mbv = MailboxValidator::MBV.new()
      mbv.apikey = $api_key
      mbv.query_single('example@example.com')
      expect(mbv.result.error.error_message).to eq 'API key not found.'
    end
  end

  it "work correctly with api key exists" do
    if $api_key == 'YOUR_API_KEY'
      print "/*
* You could enter a MailboxValidator API Key in spec/spec_helper.rb
* for real web service calling test.
* 
* You could sign up for a free API key at https://www.mailboxvalidator.com/plans#api
* if you do not have one.
*/"
      expect($api_key).to eq 'YOUR_API_KEY'
    else
      expect($api_key).to_not eq 'YOUR_API_KEY'
    end
  end

  it "work correctly with validate email" do
    mbv = MailboxValidator::MBV.new()
    mbv.apikey = $api_key
    mbv.query_single('example@example.com')
    if $api_key == 'YOUR_API_KEY'
      expect(mbv.result.error.error_code).to eq 10001
    else
      expect(mbv.result.status).to eq false
    end
  end

  it "work correctly with disposable email" do
    mbv = MailboxValidator::MBV.new()
    mbv.apikey = $api_key
    mbv.disposable_email('example@example.com')
    if $api_key == 'YOUR_API_KEY'
      expect(mbv.result.error.error_code).to eq 10001
    else
      expect(mbv.result.is_disposable).to eq false
    end
  end

  it "work correctly with free email" do
    mbv = MailboxValidator::MBV.new()
    mbv.apikey = $api_key
    mbv.free_email('example@example.com')
    if $api_key == 'YOUR_API_KEY'
      expect(mbv.result.error.error_code).to eq 10001
    else
      expect(mbv.result.is_free).to eq false
    end
  end

end
