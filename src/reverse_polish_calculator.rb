class ReversePolishCalculator

  def initialize(expression)
    # TODO 引数のバリデーション
    @calculate_target_stack = []
    expression.each do |el|
      @calculate_target_stack.push(el)
    end
  end

  def calculation
    left = @calculate_target_stack[0].to_i
    right = @calculate_target_stack[1].to_i
    operator = @calculate_target_stack[2]

    ans = 0
    case operator
    when "+"
      ans = left + right
    when "-"
      ans = left - right
    when "*"
      ans = left * right
    when "/"
      ans = left / right
    else
      # TODO 上記以外は受け付けない
    end

    ans
  end
end
