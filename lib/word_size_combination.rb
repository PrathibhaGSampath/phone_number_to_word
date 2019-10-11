class WordSizeCombination
  #10 digit Phone number    
  MAX_SIZE = 10
  attr_accessor :mini_size

  def initialize(mini_size)
   # minimum word length = 3
   self.mini_size = mini_size
   @word_length = mini_size
  end

  # generating the number combination for the length
  def get_size_combinations
    final_combination = Set.new

    while @word_length <= MAX_SIZE 
      combinations = []
      combinations.push(@word_length)
      remaining_length = MAX_SIZE - @word_length
      
      while remaining_length > 0 
        if remaining_length >= mini_size
          combinations.push(mini_size)
          remaining_length = remaining_length - mini_size
        else
          # If remianing legth is less than min_size add the reamining to the last.
          combinations[-1] = combinations[-1] + remaining_length
          remaining_length = 0
        end
      end

	  final_combination << combinations
	  max_rotation = combinations.length
		
	  # rotating the combinations to generate all possible combination
      # eg: [3, 3, 4], [3, 4, 3] & [4, 3, 3].
	  1.upto(max_rotation) { combinations = combinations.rotate
							   final_combination << combinations
	  						 }
		
      @word_length = @word_length + 1
    end

    return final_combination.to_a 
  end
  
end