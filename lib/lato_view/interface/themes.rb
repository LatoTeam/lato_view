module LatoView
  # This module contain functions used to manage themes.
  module Interface::Themes

    # This function return the name of the current theme used for the
    # application.
    def view_getCurrentTemplateName
      return VIEW_CURRENTTEMPLATENAME if defined? VIEW_CURRENTTEMPLATENAME
      directory = core_getCacheDirectory
      if File.exist? "#{directory}/view.yml"
        # accedo al view.yml
        config = YAML.load(
          File.read(File.expand_path("#{directory}/view.yml", __FILE__))
        )
        # verifico esistenza dati
        if !config || !config['template']
          return false
        end
        # verifico che il template sia valido
        unless VIEW_TEMPLATES.include? config['template']
          raise 'Template value is not correct on view.yml config file' and return false
        end
        # ritorno nome template
        return config['template']
      else
        return false
      end
    end

  end
end
