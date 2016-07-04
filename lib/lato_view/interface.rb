module LatoView
  # Classe che contiene tutti i moduli che generano l'interfaccia del modulo
  module Interface

    # Richiamo il modulo con le funzioni di navigazione
    require 'lato_view/interface/navigation'
    include LatoView::Interface::Navigation
    # Richiamo funzioni per la gestione degli assets
    require 'lato_view/interface/assets'
    include LatoView::Interface::Assets
    # Richiamo il modulo con le funzioni di gestione immagini pannello
    require 'lato_view/interface/images'
    include LatoView::Interface::Images

  end
end
