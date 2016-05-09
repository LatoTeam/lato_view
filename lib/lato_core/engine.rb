module LatoCore

  # Classe che gestisce l'inizializzazione del modulo
  class Engine < ::Rails::Engine
    isolate_namespace LatoCore

    # Aggiunta del supporto alle migrazioni
    initializer "Add migration support" do |app|
      unless app.root.to_s.match root.to_s
        config.paths["db/migrate"].expanded.each do |expanded_path|
          app.config.paths["db/migrate"] << expanded_path
        end
      end
    end

    # Aggiunta del supporto ai routes
    initializer "Add gem routes to application", before: :load_config_initializers do |app|
      Rails.application.routes.append do
        # modificare "/lato/starter" con l'url di base dei routes del modulo
        mount LatoCore::Engine, at: "/lato/core"
      end
    end

  end
end
