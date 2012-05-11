module RPG
  class Character
    attr_accessor :stats, :initiative
    
    def initialize initials = {}
      @stats = Hash.new.merge(initials)
      generate
    end
  
    def level_up increase = {}
      @stats.merge(increase)
    end
  
    def take_dmg dmg, opts = {}
      if @stats[:immunities].include?(opts[:type])
        0
      else
        total_dmg = dmg - ( @stats[:resistences].keys.include?(opts[:type]) ? @stats[:resistences][opts[:type]] : 0 )
        total_dmg = 0 if total_dmg < 0
        @stats[:hp] -= total_dmg
        total_dmg
      end
    end
  
    def roll_init
      RPG::Dice.roll "1d20"
    end
  
  private
    def generate
      [:maxhp, :hp, :atk, :def, :dmg, :immunities, :resistences].each do |s|
        if @stats[s].nil?
          @stats[s] = case s
          when :maxhp, :hp
            10
          when :atk
            1
          when :def
            10
          when :dmg
            2
          when :immunities
            []
          when :resistences
            {}
          end
        end
      end
    
      
    end
  end
end