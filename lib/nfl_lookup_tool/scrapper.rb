# require 'nokogiri'
# require 'open-uri'
# require 'pry'
class Scrapper

    attr_accessor :league, :conference, :division, :team, :player, :site
    
    def initialize
        
        @@nfl_divisions = []
               
    end
    
    def build_league

        site = "https://www.cbssports.com/nfl/teams/"
        doc = Nokogiri::HTML(open(site)) 
        conference_scrape = doc.css("div.TeamIndexContainer .TableBaseWrapper")
        conference_scrape.each do |conf|
            self.conference = conf.css("div.TeamLogoNameLockup span.TeamLogoNameLockup-name").text.strip
            puts conference
            
            divisions= conf.css("tr.TableBase-headTr")
            divisions.each do |divi| 
                division = divi.text.strip 
                @@nfl_divisions << division
            end
            teams = conf.css(".TableBase-bodyTr")
            teams.each_with_index do |our_team, index|
                current_team_name = our_team.css(".TeamName").text

                current_team_link = our_team.css("a").attribute("href").value
                current_team_link = "https://www.cbssports.com" + current_team_link
                
                #Creates new team from scraped team names
                # binding.pry
                nfl_team = Team.new(current_team_name)
                
                #Associates Created team with conference
                nfl_team.conference = conference

                #Associates Created team with division
                if index < 4
                    nfl_team.division = @@nfl_divisions[0]
                elsif index < 8 
                    nfl_team.division = @@nfl_divisions[1]
                elsif index < 12
                    nfl_team.division = @@nfl_divisions[2]
                else
                    nfl_team.division = @@nfl_divisions[3]
                end

                
                roster_scrape_link = our_team.css(".TableBase-bodyTd")[2].css("a").attribute("href").value
                roster_scrape_link = "https://www.cbssports.com" + roster_scrape_link
                nfl_team.roster_link = roster_scrape_link

                schedule_scrape_link = our_team.css(".TableBase-bodyTd")[3].css("a").attribute("href").value
                schedule_scrape_link = "https://www.cbssports.com" + schedule_scrape_link
                nfl_team.schedule_link = schedule_scrape_link

            end
            
        end
    end
    
    
    
    def scrape_roster(link, passed_team)
        site = link
        doc = Nokogiri::HTML(open(site))
        roles = doc.css("#TableBase")
        roles.each do|role|
            role_played = role.css("h4.TableBase-title").text.strip
            players = role.css("tr.TableBase-bodyTr")
            players.each do|each_player|
                player_name = each_player.css("td.TableBase-bodyTd .CellPlayerName--long a").text.strip
                player_number = each_player.css("td.TableBase-bodyTd")[0].text.strip
                player_position = each_player.css("td.TableBase-bodyTd")[2].text.strip
                added_player = Player.new(player_name, passed_team, player_position)
                added_player.number = player_number
                player_experience = each_player.css("td.TableBase-bodyTd")[6].text.strip
                added_player.experience = player_experience
                added_player.phase_of_game = role_played

            end     
        end
        nil
    end
    
    def scrape_schedule(link, passed_team)
        site = link
        doc = Nokogiri::HTML(open(site))
        season_schedule = doc.css(".TableBaseWrapper").css(".TableBase-bodyTr")
        season_schedule.each do|week|
            game_week = week.css("td.TableBase-bodyTd")[0].text.strip
            game_date = week.css("td.TableBase-bodyTd")[1].text.strip
            opponent = week.css("td.TableBase-bodyTd .TeamName").text.strip
            game_time = week.css("td.TableBase-bodyTd .CellGame").text.strip
            team_schedule = Schedule.new(game_week, game_date, game_time, opponent)
            team_schedule.scheduled_game(passed_team)
        end
    end 
end