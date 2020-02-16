# Write your code here!
def game_hash
 {
  :home => {:team_name => "Brooklyn Nets",
            :colors => ["Black", "White"],
            :players => [
              {:player_name => "Alan Anderson",
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
  :away => {:team_name => "Charlotte Hornets",
            :colors => ["Turquoise", "Purple"],
            :players => [
              {:player_name => "Jeff Adrien",
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
end

def get_player_stats(name)
  home_team = game_hash[:home]
  away_team = game_hash[:away]
   ht_player_index = 0
   while ht_player_index < home_team[:players].length do
    if name == home_team[:players][ht_player_index][:player_name]
      return home_team[:players][ht_player_index]
    end
    ht_player_index +=1
    at_player_index = 0
   while at_player_index < away_team[:players].length do
    if name == away_team[:players][at_player_index][:player_name]
      return away_team[:players][at_player_index]
    end
    at_player_index +=1
    end
    end
    end
    
    def num_points_scored(name)
player_hash = get_player_stats(name)
if name == player_hash[:player_name]
return player_hash[:points]
end
end

def shoe_size(name)
  player_hash = get_player_stats(name)
  if name == player_hash[:player_name]
    return player_hash[:shoe]
  end
end

def team_colors(team_name)
if 
  team_name == game_hash[:home][:team_name]
  return game_hash[:home][:colors]
else
  team_name == game_hash[:away][:team_name]
  return game_hash[:away][:colors]
end
end

def team_names
  teams = []
  teams << game_hash[:home][:team_name] 
  teams << game_hash[:away][:team_name]
end

def player_numbers(team_name)
  home_team = game_hash[:home]
  away_team = game_hash[:away]
  ht_player_index = 0
  home_team_numbers = []
  while ht_player_index < home_team[:players].length do
    if team_name == home_team[:team_name]
      home_team_numbers << home_team[:players][ht_player_index][:number]
    end
    ht_player_index +=1
    at_player_index = 0
    away_team_numbers = []
    while at_player_index < away_team[:players].length do
      if team_name == away_team[:team_name]
        away_team_numbers << away_team[:players][at_player_index][:number]
      end
      at_player_index +=1   
  end
end
home_team_numbers.empty? ? away_team_numbers : home_team_numbers
end

def player_stats(name)
  home_team = game_hash[:home]
  away_team = game_hash[:away]
  ht_player_hash = {}
   ht_player_index = 0
   while ht_player_index < home_team[:players].length do
    if name == home_team[:players][ht_player_index][:player_name]
      return ht_player_hash = {
        :number => home_team[:players][ht_player_index][:number],
        :shoe => home_team[:players][ht_player_index][:shoe],
        :points => home_team[:players][ht_player_index][:points],
        :rebounds => home_team[:players][ht_player_index][:rebounds],
        :assists => home_team[:players][ht_player_index][:assists],
        :steals => home_team[:players][ht_player_index][:steals],
        :blocks => home_team[:players][ht_player_index][:blocks],
        :slam_dunks => home_team[:players][ht_player_index][:slam_dunks]
       }
    end
    ht_player_index +=1
    at_player_hash = {}
    at_player_index = 0
   while at_player_index < away_team[:players].length do
    if name == away_team[:players][at_player_index][:player_name]
      return at_player_hash = {
        :number => away_team[:players][at_player_index][:number],
        :shoe => away_team[:players][at_player_index][:shoe],
        :points => away_team[:players][at_player_index][:points],
        :rebounds => away_team[:players][at_player_index][:rebounds],
        :assists => away_team[:players][at_player_index][:assists],
        :steals => away_team[:players][at_player_index][:steals],
        :blocks => away_team[:players][at_player_index][:blocks],
        :slam_dunks => away_team[:players][at_player_index][:slam_dunks]
      }
    end
    at_player_index +=1
    end
    end
    end
    
  def biggest_shoe_size
  home_team = game_hash[:home]
  away_team = game_hash[:away]
  ht_player_index = 0
  ht_shoes = []
  while ht_player_index < home_team[:players].length do
  ht_shoes << home_team[:players][ht_player_index][:shoe]
    ht_player_index +=1
  end
  at_player_index = 0
  at_shoes = []
  while at_player_index < away_team[:players].length do
  at_shoes << away_team[:players][at_player_index][:shoe]
  at_player_index +=1
  end
  (ht_shoes + at_shoes).max
end
biggest_shoe_size

def big_shoe_rebounds
home_team = game_hash[:home]
away_team = game_hash[:away]
ht_player_index = 0
while ht_player_index < home_team[:players].length do
  if home_team[:players][ht_player_index][:shoe] == biggest_shoe_size
    return home_team[:players][ht_player_index][:rebounds]
  end
  ht_player_index +=1
end
  at_player_index = 0
  while at_player_index < away_team[:players].length do
    if away_team[:players][at_player_index][:shoe] == biggest_shoe_size
      return away_team[:players][at_player_index][:rebounds]
    end
    at_player_index +=1
  end
end
    
# BONUS QUESTIONS

def most_points
  home_team = game_hash[:home]
  away_team = game_hash[:away]
  ht_player_index = 0
  ht_points = []
  while ht_player_index < home_team[:players].length do
  ht_points << home_team[:players][ht_player_index][:points]
    ht_player_index +=1
  end
  at_player_index = 0
  at_points = []
  while at_player_index < away_team[:players].length do
  at_points << away_team[:players][at_player_index][:points]
  at_player_index +=1
  end
  (ht_points + at_points).max
end
most_points

def most_points_scored
home_team = game_hash[:home]
away_team = game_hash[:away]
ht_player_index = 0
while ht_player_index < home_team[:players].length do
  if home_team[:players][ht_player_index][:points] == most_points
    return home_team[:players][ht_player_index][:player_name]
  end
  ht_player_index +=1
end
  at_player_index = 0
  while at_player_index < away_team[:players].length do
    if away_team[:players][at_player_index][:points] == most_points
      return away_team[:players][at_player_index][:player_name]
    end
    at_player_index +=1
  end  
end

def winning_team
  home_team = game_hash[:home]
  away_team = game_hash[:away]
  ht_player_index = 0
  ht_points = []
  while ht_player_index < home_team[:players].length do
  ht_points << home_team[:players][ht_player_index][:points]
    ht_player_index +=1
  end
  at_player_index = 0
  at_points = []
  while at_player_index < away_team[:players].length do
  at_points << away_team[:players][at_player_index][:points]
  at_player_index +=1
  end
  ht_points.sum > at_points.sum ? home_team[:team_name] : away_team[:team_name]
end

def player_with_longest_name
  home_team = game_hash[:home]
  away_team = game_hash[:away]
  ht_player_index = 0
  ht_players = []
  while ht_player_index < home_team[:players].length do
    ht_players << home_team[:players][ht_player_index][:player_name]
    ht_player_index +=1
  end
  at_player_index = 0
  at_players =[]
  while at_player_index < away_team[:players].length do
    at_players << away_team[:players][at_player_index][:player_name]
    at_player_index +=1
  end
  (ht_players + at_players).max_by{|player| player.length}
end

# SUPER BONUS

def most_steals
  home_team = game_hash[:home]
  away_team = game_hash[:away]
  ht_player_index = 0
  ht_steals = []
  while ht_player_index < home_team[:players].length do
  ht_steals << home_team[:players][ht_player_index][:steals]
    ht_player_index +=1
  end
  at_player_index = 0
  at_steals = []
  while at_player_index < away_team[:players].length do
  at_steals << away_team[:players][at_player_index][:steals]
  at_player_index +=1
  end
  (ht_steals + at_steals).max
end
most_steals

def long_name_steals_a_ton?
  home_team = game_hash[:home]
  away_team = game_hash[:away]
  ht_player_index = 0
  while ht_player_index < home_team[:players].length do
    if player_with_longest_name == home_team[:players][ht_player_index][:player_name] && home_team[:players][ht_player_index][:steals] == most_steals
      return true
    end
      ht_player_index +=1
  end
  at_player_index = 0
  while at_player_index < away_team[:players].length do
    if player_with_longest_name == away_team[:players][at_player_index][:player_name] && away_team[:players][at_player_index][:steals] == most_steals
      return true
    end
    at_player_index +=1
  end
end
