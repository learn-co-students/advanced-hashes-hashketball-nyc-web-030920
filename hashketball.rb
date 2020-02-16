def game_hash()
  {
    :home => {
      :team_name => 'Brooklyn Nets',
      :colors => ['Black','White'],
      :players => [{
        :player_name => 'Alan Anderson',
        :number => 0,
        :shoe => 16,
        :points => 22,
        :rebounds => 12,
        :assists => 12,
        :steals => 3,
        :blocks => 1,
        :slam_dunks => 1,
        }, {
        :player_name => 'Reggie Evans',
        :number => 30,
        :shoe => 14,
        :points => 12,
        :rebounds => 12,
        :assists => 12,
        :steals => 12,
        :blocks => 12,
        :slam_dunks => 7,
        }, {
        :player_name => 'Brook Lopez',
        :number => 11,
        :shoe => 17,
        :points => 17,
        :rebounds => 19,
        :assists => 10,
        :steals => 3,
        :blocks => 1,
        :slam_dunks => 15,
        }, {
        :player_name => 'Mason Plumlee',
        :number => 1,
        :shoe => 19,
        :points => 26,
        :rebounds => 11,
        :assists => 6,
        :steals => 3,
        :blocks => 8,
        :slam_dunks => 5,
        }, {
        :player_name => 'Jason Terry',
        :number => 31,
        :shoe => 15,
        :points => 19,
        :rebounds => 2,
        :assists => 2,
        :steals => 4,
        :blocks => 11,
        :slam_dunks => 1,
        }
      ],
    }, :away =>{
    :team_name => 'Charlotte Hornets',
    :colors => ['Turquoise','Purple'],
    :players => [{
      :player_name => 'Jeff Adrien',
      :number => 4,
      :shoe => 18,
      :points => 10,
      :rebounds => 1,
      :assists => 1,
      :steals => 2,
      :blocks => 7,
      :slam_dunks => 2,
      }, {
      :player_name => 'Bismack Biyombo',
      :number => 0,
      :shoe => 16,
      :points => 12,
      :rebounds => 4,
      :assists => 7,
      :steals => 22,
      :blocks => 15,
      :slam_dunks => 10,
      }, {
      :player_name => 'DeSagna Diop',
      :number => 2,
      :shoe => 14,
      :points => 24,
      :rebounds => 12,
      :assists => 12,
      :steals => 4,
      :blocks => 5,
      :slam_dunks => 5,
      }, {
      :player_name => 'Ben Gordon',
      :number => 8,
      :shoe => 15,
      :points => 33,
      :rebounds => 3,
      :assists => 2,
      :steals => 1,
      :blocks => 1,
      :slam_dunks => 0,
      }, {
      :player_name => 'Kemba Walker',
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

def num_points_scored(player_name)
  player_lib = game_hash()
  player_lib
  player_lib.each do |team,elements|
    elements.each do |attribute,data|
      if :players == attribute
        data.each do |player|
          if player[:player_name] == player_name
            return player[:points]
          end
        end
      end
    end
  end
end

def shoe_size(player_name)
  player_lib = game_hash()
  player_lib
  player_lib.each do |team,elements|
    elements.each do |attribute,data|
      if :players == attribute
        data.each do |player|
          if player[:player_name] == player_name
            return player[:shoe]
          end
        end
      end
    end
  end
end

def team_colors(team)
  player_lib = game_hash()
  player_lib
  player_lib.each do |x,elements|
    if elements[:team_name] == team
      return elements[:colors]
    end
  end
end

def team_names()
  player_lib = game_hash()
  player_lib
  team_names = []
  player_lib.each do |x,elements|
      team_names << elements[:team_name]
  end
  team_names
end

def player_numbers(team)
  player_lib = game_hash()
  player_lib
  jerseys = []
  player_lib.each do |teams,elements|
     if elements[:team_name] == team
      elements.each do |attribute,data|
        if :players == attribute
          data.each do |player|
            jerseys << player[:number]
          end
        end
      end
    end
  end
  p jerseys
end

def player_stats(player_name)
  player_lib = game_hash()
  player_lib
  player_lib.each do |team,elements|
    elements.each do |attribute,data|
      if attribute == :players
        data.each do |player|
          if player[:player_name] == player_name
            player_stats = player
            player_stats.delete(:player_name)
            return player_stats
          end
        end
      end
    end
  end
end


def big_shoe_rebounds()
  shoe_size = 0
  rebound = 0
  player_lib = game_hash()
  player_lib
  player_lib.each do |team,elements|
    elements.each do |attribute,data|
      if attribute == :players
        data.each do |player|
          if player[:shoe] > shoe_size
            shoe_size = player[:shoe]
            rebound = player[:rebounds]
          end
        end
      end
    end
  end
  rebound
end

def most_points_scored()
  most_points = 0
  person = 0
  player_lib = game_hash()
  player_lib
  player_lib.each do |team,elements|
    elements.each do |attribute,data|
      if attribute == :players
        data.each do |player|
          if player[:points] > most_points
            most_points = player[:points]
            person = player[:player_name]
          end
        end
      end
    end
  end
person
end

def player_with_longest_name()
  long_name = 0
  person = 0
  player_lib = game_hash()
  player_lib
  player_lib.each do |team,elements|
    elements.each do |attribute,data|
      if attribute == :players
        data.each do |player|
          if player[:player_name].length > long_name
            long_name = player[:player_name].length
            person = player[:player_name]
          end
        end
      end
    end
  end
  person
end

def long_name_steals_a_ton?()
  long_player = player_with_longest_name()
  steals_player = 0
  most_steals = 0
  player_lib = game_hash()
  player_lib
  player_lib.each do |team,elements|
    elements.each do |attribute,data|
      if attribute == :players
        data.each do |player|
          if player[:rebounds] > most_steals
            longest_rebound = player[:steals]
            steals_player = player[:player_name]
          end
        end
      end
    end
  end
  if steals_player = long_player
    return true
  end
end

def winning_team()
  player_lib = game_hash()
  b = 0
  c = 0
  player_lib[:home].each do |team,elements|
    if team == :players
      elements.each do |player|
        b+=player[:points]
      end
    end
  end
  player_lib[:away].each do |team,elements|
    if team == :players
      elements.each do |player|
        c+=player[:points]
      end
    end
  end
  if b > c
    return 'Brooklyn Nets'
  else
    return 'Charlotte Hornets'
  end
end
