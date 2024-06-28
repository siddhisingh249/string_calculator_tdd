# TDD without monkey patch for calculator_spec.rb
require 'calculator.rb'

RSpec.describe Calculator do
  describe '.add_numbers' do
    context 'when the input is an empty string' do
      it 'returns 0' do
        expect(Calculator.add_numbers("")).to eq(0)
      end
    end

    context 'when the input contains a single number' do
      it 'returns the number itself' do
        expect(Calculator.add_numbers("1")).to eq(1)
      end
    end

    context 'when the input contains multiple numbers separated by commas' do
      it 'returns the sum of the numbers' do
        expect(Calculator.add_numbers("1,5,6")).to eq(12)
      end
    end

    context 'when the input contains negative numbers' do
      it 'raises an exception with a message listing the negative numbers' do
        expect { Calculator.add_numbers("1,-2,3,-4") }.to raise_error(StandardError, "negative numbers not allowed: -2, -4")
      end
    end

    context 'when the input contains a custom delimiter' do
      it 'returns the sum of the numbers in the string' do
        expect(Calculator.add_numbers("//;\n1;2;3")).to eq(6)
      end
    end

    context 'when the input contains numbers separated by spaces' do
      it 'returns the sum of the numbers' do
        expect(Calculator.add_numbers("1, 5")).to eq(6)
      end
    end

    context 'when the input contains a newline at the end' do
      it 'raises an exception with an invalid input message' do
        expect { Calculator.add_numbers("1,\n") }.to raise_error(StandardError, "invalid input")
      end
    end
  end
end
