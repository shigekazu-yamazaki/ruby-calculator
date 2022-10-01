class TextParser
  def initialize(symbol)
    @parse_target = symbol
  end

  def parse
    token_array = []
    consecutive_number = ""

    @parse_target.each_char.with_index do |char, index|
      if is_number(char)
        consecutive_number << char
      else
        unless consecutive_number.empty?
          number = consecutive_number.include?(".") ? consecutive_number.to_f : consecutive_number.to_i
          token_array.append(number)
          consecutive_number = ""
        end

        if index > 0 && is_number(@parse_target[index - 1])
          token_array.append(char)
        else
          consecutive_number << char
        end
      end
    end

    unless consecutive_number.empty?
      number = consecutive_number.include?(".") ? consecutive_number.to_f : consecutive_number.to_i
      token_array.append(number)
    end

    parsed_array = []
    i = 0
    while i < token_array.size
      if token_array[i].is_a?(Numeric)
        parsed_array.push(token_array[i])
      else
        parsed_array.push(token_array[i + 1])
        parsed_array.push(token_array[i])
        i += 1
      end
      i += 1
    end
    p parsed_array

    parsed_array
  end

  private

  @parse_target = ""

  def is_number(char)
    !!(char =~ /^[0-9.]+$/)
  end
end
