class TextParser
  def initialize(symbol)
    @parse_target = symbol
  end

  def parse
    token_array = []
    consecutive_number = ""

    @parse_target.each_char do |char|
      if is_number(char)
        consecutive_number << char
      else
        unless consecutive_number.empty?
          token_array.append(consecutive_number.to_i)
          consecutive_number = ""
        end
        token_array.append(char)
      end
    end

    unless consecutive_number.empty?
      token_array.append(consecutive_number.to_i)
    end

    parsed_array = []
    i = 0
    while i < token_array.size
      # TODO 質問: 前回は kind_of? を使ったが、is_a? だと良くない？
      if token_array[i].is_a?(Integer)
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
    !!(char =~ /^[0-9]+$/)
  end
end
