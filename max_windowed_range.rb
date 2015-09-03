
def max_windowed_range(array, window_size)
  current_max_range = nil
  queue = StackQueue.new
  window_size.times { |idx| queue.enqueue(array[idx]) }
  current_max_range = queue.max - queue.min
  (array.length - window_size).times do |idx|
    queue.dequeue
    queue.enqueue(array[idx + window_size])
    current_range = queue.max - queue.min
    current_max_range = current_range if current_range > current_max_range
  end
  current_max_range
end

class MyStack
  def initialize
    @store = []
  end

  def pop
    last = @store.last[0]
    @store = @store[0...-1]
    last
  end

  def empty?
    @store.empty?
  end

  def push(el)
    if peek
      max = @store.last[1]
      max = el if el > max
      min = @store.last[2]
      min = el if el < min
    else
      max = el
      min = el
    end
    @store += [[el, max, min]]
  end

  def peek
    @store.last ? @store.last[0] : nil
  end

  def size
    @store.length
  end

  def max
    if peek
      @store.last[1]
    else
      nil
    end
  end

  def min
    if peek
      @store.last[2]
    else
      nil
    end
  end
end


class StackQueue
  def initialize
    @in = MyStack.new
    @out = MyStack.new
  end

  def enqueue(el)
    @in.push(el)
  end

  def transfer_stacks
    if @out.empty?
      until @in.empty?
        @out.push(@in.pop)
      end
    end
  end

  def dequeue
    transfer_stacks
    @out.pop
  end

  def peek
    transfer_stacks
    @out.peek
  end

  def size
    @in.size + @out.size
  end

  def max
    if @in.empty?
      return @out.max
    elsif @out.empty?
      return @in.max
    else
      @in.max > @out.max ? @in.max : @out.max
    end
  end

  def min
    if @in.empty?
      return @out.min
    elsif @out.empty?
      return @in.min
    else
      @in.min < @out.min ? @in.min : @out.min
    end

  end
end
