class Player

    @@all = []
    attr_accessor :name, :number, :experience, :phase_of_game
    attr_reader :team, :position
    
    #takes input of a name and posibly team and position on initialization
    #add every player to the 
    def initialize(name, team=nil, position=nil)
        @name = name
        self.team= team if team
        self.position= position if position
        @@all << self
    end
    
    def self.all
        @@all
    end

    def position=(position)
        @position = position
    end

    def team=(team)
        @team = team
        team.players << self if !team.players.include?(self)
    end 

    def self.find_by_name(name)
        Player.all.find{|player| player if player.name == name}
    end
    
end 