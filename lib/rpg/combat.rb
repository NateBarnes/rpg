module RPG
  class Combat
    @actionorder = []
    @env = {}
    
    def initialize combatants = []
      roll_initiative combatants
    end
    
    def act action, target
      
    end
    
  private
    def roll_initiative chars
      chars.each do |c|
        c.roll_init
      end
    end
  end
end