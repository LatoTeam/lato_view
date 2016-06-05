module LatoView
  # Classe base usata per le view di sviluppo dell'interfaccia
  class DevelopController < ActionController::Base
    # Imposto layout di base dal lato_view
    layout "lato_layout"

    # Attivo il controllo delle credenziali
    before_action :core_controlUser

    # Pagina di visualizzazione degli elementi statici dell'interfaccia
    def home
      redirect_to lato_core.root_path if Rails.env.production?
    end

  end

end
