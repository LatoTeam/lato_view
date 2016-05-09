$:.push File.expand_path("../lib", __FILE__)

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "lato_core"
  s.version     = "0.1.0"
  s.authors     = ["Gregorio Galante"]
  s.email       = ["gregogalante@gmail.com"]
  s.homepage    = "http://www.gregoriogalante.com"
  s.summary     = "Starter kit for new Lato module"
  s.description = "Starter kit for new Lato module"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.5.1"
  s.add_dependency "bcrypt"


end
