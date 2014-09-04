require 'twilio-ruby'
require_relative '../../credentials'

class Notification
  attr_accessor :to_number

  def initialize(options = {})
    self.to_number = options[:to_number]
    account_sid = Credentials.credentials[:twilio_account_sid]
    auth_token = Credentials.credentials[:twilio_account_token]
    @client = Twilio::REST::Client.new(account_sid, auth_token)
  end

  def text
    contact = "5712967102"
    notification = @client.account.messages.create(
      :to => "5712967102",
      :from => "+12405473623",
      :body => random_compliment)
  end

  def random_compliment
    compliments = ["Great job!", "You can do it!", "Have a great day!"]
    compliments.sample
  end

end