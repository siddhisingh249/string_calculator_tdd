class Calculator
  def self.add_numbers(input)
    return 0 if input.empty?
    numbers = extract_numbers(input)
    raise_on_negatives(numbers)
    numbers.sum
  end

  private

  def self.extract_numbers(input)
    raise StandardError, "invalid input" if input.end_with?(",\n")
    delimiter, numbers_string = input.start_with?("//") ? [input[2], input.split("\n", 2).last] : [/[\n,]/, input]
    numbers_string.split(delimiter).map(&:to_i)
  end

  def self.raise_on_negatives(numbers)
    negatives = numbers.select(&:negative?)
    raise StandardError, "negative numbers not allowed: #{negatives.join(', ')}" if negatives.any?
  end
end
