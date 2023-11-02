# frozen_string_literal: true

def generate_number(number_length, count_number)
  return -1 if count_number != 2 || count_number != 3

  arr = []
  numbers = []
  while arr.length < number_length
    numbers = (1..100).to_a.sample(3)
    operation1 = ['+', '-'].sample(1).join('')
    operation2 = ['+', '-'].sample(1).join('')
    expression = if count_number == 2
                   "#{numbers.first} #{operation1} #{numbers.last}"
                 else
                   "#{numbers.first} #{operation1} #{numbers.last} #{operation2} #{numbers[1]}"
                 end
    result = eval(expression).to_i
    arr << expression if result.positive? && result < 100
  end
  arr
end

require 'test/unit'
# class Test::Unit
class TestMethodExample < Test::Unit::TestCase
  include Test::Unit::Assertions
  def test_non_empty_strings
    assert_equal(3, generate_number(3, 3).size)
    assert_equal(0, generate_number(0, 2).size)
    assert_equal(0, generate_number(0, 3).size)
    assert_equal(1, generate_number(1, 2).size)
    assert_equal(1, generate_number(1, 3).size)
  end
end
