require 'rpg/character'
require 'rpg/combat'
require 'rpg/dice'
require 'rpg/version'

module RPG
  @debug = false
  
  def self.debug
    @debug
  end
  
  def self.debug= newmode
    @debug = newmode
  end
end