class Bubble_sort

  def first_method(array)
      @array = array
      iteration = @array.length - 1
      iteration.times do
        @array.map.with_index do |num, i|
            if num != @array.length
              compare = @array[i] <=> @array[i+1]
              @array[i], @array[i+1] = @array[i+1], @array[i] if compare == 1
            end
          end
        end
        print @array
  end

  def second_method(array, &block)
    @array = array
    iteration = @array.length - 1
    iteration.times do
      @array.map.with_index do |num, i|
          if num != @array.length
            compare = block.call(@array[i], @array[i + 1])
            @array[i], @array[i+1] = @array[i+1], @array[i] if compare >= 1
          end
        end
      end
      print @array
  end
end


bubble_sort = Bubble_sort.new

bubble_sort.first_method([4,3,78,2,0,2])

bubble_sort.second_method(["hi","hello","hey"]) do |left, right|
  left.length - right.length
end
