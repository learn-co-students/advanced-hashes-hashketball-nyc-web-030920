def num_points_scored(player_name)
  array = [] 
  i = 0 
  while i < 5 do 
    if game_hash[:home][:players][i][:player_name] = "#{player_name}"
      array << game_hash[:home][:players][i][:points]
    elsif game_hash[:away][:players][i][:player_name] = "#{player_name}"
      array << game_hash[:away][:players][i][:points]
    else 
      puts "Sorry, that player name not found."
    end 
    i += 1 
  end 
  array[0]    
end

def num_points_scored(player_name)
  array = [] 
  i = 0 
  while i < 5 do 
    if game_hash[:home][:players][i][:player_name] = "#{player_name}"
      array << game_hash[:home][:players][i][:points]
    elsif game_hash[:away][:players][i][:player_name] = "#{player_name}"
      array << game_hash[:away][:players][i][:points]
    else 
      puts "Sorry, that player name not found."
    end 
    i += 1 
  end 
  array[0]    
end