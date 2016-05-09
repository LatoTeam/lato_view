module LatoView
  module ApplicationHelper

    # Funzione usata per stampare i vari concepts gestiti e forniti da lato view
    # Richiede il nome del concept come parametro
    def view(name)
      class_string = "LatoView::#{name.capitalize}::Cell"
      return class_string.constantize
    end

    # Helper icone svg
    def putSvg(icon)
      if(!icon or icon.nil? or icon.blank?)
        return ''
      end
      render "lato_view/icons/#{icon}.svg"
    end

  end
end
