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

# ________________
# readWand
# ________________
#Reading data about wands from wandData.rb file to create Wood and Core objects and store in DB
def readWand
  wandData = nil
  #returns array of hashes
  File.open("db/seedFiles/wandData.rb") do |file|
    wandData = eval(file.read)
  end
  #create wand objects & save to DB
  wandData.each do |k, v|
    if k == :Cores
      v.each do |core|
        Core.create(material: core)
      end
    elsif k == :Wood
      v.each do |wood|
        Wood.create(name: wood)
      end
    end
  end
end

# ________________
# readFamiliar
# ________________
#Reading data about familiars from familiarData.rb file to create Familiar objects and store in DB
def readFamiliar
  familiarData = nil
  #returns array of hashes
  File.open("db/seedFiles/familiarData.rb") do |file|
    familiarData = eval(file.read)
  end
  #create familiar objects & save to DB
  familiarData.each do |k, v|
    v.each do |species|
      Familiar.create(species: species)
    end
  end
end

readHouse
readSpells
readWand
readFamiliar
