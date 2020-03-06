require "pry"

def game_hash 
  hash = {
                                
   :away => {:team_name => "Charlotte Hornets", 
    :colors => ["Turquoise", "Purple"], 
    :players => [{:player_name => 
                    "Jeff Adrien",
                    :number => 4, 
                    :shoe => 18, 
                    :points => 10, 
                    :rebounds => 1, 
                    :assists => 1, 
                    :steals => 2, 
                    :blocks => 7, 
                    :slam_dunks => 2}, 
                {:player_name => "Bismack Biyombo",
                    :number => 0, 
                    :shoe => 16, 
                    :points => 12, 
                    :rebounds => 4, 
                    :assists => 7, 
                    :steals => 22, 
                    :blocks => 15, 
                    :slam_dunks => 10 },
                {:player_name => "DeSagna Diop",
                    :number => 2, 
                    :shoe => 14, 
                    :points => 24, 
                    :rebounds => 12, 
                    :assists => 12, 
                    :steals => 4, 
                    :blocks => 5, 
                    :slam_dunks => 5 },
                {:player_name =>"Ben Gordon",
                    :number => 8, 
                    :shoe => 15, 
                    :points => 33, 
                    :rebounds => 3, 
                    :assists => 2, 
                    :steals => 1, 
                    :blocks => 1, 
                    :slam_dunks => 0},
                {:player_name => "Kemba Walker",
                    :number => 33, 
                    :shoe => 15, 
                    :points => 6, 
                    :rebounds => 12, 
                    :assists => 12, 
                    :steals => 7, 
                    :blocks => 5, 
                    :slam_dunks => 12}]},

  
    :home => {
            :team_name => "Brooklyn Nets", 
            :colors => ["Black", "White"],  
            :players => 
                          [{:player_name => 
                          "Alan Anderson",
                            :number => 0, 
                            :shoe => 16, 
                            :points => 22, 
                            :rebounds => 12, 
                            :assists => 12, 
                            :steals => 3, 
                            :blocks => 1, 
                            :slam_dunks => 1}, 
                         {:player_name => "Reggie Evans",
                            :number => 30, 
                            :shoe => 14, 
                            :points => 12, 
                            :rebounds => 12, 
                            :assists => 12, 
                            :steals => 12, 
                            :blocks => 12, 
                            :slam_dunks => 7 },
                         {:player_name =>"Brook Lopez",
                            :number => 11, 
                            :shoe => 17, 
                            :points => 17, 
                            :rebounds => 19, 
                            :assists => 10, 
                            :steals => 3, 
                            :blocks => 1, 
                            :slam_dunks => 15 },
                        {:player_name => "Mason Plumlee",
                            :number => 1, 
                            :shoe => 19, 
                            :points => 26, 
                            :rebounds => 11, 
                            :assists => 6, 
                            :steals => 3, 
                            :blocks => 8, 
                            :slam_dunks => 5 },
                         {:player_name =>"Jason Terry",
                            :number => 31, 
                            :shoe => 15, 
                            :points => 19, 
                            :rebounds => 2, 
                            :assists => 2, 
                            :steals => 4, 
                            :blocks => 11, 
                            :slam_dunks => 1}]}}

end

require "pry"


def num_points_scored(player_lookup)
  hash = game_hash
  hash.each do |location, team|
  team.each do |attribute, data|
    if attribute == :players
    data.each do |player|
      if player[:player_name] == player_lookup
        return player[:points]
      end
  end
end
end
end
end

def shoe_size(input)
  hash = game_hash
  hash.each do |location, team|
  team.each do |attribute, data|
    if attribute == :players
    data.each do |player|
      if player[:player_name] == input
        return player[:shoe]
      end
  end
end
end
end
end

def team_colors(input)
  hash = game_hash
  hash.each do |location, team|
  if team[:team_name] == input
    return team[:colors]
    end
  end
end

def team_names
  hash = game_hash
  hash.map do |location, team|
    team[:team_name]
  end
end

def player_numbers(input)
num = []
hash = game_hash
hash.each do |location, team|
  if team[:team_name] == input
    team.each do |details, data|
      if details == :players
        data.each do |name|
          num.push(name[:number])
end
end
end
end
end
return num
end

def player_stats(input)
new_hash = Hash.new

game_hash.each do |location, team|
  team.each do |details, data|
    if details == :players
      data.each do |names|
        if names[:player_name] == input
    new_hash = names.delete_if do |a, b|
    a == :player_name
          end
        end
      end
    end
end
end
return new_hash
end

def big_shoe_rebounds
shoe = 0
rbnds = 0
game_hash.each do |location, team|
  team[:players].each do |player|
    if player[:shoe] > shoe
      shoe = player[:shoe]
      rbnds = player[:rebounds]
    end
  end
  end
  return rbnds
end