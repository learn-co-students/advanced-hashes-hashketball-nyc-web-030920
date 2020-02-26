def game_hash
hash = {
    :home => {
        :team_name => "Brooklyn Nets",
        :colors => ["Black", "White"],
        :players => [
            {:player_name=>"Alan Anderson", :number=>0, :shoe=>16, :points=>22, :rebounds=>12, :assists=>12, :steals=>3, :blocks=>1, :slam_dunks=>1},
            {:player_name=>"Reggie Evans", :number=>30, :shoe=>14, :points=>12, :rebounds=>12, :assists=>12, :steals=>12, :blocks=>12, :slam_dunks=>7},
            {:player_name=>"Brook Lopez", :number=>11, :shoe=>17, :points=>17, :rebounds=>19, :assists=>10, :steals=>3, :blocks=>1, :slam_dunks=>15},
            {:player_name=>"Mason Plumlee", :number=>1, :shoe=>19, :points=>26, :rebounds=>11, :assists=>6, :steals=>3, :blocks=>8, :slam_dunks=>5},
            {:player_name=>"Jason Terry", :number=>31, :shoe=>15, :points=>19, :rebounds=>2, :assists=>2, :steals=>4, :blocks=>11, :slam_dunks=>1}
        ]
    },

    :away => {
        :team_name => "Charlotte Hornets", 
        :colors => ["Turquoise", "Purple"],
        :players => [
            {:player_name=>"Jeff Adrien", :number=>4, :shoe=>18, :points=>10, :rebounds=>1, :assists=>1, :steals=>2, :blocks=>7, :slam_dunks=>2},
            {:player_name=>"Bismack Biyombo", :number=>0, :shoe=>16, :points=>12, :rebounds=>4, :assists=>7, :steals=>22, :blocks=>15, :slam_dunks=>10},
            {:player_name=>"DeSagna Diop", :number=>2, :shoe=>14, :points=>24, :rebounds=>12, :assists=>12, :steals=>4, :blocks=>5, :slam_dunks=>5},
            {:player_name=>"Ben Gordon", :number=>8, :shoe=>15, :points=>33, :rebounds=>3, :assists=>2, :steals=>1, :blocks=>1, :slam_dunks=>0},
            {:player_name=>"Kemba Walker", :number=>33, :shoe=>15, :points=>6, :rebounds=>12, :assists=>12, :steals=>7, :blocks=>5, :slam_dunks=>12}
        ]
    }
}

hash 
end 

def num_points_scored(player_name)
    number = ""
    hash = game_hash

    hash.each { |key, value|
    #key = :away, value = {:team_name => "Charlotte Hornets"}

    value[:players].each  { |k, v|
        if k[:player_name] == player_name
            number = k[:points]
        end
        }
    } 
    
    number
end 

def shoe_size(player_name)
    shoe_size = ""
    hash = game_hash

    hash.each { |key, value|
    #key = :away, value = {:team_name => "Charlotte Hornets"}

    value[:players].each  { |k, v|
        if k[:player_name] == player_name
            shoe_size = k[:shoe]
        end
        }
    } 
    
    shoe_size
end 

def team_colors(team)
    hash = game_hash
    colors = ""

    hash.each { |key, value|
        if value[:team_name] == team 
            colors = value[:colors] 
        end 
    }

    colors
end 

def team_names
    team_names = []
    hash = game_hash

    hash.each { |key, value|
        team_names.push(value[:team_name])
    }

    team_names
end

def player_numbers(team)
    jersey_numbers = []
    hash = game_hash

    hash.each { |key, value|
        value[:players].each  { |k, v|

        if value[:team_name] == team
            jersey_numbers.push(k[:number])
        end 
            }
        }

    jersey_numbers
end 

def player_stats(name)
    hash = game_hash
    stats = {}

    hash.each { |key, value|
        value[:players].each  { |k, v|

        if k[:player_name] == name
            stats = k
            stats.reject! { |k|
                k == :player_name
            }
        end 

            }
        }

    stats
end 

# Return the number of rebounds associated with the player that has the largest shoe size.
# Break this one down into steps:

# First, find the player with the largest shoe size
# Then, return that player's number of rebounds
# Remember to think about return values here.

def big_shoe_rebounds
    hash = game_hash
    x = 0
    rebounds = 0

    hash.each { |key, value|
    value[:players].each  { |k, v|
        if x < k[:shoe]
            x = k[:shoe]
            rebounds = k[:rebounds]
        end
        }
    } 
    rebounds
end 