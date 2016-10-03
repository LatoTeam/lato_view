module LatoView
  class Engine < ::Rails::Engine
    isolate_namespace LatoView

    # Add routes support
    initializer 'Add gem routes to application',
                before: :load_config_initializers do
      Rails.application.routes.append do
        mount LatoView::Engine, at: '/lato/view'
      end
    end

    # Set helper to application
    initializer 'Add helpers to application' do
      ActiveSupport.on_load :action_controller do
        helper LatoView::ApplicationHelper
      end
    end

    # Add interface
    config.autoload_paths << LatoView::Engine.root.join('lib/interface')

  end
end
