require 'marky_markov'
module NojBot
  class Wisdom
    @@markov = MarkyMarkov::TemporaryDictionary.new 3
    @@markov.parse_file "noj.txt"

    def self.words_of_wisdom
      @@markov.generate_2_sentences
    end

  end
end
