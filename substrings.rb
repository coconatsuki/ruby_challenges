dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

class Substring

  def initialize(string, array)
    @string = string.downcase!
    @array = array
    @result = Hash.new(0)
  end

  def scanning
      @array.each do |el|
        if @string.include? el
             @result[el] += @string.scan(el).length
        end
      end
      puts @result
  end

end


substring = Substring.new("Howdy partner, sit down! How's it going?", dictionary)


substring.scanning
