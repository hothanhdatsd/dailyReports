# frozen_string_literal: true

def job_position
  {
    'tonggiamdoc' => 0,
    'giamdoc' => 1,
    'truongphong' => 2,
    'nhanvienvp' => 3,
    'nhanviensale' => 4
  }
end

def check_position(position)
  hash_position = position.map do |value|
    sorted(value)
  end
  sorted_hash_position = hash_position.sort_by { |hash| hash[:sum] }

  sorted_hash_position.map { |hash| hash.reject { |key| key == :sum } }
end

def sorted(value)
  sorted_positions = value[:positions].sort_by { |pos| job_position[pos] }
  sum = sorted_positions.map { |value_position| job_position[value_position] }.sum
  { id: value[:id], positions: sorted_positions, sum: sum }
end


require 'test/unit'
# class Test::Unit
class TestMethodExample < Test::Unit::TestCase
  include Test::Unit::Assertions
  def test_non_empty_strings
    assert_equal([{ id: 1, positions: %w[truongphong nhanviensale] },
                  { id: 2, positions: %w[tonggiamdoc truongphong nhanviensale] }],
                 check_position([{ id: 1, positions: %w[nhanviensale truongphong] },
                                 { id: 2, positions: %w[truongphong tonggiamdoc nhanviensale] }]))
    assert_equal([{ id: 2, positions: %w[tonggiamdoc giamdoc nhanviensale] },
                  { id: 1, positions: %w[nhanvienvp nhanviensale] }],
                 check_position([{ id: 1, positions: %w[nhanviensale nhanvienvp] },
                                 { id: 2, positions: %w[giamdoc tonggiamdoc nhanviensale] }]))
  end
end
