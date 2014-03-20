class Robut::Plugin::Doge
  include Robut::Plugin

  desc "doge/wow <such _> <much _> <wow> - create a doge meme."

  match /^doge(.*$)/, :sent_to_me => true do |msg|
    reply(doge(msg))
  end

  match /(^wow.*$)/, :sent_to_me => true do |msg|
    reply(doge(msg))
  end

  def doge(message)
    message.strip!
    if message.start_with? "doge"
      message = message[4..-1]
      message.strip!
    end
    message.gsub!("such", "/such")
    message.gsub!("so", "/so")
    message.gsub!("much", "/much")
    message.gsub!("very", "/very")
    message.gsub!("wow", "/wow")
    message.gsub!(/\s|,|\.|;|:|\?|!|@/, '')
    message = "/" + message if message[0] != '/'
    return "http://dogr.io#{message}.png"
  end
end
