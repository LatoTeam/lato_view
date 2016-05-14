module LatoView

  # Classe base usata per le view di sviluppo dell'interfaccia
  class DevelopController < ActionController::Base

    # Imposto layout di base dal lato_view
    layout "lato_layout"

    # Attivo il controllo delle credenziali
    before_action :core_controlUser

    def home

    end

  end

end
