module LatoCore
  module Interface

    # Insieme di funzioni che determinano e gestiscono le informazioni riguardo alla navigazione tra le sezioni offerte dai moduli lato
    module Navigation

      # Ritorna un array contenente le voci che andranno a formare il menu di navigazione del backoffice.
      # * *Returns* :
      # - array di hash contenenti i dati delle voci di menu
      def core_getNavbarItems
        return getApplicationNavbarItems + getLatoNavbarItems
      end

      # Ritorna un array contenente le voci delle gemme lato che andranno a formare il menu di navigazione del backoffice.
      # * *Returns* :
      # - array di hash contenenti i dati delle voci di menu
      private def getLatoNavbarItems
        # inizializzo la lista delle voci della navbar
        navbar_items = []
        # identifico la lista di gemme del progetto Lato usate dalla applicazione
        gems = core_getLatoGems()
        # per ogni gemma estraggo i dati necessari a riempire la navbar
        gems.each do |name|
          module_name = name.camelize
          module_root = module_name.constantize::Engine.root

          if File.exists? ("#{module_root}/config/config.yml")
            # accedo al config.yml
            config = YAML.load(File.read(File.expand_path("#{module_root}/config/config.yml", __FILE__)))
            # estraggo i dati dallo yaml
            data = getConfigNavbarData(config)
            # aggiungo i dati nella risposta
            data.each do |single_voice|
              navbar_items.push(single_voice)
            end
          end
        end
        # ritorno il risultato
        return navbar_items
      end

      # Ritorna un array contenente le voci della applicazione principale che andranno a formare il menu di navigazione del backoffice.
      # * *Returns* :
      # - array di hash contenenti i dati delle voci di menu
      private def getApplicationNavbarItems
        directory = core_getCacheDirectory
        # inizializzo la lista delle voci della navbar
        navbar_items = []

        if File.exists? ("#{directory}/config.yml")
          # accedo al config.yml
          directory = core_getCacheDirectory
          config = YAML.load(File.read(File.expand_path("#{directory}/config.yml", __FILE__)))
          # estraggo i dati dallo yaml
          data = getConfigNavbarData(config)
          # aggiungo i dati nella risposta
          data.each do |single_voice|
            navbar_items.push(single_voice)
          end
        end
        # ritorno il risultato
        return navbar_items
      end

      # Estrae i dati relativi alla navbar dal file config.yml di una applicazione controllando che la struttura del file sia corretta
      private def getConfigNavbarData(config)
        # inizializzo la lista di dati
        results = []
        # se il file è formattato correttamente esamino ogni sua voce
        if(config and config['menu'])
          config['menu'].each do |voice|
            # estraggo i dati
            unique_name = voice[0]
            name = voice[1]['name'].capitalize
            url = voice[1]['url'].downcase
            icon = voice[1]['icon'].downcase
            position = voice[1]['position']
            permission = voice[1]['permission']
            # genero l'oggetto con le informazioni di output
            output_voice = {
              :unique_name => unique_name,
              :name => name,
              :url =>  url,
              :icon => icon,
              :position => position,
              :permission => permission
            }
            # aggiungo la voce al risultato
            results.push(output_voice)
          end
        end
        # ritorno il risultato
        return results
      end

    end

  end
end
