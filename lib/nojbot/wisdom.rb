require 'marky_markov'
module NojBot
  class Wisdom
    @@markov = MarkyMarkov::TemporaryDictionary.new
    @@markov.parse_file File.join(File.dirname(__FILE__), "..", "..", "hamlet.txt")

    def self.words_of_wisdom
      @@markov.generate_2_sentences
    end

  end
end
