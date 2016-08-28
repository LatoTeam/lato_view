module LatoView
  class Engine < ::Rails::Engine
    isolate_namespace LatoView

    # Add routes support
    initializer 'Add gem routes to application',
                before: :load_config_initializers do
      Rails.application.routes.append do
        # modificare "/lato/starter" con l'url di base dei routes del modulo
        mount LatoView::Engine, at: '/lato/view'
      end
    end

    # Set helper to application
    initializer 'Add helpers to application' do
      ActiveSupport.on_load :action_controller do
        helper LatoView::ApplicationHelper
      end
    end
  end
end
