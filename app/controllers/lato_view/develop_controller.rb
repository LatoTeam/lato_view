module LatoView
  # This class is used to show develop pages on development environment.
  class DevelopController < ActionController::Base

    # set lato_view layout
    layout "lato_layout"

    # check user is logged before actions
    before_action :core_controlUser

    # This function render the develop page for lato_view.
    def home
      redirect_to lato_core.root_path if Rails.env.production?
    end

  end

end
