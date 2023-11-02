# frozen_string_literal: true

def generate_number(_length, _number)
  arr = []
  numbers = []
  while arr.length < _length
    numbers = (1..100).to_a.sample(3)
    operation1 = ['+', '-'].sample(1).join('')
    operation2 = ['+', '-'].sample(1).join('')
    expression = _number == 2 ? "#{numbers.first} #{operation1} #{numbers.last}" : "#{numbers.first} #{operation1} #{numbers.last} #{operation2} #{numbers[1]}"
    result = eval(expression).to_i
    arr << expression if result.positive? && result < 100
  end
  arr
end
p generate_number(2, 3)
