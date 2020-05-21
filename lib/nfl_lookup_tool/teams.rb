
class Team

    attr_accessor :name, :teams, :conference, :division, :league, :roster_link, :schedule_link
    attr_writer :season

    @@all = []

    def initialize(name)

        @name = name
        @players = []
        @season = []
        @@conferences = ["AFC", "NFC"]
        @@divisions = ["East", "West", "North", "South"]
        @phases_of_game = ["Offense", "Defense", "Special Teams"]
        @@all << self
    end
    
    def self.all
        @@all
    end
    

    def players
        @players
    end
    
    def self.erase_all
        self.all.clear
    end

    
    def self.build_league
        scrape_test = Scrapper.new()
        scrape_test.build_league
    end

    def self.find_by_name(name)
        self.all.find{|team| team.name == name}
    end
    
    #build rosters
    def self.build_team_roster(name)
        selected_team = self.find_by_name(name)
        scrape_current_team = Scrapper.new()
        scrape_current_team.scrape_roster(selected_team.roster_link, selected_team)
        # binding.pry
    end
    #build schedule
    def self.build_team_schedule(name)
        selected_team = self.find_by_name(name)
        scrape_current_team = Scrapper.new()
        scrape_current_team.scrape_schedule(selected_team.schedule_link, selected_team)
    end

    def add_game(game)
        self.season << game
    end

    def phases_of_game
        @phases_of_game
    end

    def self.conferences
        @@conferences
    end

    def self.divisions
        @@divisions
    end


    # team_schedule
    def season
        @season
    end
    #print_team
    def self.print_team(team)
        puts "Name: #{team.name}  Conference: #{team.conference} Division: #{team.division}"
    end

    def self.print_division(conf, division)
        puts "  Division: #{division}"
        Team.all.select{|conf_team|conf_team.conference == conf}.each_with_index do|divi_team, index| 
            Team.print_team(divi_team) if divi_team.division == division
            end
    end

    def self.print_conference(conf)
        puts "Conference: #{conf}"
        Team.divisions.each do |division|
            Team.print_division(conf, division)
        end
    end

    def self.print_league
        puts "NFL"
        Team.conferences.each do |conf|
            Team.print_conference(conf)
        end
    end

    #print team schedule
    def print_team_schedule
        puts "  WK      date            opponent          time   "  
        self.season.each do|game|
            puts "  #{game.week}     #{game.date}      #{game.opponent}      #{game.time} "
        end
        # binding.pry
    end

    # print_roster
    def print_roster
        count = 0
        while count < self.phases_of_game.length
            puts "#{self.phases_of_game[count]}"
            phase = self.players.select{|player|player.phase_of_game == self.phases_of_game[count]}

            phase.each_with_index do|phase_player, index|
                puts "#{index+1}   #{phase_player.name}   #{phase_player.number}  #{phase_player.experience}   #{phase_player.position}"
            end 
            count += 1


        end
    end

    def list_roster_by_phase(phase)
         self.players.select{|player|player.phase_of_game == phase}
    end

    def print_roster_by_phase(phase)
        puts "#{phase}"
        list_roster_by_phase(phase).each_with_index do|player, index|
            puts "#{index+1}   #{player.name}   #{player.number}  #{player.experience}   #{player.position}"
        end       
    end

    def select_player_by_phase_and_index(phase, number) 
         temp_roster = list_roster_by_phase(phase)
         temp_roster[number-1]
    end

       
    def print_player(phase, number)
        selected_player = select_player_by_phase_and_index(phase, number)
        puts "#{number}.   Name: #{selected_player.name}   Jersey Number: #{selected_player.number}  Experience: #{selected_player.experience}   Position: #{selected_player.position}"
    end
end


