class Robut::Plugin::Hug
  include Robut::Plugin

  desc "hug - receive a virtual hug from nojbot."

  match /(^|\W)hugs?(\W|$)/i, :sent_to_me => true do
    reply("https://dl.dropboxusercontent.com/u/9921601/virtual-hug.gif")
  end
end
