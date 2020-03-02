require 'pry'

def game_hash
  {:home => {
    :team_name => "Brooklyn Nets",
    :colors => ["Black", "White"],
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
  result = []
  game_hash.each do |place, team|
    result << team[:team_name]
  end
  result
end


def player_numbers(team_name)
  result = []
  game_hash.each do |place, team|
    team.each do |attribute, data|
      if attribute == :players
        data.each do |player|
          if team[:team_name] == team_name
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
  game_hash.each do |place, team|
    team.each do |attribute, data|
      if attribute == :players
        data.each do |player|
          if player[:player_name] == players_name
            result = player.delete_if do |k, y|
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
  max_shoe_player = nil
  max_shoe = nil
  rebound = nil
  game_hash.each do |place, team|
    team.each do |attribute, data|
      if attribute == :players
        data.each do |player|
          if !max_shoe
            max_shoe_player = player[:player_name]
            max_shoe = player[:shoe]
            rebound = player[:rebounds]
          else if max_shoe < player[:shoe]
            max_shoe_player = player[:player_name]
            max_shoe = player[:shoe]
            rebound = player[:rebounds]
          end
        end
      end
    end
  end
end
rebound
end


def most_points_scored
  max_points_player = nil
  max_points = nil
  game_hash.each do |place, team|
    team.each do |attribute, data|
      if attribute == :players
        data.each do |player|
          if !max_points
            max_points_player = player[:player_name]
            max_points = player[:points]
          else if max_points < player[:points]
            max_points_player = player[:player_name]
            max_points = player[:points]
          end
        end
      end
    end
  end
end
max_points_player
end


def winning_team
  team1_total = 0
  team2_total = 0
  
  game_hash[:home][:players].each do |player, data|
    team1_total += player[:points]
    end
    
  game_hash[:away][:players].each do |player, data|
      team2_total += player[:points]
    end
    
  
  if team1_total > team2_total
    return "Brooklyn Nets"
    elsif team1_total < team2_total
    return "Charlotte Hornets"
  end 
end


def player_with_longest_name
  longest = nil
  game_hash.each do |place, team|
    team.each do |attribute, data|
      if attribute == :players
        data.each do |player|
          if !longest
            longest = player[:player_name]
          else if longest.length < player[:player_name].length
            longest = player[:player_name]
          
          end
        end
      end
    end
  end
end
  longest
end

def long_name_steals_a_ton?
  steal = 0
  player_name = 0
  longest_player_steal = 0
  
  game_hash.each do |team, team_info|
    team_info[:players].each do |player|
      while player[:player_name].length > player_name
        player_name = player[:player_name].length
        longest_player_steal = player[:steals]
      end
    end
  end

  game_hash.each do |team, team_info|
    team_info[:players].each do |player|
      while player[:steals] > steal
        steal = player[:steals]
      end
    end
  end 
  return longest_player_steal >= steal
end 