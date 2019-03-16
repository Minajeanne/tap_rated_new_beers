
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "tap_rated_new_beers/version"
require 'pry'
require 'colorized_string'

Gem::Specification.new do |spec|
  spec.name          = "tap_rated_new_beers"
  spec.version       = TapRatedNewBeers::VERSION
  spec.authors       = ["Minajeanne"]
  spec.email         = ["albrown07@mac.com"]

  spec.summary       = %q{"A ruby gem to view Beeradvocate's top 50 beers"}
  spec.description   = %q{"A ruby gem to view Beeradvocate's top 50 beers with the option to learn more about each beer and directly access the brewery's website"}
  spec.homepage      = "https://github.com/Minajeanne/tap_rated_new_beers.git"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "http://RubyGems.org"

    spec.metadata["homepage_uri"] = spec.homepage
    spec.metadata["source_code_uri"] = "https://github.com/Minajeanne/tap_rated_new_beers.git"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

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
  spec.add_development_dependency "rspec", "~> 3.2"
  spec.add_development_dependency "cucumber", "~> 1.3.20"
  spec.add_development_dependency "aruba"
  spec.add_development_dependency 'launchy', '~> 2.4', '>= 2.4.3'
  spec.add_development_dependency 'colorize', '~> 0.8.1'
end
