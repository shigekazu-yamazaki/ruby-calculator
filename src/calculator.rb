require "./src/text_parser"
require "./src/reverse_polish_calculator"

# 計算式の優先順位はサポートしない
# ()はサポートしない
# -1+1 のように先頭に符号が付くケースをサポートする
# 小数の計算に対応する
if __FILE__ == $0
  # text = ARGV[0]
  text = "2-1"
  text_parser = TextParser.new(text)
  calculator = ReversePolishCalculator.new(text_parser.parse)
  puts calculator.calculation
end
