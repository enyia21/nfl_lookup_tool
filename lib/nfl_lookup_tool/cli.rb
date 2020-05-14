#this is the CLI that belongs to NflLookUp
class NflLookupTool::CLI
    def call
        greeting
        choose_team
        #     - player_menu
        #     - team_menu
        exit_program
    end
    
    def greeting
        puts "Welcome to the Nfl LookUp Tool!"  
        puts "You can search the nfl for players based on your favorite team."
        
        # Team.build_league
        # Team.build_team_roster("Buffalo Bills")
        # # Team.build_team_schedule("Chicago Bears")
        # # Team.find_by_name("Chicago Bears").print_team_schedule
        # Team.find_by_name("Buffalo Bills").print_roster_by_phase("Special Teams")
        # Team.find_by_name("Buffalo Bills").print_player("Defense" , 2)
    end 

    
        # calls choose_player_or_team
        #     def choose_player_or_team_
        #         compare input to choices
        #             - send users to player_menu
        #             - send users to team_menu
        #             - exit program
        #     
    def choose_team
        print "Please choose how you would like to search: "
        input = gets.strip.downcase
        while (input != "exit_program")
            case input
            # when "player"
            #     puts "You've chosen to look over the player menu"
            #     player_menu
            #     puts "Would you like to continue using the app.  Yes or No (y/n): "
            #     player_continue = gets.strip.downcase
            #     if player_continue == "y"
            #         input = "player"
            #     elsif player_continue == "n"
            #         input = "exit_program"
            #     else 
            #         puts "Please input proper value: You are being returned to the player menu"
            #         input = "player"
            #     end 
            when "team"
                puts "You've chosen to look over the team menu"
                team_menu
                puts "Would you like to continue using the app.  Yes or No (y/n): "
                team_continue = gets.strip.downcase
                if team_continue == "y"
                    input = "team"
                elsif team_continue == "n"
                    input = "exit_program"
                else 
                    puts "Please input proper value: You are being returned to the team menu"
                    input = "team"
                end 
            when "exit"
                puts "You've chosen to exit the program"
                input = "exit_program"
            else 
                puts "Your choice of -- #{input} -- isn't a valid choice for this program. " 
                puts "Please make a choice between team, or exit: "
                input = gets.strip.downcase
            end
        end
    end
            
    def team_menu
        
            Team.build_league
            # input = "Invalid"
            # while input == "Invalid"
            #     puts "Please choose a football team: "
            #     input = gets.strip
            #     if Team.find_by_name(input)
            #         input
            #     else
            #         input = "Invalid"
            #         puts "User input invalid"
            #     end
            # end

            team_search = "incomplete"
            while (team_search != 'complete')
            puts "Would you like view teams listed by league, listed by conference or listed by division "
            printby_league_conference_division = gets.strip
                case printby_league_conference_division
                when "league"
                    Team.print_league
                    puts "Please choose a team:"
                    team_input = gets.strip
                    if Team.find_by_name(team_input)
                        Team.print_team(team_input)
                        puts "Would uou like to "
                    team_search = 'complete'
                when "conference"
                    puts "List of conferences"
                    puts "Choose your conference"
                    puts "Choose your team"
                    team_search = "complete"
                when "division"
                    puts "List of Division"
                    puts "Choose your divsion"
                    puts "Choose your team"
                    team_search = "complete"
                when "exit"
                    puts "exits out of team menu"
                    team_search =  "complete"
                else
                puts "failed proper input"
            end 
        end
    end

    # def player_menu
    #     player_search = "incomplete"
    #     puts "Choose player by: "
    #     while player_search != "complete"
    #         puts "Would you like to search for a player league wide or by position?"
    #         search_league_or_position = gets.strip.downcase
    #         case search_league_or_position
    #         when "league"
    #             puts "Searches the player array and returns information on the player and team"
    #             player_search = "complete"
    #         when "position"
    #             puts "Searches based on the position"
    #             puts "List postions in football"
    #             puts "Calls position class and prints out player by postion."
    #             player_search = "complete"
    #         else
    #             puts "Please place a valid input:"
    #         end
    #     end
    # end
            # For player please type in player or 1 for team type team or 2 to exit type exit
            # get input from user pass into input variable 
            
    def exit_program
        puts ""
        puts "***************************************************************************************************"
        puts "Thank you for using our Nfl lookup tool.   If you'd like to get more infromation about the application do not hesitate to contact us at:"
        puts "Enyia app development!"
        puts "2233 Somewhere St."
        puts "Over-the-rainbow, Hawaii"
        puts "99999"
        puts "****************************************************************************************************"
    end
end



