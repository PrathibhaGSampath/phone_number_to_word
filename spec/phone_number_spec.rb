require_relative '../lib/phone_number.rb'

describe "PhoneNumber" do

  it ".letter_mapping_for_number should return letter mapping arrays" do
    search_object = PhoneNumber.new("2345678922")

    expect(search_object.send :letter_mapping_for_number).to eq [["a", "b", "c"], ["d", "e", "f"], ["g", "h", "i"], ["j", "k", "l"], ["m", "n", "o"], ["p", "q", "r", "s"], ["t", "u", "v"], ["w", "x", "y", "z"], ["a", "b", "c"], ["a", "b", "c"]]
  end

  it ".find_valid_words should return all valid words from dictionary" do
    search_object = PhoneNumber.new("2")
    words = ["motor", "usual", "truck"]

    expect(search_object.send :find_valid_words, words).to eq words
  end

  it ".find_valid_words should return only valid words from dictionary" do
    search_object = PhoneNumber.new("2")
    words = ["motor", "usual", "xyzjjj"]

    expect(search_object.send :find_valid_words, words).to eq ["motor", "usual"]
  end

  it ".generate should find combination words for '2282668687'" do
    search_object = PhoneNumber.new("2282668687")
    combination_words = search_object.words_combination
    expected_result = ["act,boo,tots", "act,boo,tour", "act,con,tots", "act,con,tour", "act,coo,tots", 
                        "act,coo,tour", "bat,boo,tots", "bat,boo,tour", "bat,con,tots", "bat,con,tour", 
                        "bat,coo,tots", "bat,coo,tour", "cat,boo,tots", "cat,boo,tour", "cat,con,tots", 
                        "cat,con,tour", "cat,coo,tots", "cat,coo,tour", "act,boot,mus", "act,boot,nus", 
                        "act,boot,our", "act,coot,mus", "act,coot,nus", "act,coot,our", "bat,boot,mus", 
                        "bat,boot,nus", "bat,boot,our", "bat,coot,mus", "bat,coot,nus", "bat,coot,our", 
                        "cat,boot,mus", "cat,boot,nus", "cat,boot,our", "cat,coot,mus", "cat,coot,nus", 
                        "cat,coot,our", "acta,mot,mus", "acta,mot,nus", "acta,mot,our", "acta,not,mus", 
                        "acta,not,nus", "acta,not,our", "acta,oot,mus", "acta,oot,nus", "acta,oot,our", 
                        "acta,mounts", "act,amounts", "act,contour", "bat,amounts", "bat,contour", 
                        "cat,amounts", "cat,contour", "catamounts"]

    expect(combination_words - expected_result | expected_result - combination_words).to eq []
  end

  it ".generate should find combination words for '6686787825'" do
    search_object = PhoneNumber.new("6686787825")
    combination_words = search_object.words_combination
    expected_result = ["mot,opt,puck", "mot,opt,ruck", "mot,opt,suck", "mot,ort,puck", "mot,ort,ruck", 
                        "mot,ort,suck", "not,opt,puck", "not,opt,ruck", "not,opt,suck", "not,ort,puck", 
                        "not,ort,ruck", "not,ort,suck", "oot,opt,puck", "oot,opt,ruck", "oot,opt,suck", 
                        "oot,ort,puck", "oot,ort,ruck", "oot,ort,suck", "mot,opts,taj", "mot,opus,taj", 
                        "mot,orts,taj", "not,opts,taj", "not,opus,taj", "not,orts,taj", "oot,opts,taj", 
                        "oot,opus,taj", "oot,orts,taj", "noun,pup,taj", "noun,pur,taj", "noun,pus,taj", 
                        "noun,sup,taj", "noun,suq,taj", "onto,pup,taj", "onto,pur,taj", "onto,pus,taj", 
                        "onto,sup,taj", "onto,suq,taj", "motor,truck", "motor,usual", "nouns,truck", 
                        "nouns,usual", "noun,struck", "onto,struck", "motortruck"]

    expect(combination_words - expected_result | expected_result - combination_words).to eq []
  end

end
