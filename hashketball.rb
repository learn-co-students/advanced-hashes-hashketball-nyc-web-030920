# Write your code here!


def construct_players(player_list)
  l = []
  player_list[0].each_with_index do |val, i|
  # player_list[0].each do |val|
    player = {
      player_name: val,
      number: player_list[1][i],
      shoe: player_list[2][i],
      points: player_list[3][i],
      rebounds: player_list[4][i],
      assists: player_list[5][i],
      steals: player_list[6][i],
      blocks: player_list[7][i],
      slam_dunks: player_list[8][i]
    }
    l << player
  end
  return l
end

def game_hash
  gh = {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
    },
  }
  home = [
    ["Alan Anderson",	"Reggie Evans",	"Brook Lopez",	"Mason Plumlee",	"Jason Terry"],
    [0,	30,	11,	1,	31],
    [16,	14,	17,	19,	15],
    [22,	12,	17,	26,	19],
    [12,	12,	19,	11,	2],
    [12,	12,	10,	6,	2],
    [3,	12,	3,	3,	4],
    [1,	12,	1,	8,	11],
    [1,	7,	15,	5,	1],
  ]

  away = [
    ["Jeff Adrien",	"Bismack Biyombo",	"DeSagna Diop",	"Ben Gordon",	"Kemba Walker"],
    [4,	0,	2,	8,	33],
    [18,	16,	14,	15,	15],
    [10,	12,	24,	33,	6],
    [1,	4,	12,	3,	12],
    [1,	7,	12,	2,	12],
    [2,	22,	4,	1,	7],
    [7,	15,	5,	1,	5],
    [2,	10,	5,	0,	12]
  ]
  gh[:home][:players] = construct_players(home)
  gh[:away][:players] = construct_players(away)
  return gh
end

def all_players
  gh = game_hash()
  sym = [:home, :away]
  sym.each do |s|
    game_hash[s][:players].each {|player| yield player}
  end
end

def lookup_value player_name, value
  gh = game_hash()
  all_players do |player|
    if player[:player_name] == player_name
      return player[value]
    end
  end
end

def num_points_scored name
  lookup_value(name, :points)
end

def shoe_size name
  lookup_value(name, :shoe)
end

def team_colors team_name
  gh = game_hash()
  sym = [:home, :away]
  sym.each do |s|
    if game_hash[s][:team_name] == team_name
      return game_hash[s][:colors]
    end
  end
end

def team_names
  gh = game_hash()
  [gh[:home][:team_name], gh[:away][:team_name]]
end

def player_numbers team_name
  gh = game_hash()
  sym = [:home, :away]
  nums = []
  sym.each do |s|
    if game_hash[s][:team_name] == team_name
      game_hash[s][:players].each do |player|
        nums << player[:number]
      end
    end
  end
  return nums
end

def player_stats player_name
  gh = game_hash()
  all_players do |player|
    if player[:player_name] == player_name
      player.delete(:player_name)
      return player
    end
  end
end

def big_shoe_rebounds
  gh = game_hash()
  m = 0
  rebounds = 0
  all_players do |player|
    if player[:shoe] > m
      m = player[:shoe]
      rebounds = player[:rebounds]
    end
  end
  return rebounds
end

def most_points_scored
  m = 0
  name = ""
  all_players do |player|
    if player[:points] > m
      m = player[:points]
      name = player[:player_name]
    end
  end
  return name
end

def winning_team
  gh = game_hash
  total = 0
  name = ""
  game_hash.each do |key, h|
    sum = 0
    h[:players].each do |player|
      sum += player[:points]
    end
    if sum > total
      total = sum
      name = h[:team_name]
    end
  end
  return name
end

def player_with_longest_name
  max = ""
  all_players do |player|
    if player[:player_name].size > max.size
      max = player[:player_name]
    end
  end
  return max
end

def long_name_steals_a_ton?
  longest = player_with_longest_name()
  steals = 0
  all_players do |player|
    if player[:player_name] == longest
      steals = player[:steals]
    end
  end
  all_players do |player|
    if player[:steals] > steals
      return false
    end
  end
  return true
end
