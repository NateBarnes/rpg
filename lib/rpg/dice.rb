module RPG
  class Dice
    def self.roll dice
      num, dtype, mod, rtype = parse_dice dice
      sum = mod.nil? ? 0 : mod
      rolls = []
      if rtype == :dice
        num.times do 
          rolls << (rand(dtype)+1)
        end
        sum += rolls.inject(:+)
        puts "#{dice} = #{sum} '#{rolls}'"
      elsif rtype == :keep
        num.times do
          rolls << (rand(6)+1)
        end
        rolls.sort! {|x,y| y <=> x }
        kept = []
        dtype.times do |n|
          puts n
          kept << rolls[n]
        end
        sum += kept.inject(:+)
        puts "#{dice} = #{sum} '#{rolls}'"
      end
      return sum
    end
    
  private
    def self.parse_dice dice
      first, mod = dice.split("+")
      if mod.nil?
        first, mod = dice.split("-")
        mod = Integer(mod) * -1 unless mod.nil?
      else
        mod = Integer(mod)
      end
      num, dtype = first.split("d")
      if dtype.nil?
        num, dtype = first.split("k")
        rtype = :keep
      else
        rtype = :dice
      end
      return Integer(num), Integer(dtype), mod, rtype
    end
  end
end