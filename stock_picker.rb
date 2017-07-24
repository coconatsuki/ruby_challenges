class Stock_picker

  def initialize(array)
    @array = array
    @profits_array = []
    @result = nil
  end

  def compare
      @array.map.with_index do |e1, i|
        @array.map.with_index do |e2, ind|
          if i > ind
            @profits_array << [[e1 - e2], [ind, i]]
          end
        end
      end
      sort
  end

  def sort
    @result = @profits_array.max_by do |a|
      a[0][0]
    end
    p @result[1]
  end


end

stock_picker = Stock_picker.new([17,3,6,9,15,8,6,1,10])

stock_picker.compare
