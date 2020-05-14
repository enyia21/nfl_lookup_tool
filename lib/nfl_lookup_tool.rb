require_relative "./nfl_lookup_tool/version"
require_relative "./nfl_lookup_tool/cli"
require_relative "./nfl_lookup_tool/teams.rb"
require_relative "./nfl_lookup_tool/scrapper.rb"
require_relative "./nfl_lookup_tool/players.rb"
require_relative "./nfl_lookup_tool/schedule.rb"
require "bundler"

module NflLookupTool
  class Error < StandardError; end
  # Your code goes here...
end

# module Concerns
#     module Findable
#         def find_by_name(name)
#             self.all.find{|player| player if player.name == name}
#         end

#         def find_or_create_by_name(name)
#             if self.find_by_name(name)
#                 self.find_by_name(name)
#             else
#                 self.create(name)
#             end
#         end
#     end
# end

