class ReversePolishCalculator

  def initialize(expression)
    @calculation_target = expression
  end

  def calculation
    stack = []

    @calculation_target.each do |token|
      case token
      when Integer
        stack.push(token)
      when "+"
        a = stack.pop
        b = stack.pop
        stack.push(a + b)
      when "-"
        a = stack.pop
        b = stack.pop
        stack.push(b - a)
      when "*"
        a = stack.pop
        b = stack.pop
        stack.push(a * b)
      when "/"
        a = stack.pop
        b = stack.pop
        stack.push(b / a)
      else
        # TODO 上記以外は受け付けない
      end
    end
    stack.pop
  end
end
