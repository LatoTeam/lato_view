module LatoView
  # This class is used to render elements used as assets for cells.
  class AssetsController < ActionController::Base

    # check user is logged before actions
    before_action :core_controlUser

    # This function render the trumbowyg assets.
    def trumbowyg_icons
      send_file "#{LatoView::Engine.root}/app/assets/images/lato_view/vendor/trumbowyg_icons.svg", type: 'image/svg+xml'
    end

  end

end
