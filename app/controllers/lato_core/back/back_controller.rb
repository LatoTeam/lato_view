module LatoCore

  # Classe che gestisce il pannello di backoffice del modulo
  class Back::BackController < ApplicationController
    # Includo l'interfaccia di lato_core
    include LatoCore::Interface
    # Includo l'interfaccia di lato_view
    include LatoView::Interface

    # Imposto layout di base dal lato_view
    layout "lato_layout"

    # Attivo il controllo delle credenziali
    before_action :core_controlUser, :except => [:login, :exec_login]


    # Richiama la view della home del pannello di backoffice
    def home
      @message = CORE_LANG['welcome'] + " " + CORE_APPNAME
    end

  end

end
