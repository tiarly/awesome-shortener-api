# frozen_string_literal: true

class TokenGenerator
  include Service

  LOWER_ALPHABET = %w[a b c d e f g h i j k l m n o p q r s t u v w x y z].freeze
  UPCASE_ALPHABET = %w[A B C D E F G H I J K L M N O P Q R S T U V W X Y Z].freeze
  NUMBERS = %w[0 1 2 3 4 5 6 7 8 9].freeze

  MAX_TOKEN_LENGTH = 8

  def call
    alphanumeric_list = (LOWER_ALPHABET + UPCASE_ALPHABET + NUMBERS)

    alphanumeric_list.sample(MAX_TOKEN_LENGTH).join
  end
end
