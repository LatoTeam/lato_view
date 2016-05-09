module LatoView

  # Concept usato per la generazione di tabelle.
  # Il concept supporta dati in input sia sotto forma di array che sotto forma di
  # query ad un model.
  # * *Inizializzazione* :
  #
  class Table::Cell < Cell

    # Array contenente l'intestazione della tabella
    # * *struttura*: ['Voce 1', 'Voce 2', ... ]
    # * *default*: nil
    attr_accessor :head
    # Array contenente le righe da stampare della tabella
    # * *struttura*: [['val 1', 'val 2'], ['val 1', 'val 2']]
    # * *default*: nil
    attr_accessor :rows


    def initialize(head: nil, rows: nil)
      @head = head
      @rows = rows
    end


    def show
      return open + head + rows + close
    end


    # Funzione che stampa l'apertura di una tabella
    def open
      return "<table class='table'>"
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
    # - position: posizione della riga da stampare nell'array di righe definito durante
    # l'inizializzazione
    # - row: array che rappresenta la riga da stampare
    def row(position: position, row: row)
      if(position and !@rows.nil? and !@rows[position].nil?)
        @current_row = @rows[position]
      end
      if(row)
        @current_row = row
      end
      render 'row.html'
    end


    # Funzione che stampa la chiusura di una tabella
    def close
      return '</table>'
    end


    # Funzione che, se il primo parametro è il risultato di una query, lo trasforma in un array
    # di array da usare per inizializzare una tabella
    def self.generate_rows_from_activerecords(activerecords, attributes)
      rows = []
      activerecords.each do |row|
        row = []
        attributes.each do |attribute|
          row.push(row.send(attribute))
        end
        rows.push(row)
      end
      return rows
    end

  end

end
