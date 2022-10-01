require "rspec"
require "./src/reverse_polish_calculator"

RSpec.describe ReversePolishCalculator do
  it("Should create instance") do
    reverse_polish_calculator = ReversePolishCalculator.new([1, 1, "+"])
    expect(reverse_polish_calculator.instance_of?(ReversePolishCalculator)).to eq true
  end

  it("Should success calculate") do
    expect(ReversePolishCalculator.new([1, 2, "+"]).calculation).to eq 3
    expect(ReversePolishCalculator.new([1, 2, "-"]).calculation).to eq(-1)
    expect(ReversePolishCalculator.new([2, 2, "*"]).calculation).to eq 4
    expect(ReversePolishCalculator.new([4, 2, 3, "*", "+"]).calculation).to eq 10
    expect(ReversePolishCalculator.new([10, 2, "/"]).calculation).to eq 5
  end

  it("Should success calculate if token is includes signed number") do
    expect(ReversePolishCalculator.new([-1, -2, "+"]).calculation).to eq(-3)
  end

  it("Should success calculate if token is includes decimal point") do
    expect(ReversePolishCalculator.new([0.1, 0.2, "+"]).calculation).to eq 0.3
  end

  it("Should fail calculate") do
    expect {
      ReversePolishCalculator.new([10, 2, "#"]).calculation
    }.to raise_error(StandardError, "Unexpected token: #")
  end

end
