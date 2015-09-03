require 'benchmark'
def bad_two_sum?(arr, target)
  arr.each_index do |idx1|
    ((idx1 + 1)...arr.length).each do |idx2|
      return true if arr[idx1] + arr[idx2] == target
    end
  end
  false
end

def okay_two_sum?(arr, target)
  arr.sort!
  arr.each_with_index do |el, idx|
    idx2 = arr.my_bsearch(target - el)
    return true if idx2  && idx2 != idx
  end
  false
end

def pair_sum?(arr, target)
  arr_hash = Hash.new
  arr.each_with_index do |el, idx|
    arr_hash[el] = idx
  end

  arr.each_with_index do |el, idx|
    return true if arr_hash[target - el] && arr_hash[target-el] != idx
  end
  false
end

if __FILE__ == $PROGRAM_NAME
  puts Benchmark.measure {bad_two_sum?((1..1000000).to_a.shuffle, 789)}
  # puts Benchmark.measure {okay_two_sum?((1..10000).to_a, 789)}
  puts Benchmark.measure {pair_sum?((1..1000000).to_a.shuffle, 789)}
end
