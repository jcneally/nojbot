require 'spec_helper'
require 'nojbot/wisdom'

describe NojBot::Wisdom do
  it "replies with a random sentence" do
    result = NojBot::Wisdom.words_of_wisdom
    result.length.should satisfy { |n| n > 0 }
  end
end
