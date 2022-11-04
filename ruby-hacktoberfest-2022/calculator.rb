def is_number? expr
  return false if expr.nil?
  expr = "#{expr}"              
  expr.match /^(\d+|\d+\.\d+)$/ # since match() is defined only for strings
end

def calc(expr)  
  return expr.to_i if is_number? expr
  expr.gsub!(" ","") # clean the string from whitespaces
  # pay attention to the order: + and - should come before * and /
  # can you figure out why ?
  arr = expr.split /\+/
  return arr.inject(0){|x,y| calc(x) + calc(y) } if arr.size > 1
  arr = expr.split /\-/  
  return arr.inject(0){|x,y| calc(x) - calc(y) } if arr.size > 1
  arr = expr.split /\*/
  return arr.inject(1){|x,y| calc(x) * calc(y) } if arr.size > 1
  arr = expr.split /\//
  return arr.inject   {|x,y| calc(x) / calc(y) } if arr.size > 1
end
