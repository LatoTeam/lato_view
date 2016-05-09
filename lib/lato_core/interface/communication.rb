module LatoCore
  module Interface

    # Insieme di funzioni che permettono di ottenere informazioni sulla applicazione principale e sulle altre gemme che lavorano su di essa
    module Communication


      # Ritorna il nome dell'applicazione principale settato nel file config/lato/config.yml. Se l'applicazione principale non specifica nessun nome allora la funzione ritorna il valore 'Lato'
      def core_getApplicationName
        directory = core_getCacheDirectory
        if File.exists? ("#{directory}/config.yml")
          config = YAML.load(File.read(File.expand_path("#{directory}/config.yml", __FILE__)))
          if(config and config['app_name'])
            return config['app_name']
          else
            return 'Lato'
          end
        else
          return 'Lato'
        end
      end


      # Esamina tutte le gemme della applicazione principale e ritorna solamente quelle appartenenti al progetto Lato.
      # * *Returns* :
      # - array di stringhe con i nomi delle gemme del progetto Lato usate dall'applicazione
      def core_getLatoGems
        gems = core_getGems
        lato_gems = []
        # controllo ogni gemma
        gems.each do |name|
          if(name.start_with? 'lato')
            lato_gems.push(name)
          end
        end
        # ritorno il risultato
        return lato_gems
      end


      # Ritorna la lista dei nomi delle gemme utilizzate dalla applicazione principale
      # * *Returns* :
      # - array di stringhe con i nomi delle gemme dell'applicazione
      def core_getGems
        require 'bundler'
        return Bundler.load.specs.map { |spec| spec.name }
      end

    end

  end
end
