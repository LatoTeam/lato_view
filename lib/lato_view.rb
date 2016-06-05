# Lato View e' il modulo del progetto Lato che si occupa di fornire tutti gli
# elementi utili a definire l'interfaccia grafica. Questo modulo, anche se
# non esplicitamente definito, e' una dipendenza obbligatoria per qualsiasi
# altro modulo Lato.
module LatoView
  # Gemme di dipendenza
  require 'sass-rails'
  require 'autoprefixer-rails'
  require 'jeet'
  require 'selectize-rails'
  require 'cells'
  require 'cells-erb'
  require 'ransack'
  require 'will_paginate'

  # Moduli della gemma
  require 'lato_view/engine'
  require 'lato_view/interface'
  require 'lato_view/concepts'
end
