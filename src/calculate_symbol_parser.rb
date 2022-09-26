class CalculateSymbolParser
  def initialize(symbol)
    # TODO 引数のバリデーション
    @parse_target = symbol
  end

  def parse
    parsed_array = []
    consecutive_number = ""
    next_operator = ""

    @parse_target.each_char do |char|
      if is_number(char)
        consecutive_number << char
      else
        unless consecutive_number.empty?
          parsed_array.append(consecutive_number.to_i)
          consecutive_number = ""
        end
        next_operator = char
      end
    end

    unless consecutive_number.empty?
      parsed_array.append(consecutive_number.to_i)
      consecutive_number = ""
    end

    parsed_array.append(next_operator)

    parsed_array
  end

  private

  @parse_target = ""

  def is_number(char)
    !!(char =~ /^[0-9]+$/)
  end
end
