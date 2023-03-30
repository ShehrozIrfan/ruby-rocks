# This is a file handling (create, writing, and closing) program using Ruby

def fileHandling
  puts 'Please write the name of the file you want to create. Make sure and add the filetype at the end (e.g. .txt, .rb): '
  name = gets.chomp.to_s
  puts 'Please write what you are wanting to put into the file: '
  toWrite = gets.chomp.to_s
  # First we will create a file which is assigned to a variable.
  # This file will be created and added to the current project directory that this program is in
  # The name of the file will be what was entered at the first prompt.
  fileObject = File.new(name, 'w+')

  # Next we are going to write to the file
  # The content of the file will be what was input at the second prompt.
  fileObject.syswrite(toWrite)

  # Finally we will close the file that we created and wrote to
  puts "The file you made and wrote to is located in the current directory! It's name is #{name}!"
  fileObject.close

  # Now go and find the file you created, and see how you were able to to create, edit, and close a file with Ruby!
end

fileHandling
