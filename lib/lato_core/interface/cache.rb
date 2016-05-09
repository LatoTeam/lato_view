module LatoCore
  module Interface

    # Insieme di funzioni che gestiscono la cache dei moduli sulla applicazione principale
    module Cache


      # Funzione che ritorna il percorso alla directory di cache usata dai moduli lato per memorizzare informazioni sull'applicazione principale
      def core_getCacheDirectory
        dirname = "#{Rails.root}/config/lato"
        if(!File.exists?(dirname))
          FileUtils.mkdir_p(dirname)
        end

        return dirname
      end

    end

  end
end
