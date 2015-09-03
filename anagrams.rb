require 'benchmark'
def first_anagram(str1, str2)
  possible_anagrams = string_permutations(str1)
  possible_anagrams.include?(str2)
end

def string_permutations(str)
  return [str] if str.length == 1
  str_copy = str.dup
  el = str_copy.slice!(0)
  subs = string_permutations(str_copy)
  permutations = []
  subs.each do |substr|
    (substr.length + 1).times do |idx|
      permutations << substr.dup.insert(idx, el)
    end
  end
  permutations.uniq
end

def second_anagram(str1, str2)
  str1.chars.each do |letter1|
    str2.chars.each do |letter2|
      if letter1 == letter2
        str1.delete! letter1
        str2.delete! letter2
      end

    end
  end
  str1 == "" && str2 == ""
end

def third_anagram(str1, str2)
  str1.chars.sort == str2.chars.sort
end

def fourth_anagram(str1, str2)
  str1_hash = Hash.new(0)
  str2_hash = Hash.new(0)
  str1.each_char do |letter|
    str1_hash[letter] += 1
  end
  str2.each_char {|letter| str2_hash[letter] += 1}

  str1_hash == str2_hash
end


if __FILE__ == $PROGRAM_NAME
  # puts Benchmark.measure {first_anagram(('a'...'k').to_a.shuffle.join, ('a'...'k').to_a.shuffle.join)}
  # puts Benchmark.measure {second_anagram(('a'...'z'*4).to_a.shuffle.join, ('a'...'z'*4).to_a.shuffle.join)}
  puts Benchmark.measure {third_anagram(('a'...'z'*4).to_a.shuffle.join, ('a'...'z'*4).to_a.shuffle.join)}
  puts Benchmark.measure {fourth_anagram(('a'...'z'*4).to_a.shuffle.join, ('a'...'z'*4).to_a.shuffle.join)}
end
