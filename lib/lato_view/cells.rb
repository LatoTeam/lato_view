module LatoView
  # Cells superclass
  class Cell < Cell::Concept

    # Set cells directory
    view_paths << "#{LatoView::Engine.root}/app/cells"

    # Include cells dependencies
    include ActionView::Helpers::FormHelper
    include ActionView::Helpers::UrlHelper
    include ActionView::Helpers::CaptureHelper
    include ERB::Util
    include ::Cell::Erb

  end
end
