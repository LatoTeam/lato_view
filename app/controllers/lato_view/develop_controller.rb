module LatoView

  # Classe base usata per le view di sviluppo dell'interfaccia
  class DevelopController < ActionController::Base

    # Includo l'interfaccia di lato_core
    include LatoCore::Interface
    # Includo l'interfaccia di lato_view
    include LatoView::Interface

    # Imposto layout di base dal lato_view
    layout "lato_layout"

    # Attivo il controllo delle credenziali
    before_action :core_controlUser

    def home

    end

  end

end
