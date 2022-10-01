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
  # TODO 2-1 の計算結果が 0.1e1　になってしまうのを「1」と表示したい。（結果が小数なら小数表記にもしたい）
  puts calculator.calculation
end
