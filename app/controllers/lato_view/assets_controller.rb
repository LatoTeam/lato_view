module LatoView
  # Classe usata per ritornare alcuni file assets utili per l'interfaccia di
  # lato_view.
  class AssetsController < ActionController::Base

    # Attivo il controllo delle credenziali (evito di mandare gli assets se
    # non sono necessari fuori dal pannello di amministrazione)
    before_action :core_controlUser

    # Pagina che ritorna il file svg usato dall'input editor gestito
    # tramite libreria trumbowyg
    def trumbowyg_icons
      send_file "#{LatoView::Engine.root}/app/assets/images/lato_view/vendor/trumbowyg_icons.svg", type: 'image/svg+xml'
    end

  end

end
