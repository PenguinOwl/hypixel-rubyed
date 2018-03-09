Gem::Specification.new do |spec|
  spec.name        = 'hypixel-ruby' + ENV['TRAVIS_BRANCH'] == "dev" ? '-dev' : ''
  spec.version     = '0.0.1'
  spec.date        = Date.today.to_s
  spec.summary     = "Barebones wrapper for hyixel stats"
  spec.description = "Coming Soon"
  spec.authors     = ["PenguinOwl"]
  spec.files       = ["lib/hypixel-ruby.rb"]
  spec.homepage    = 'https://github.com/PenguinOwl/hypixel-rubyed/'
  spec.license     = 'MIT'
end
