
#array of hashes
# File.open("db/seedFiles/houseData.rb") do |file|
#   houseData = eval(file.read)
# end

File.open("db/seedFiles/houseData.rb").each_with_index do |file, index|
  puts file
  puts index
end


#array of hashes
spellData = File.open("db/seedFiles/spellData.rb")


#hash with values as array
wandData = File.open("db/seedFiles/wandData.rb")


#hash with values as array
familiarData = File.open("db/seedFiles/familiarData.rb")
