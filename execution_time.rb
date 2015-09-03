require 'Benchmark'
def my_min(list)
  min = list.first
  list.each do |el|
    min = el if el < min
  end
end

def largest_contiguous_subsum(list)
  sub_arrays = []
  list.each_index do |idx1|
    (idx1...list.length).each do |idx2|
      sub_arrays << list[idx1..idx2]
    end
  end

  sub_arrays.map! do |arr|
    arr.inject(:+)
  end

  max = sub_arrays.first
  sub_arrays.each do |el|
    max = el if el > max
  end
  max
end

def new_lcs(list)
  contiguous_sum = 0
  greatest_sum = 0
  list.each do |el|
    contiguous_sum += el
    greatest_sum = contiguous_sum if contiguous_sum > greatest_sum
    contiguous_sum = 0 if contiguous_sum < 0
  end
  greatest_sum
end

if __FILE__ == $PROGRAM_NAME
  # puts Benchmark.measure {first_anagram(('a'...'k').to_a.shuffle.join, ('a'...'k').to_a.shuffle.join)}
  # puts Benchmark.measure {second_anagram(('a'...'z'*4).to_a.shuffle.join, ('a'...'z'*4).to_a.shuffle.join)}
  puts Benchmark.measure {largest_contiguous_subsum((1...10000).to_a.shuffle)}
  puts Benchmark.measure {new_lcs((1...10000).to_a.shuffle)}
end
