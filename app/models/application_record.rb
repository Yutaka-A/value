class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  
  
  
  
  
# require 'rpg_level'

# rpg_level = RpgLevel.new

# # Define EXP Table by formula
# #
# #   Lv1 = 0
# #   Lv2 = 4
# #   Lv3 = 6  (Total = 10)
# #   Lv4 = 8  (Total = 18)
# #   Lv5 = 10 (Total = 28)
# #
# rpg_level.define_exp_table(5) {|data| data[:level] * 2}

# # Obtain 12 experience points
# # It also means that leveling up at the same time
# rpg_level.obtain_exp(12)

# # Get current level
# p(rpg_level.level)  # => 3

# # Get more information
# p(rpg_level.level_status)  # => {:level=>3, :next_necessary_exp=>8, :lacking_exp_for_next=>6, :obtained_exp_for_next=>2}
  
  
end
