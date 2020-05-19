# NflLookupTool

* Find out how to access nfl network.

This is a simple ruby gem that allows users to look up a football team.  They can print out the roster as well as the schedule.   The website https://www.cbssports.com/nfl/teams/ is scrapped to grab NFL teams.   The roster and the schedule are passed into the methods that scrapes the roster and schedule for selected teams.  

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'nfl_lookup_tool'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install nfl_lookup_tool

## Usage

NFL Lookup Tool

## Getting Started:

### Installing

---
bundle gem nfl_lookup_tool

git remote add origin https://github.com/enyia21
/nfl_lookup_tool.git

git push -u origin master

---

## Objectives:
* Build a CLI 
* Create a method that engages in a two level scrape.  


## Overview:

This website is designed to allow users to search for there favorite footall team by viewing the entire league or each conference of football teams.  Scapper class works with the Team class to provide information for the Command Line Interface(CLI) to use.  

User can select a team and then choose whether they would like to know the current roster of the football team or the schedule for the upcomming season.

Utilize scrapping techniques to scrape the cbs sports nfl page to pull data about nfl teams and there repective schedules

## Deployment
 * Ruby - Web Framework


We added these dependencies in order to deploy live: 
  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "pry"
  spec.add_dependency "nokogiri"

# Authors
* Chibuisi Enyia



## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[enyia21]/nfl_lookup_tool. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[enyia21]/nfl_lookup_tool/blob/master/CODE_OF_CONDUCT.md).


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the NflLookupTool project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/nfl_lookup_tool/blob/master/CODE_OF_CONDUCT.md).
