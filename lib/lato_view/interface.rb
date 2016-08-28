module LatoView
  module Interface

    # Require all interface modules
    require 'lato_view/interface/navigation'
    include LatoView::Interface::Navigation
    require 'lato_view/interface/assets'
    include LatoView::Interface::Assets
    require 'lato_view/interface/images'
    include LatoView::Interface::Images
    require 'lato_view/interface/themes'
    include LatoView::Interface::Themes

  end
end
