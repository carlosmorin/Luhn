class Luhn
  def initialize(number)
    @number = number
  end

  def self.valid?(num)
    new(num).valid?
  end

  def valid?
    return if valid_number_format?
    puts "Checksum: #{checksum % 10 == 0}" 
    checksum % 10 == 0
  end

  private

  def valid_number_format?
    number_characters || number_length
  end

  def number_characters
    @number.count('0123456789') != @number.gsub(/ /, "").size
  end

  def number_length
    digits.size <= 1
  end

  def checksum
    total = 0
    digits.reverse.each_with_index do |digit, index|
      total += get_value(digit, index)
    end
    total
  end

  def get_value(number, index)
    value = index.odd? ? duplicate(number) : number
  end

  def duplicate(digit)
    digit * 2 > 9 ? 2 * digit - 9 : digit * 2
  end

  def digits
    @number.gsub(/ /, "").split('').map(&:to_i)
  end
end

 Luhn.valid?("055a 444 285")