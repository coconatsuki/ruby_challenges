class Rebuild_enumerable_methods

  def my_each(array)
    for element in array
      yield(element)
    end
  end

  def my_each_with_index(array)
    array.length.times do |i|
      yield(array, i)
    end
  end

  def my_select(array)
    new_array = []
    self.my_each(array) do |element|
      new_array << element if yield(element)
    end
    p new_array
  end

  def my_all?(array)
    result = nil
    self.my_each(array) do |element|
      if !yield(element)
        result = false
        break
      else
        result = true
      end
    end
    p result
  end

  def my_any?(array)
    result = nil
    self.my_each(array) do |element|
      if yield(element)
        result = true
        break
      else
        result = false
      end
    end
    p result
  end

  def my_none?(array)
    result = nil
    self.my_each(array) do |element|
      if yield(element)
        result = false
        break
      else
        result = true
      end
    end
    p result
  end

  def my_count(array)
    count = 0
    self.my_each(array) do |element|
      count += 1
    end
    p count
  end

  def my_map(array, proc=nil, &block)
    new_array = []
    object_to_call = proc || block
      self.my_each(array) do |element|
        new_array << object_to_call.call(element)
      end
      p new_array
  end

  def my_inject(array)
    result = array.first
    self.my_each(array) do |element|
      result = yield(result, element) unless element == array.first
    end
    puts result
  end

  def multiply_els(array)
    self.my_inject(array) { |res, el| res * el }
  end

end

rebuild = Rebuild_enumerable_methods.new

rebuild.my_each([1,2,3,4,5,6]) { |el| el }

rebuild.my_each_with_index([1,2,3,4,5,6]) { |array, ind| print "\nindex #{ind} => element #{array[ind]} " }

rebuild.my_select([1,2,3,4,5,6]) {|element| element < 4}

rebuild.my_all?([1,2,3,4,5,6]) {|element| element > 0}

rebuild.my_any?([1,2,3,4,5,6]) {|element| element > 6}

rebuild.my_none?([1,2,3,4,5,6]) {|element| element > 6}

rebuild.my_count([1,2,3,4,5,6])

my_map_proc = Proc.new {|el| el * 6}

rebuild.my_map([1,2,3,4,5,6], my_map_proc)

rebuild.my_inject([1,2,3,4,5,6]) { |res, el| res + el }

rebuild.multiply_els([1,2,3,4,5,6])
