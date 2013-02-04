module Codings
  class Ceasar
    ALPHABET = %w(a b c d e f g h i j k l m n o p q r s t u v w x y z)

    attr_accessor :mod_key

    def initialize(mod_key)
      @mod_key = mod_key
    end

    def decrypt(encrypted_text)
      letter = most_common_letter(encrypted_text)
      change_text(encrypted_text, true)
    end

    def encrypt(text)
      change_text(text, false)
    end

    def change_text(text, decrypt)
      new_text = []
      text.each_char do |char|
        if /\W/.match(char)
          new_text << " "
        else
          new_text << change_letter(char, true)
        end
      end
      new_text.join
    end

    def change_letter(letter, decrypt)
      letter_number = ALPHABET.index(letter)
      new_letter_number = change_number(letter_number, decrypt)
      new_letter = ALPHABET[new_letter_number]
    end

    def change_number(letter_number, decrypt)
      if decrypt == true
        return (letter_number + @mod_key) % ALPHABET.length
      elsif decrypt == false
        return (letter_number + (0 - @mod_key)) % ALPHABET.length
      end
    end

    def most_common_letter(text)
      letters = {}
      previous_letter = 0
      count = 0
      text.each_char do |char|
        if /\W/.match(char)
          count += 1
          unless previous_letter == char
            letters[previous_letter] = count
            previous_letter = char
            count = 0
          end
        end
      end
      letters.sort{|a,b| a[1] <=> b[1]}.last
    end
  end
end
