# Lato View

**Lato** è un progetto italiano di software modulare sviluppato in Ruby on Rails.
Il modulo **lato_view** è in grado di offrire diverse funzionalità tra le quali:

* Caricamento degli assets utilizzati da tutti i moduli Lato
* Funzioni per stampare componenti grafiche da ultilizzare durante lo sviluppo

## Installazione

Aggiungere la gemma alla vostra applicazione

```ruby
gem 'lato_view', git: 'https://github.com/LatoTeam/lato_view.git'
```
Installare la gemma

```console
bundle install
```

## Sviluppare con Lato View

Per sviluppare utilizzando le funzioni messe a disposizione da Lato è possibile consultare la documentazione di ogni singolo modulo.

### Impostare il layout di Lato view in un controller personalizzato

Durante lo sviluppo di una applicazione può essere necessario integrare delle sezioni customizzate al pannello di amministrazione di Lato.

L'integrazione del layout di lato_view in un controller può avvenire in questo modo:

```ruby
class CustomController < ApplicationController

  layout 'lato_layout'

end
```

### Modificare il logo della sidebar

Il logo standard del pannello di Lato può essere sostituito semplicemente inserendo nella directory /config/lato/ un file svg chiamato 'logo.svg'.

### Utilizzare le icone svg messe a disposizione da Lato view

Il modulo lato_view possiede una serie di icone in formato svg utilizzabili facilmente in una view che utilizza il layout di Lato (vedi voce: "Impostare il layout di Lato view in un controller personalizzato").

Per stampare tali icone è possibile utilizzare l'helper **put_svg(icon)** dove il parametro *icon* deve essere una stringa contenente il nome dell'icona da stampare.

### Utilizzare i concepts/cells per stampare componenti grafiche

Gli elementi grafici che compongono il pannello di Lato sono realizzati utilizzando il sistema di celle messe a disposizione dalla gemma 'rails-cells' (maggori info: https://github.com/apotonick/cells).

Utilizzare le celle per sviluppare una interfaccia utilizzando il layout di Lato significa che ogni componente utilizzata viene gestita come un oggetto istanziato.

Per inizializzare una componente è possibile utilizzare l'helper **view(name)** dove il parametro *name* deve essere una stringa contenente il nome della componente da inizializzare. All'helper bisogna richiamare poi il metodo new() passando i parametri necessari se richiesto dalla componente.

```erb
<% block = view(:block).new() %>

<%= block %>
```

Le componenti messe a disposizione da lato_view sono le seguenti:

* **actionbar**: una barra utilizzata per contenere un titolo, una serie di links e un insieme di widget che possono essere a loro volta altre componenti.
* **block**: un contenitore generico.
* **buttongroup**: una lista di links.
* **dropdown**: un dropdown composto da una intestazione e una serie di links.
* **index**: una lista di oggetti appartenenti ad una entità del database.
* **input**: un input con la quale l'utente può inserire dati da inviare al server.
* **searchbar**: un input speciale utilizzato per stampare una barra di ricerca.
* **table**: una tabella personalizzabile.

#### Concept::Block

L'elemento blocco è un contenitore generico che può essere utilizzato per costruire una griglia di contenuti.
I parametri che possono essere passati nel costruttore sono:

* width: dimensione del blocco. I valori ammessi possono essere [large half third fourth two-third three-fourth].
* content: contenuto da mostrare all'interno del blocco sotto forma di stringa.
* custom_class: classi custom da aggiungere al blocco sotto forma di stringa.

Le funzioni utilizzabili con la componente block sono le seguenti:

* **open(width: width, custom_class: custom_class)**

Funzione che stampa esclusivamente i tag di apertura del blocco. Può ricevere come parametri la dimensione dell'apertura (di default quella definita nel costruttore) e le classi custom da aggiungere (di default quelle definite nel costruttore).

* **close()**

Funzione che stampa i tag di chiusura del blocco.

*Esempio:*

```erb
<% block = view(:block).new(width: 'half') %>

<%= block.open(width: third) %>
My content
<%= block.close() %>
```
