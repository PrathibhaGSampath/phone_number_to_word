require_relative 'dictionary'
require_relative 'word_size_combination'

class PhoneNumber
	NUMBER_LETTER_MAP = {
						 2 => ["a","b", "c"], 
						 3 => ["d","e", "f"], 
						 4 => ["g","h", "i"],
						 5 => ["j","k", "l"], 
						 6 => ["m","n", "o"], 
						 7 => ["p","q", "r", "s"], 
						 8 => ["t","u", "v"], 
						 9 => ["w","x", "y", "z"]
						}

	def initialize(number)
		@number = number
		@dictionary = Dictionary.new
		@combination_words = []
		@letters_combination = letter_mapping_for_number
	end

	def words_combination
		words_size_combinations = WordSizeCombination.new(3).get_size_combinations

		words_size_combinations.each do |combination|
			words = []
			start_index = 0

			combination.each do |word_length|
				end_index = start_index + word_length
				letters = @letters_combination[start_index...end_index]
				start_index = end_index
				split_word_combinations = letters.shift.product(*letters).map(&:join)
				valid_words = find_valid_words(split_word_combinations)
				if valid_words.length == 0
					words = []
					break  
				end
				words << valid_words
			end
			@combination_words << words unless words.empty?
		end
		return format_to_the_required_output
	end


private
	def letter_mapping_for_number
		@letters_combination =  @number.chars.map { |key| NUMBER_LETTER_MAP["#{key}".to_i] }
	end

	def find_valid_words(word_combinations)
		word_combinations = word_combinations.group_by{|word| word[0].upcase}
		words = @dictionary.find_words(word_combinations)
	end

	def format_to_the_required_output
	    final_combination_words = []

	    @combination_words.each do |combination|
	      combination.shift.product(*combination).each do |combi|
	        final_combination_words << combi.join(",")
	      end      
	    end
	    final_combination_words
	end
end