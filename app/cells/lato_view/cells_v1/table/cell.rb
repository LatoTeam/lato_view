module LatoView
  # Cella usata per la generazione di tabelle.
  module CellsV1::Table
    # Cella Table
    class Cell < Cell
      # Array contenente l'intestazione della tabella
      # * *struttura*: ['Voce 1', 'Voce 2', ... ]
      # * *default*: nil
      attr_accessor :head

      # Array contenente le righe da stampare della tabella
      # * *struttura*: [['val 1', 'val 2'], ['val 1', 'val 2']]
      # * *default*: nil
      attr_accessor :rows

      def initialize(head: nil, rows: nil)
        # eseguo brevi controlli sull'input
        raise 'Table Concept: head must be an array' if head and !head.is_a? Array
        # assegno i valori alle variabili di istanza
        @head = head
        @rows = rows if rows && check_rows(rows)
      end

      def show
        open + head + rows + close
      end

      # Funzione che stampa l'apertura di una tabella
      def open
        "<table class='table'>"
      end

      # Funzione che genera l'intestazione della tabella
      def head
        render 'head.html'
      end

      # Funzione che stampa tutte le righe della tabella
      def rows
        render 'rows.html'
      end

      # Funzione che stampa una riga della tabella
      # * *Parametri* :
      # - position: posizione della riga da stampare nell'array di righe
      # definito durante l'inizializzazione
      # - row: array che rappresenta la riga da stampare
      def row(position: 0, row: nil)
        if position && !@rows.nil? && !@rows[position].nil?
          @current_row = @rows[position]
        end
        @current_row = row if row
        render 'row.html'
      end

      # Funzione che stampa la chiusura di una tabella
      def close
        '</table>'
      end

      # Funzione che, se il primo parametro e' il risultato di una query,
      # lo trasforma in un array di array da usare per inizializzare una tabella
      def self.generate_rows_from_activerecords(activerecords, attributes)
        rows = []
        activerecords.each do |activerecord|
          row = []
          attributes.each do |attribute|
            row.push(activerecord.send(attribute))
          end
          rows.push(row)
        end
        rows
      end

      # Funzione che controlla che i widgets passati alla actionbar siano corretti
      private def check_rows(rows)
        # evito il controllo se sono in production
        return true if Rails.env.production?
        raise 'Table Concept: links must be an array' unless rows.is_a? Array
        rows.each do |row|
          raise 'Table Concept: rows content must be an array' unless row.is_a? Array
        end
      end

    end
    # Fine cella
  end
end
