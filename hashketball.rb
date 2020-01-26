require "pry"
 def game_hash 
 {
    :home => {
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
        :slam_dunks => 1,
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
        :slam_dunks => 7,
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
        :slam_dunks => 15,
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
        :slam_dunks => 5,
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
        :slam_dunks => 1,
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
        :slam_dunks => 2,
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
        :slam_dunks => 10,
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
        :slam_dunks => 5,
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
        :slam_dunks => 0,
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
        :slam_dunks => 12,
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
    team.each do |attribute, data|
      if data == team_name
        return team[:colors]
      end
    end
  end
end

def team_names
  whose_playing =[]
  game_hash.each do |place, team|
    whose_playing << team[:team_name]
  end
  whose_playing
end

def player_numbers(teams_name)
  jersey_numbers = []
  game_hash.each do |place, team|
    if team[:team_name] == teams_name
      team.each do |attribute, data|
        if attribute == :players
          data.each do |player|
          jersey_numbers << player[:number]
           end
         end
      end
    end
  end
  jersey_numbers
end

def player_stats(players_name)
  new_hash = {}
  game_hash.each do |place, team|
    team.each do |attribute, data|
      if attribute == :players
        data.each do |player|
          if player[:player_name] == players_name
          new_hash = player.delete_if do |k,v|
            k == :player_name
            end
          end
        end
      end
    end
  end
  new_hash
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
leading_scorer ="placeholder"
  
    game_hash.each do |place, team|
     team.each do |attribute, data|
       if attribute == :players
       data.each do |player|
      if  player[:points] > most_points
        most_points = player[:points]
        leading_scorer = player[:player_name]
          end
        end
      end
    end
  end
  return leading_scorer
end

def winning_team
  home_score = 0
  away_score = 0
  game_hash.each do |place, team|
    if place == :away
      team.each do |attribute, data|
        if attribute == :players
          data.each do |player|
            away_score += player[:points]
          end
        end
      end
    else team.each do |attribute, data|
      if attribute == :players
        data.each do |player|
        home_score += player[:points]
        end
      end
    end
  end
end
if home_score > away_score
  return "Brooklyn Nets"
else
  return "Charlotte Hornets"
  end
end

def player_with_longest_name
  longest_name = "placeholder"
  name_length = 0
  game_hash.each do |palce, team|
    team.each do |attribute, data|
      if attribute == :players
        data.each do |player|
          if player[:player_name].length > name_length
            longest_name = player[:player_name]
            name_length = player[:player_name].length
          end
        end
      end
    end
  end
return longest_name
end

def long_name_steals_a_ton?
  steal_king = "placeholder"
  no_of_steals = 0
  game_hash.each do |place, team|
    team.each do |attribute, data|
      if attribute == :players
        data.each do |player|
        if player[:steals] > no_of_steals
          steal_king = player[:player_name]
          no_of_steals = player[:steals]
          end
        end
      end
    end
  end
  if player_with_longest_name = steal_king
    return true
  else
    return false
  end
end
