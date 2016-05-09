module LatoCore
  module Interface

    # Insieme di funzioni che determinano e gestiscono le informazioni riguardo alle lingue dell'applicazione tra le sezioni offerte dai moduli lato
    module Languages


      # Funzione che ritorna true se l'applicazione ha più lingue, false se l'applicazione ha una singola lingua
      def core_applicationHasLanguages
        if(CORE_APPLANGUAGES)
          return (CORE_APPLANGUAGES.length > 1)
        else
          languages = core_getApplicationLanguages
          return (languages.length > 1)
        end
      end


      # Funzione che ritorna un array contenente le lingue gestite dall'applicazione
      def core_getApplicationLanguages
        # definisco variabile di ritorno
        languages = false
        if File.exists? ("#{Rails.root}/config/lato/config.yml")
          # accedo al config.yml
          config = YAML.load(File.read(File.expand_path("#{Rails.root}/config/lato/config.yml", __FILE__)))
          if(config['languages'])
            languages = config['languages'].split(',')

            languages.each do |language|
              language = language.downcase.gsub(" ", "")
            end
          end
        end
        # ritorno il risultato
        return languages
      end


      # Funzione che ritorna la lettura del file di lingua corretto per il modulo il cui nome è ricevuto come parametro
      def core_loadModuleLanguages(module_name)

          module_root = module_name.camelize.constantize::Engine.root

          if File.exists? ("#{module_root}/lang/#{I18n.locale}.yml")
            return YAML.load(File.read(File.expand_path("#{module_root}/lang/#{I18n.locale}.yml", __FILE__)))
          else
            return YAML.load(File.read(File.expand_path("#{module_root}/lang/default.yml", __FILE__)))
          end
      end

    end

  end
end
