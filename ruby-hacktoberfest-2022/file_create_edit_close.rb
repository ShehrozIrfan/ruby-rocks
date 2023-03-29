# This is a file handling (create, writing, and closing) program using Ruby

=begin 
First we will create a file which is assigned to a variable.
This file will be created and added to the current project directory that this program is in
=end

fileObject = File.new('newFile.txt', 'w+')

# Next we are going to write to the file
fileObject.syswrite('This is sample text being written to the newly created file.')

# Finally we will close the file that we created and wrote to
fileObject.close
