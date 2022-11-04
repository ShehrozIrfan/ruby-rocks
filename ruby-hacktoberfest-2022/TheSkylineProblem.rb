# Leetcode-218.
# @param {Integer[][]} buildings
# @return {Integer[][]}
def get_skyline(buildings)
  result = [{x: -1, h: 0}]
  heights = [0]
  
  points = []
  buildings.each do |l, r, h|
    points << [l, h]
    points << [r, -h]
  end

  points.sort.each do |x, h|
    if h > 0
      heights << h
    elsif h < 0
      heights.slice!(heights.index(-h))
    end

    max_height = heights.max
    
    if result.last[:h] == max_height
      next
    elsif result.last[:x] == x
      result.pop
      next if result.last[:h] == h
    end

    result << {x: x, h: max_height}
  end

  result.shift
  result.map{|hash| [hash[:x], hash[:h]]}
end
