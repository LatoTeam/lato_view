module LatoView

  # Classe che gestisce l'inizializzazione del modulo
  class Engine < ::Rails::Engine
    isolate_namespace LatoView

    # Aggiunta del supporto ai routes
    initializer "Add gem routes to application", before: :load_config_initializers do |app|
      Rails.application.routes.append do
        # modificare "/lato/starter" con l'url di base dei routes del modulo
        mount LatoView::Engine, at: "/lato/view"
      end
    end

    # Imposto tutt gli helper disponibili di default
    initializer 'Add helpers to application' do |app|
      ActiveSupport.on_load :action_controller do
        helper LatoView::ApplicationHelper
      end
    end

  end

end
