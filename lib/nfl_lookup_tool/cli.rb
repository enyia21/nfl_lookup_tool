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
    end 

    
        # calls choose_player_or_team
        #     def choose_player_or_team_
        #         compare input to choices
        #             - send users to player_menu
        #             - send users to team_menu
        #             - exit program
        #     
    def choose_team
        print "Please type --- team ---  to search for a team or === exit === to exit. "
        input = gets.strip.downcase
        while (input != "exit_program")
            case input
            when "team"
                puts "You've chosen to look over the team menu"
                team_menu
                puts "Would you like to continue using the app.  Yes or No (y/n): "
                team_continue = gets.strip
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
            team_search = "incomplete"
            while (team_search != 'complete')
            puts "Would you like view teams listed by league or by conference"
            printby_league_conference = gets.strip
                case printby_league_conference
                when "league"
                    league_prompt
                    team_search = 'complete'
                when "conference"
                    conference_prompt
                    team_search = "complete"
                when "exit"
                    puts "exits out of team menu"
                    team_search =  "complete"
                else
                puts "failed proper input"
            end 
        end
    end

    def league_prompt
        Team.print_league
        binding.pry
        user_question = "unanswered"
        while user_question != "answered" 
            puts "Please input a team name: "
            team_name_input = gets.strip
            failed_input_count = 0
            if Team.find_by_name(team_name_input)
                puts "Would you like to view roster, or team schedule?  Please type roster, schedule or exit"
                input = gets.strip
                team = Team.find_by_name(team_name_input)
                if input == "schedule"
                    Team.build_team_schedule(team_name_input)
                    team.print_team_schedule
                    user_question = "answered"
                elsif input== "roster"
                    Team.build_team_roster(team_name_input)
                    team.print_roster
                    puts "Would you like more information about a player on the team?"
                    user_question = "answered"
                elsif input == "exit"
                    puts "You are now exiting the league search!"
                    user_question = "answered"
                else
                    puts "Please make sure you type in the information correctly!"
                    failed_input_count += 1
                    if failed_input_count == 10
                        puts "Too many failures.  Please try again at another time!"
                        user_question = "answered"
                    else
                        user_question = "unanswered"
                    end
                end
            else
                puts "Please input a valid team"
                failed_input_count += 1
                if failed_input_count == 10
                    puts "Too many failures.  Please try again at another time!"
                    user_question = "answered"
                else
                    user_question = "unanswered"
                end
            end
        end
    end

    # def conference_prompt
        
    #     user_question = "unanswered"
    #     puts "Please input which conference you would like to view: AFC, NFC, or exit"
    #     user_input = gets.strip
    #     count = 0 
    #     unless user_question == "answered" || count > 10 
    #         if user_input == "AFC"
    #             Team.print_conference(user_input)

    #             user_question = 'answered'
    #         elsif user_input == "NFC"
    #             Team.print_conference(user_input)

    #             user_question = 'answered'
    #         elsif user_input == "exit"
    #             puts "You will be returned to the previous menu now!"
    #             user_question = 'answered'
    #         else
    #             puts "Please place valid information or the program will exit!"
    #             count = +1
    #             if count > 10
    #                 user_question = "answered"
    #                 puts "TOO MANY ERRORS WERE MADE!"
    #             end
    #         end
    #     end

    #     while user_question != "answered" 
    #         puts "Please input a team name: "
    #         team_name_input = gets.strip
    #         failed_input_count = 0
    #         if Team.find_by_name(team_name_input)
    #             puts "Would you like to view roster, or team schedule?  Please type roster, schedule or exit"
    #             input = gets.strip
    #             team = Team.find_by_name(team_name_input)
    #             if input == "schedule"
    #                 Team.build_team_schedule(team_name_input)
    #                 team.print_team_schedule
    #                 user_question = "answered"
    #             elsif input== "roster"
    #                 Team.build_team_roster(team_name_input)
    #                 team.print_roster
    #                 puts "Would you like more information about a player on the team?"
    #                 user_question = "answered"
    #             elsif input == "exit"
    #                 puts "You are now exiting the league search!"
    #                 user_question = "answered"
    #             else
    #                 puts "Please make sure you type in the information correctly!"
    #                 failed_input_count += 1
    #                 if failed_input_count == 10
    #                     puts "Too many failures.  Please try again at another time!"
    #                     user_question = "answered"
    #                 else
    #                     user_question = "unanswered"
    #                 end
    #             end
    #         else
    #             puts "Please input a valid team"
    #             failed_input_count += 1
    #             if failed_input_count == 10
    #                 puts "Too many failures.  Please try again at another time!"
    #                 user_question = "answered"
    #             else
    #                 user_question = "unanswered"
    #             end
    #         end
    #     end
    # end

    
    
    #Present team prompt 
    #conference ask
    #Pick Team

    
    def pick_your_team(conf)
        case conf     
        when nil
        
        when "AFC"
            puts "Please pick your team from the conference list of teams available"
            input = gets.strip
            user_team = CLI.valid_team(input)
            CLI.roster_or_schedule(user_team)
        when "NFC"
            puts "Please pick your team from the conference list of teams available"
            input = gets.strip
            user_team = CLI.valid_team(input)
            CLI.roster_or_schedule(user_team)
        else
            puts "Error: Your Logic has failed.  Conf should only have AFC or NFC passed into it"
        end

    end
    #team find_by_name

    def self.valid_team(team_name)
        unless Team.find_by_name(team_name) 
            puts "Please input a team:"
            team_name = gets.strip
        end
        Team.find_by_name(team_name)
    end

    def self.roster_or_schedule(team)
        user_input = 'none'
        unless user_input == 'roster' || user_input == 'schedule'
            puts "Please type roster or schedule into the console!"
            user_input = gets.strip
        end

        if user_input == 'roster'
            Team.build_team_roster(team.name)
            team.print_roster
        end

        if user_input == 'schedule'
            Team.build_team_schedule(team.name)
            team.print_team_schedule
        end
    end

    


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



