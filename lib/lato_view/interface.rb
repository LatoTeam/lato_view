module LatoView
  # Classe che contiene tutti i moduli che generano l'interfaccia del modulo
  module Interface

    # Richiamo il modulo con le funzioni di navigazione
    require 'lato_view/interface/navigation'
    include LatoView::Interface::Navigation
    
  end
end
