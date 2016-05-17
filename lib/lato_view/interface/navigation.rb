module LatoView
  module Interface
    # Insieme di funzioni usate per modificare l'aspetto della navbar del
    # sistema
    module Navigation
      # Funzione che prende una stringa come parametro e, se essa e' presente
      # come nome univoco tra le voci della navbar la imposta come voce con
      # classe active nella navigazione
      def view_setCurrentVoice(unique_name)
        @view_navbar_unique_name = unique_name
      end
      # Fine funzioni modulo
    end
    # Fine modulo
  end
end
