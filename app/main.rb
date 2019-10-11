require_relative '../lib/phone_number'

class Main
  def initialize
    @number = "";
    @words = []
  end

  def take_input_number
    puts "Please Enter the phone number"
    @number = gets.strip

    if @number.empty?
      print_empty_message
    elsif @number.include?('0') || @number.include?('1')
      print_number_not_valid_message
    elsif !@number.scan(/\D/).empty?
      print_invalid_char_message
    else
      print_loading_message
      time_start = Time.now()

      @words = PhoneNumber.new(@number).words_combination
      puts @words.inspect

      time_end = Time.now()
      puts "\nTime Taken: #{time_end.to_f - time_start.to_f}"
    end
  end

  def print_empty_message
    puts "Number can't be empty."
  end

  def print_invalid_char_message
    puts "Invalid characters present in the input."
  end

  def print_number_not_valid_message
    puts "Not a valid number. (Number should not conain '0' or '1')"
  end

  def print_loading_message
    puts "Generating words from #{@number}, Please wait."
  end
  
end


Main.new.take_input_number unless ENV['TESTING']