module FunWithStrings
  def palindrome?
    string = self.downcase
    string.gsub!(/\W+/,'')
    string == string.reverse
  end
  
  def count_words
    frequency = Hash.new
    string = self.gsub(/[^a-zA-Z]/, '').downcase
    words = string.split
    words.each do |token|
      if words.key?(token)
        frequency[token] += 1
      else 
        frequency[token] = 1
      end
    end
    frequency
  end
  
  def anagram_groups
    self.split.group_by{|word| word.each_char.sort}.values
  end
end

# make all the above functions available as instance methods on Strings:

class String
  include FunWithStrings
end
