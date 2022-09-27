require "rspec"
require "./src/text_parser"

RSpec.describe TextParser do
  it("Should create instance") do
    csp = TextParser.new("1+1")
    expect(csp.instance_of?(TextParser)).to eq true
  end

  it("Should success parse") do
    csp = TextParser.new("1+2")
    symbols = csp.parse

    expect(symbols.instance_of?(Array)).to eq true
    expect(symbols.length).to eq 3
    expect(symbols[0].instance_of?(Integer)).to eq true
    expect(symbols[0]).to eq 1
    expect(symbols[1].instance_of?(Integer)).to eq true
    expect(symbols[1]).to eq 2
    expect(symbols[2].instance_of?(String)).to eq true
    expect(symbols[2]).to eq "+"
  end

  it("Should return true when argument is number") do
    expect(TextParser.new("1+1").send(:is_number, "1")).to eq true
  end

  it("Should return false when argument is not number") do
    expect(TextParser.new("1+1").send(:is_number, "A")).to eq false
  end
end
