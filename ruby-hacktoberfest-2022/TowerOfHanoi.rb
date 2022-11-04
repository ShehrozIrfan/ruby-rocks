def tower(disk_numbers, source, auxilary, destination)
  if disk_numbers == 1
    puts "#{source} -> #{destination}"
    return
  end
  tower(disk_numbers - 1, source, destination, auxilary)
  puts "#{source} -> #{destination}"
  tower(disk_numbers - 1, auxilary, source, destination)
  nil
end
