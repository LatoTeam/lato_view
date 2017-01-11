module LatoView
  # This module contain functions for assest management.
  module Interface::Assets

    # This function return an array of url of assets from lato gems.
    def view_getLatoAssetsItems
      return VIEW_LATOASSETS if defined? VIEW_LATOASSETS
      # inizializzo la lista degli assets
      assets = []
      # identifico la lista di gemme del progetto Lato usate dalla
      # applicazione
      gems = core_getLatoGems
      # per ogni gemma estraggo i dati necessari a riempire la navbar
      gems.each do |name|
        module_name = name.camelize
        module_root = module_name.constantize::Engine.root
        next unless File.exist? "#{module_root}/config/config.yml"
        # accedo al config.yml
        config = YAML.load(
          File.read(File.expand_path("#{module_root}/config/config.yml",
                                     __FILE__))
        )
        # estraggo i dati dallo yaml
        data = getConfigAssets(config)
        # aggiungo i dati nella risposta
        data.each do |single_asset|
          assets.push(single_asset)
        end
      end
      # ritorno il risultato
      return assets
    end

    # This function return an array of url of assets from lato gems.
    def view_getLatoGMapsKey
      return VIEW_LATOGMAPSKEY if defined? VIEW_LATOGMAPSKEY
      key = ''
      directory = core_getCacheDirectory
      if File.exist? "#{directory}/view.yml"
        # accedo al view.yml
        config = YAML.load(
          File.read(File.expand_path("#{directory}/view.yml", __FILE__))
        )
        key = config['google_maps_key']
      end
      # ritorno il risultato
      return key
    end

    # This function return an array of url of assets from the main application.
    def view_getApplicationsAssetsItems
      return VIEW_APPASSETS if defined? VIEW_APPASSETS
      # inizializzo la lista delle voci della navbar
      assets = []
      directory = core_getCacheDirectory
      if File.exist? "#{directory}/view.yml"
        # accedo al view.yml
        config = YAML.load(
          File.read(File.expand_path("#{directory}/view.yml", __FILE__))
        )
        # estraggo i dati dallo yaml
        data = getConfigAssets(config)
        # aggiungo i dati nella risposta
        data.each do |single_asset|
          assets.push(single_asset)
        end
      end
      # ritorno il risultato
      return assets
    end

    # This function return an array of url from the config file of a lamo module.
    private def getConfigAssets(config)
      # inizializzo la lista di dati
      results = []
      # se il file e' formattato correttamente esamino ogni sua voce
      if config && config['assets']
        config['assets'].each do |voice|
          # estraggo i dati
          # unique_name = voice[0]
          name = voice[1]['name'].downcase
          type = voice[1]['type'].downcase
          # genero l'oggetto con le informazioni di output
          output_voice = {
            name: name,
            type: type
          }
          # aggiungo la voce al risultato
          results.push(output_voice)
        end
      end
      # ritorno il risultato
      results
    end

  end
end
