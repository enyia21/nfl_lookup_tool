1. Flow
    a. ClI
    b. Classes
    c. Scrapepr
    d. Object 
Build Skelclass 

    NflLookupTool::CLI
        def call
            greeting
            choose_player_or_team
                - player_menu
                - team_menu
            exit
        end

        def greeting
            Welcome to the Nfl LookUp Tool.  You can search the nfl for players based on your favorite team or players
            Please choose how you would like to search
            For player please type in player or 1 for team type team or 2 to exit type exit
            get input from user pass into input variable 
            calls choose_player_or_team
        end
        
        def choose_player_or_team_
            compare input to choices
                - send users to player_menu
                - send users to team_menu
                - exit program
        end
        
        def player_menu
            player_menu allows you to choose players by position or exit player menu
            if you choose to choose players by position it will list off all position on the football field
                based on position lists off all players in the league who play that position
            returns a list of players who play that position 
            allows you to select a player from the list of players who plays that postion
            prints the team the player plays on that team and possibly opens a link to the players bio on cbs sports
            return you to the player menu
            if you choose exit you are returned to the choose_player_or_team menu
        end

        def team_menu
            team_menu allows you to choose a team or exit menu
            if you choose a team you are given the choice of selecting team roster, or a team schedule or exit
                if you choose team roster, roster is printed by postion and players can be choosen or exit
                    if player is chosen. prints to screen that the player plays on the team and possibly opens linke to cbs sports bio
                if player team schedule then the team schedule is printed to screen and you are given the choice to exit the screen 
                if you choose to exit you are returned to the choose player or team menu
        end
    
        def exit program
            prints exit message thankin users for using the app.  and exiting the app
        end

    end

    


2. Classes
    2a. class relationships

What would i like to have happen>

User enters app.  
User has a choice between selecting a team or a player
If user selects team 
    then user has the choice between 
        printing out the team schedule, 
        printing out the print out players,
if user selects player
    then 


