n = 1
while n <= 5
  puts "* " * n
  n += 1
end


#* 
#* * 
#* * * 
#* * * * 
#* * * * * 

n = 1
while n <= 5
  puts ("* " * n).rjust(10)
  n += 1
end

#        * 
#      * * 
#    * * * 
#  * * * * 
#* * * * * 