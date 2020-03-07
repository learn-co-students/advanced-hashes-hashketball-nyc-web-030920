def num_points_scored(player_name)
  game_hash.each do |location, team_data_hash|
    team_data_hash.each do |attribute, data| 
      if attribute == :players 
        data.each do |data_item|
          data_item.each do |player_info|
            if player_info == player_name
              data_item[:points]
              # binding.pry 
            end
          end 
        end
      end 
    end
  end 
  
  #   p num_points_scored("Alan Anderson")
  
#   def team_colors(team_name)
#     game_hash.each do |location, team_data_hash|
#       team_data_hash.each do |attribute, data| 
#       if attribute == :team_name
#         return team_data_hash[:colors]
#         binding.pry 
#       end 
#     end 
#   end 
    
      
#   end 
  
#   p team_colors("Charlotte Hornets")
  
  
# end 