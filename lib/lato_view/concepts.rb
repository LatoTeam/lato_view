module LatoView

  # Sopraclasse di tutti i concepts
  class Cell < Cell::Concept

    view_paths << "#{LatoView::Engine.root}/app/concepts"

    include ActionView::Helpers::FormHelper
    include ActionView::Helpers::UrlHelper
    include Ransack::Helpers::FormHelper
    include ::Cell::Erb

  end

end
