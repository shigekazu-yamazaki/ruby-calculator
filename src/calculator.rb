require "./src/calculate_symbol_parser"
require "./src/reverse_polish_calculator"

# 計算式の優先順位はサポートしない
# ()はサポートしない
# -1+1 のように先頭に符号が付くケースをサポートする
# 小数の計算に対応する
if __FILE__ == $0
  csp = CalculateSymbolParser.new("2-1")
  calculator = ReversePolishCalculator.new(csp.parse)
  puts calculator.calculation
end
