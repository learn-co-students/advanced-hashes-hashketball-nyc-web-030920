require 'pry'

# Write your code here!
#method to contain and return 
def game_hash
  
  hash = {
    :home => {
      :team_name => "Brooklyn Nets", #the team's name as a string
      :colors => ["Black", "White"],    #individual color names in an array
      :players => [
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
        }]    #an array of hashes - contains stats for each player (including name)
    }, #home team hash
    :away => {
      :team_name => "Charlotte Hornets", #the team's name as a string
      :colors => ["Turquoise", "Purple"],    #individual color names in an array
      :players => [
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
        }]    #an array of hashes - contains stats for each player (including name)
    } #away team hash
  }
  
  return hash
  
end


#method to return number of points scored by specific player
def num_points_scored(player_name)
  
  stat_search(player_name, :points)
  
end


#method to return the show size for any specified player
def shoe_size(player_name)

  return stat_search(player_name, :shoe)
  
end


#method to return list of team colors as an array
def team_colors(team_name)
  
  info = game_hash
  
  if info[:home].any?{|key, value| value == team_name}
    return info[:home][:colors]
  else
    if info[:away].any?{|key, value| value == team_name}
      return info[:away][:colors]
    end
  end
  
  
end

#method to return list of team names as an array
def team_names
  
  game = game_hash
  
  teams = [game[:home][:team_name], game[:away][:team_name]]
  
  return teams

end


#method to return an array of jersey numbers for a specified team
def player_numbers(team_name)
  
  info = game_hash
  
  numbers = []
  
  if info[:home].value?(team_name)
    #use .each with block that pushes each player's number to the array for the array of player hashes
    info[:home][:players].each{|hash| numbers.push(hash[:number])}
  else
    if info[:away].value?(team_name)
      #use .each with block that pushes each player's number to the array for the array of player hashes
      info[:away][:players].each{|hash| numbers.push(hash[:number])}
    end
  end
  
  return numbers
  
end


#method to return a hash of a specified player's stats
def player_stats(player_name)
  
  info = game_hash
  
  stats = {
    :number => stat_search(player_name, :number),
    :shoe => stat_search(player_name, :shoe),
    :points => stat_search(player_name, :points),
    :rebounds => stat_search(player_name, :rebounds),
    :assists => stat_search(player_name, :assists),
    :steals => stat_search(player_name, :steals),
    :blocks => stat_search(player_name, :blocks),
    :slam_dunks => stat_search(player_name, :slam_dunks)
    
  }

  return stats
  
end


#method to return the number of rebounds for the player who has the largest shoe size
def big_shoe_rebounds
  
  big_shoe = max_stat(:shoe)
  
  rebounds = stat_search(big_shoe[:max_player], :rebounds)
  
  return rebounds
  
end



#method to return the name of the player who has the most points
def most_points_scored
  
  most_points = max_stat(:points)
  
  name = most_points[:max_player]
  
  return name
  
end


#method to return the team name  which has the most points
def winning_team
  
  info = game_hash
  
  #arrays to iterate over to pass as arguments to stat_search method
  all_home = info[:home][:players].map{|hash| hash.fetch(:player_name)}
  all_away = info[:away][:players].map{|hash| hash.fetch(:player_name)}
  
  total_home = 0
  total_away = 0
  
  all_home.each{|name| total_home += stat_search(name, :points)}
  all_away.each{|name| total_away += stat_search(name, :points)}
  
  if total_home > total_away
    return info[:home][:team_name]
  else
    if total_away > total_home
      return info[:away][:team_name]
    else 
      return "It's a tie!"
    end
  end
  
end

#method that returns the name of the player with the longest name
def player_with_longest_name
  
  all_players = home_players + away_players
  
  name_lengths = all_players.map{|name| name.length}
  
  longest = name_lengths.max
  
  longest_name = all_players[name_lengths.index(longest)]
  
  return longest_name
  
end


#method that returns true if the player with the longest name had the most steals
def long_name_steals_a_ton?
  
    #use max_stat(:steals) and see if max_stat[:max_player] == player_with_longest_name 
    
    player = player_with_longest_name
    
    stealer = max_stat(:steals)
    
    if stealer[:max_player] == player
      return true
    else
      return false
    end
  
end


# --------- helper methods ------------

#method to seach for a given player's stats
def stat_search(player_name, stat)
  
  info = game_hash
  
    #using the index of the players array of hashes: info[:home][:players][index][:points], then using player.any? to parse each key/value, then returning the stat value for the hash at that index
    if info[:home][:players].index{|player| player.any?{|key, value| value == player_name}}
    return info[:home][:players][
      info[:home][:players].index{|player| player.any?{|key, value| value == player_name}}
      ][stat]
  else
    if info[:away][:players].index{|player| player.any?{|key, value| value == player_name}}
      return info[:away][:players][
        info[:away][:players].index{|player| player.any?{|key, value| value == player_name}}
        ][stat]
    end
  end 
  
  
end


#helper method to find the max of a given stat and reports the player's name along with the value of that stat
def max_stat(stat)
  
  info = game_hash
  
  all_players = home_players + away_players
  
  all_stat = info[:home][:players].map{|hash| hash.fetch(stat)} + info[:away][:players].map{|hash| hash.fetch(stat)}
  
  max = all_stat.max
  
  max_player_index = all_stat.index(max)
  
  stat_value = {}
  
  stat_value[:max_player] = all_players[max_player_index]
  stat_value[:max_stat] = max
  
  return stat_value #a 2-key hash with name and stat
  
end

#returns array of home team player names
def home_players
  
  info = game_hash
  
  return info[:home][:players].map{|hash| hash.fetch(:player_name)}
  
end


#returns array of away team player names
def away_players
  
  info = game_hash
  
  return info[:away][:players].map{|hash| hash.fetch(:player_name)}
  
end


