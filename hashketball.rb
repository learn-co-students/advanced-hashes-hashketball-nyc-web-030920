require 'pry'
require 'pp'

def game_hash
 {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players =>[
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
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
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
        }
      ]
    }
  }
end

def num_points_scored(players_name)
  #return num of points for player passed in
  game_hash.each do |place, team|
    team.each do |attribute, data|
      if attribute == :players
        data.each do |player|
          if player[:player_name] == players_name
            return player[:points]
          end 
        end 
      end
    end 
  end
end

def shoe_size(players_name)
  game_hash.each do |place, team|
    team.each do |attribute, data|
      if attribute == :players
        data.each do |player|
          if player[:player_name] == players_name
            return player[:shoe]
          end 
        end 
      end
    end 
  end
  
end

def team_colors(team_name)
  game_hash.each do |place, team|
    if team[:team_name] == team_name
      return team[:colors]
    end 
  end 
end 

def team_names
  
  game_hash.map do |place, team|
      team[:team_name]
  end 
  
end

def player_numbers(team_name)
  result = []
  game_hash.map do |place, team|
    if team[:team_name] == team_name
      team.each do |attributes, data|
        if attributes == :players
          data.each do |player|
            result << player[:number]
          end 
        end
      end 
    end 
  end
  result
end

def player_stats(players_name)
  
  result = {}
  
  game_hash.each do  |place, team|
    team.each do |attribute, data|
      if attribute == :players
        data.each do |player|
          if players_name == player[:player_name]
            result = player.delete_if do |k, v|
              k == :player_name
            end
          end
        end 
      end
    end
  end
  result
end

def big_shoe_rebounds

  biggest_shoe = 0 
  rebounds = 0
  
  game_hash.each do |place, team|
    team.each do |attribute, data|
      if attribute == :players
        data.each do |player|
          if player[:shoe] > biggest_shoe
            biggest_shoe = player[:shoe]
            rebounds = player[:rebounds]
          end
        end
      end
    end
  end
  return rebounds
end


def most_points_scored
  
  most_points = 0
  most_points_player = ""
  
  game_hash.each do |place, team|
    team.each do |attribute, data|
      if attribute == :players
        data.each do |player|
          if player[:points] > most_points
            most_points = player[:points]
            most_points_player = player[:player_name]
            # binding.pry
          end
        end
      end
    end
  end
  return most_points_player

end

def winning_team
  
  home_points = 0 
  away_points = 0

  game_hash.each do |place, team|
    
    #do home things
    if place == :home
      team.each do |attribute, data|
        if attribute == :players
          data.each do |player|
            home_points += player[:points]
          end
        end
      end
      home_points
      # binding.pry
    end
    
    #do away things
    if place == :away
      team.each do |attribute, data|
        if attribute == :players
          data.each do |player|
            away_points += player[:points]
          end
        end
      end
      away_points
      # binding.pry
    end
    
    #compare the two
    if home_points > away_points
      return "Brooklyn Nets"
    else
      return "Charlotte Hornets"
    end
    
  end

end



def player_with_longest_name
  
  longest_name = 0
  longest_name_player = ""
  
  game_hash.each do |place, team|
    team.each do |attribute, data|
      if attribute == :players
        data.each do |player|
          if player[:player_name]
            if player[:player_name].length > longest_name
              longest_name = player[:player_name].length
              longest_name_player = player[:player_name]
              # binding.pry
            end
          end 
        end
      end
    end
  end
  return longest_name_player
end



def long_name_steals_a_ton?
  
  most_steals = 0
  most_steals_player = ""
  
  #figures out the most steals
  game_hash.each do |place, team|
    team.each do |attribute, data|
      if attribute == :players
        data.each do |player|
          if player[:steals] > most_steals
            most_steals = player[:steals]
            most_steals_player = player[:player_name]
            # binding.pry
          end
        end
      end
    end
  end
  # binding.pry
  
  #compares most steals with longest name
  if most_steals_player == player_with_longest_name
    return TRUE
  else
    return FALSE
  end
  

end 