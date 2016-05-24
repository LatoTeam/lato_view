module LatoView
  # Sopraclasse di tutti i concepts
  class Cell < Cell::Concept
    # Imposto la directory che contiene i vari concepts
    view_paths << "#{LatoView::Engine.root}/app/concepts"

    # Includo tutte le funzioni necessarie al corretto funzionamento dei
    # concepts
    include ActionView::Helpers::FormHelper
    include ActionView::Helpers::UrlHelper


    # Funzioni per usare files .erb nelle celle
    include ::Cell::Erb
  end
end
