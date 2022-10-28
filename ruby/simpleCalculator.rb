class SimpleCalculator
  class UnsupportedOperation < StandardError; end
  ALLOWED_OPERATIONS = ['+', '/', '*'].freeze
  def self.calculate(first_operand, second_operand, operation)
    raise SimpleCalculator::UnsupportedOperation unless ALLOWED_OPERATIONS.include?(operation)
    raise ArgumentError unless first_operand.instance_of?(Integer) && second_operand.instance_of?(Integer)
    result = case operation
      when '+'
        first_operand. + second_operand
      when '*'
        first_operand * second_operand
      when '/'
        first_operand / second_operand   rescue return "Division by zero is not allowed."
    end
    "#{first_operand} #{operation} #{second_operand} = #{result}"
  end
end
