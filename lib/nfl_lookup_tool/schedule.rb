class Schedule

    attr_accessor :week, :date, :time, :opponent, :scheduled_game
    
    def initialize(week=nil, date=nil, time=nil, opponent=nil)
        @week = week
        @date = date
        @time = time
        @opponent = opponent
    end

    def scheduled_game(team)
        team.add_game(self) if self.opponent !=""
    end
end