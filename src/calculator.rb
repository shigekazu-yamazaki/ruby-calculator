require "./src/calculate_symbol_parser"
require "./src/reverse_polish_calculator"

# TODO RSpec 追加してガシガシ内容変更してく
if __FILE__ == $0
  # TODO コマンドライン引数のエラー制御

  csp = CalculateSymbolParser.new(ARGV[0])
  calculator = ReversePolishCalculator.new(csp.parse)
  puts calculator.calculation
end
