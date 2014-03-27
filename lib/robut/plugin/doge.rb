class Robut::Plugin::Doge
  include Robut::Plugin

  desc "doge/wow text - create a doge meme from 'text'"

  match /^doge(.*$)/i, :sent_to_me => true do |msg|
    reply(doge(msg))
  end

  match /(^wow.*$)/i, :sent_to_me => true do |msg|
    reply(doge(msg))
  end

  def doge(message)
    message.strip!
    message.downcase!
    if message.start_with? "doge"
      message = message[4..-1]
      message = "wow " + message
      message.strip!
    end
    message.gsub!("such", "/such")
    message.gsub!("so", "/so")
    message.gsub!("much", "/much")
    message.gsub!("very", "/very")
    message.gsub!("wow", "/wow")
    message.gsub!("amaze", "/amaze")
    message.gsub!("many", "/many")
    message.gsub!(/,|\.|;|:|\?|!/, '/')
    message.gsub!(/\s|@|_/, '')
    message.squeeze!("/")
    message.chop! if message.end_with? '/'
    return "http://dogr.io#{message}.png"
  end
end
