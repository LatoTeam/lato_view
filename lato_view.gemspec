$:.push File.expand_path("../lib", __FILE__)

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "lato_view"
  s.version     = "1.1.1"
  s.authors     = ["Gregorio Galante, Antonio Dal Cin, Riccardo Zanutta"]
  s.email       = ["gregogalante@gmail.com"]
  s.homepage    = "https://github.com/LatoTeam/lato_view"
  s.summary     = "Lato module for view elements"
  s.description = "Lato module for view elements"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails"

  # Front-end dependencies
  s.add_dependency "sass-rails"
  s.add_dependency "autoprefixer-rails"
  s.add_dependency "jeet"
  s.add_dependency "selectize-rails"
  s.add_dependency "cells"
  s.add_dependency "cells-erb"

  # Search dependencies
  s.add_dependency "ransack"

  # Pagination
  s.add_dependency "will_paginate"

  # Lato dependencies
  s.add_dependency "lato_core"

end
