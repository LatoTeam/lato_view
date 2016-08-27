module LatoView
  # Insieme di helper principali forniti da lato_view per lo sviluppo
  # delle interfacce
  module ApplicationHelper

    # Funzione usata per stampare i vari concepts gestiti e forniti da lato view.
    # Richiede il nome del concept come parametro
    def view(*names)
      cell_class = "LatoView::"
      names.each do |name|
        cell_class = "#{cell_class}#{name.capitalize}::"
      end
      cell_class = "#{cell_class}Cell".constantize
      return cell_class
    end

    # Funzione che stampa una icona svg
    def put_svg(icon)
      # gestisco l'errore se il parametro non è corretto
      raise 'You must send an icon value as parameter' if !icon || icon.nil? || icon.blank?
      # renderizzo l'icona richiesta
      render "lato_view/icons/#{icon}.svg"
    end

  end
end
