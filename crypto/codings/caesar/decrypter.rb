module Codings
  module Caesar
    ##
    # Decrypts Ceasar code.
    #
    # @!attribute [r] modifier
    #  @return [Fixnum]
    #
    # @!attribute [r] text
    #  @return [String]
    #
    class Decrypter
      attr_accessor :modifier, :text

      ##
      # @param [String] text
      #
      def initialize(text)
        @text = text
      end

      ##
      # Decrypts the given text.
      #
      # @return [String]
      #
      def decrypt
        letter = most_common_letter
        decrypt_text(text)
      end

      ##
      # Finds the most common letter in the given text.
      #
      # @return [String] letter
      #
      def most_common_letter
        letters         = {}
        previous_letter = 0
        counter         = 0

        text.each_char do |char|
          if /\W/.match(char)
            count += 1
            unless previous_letter == char
              letters[previous_letter] = count
              previous_letter          = char
              count                    = 0
            end
          end
        end

        letters.sort{|a,b| a[1] <=> b[1]}.last
      end

      ##
      # Decrypts the given text.
      #
      # @return [String]
      #
      def decrypt_text
        decrypted = []

        text.each_char do |char|
          if /\W/.match(char)
            decrypted << " "
          else
            decrypted << alter_char(char)
          end
        end

        decrypted.join
      end

      ##
      # Adjusts the letter with the modifier key.
      #
      # @param [String] char
      # @return [String]
      #
      def alter_char(char)
        char_key = ALPHABET.index(char)
        new_key  = alter_char_key(char_key)
        new_char = ALPHABET[new_key]
      end

      ##
      # Adds the character number with the modifier key.
      #
      # @param [Fixnum] char
      # @param [Fixnum]
      #
      def alter_char_key(char)
        char + mod_key % ALPHABET.length
      end
    end # Decrypter
  end # Ceasar
end # Codings
