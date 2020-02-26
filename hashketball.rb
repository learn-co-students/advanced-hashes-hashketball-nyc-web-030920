# Write your code here!
require "pry"

def game_hash
  {
    home: { team_name: 'Brooklyn Nets',
            colors: ['Black', 'White'],
            players: [
              { player_name: 'Alan Anderson',
                number: 0,
                shoe: 16,
                points: 22,
                rebounds: 12,
                assists: 12,
                steals: 3,
                blocks: 1,
                slam_dunks: 1 },
              { player_name: 'Reggie Evans',
                number: 30,
                shoe: 14,
                points: 12,
                rebounds: 12,
                assists: 12,
                steals: 12,
                blocks: 12,
                slam_dunks: 7 },
              { player_name: 'Brook Lopez',
                number: 11,
                shoe: 17,
                points: 17,
                rebounds: 19,
                assists: 10,
                steals: 3,
                blocks: 1,
                slam_dunks: 15 },
              { player_name: 'Mason Plumlee',
                number: 1,
                shoe: 19,
                points: 26,
                rebounds: 11,
                assists: 6,
                steals: 3,
                blocks: 8,
                slam_dunks: 5 },
              { player_name: 'Jason Terry',
                number: 31,
                shoe: 15,
                points: 19,
                rebounds: 2,
                assists: 2,
                steals: 4,
                blocks: 11,
                slam_dunks: 1 }
            ] },
    away: { team_name: 'Charlotte Hornets',
            colors: ['Turquoise', 'Purple'],
            players: [
              { player_name: 'Jeff Adrien',
                number: 4,
                shoe: 18,
                points: 10,
                rebounds: 1,
                assists: 1,
                steals: 2,
                blocks: 7,
                slam_dunks: 2 },
              { player_name: 'Bismack Biyombo',
                number: 0,
                shoe: 16,
                points: 12,
                rebounds: 4,
                assists: 7,
                steals: 22,
                blocks: 15,
                slam_dunks: 10 },
              { player_name: 'DeSagna Diop',
                number: 2,
                shoe: 14,
                points: 24,
                rebounds: 12,
                assists: 12,
                steals: 4,
                blocks: 5,
                slam_dunks: 5 },
              { player_name: 'Ben Gordon',
                number: 8,
                shoe: 15,
                points: 33,
                rebounds: 3,
                assists: 2,
                steals: 1,
                blocks: 1,
                slam_dunks: 0 },
              { player_name: 'Kemba Walker',
                number: 33,
                shoe: 15,
                points: 6,
                rebounds: 12,
                assists: 12,
                steals: 7,
                blocks: 5,
                slam_dunks: 12 }
            ] }
  }
end

def num_points_scored(toFind) 
  hash = game_hash
  hash.each do |place, team| #away {}, home {}
    team.each do |title, info| #{team_name: , color: , players: []}
      next unless title == :players #find item names players
      
      info.each do |points| #{players: name: , points:... }
        if points[:player_name] == toFind
          return points[:points]
        end
      end
    end
  end
end

def shoe_size(name)
  hash = game_hash
  hash.each do |place, team| #{away:{}, home:{}}
    team.each do |teamInfo, details| #{color...player:[]}
      next unless teamInfo == :players
      
      details.each do |player, points|
        if player[:player_name] == name
          return player[:shoe]
        end
      end
    end
  end
end

def team_colors(teamName)
  hash = game_hash
  hash.each do |place, team|
    if team[:team_name] == teamName
      return team[:colors]
    end
  end
end

def team_names
  hash = game_hash
  array = []
  
  hash.each do |place, team|
    array.push(team[:team_name])
  end
  array
end

def player_numbers(teamName)
  hash = game_hash
  ans = []
  
  hash.each do |place, team|
    next unless team[:team_name] == teamName
    
    team.each do |teamInfo, data|
      next unless teamInfo == :players
      
      data.each do |points|
        ans.push(points[:number])
      end
    end
  end
  ans
end

def player_stats(playerName)
  hash = game_hash
  ans = {}
  
  hash.collect do |place, team|
    team.each do |attribute, info|
      next unless attribute == :players
      
      hash[place][attribute].each do |player|
        next unless player[:player_name] == playerName
        
        ans = player.delete_if do |k, v|
          k == :player_name
        end
      end
    end
  end
  ans
end

def big_shoe_rebounds
  max = 0 
  max_rebounds = 0 
  hash = game_hash
  
  hash.each do |place, team|
    team.each do |attribute, data|
      next unless attribute == :players
      data.each do |info, number|
        curr = info[:shoe]
        if curr > max
          max = curr
          max_rebounds = info[:rebounds]
        end
      end
    end
  end
  max_rebounds
end

def most_points_scored
  hash = game_hash
  max_points = 0
  max_name = ""
  
  hash.each do |place, team|
    team.each do |attribute, info|
      next unless attribute == :players
      info.each do |title, data|
        curr = title[:points]
        if curr > max_points
          max_points = curr
          max_name = title[:player_name]
        end
      end
    end
  end
  max_name
end

def winning_team
  hash = game_hash
  chPoints = 0 
  bnPoints = 0 

  
  hash.each do |place, team| 
    if team[:team_name] == 'Charlotte Hornets'
      team[:players].each do |attribute|
        chPoints += attribute[:points]
      end
    end
  end
  
  hash.each do |place, team| 
    if team[:team_name] == 'Brooklyn Nets'
      team[:players].each do |attribute|
        bnPoints += attribute[:points]
      end
    end
  end
  
  result = {'Charlotte Hornets' => chPoints, 'Brooklyn Nets' => bnPoints}
  
  result.max_by { |key, value| value}.first

end


def player_with_longest_name
  name_length = 0 
  max_name = ""
  hash = game_hash
  
  hash.each do |place, team|
    team[:players].each do |attribute|
      curr = attribute[:player_name].length 
      if curr > name_length
        name_length = curr
        max_name = attribute[:player_name]
      end
    end
  end
  max_name
end

def long_name_steals_a_ton?
  max_name = player_with_longest_name
  max_steals = 0 
  max_steals_name = ""
  
  hash = game_hash
  hash.each do |place, team|
    team[:players].each do |attribute|
      curr = attribute[:steals]
      if curr > max_steals
        max_steals = curr
        max_steals_name = attribute[:player_name]
      end
    end
  end
  
  if max_steals_name == max_name
    return true
  end
  return false
end

