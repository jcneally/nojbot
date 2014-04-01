require 'marky_markov'
module NojBot
  class Wisdom
    @@markov = MarkyMarkov::TemporaryDictionary.new 3
    @@markov.parse_file "noj.txt"

    def self.words_of_wisdom
      thoughts = @@markov.generate_2_sentences
      # To prevent ops from getting pinged and causing unnecessary heart attacks
      thoughts.gsub!(/@JajaB/i, ":JajaB")
      thoughts.gsub!(/@juan/i, ":juan")
      thoughts.gsub!(/@TBear/i, ":TBear")
      thoughts.gsub!(/@LV/i, ":LV")
      thoughts.gsub!(/@all/i, ":all")
      thoughts
    end

  end
end
