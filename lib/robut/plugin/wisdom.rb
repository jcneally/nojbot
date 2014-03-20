require 'nojbot/wisdom'

class Robut::Plugin::Wisdom
  include Robut::Plugin

  desc "words of wisdom?/input?/what do you think?/thoughts? - be enlightened by nojbots profound thoughts."

  match /(words of wisdom)|(input)|(what do you think)|(thoughts)/, :sent_to_me => true do
    reply(NojBot::Wisdom.words_of_wisdom)
  end
end
