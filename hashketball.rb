def game_hash
    hash = {}

# this is the home team's hash

    hash[:home] = {}

        hash[:home][:team_name] = ""
        hash[:home][:colors] = []
        hash[:home][:players] = []

        home_players = hash[:home][:players]

        home_players.push({:player_name => ""})
        home_players.push({:number => ""})
        home_players.push({:shoe => ""})
        home_players.push({:points => ""})
        home_players.push({:rebounds => ""})
        home_players.push({:assists => ""})
        home_players.push({:steals => ""})
        home_players.push({:blocks => ""})
        home_players.push({:slam_dunks => ""})

        # Stat	Info	Info	Info	Info	Info
        # Player Name	Alan Anderson	Reggie Evans	Brook Lopez	Mason Plumlee	Jason Terry
        # Number	0	30	11	1	31
        # Shoe	16	14	17	19	15
        # Points	22	12	17	26	19
        # Rebounds	12	12	19	11	2
        # Assists	12	12	10	6	2
        # Steals	3	12	3	3	4
        # Blocks	1	12	1	8	11
        # Slam Dunks	1	7	15	5	1

# this is the away team's hash

    hash[:away] = {}

        hash[:away][:team_name] = ""
        hash[:away][:colors] = []
        hash[:away][:players] = []

        away_players = hash[:away][:players]

        away_players.push({:player_name => ""})
        away_players.push({:number => ""})
        away_players.push({:shoe => ""})
        away_players.push({:points => ""})
        away_players.push({:rebounds => ""})
        away_players.push({:assists => ""})
        away_players.push({:steals => ""})
        away_players.push({:blocks => ""})
        away_players.push({:slam_dunks => ""})

    hash 
end 

puts game_hash

