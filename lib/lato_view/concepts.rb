module LatoView
  # Sopraclasse di tutti i concepts
  class Cell < Cell::Concept
    # Imposto la directory che contiene i vari concepts
    view_paths << "#{LatoView::Engine.root}/app/concepts"

    # Includo tutte le funzioni necessarie al corretto funzionamento dei
    # concepts

    # Funzione per utilizzare helper forms di rails
    include ActionView::Helpers::FormHelper
    # Funzione per utilizzare helpers url di rails
    include ActionView::Helpers::UrlHelper
    # Funzioni per utilizzare ransack
    include Ransack::Helpers::FormHelper
    # Funzioni per usare files .erb nelle celle
    include ::Cell::Erb
  end
end
