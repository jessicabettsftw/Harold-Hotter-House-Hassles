# ________________
# readHouse
# ________________
#Reading data about spells from houseData.rb file to create House objects and store in DB
def readHouse
  houseData = nil
  #returns array of hashes
  File.open("db/seedFiles/houseData.rb") do |file|
    houseData = eval(file.read)
  end
  #create house objects & save to DB
  houseData.each do |house|
    House.create(house)
  end
end

# ________________
# readSpells
# ________________
#Reading data about spells from spellData.rb file to create Spells objects and store in DB
def readSpells
  spellData = nil
  #returns array of hashes
  File.open("db/seedFiles/spellData.rb") do |file|
    spellData = eval(file.read)
  end
  #create spell objects & save to DB
  spellData.each do |spell|
    Spell.create(spell)
  end
end

readHouse
readSpells
