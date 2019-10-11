require 'set'
class Dictionary

	def initialize
		@words = Hash.new.tap {|hash| ("A".."Z").each{|alphabet| hash[alphabet] = Set.new}}
		group_dictionary_words
	end

	def find_words(word_combinations)
		valid_words = []
		word_combinations.each do |alphabet, words|
			words.each do |word|
				if @words[alphabet].include? word.upcase
					valid_words << word
				end
			end
		end
		return valid_words
	end

	private 
	def group_dictionary_words
		file = File.open("dictionary.txt")
		file_data = file.readlines.map(&:chomp)
		file.close
		file_data.group_by {|word| word[0].upcase }.map {|k, v| @words[k] = v.to_set }
	end
end