module Codings
  module Caesar
    ##
    # Encrypts the given text using a given or random modifier.
    #
    # @!attribute [r] text
    #  @return [String]
    #
    # @!attribute [r] modifier
    #  @return [Fixnum]
    #
    class Encrypter
      attr_accessor :text, :modifier

      ##
      # @param [String] text
      # @param [Fixnum] modifier
      #
      def initialize(text, modifier = nil)
        @text     = text
        @modifier = modifier ? modifier : random_modifier
      end

      ##
      # Generates a random modifier.
      #
      # @return [Fixnum]
      #
      def random_modifier
        rand 0..25
      end

      ##
      # Encrypts the given text.
      #
      # @return [String]
      #
      def encrypt_text
        encrypted = []

        text.each_char do |char|
          if /\W/.match(char)
            encrypted << " "
          else
            encrypted << alter_char(char)
          end
        end

        encrypted.join
      end

      ##
      # Adjusts the letter with the modifier key.
      #
      # @param [String] char
      # @param [String]
      #
      def alter_char(char)
        char_key = ALPHABET.index(char)
        new_key  = alter_char_key(char_key)
        new_char = ALHPABET[new_key]
      end

      ##
      # Adds the character number with the modifier key.
      #
      # @param [Fixnum] char
      # @param [Fixnum]
      #
      def alter_char_key(char)
        (char + modifier) % ALPHABET.length
      end
    end # Encrypter
  end # Ceasar
end # Codings
