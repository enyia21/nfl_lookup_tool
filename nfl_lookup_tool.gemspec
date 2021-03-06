require_relative 'lib/nfl_lookup_tool/version'

Gem::Specification.new do |spec|
  spec.name          = "nfl_lookup_tool"
  spec.version       = NflLookupTool::VERSION
  spec.authors       = ["chibuisi"]
  spec.email         = ["enyia21@gmail.com"]

  spec.summary       = %q{This Ruby Gem scrapes the cbssports nfl teams page allowing users to interact with info}
  spec.description   = %q{NflLookupTool - searches https://www.cbssports.com/nfl/teams/.  After scraping for NFL teams, Roster and Schedule.  The Application performs a second scrape on the roster link to return information on each player. and the position they play.}
  spec.homepage      = "https://github.com/enyia21/nfl_lookup_tool"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/enyia21/nfl_lookup_tool"
  spec.metadata["changelog_uri"] = "https://nflblahtest.com"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "pry"
  spec.add_dependency "nokogiri"
end
