class Character
  attr_access :stats, :initiative
  @stats = {}
  
  def initialize initials = {}
    @stats.merge(initials)
    generate
  end
  
  def level_up increase = {}
    @stats.merge(increase)
  end
  
  def take_dmg dmg, opts = {}
    @stats[:hp] -= dmg unless @stats[:immunities].contains(opts[:type])
  end
  
  def roll_init
    
  end
  
private
  def generate
    [:maxhp, :hp, :atk, :dmg, :immunities].each do |s|
      if @stats[s].nil?
        @stats[s] = case s
        when :maxhp, :hp
          10
        when :atk
          10
        when :dmg
          2
        when :immunities
          {}
        end
      end
    end
  end
end