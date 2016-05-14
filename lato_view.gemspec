$:.push File.expand_path("../lib", __FILE__)

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "lato_view"
  s.version     = "0.1.0"
  s.authors     = ["Gregorio Galante, Antonio Dal Cin, Riccardo Zanutta"]
  s.email       = ["gregogalante@gmail.com"]
  s.homepage    = "http://www.gregoriogalante.com"
  s.summary     = "Starter kit for new Lato module"
  s.description = "Starter kit for new Lato module"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.5.1"

  # Front-end dependencies
  s.add_dependency "sass-rails"
  s.add_dependency "autoprefixer-rails"
  s.add_dependency "jeet"
  s.add_dependency "selectize-rails"
  s.add_dependency "cells"
  s.add_dependency "cells-erb"

  # Lato dependencies
  s.add_dependency "lato_core"

end
