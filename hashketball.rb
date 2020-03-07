def game_hash 
  
  hsh = {
          :home => {:team_name => "Brooklyn Nets",
                    :colors => ["Black", "White"], 
                    :players => [{:player_name => "Alan Anderson",
                                  :number => 0,
                                  :shoe => 16,
                                  :points => 22,
                                  :rebounds => 12,
                                  :assists => 12,
                                  :steals => 3,
                                  :blocks => 1,
                                  :slam_dunks => 1
                                 },
                                 {:player_name => "Reggie Evans",
                                  :number => 30,
                                  :shoe => 14,
                                  :points => 12,
                                  :rebounds => 12,
                                  :assists => 12,
                                  :steals => 12,
                                  :blocks => 12,
                                  :slam_dunks => 7
                                 },
                                 {:player_name => "Brook Lopez",
                                  :number => 11,
                                  :shoe => 17,
                                  :points => 17,
                                  :rebounds => 19,
                                  :assists => 10,
                                  :steals => 3,
                                  :blocks => 1,
                                  :slam_dunks => 15
                                 },
                                 {:player_name => "Mason Plumlee",
                                  :number => 1,
                                  :shoe => 19,
                                  :points => 26,
                                  :rebounds => 11,
                                  :assists => 6,
                                  :steals => 3,
                                  :blocks => 8,
                                  :slam_dunks => 5
                                 },
                                 {:player_name => "Jason Terry",
                                  :number => 31,
                                  :shoe => 15,
                                  :points => 19,
                                  :rebounds => 2,
                                  :assists => 2,
                                  :steals => 4,
                                  :blocks => 11,
                                  :slam_dunks => 1
                                 }
                                ]
                   },
          :away => {
                    :team_name => "Charlotte Hornets",
                    :colors => ["Turquoise, Purple"],
                    :players => [{:player_name => "Jeff Adrien",
                                  :number => 4,
                                  :shoe => 18,
                                  :points => 10,
                                  :rebounds => 1,
                                  :assists => 1,
                                  :steals => 2,
                                  :blocks => 7,
                                  :slam_dunks => 2
                                 },
                                 {:player_name => "Bismack Biyombo",
                                  :number => 0,
                                  :shoe => 16,
                                  :points => 12,
                                  :rebounds => 4,
                                  :assists => 7,
                                  :steals => 22,
                                  :blocks => 15,
                                  :slam_dunks => 10
                                 },
                                 {:player_name => "DeSagna Diop",
                                  :number => 2,
                                  :shoe => 14,
                                  :points => 24,
                                  :rebounds => 12,
                                  :assists => 12,
                                  :steals => 4,
                                  :blocks => 5,
                                  :slam_dunks => 5
                                 },
                                 {:player_name => "Ben Gordon",
                                  :number => 8,
                                  :shoe => 15,
                                  :points => 33,
                                  :rebounds => 3,
                                  :assists => 2,
                                  :steals => 1,
                                  :blocks => 1,
                                  :slam_dunks => 0
                                 },
                                 {:player_name => "Kemba Walker",
                                  :number => 33,
                                  :shoe => 15,
                                  :points => 6,
                                  :rebounds => 12,
                                  :assists => 12,
                                  :steals => 7,
                                  :blocks => 5,
                                  :slam_dunks => 12
                                 }
                                ]
                   }
        }
  hsh
end

def num_points_scored(player) 
  a = 0
  b = 0
  value
  while a < 5 do 
    if game_hash[:home][:players][a][:player_name] == player 
       value = game_hash[:home][:players][a][:points]
    end
    a += 1
  end
  while b < 5 do 
    if game_hash[:away][:players][b][:player_name] == player 
       value = game_hash[:away][:players][b][:points]
    end
    b += 1
  end
  value
end

def shoe_size(player)
  value
  for a in 0..4
    if game_hash[:home][:players][a][:player_name] == player 
       value = game_hash[:home][:players][a][:shoe_size]
    end
  end
  for b in 0..4
    if game_hash[:away][:players][b][:player_name] == player 
       value = game_hash[:away][:players][b][:shoe_size]
    end
  end
  value
end

def team_colors(team)
  value 
  if team == "Brooklyn Nets"
     value = game_hash[:home][:colors]
  else 
     value = game_hash[:away][:colors]
  end
  value
end

def team_names
    arr = []
    arr.push(game_hash[:home][:team_name])
    arr.push(game_hash[:away][:team_name])
    arr
end

def player_numbers(team)
  arr
  if team == "Brooklyn Nets"
     arr = [0, 30, 11, 1, 31]
  else 
     arr = [4, 0, 2, 8, 33]
  end
  arr
end

def player_stats(player)
    stats
    for a in 0..4 
      if player == game_hash[:home][:players][a][:player_name]
         stats = game_hash[:home][:players][a]
      end
    end
   for b in 0..4  
      if player == game_hash[:home][:players][b][:player_name]
         stats = game_hash[:home][:players][b]
      end
    end
end

def big_shoe_rebounds
  value = 0
  index = 0
  for i in 0..4
    if game_hash[:home][:players][i][:shoe] > value
       value = game_hash[:home][:players][i][:shoe]
       index = i
    end
  end
  game_hash[:home][:players][index][:rebounds]
end






