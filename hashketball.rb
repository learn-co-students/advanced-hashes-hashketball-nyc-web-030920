require 'pry'
def game_hash
  team =
  {
    :home => 
    {
      :team_name => "Brooklyn Nets", 
      :colors => ["Black", "White"], 
      :players => 
      [
        {
          :player_name => "Alan Anderson", 
          :number => 0, 
          :shoe => 16, 
          :points => 22, 
          :rebounds => 12, 
          :assists => 12, 
          :steals => 3, 
          :blocks => 1, 
          :slam_dunks => 1
        }, 
        {
          :player_name => "Reggie Evans", 
          :number => 30, 
          :shoe => 14, 
          :points => 12, 
          :rebounds => 12, 
          :assists => 12, 
          :steals => 12, 
          :blocks => 12, 
          :slam_dunks => 7
        },
        {
          :player_name => "Brook Lopez", 
          :number => 11, 
          :shoe => 17, 
          :points => 17, 
          :rebounds => 19, 
          :assists => 10, 
          :steals => 3, 
          :blocks => 1, 
          :slam_dunks => 15
        },
        {
          :player_name => "Mason Plumlee", 
          :number => 1, 
          :shoe => 19, 
          :points => 26, 
          :rebounds => 11, 
          :assists => 6, 
          :steals => 3, 
          :blocks => 8, 
          :slam_dunks => 5
        },
        {
          :player_name => "Jason Terry", 
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
    :away => 
    {
      :team_name => "Charlotte Hornets", 
      :colors => ["Turquoise", "Purple"], 
      :players => 
      [
        {
          :player_name => "Jeff Adrien", 
          :number => 4, 
          :shoe => 18, 
          :points => 10, 
          :rebounds => 1, 
          :assists => 1, 
          :steals => 2, 
          :blocks => 7, 
          :slam_dunks => 2
        }, 
        {
          :player_name => "Bismack Biyombo", 
          :number => 0, 
          :shoe => 16, 
          :points => 12, 
          :rebounds => 4, 
          :assists => 7, 
          :steals => 22, 
          :blocks => 15, 
          :slam_dunks => 10
        },
        {
          :player_name => "DeSagna Diop", 
          :number => 2, 
          :shoe => 14, 
          :points => 24, 
          :rebounds => 12, 
          :assists => 12, 
          :steals => 4, 
          :blocks => 5, 
          :slam_dunks => 5
        },
        {
          :player_name => "Ben Gordon", 
          :number => 8, 
          :shoe => 15, 
          :points => 33, 
          :rebounds => 3, 
          :assists => 2, 
          :steals => 1, 
          :blocks => 1, 
          :slam_dunks => 0
        },
        {
          :player_name => "Kemba Walker", 
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

def num_points_scored(player_name)
  counter = 0
  while counter < game_hash[:home][:players].length
    if game_hash[:home][:players][counter][:player_name] == player_name
      return game_hash[:home][:players][counter][:points]
    elsif game_hash[:away][:players][counter][:player_name] == player_name
      return game_hash[:away][:players][counter][:points]
    else
      counter += 1
    end
  end
end

def shoe_size(player_name)
  counter = 0
  while counter < game_hash[:home][:players].length
    if game_hash[:home][:players][counter][:player_name] == player_name
      return game_hash[:home][:players][counter][:shoe]
    elsif game_hash[:away][:players][counter][:player_name] == player_name
      return game_hash[:away][:players][counter][:shoe]
    else
      counter += 1
    end
  end
end

def team_colors(team_name)
  if game_hash[:home][:team_name] == team_name
    return game_hash[:home][:colors]
  elsif game_hash[:away][:team_name] == team_name
    return game_hash[:away][:colors]
  else
    return "ERROR: Team not found."
  end
end

def team_names
  [game_hash[:home][:team_name] , game_hash[:away][:team_name]]
end

def player_numbers(team_name)
  player_numbers = []
  counter = 0
  while counter < game_hash[:home][:players].length
    if game_hash[:home][:team_name] == team_name
    player_numbers << game_hash[:home][:players][counter][:number]
    counter += 1
    elsif game_hash[:away][:team_name] == team_name
    player_numbers << game_hash[:away][:players][counter][:number]
    counter += 1
    else
    "ERROR: Team name not found."
    end
  end
  return player_numbers
end

def player_stats(player_name)
  default_hash = {:assists=>1, :blocks=>7, :number=>4, :points=>10, :rebounds=>1, :shoe=>18, :slam_dunks=>2, :steals=>2}
  game_hash.each do |location, info|
    game_hash[location][:players].each do |stats_hash|
      if stats_hash[:player_name] == player_name
        default_hash[:assists] = stats_hash[:assists]
        default_hash[:blocks] = stats_hash[:blocks]
        default_hash[:number] = stats_hash[:number]
        default_hash[:points] = stats_hash[:points]
        default_hash[:rebounds] = stats_hash[:rebounds]
        default_hash[:shoe] = stats_hash[:shoe]
        default_hash[:slam_dunks] = stats_hash[:slam_dunks]
        default_hash[:steals] = stats_hash[:steals]
      end
    end
  end
  return default_hash
end

def big_shoe_rebounds
  largest_shoe = 0
  corresponding_rebounds = 0
  game_hash.each do |location, info|
    game_hash[location][:players].each do |stats_hash|
      if stats_hash[:shoe] > largest_shoe
        largest_shoe = stats_hash[:shoe]
        corresponding_rebounds = stats_hash[:rebounds]
      end
    end
  end
  corresponding_rebounds
end

def most_points_scored
  most_points= 0
  corresponding_name = ""
  game_hash.each do |location, info|
    game_hash[location][:players].each do |stats_hash|
      if stats_hash[:points] > most_points
        most_points = stats_hash[:points]
        corresponding_name = stats_hash[:player_name]
      end
    end
  end
  corresponding_name
end

def winning_team
  home_score = 0
  game_hash[:home][:players].each do |stats_hash|
    home_score += stats_hash[:points]
  end
  away_score = 0
  game_hash[:away][:players].each do |stats_hash|
    away_score += stats_hash[:points]
  end
  home_score > away_score ? game_hash[:home][:team_name] : game_hash[:away][:team_name]
end

def player_with_longest_name
  longest_name = ""
  game_hash.each do |location, info|
    game_hash[location][:players].each do |stats_hash|
      if stats_hash[:player_name].size > longest_name.size
        longest_name = stats_hash[:player_name]
      end
    end
  end
  longest_name
end

def long_name_steals_a_ton?
  most_steals= 0
  corresponding_name = ""
  game_hash.each do |location, info|
    game_hash[location][:players].each do |stats_hash|
      if stats_hash[:steals] > most_steals
        most_steals = stats_hash[:steals]
        corresponding_name = stats_hash[:player_name]
      end
    end
  end
  corresponding_name == player_with_longest_name ? true : false
end