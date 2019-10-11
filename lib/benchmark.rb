require 'benchmark'
require_relative 'phone_number'

phone_number = PhoneNumber.new("6686787825")

puts "Overall Excecution time"
puts time = Benchmark.measure {
	puts phone_number.words_combination
}

