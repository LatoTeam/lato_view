include LatoCore::Interface

module LatoView
  module Interface::Assets

    # Funzione che ritorna un array contenente gli url relativi degli assets
    # delle gemme lato da usare nel layout di lato
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

    # Funzione che ritorna un array contenente gli url relativi degli assets
    # della applicazione principale da usare nel layout di lato
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

    # Estrae i dati relativi agli assets dal file config.yml di una
    # applicazione controllando che la struttura del file sia corretta
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
