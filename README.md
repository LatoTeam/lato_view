# Lato View

## Installation

Add the lato_view gem on your Gemfile

```ruby
gem 'lato_view'
```
Install the gem

```console
bundle install
```
Generate the initializer (Rails 5)

```console
rails lato_view_initialize
```


## Develop con Lato View # TODO: Translate

### Impostare il layout di Lato view in un controller personalizzato

Durante lo sviluppo di una applicazione può essere necessario integrare delle sezioni customizzate al pannello di amministrazione di Lato.

L'integrazione del layout di lato_view in un controller può avvenire in questo modo:

```ruby
class CustomController < ApplicationController

  layout 'lato_layout'

end
```

### Modificare il logo della sidebar

Il logo standard del pannello di Lato può essere sostituito semplicemente inserendo nella directory /assets/images/lato/ un file chiamato 'sidebar_logo' in uno dei seguenti formati: .svg .png .jpg .gif

NB: E' possibile impostare anche un logo globale (utilizzato in altre parti del pannello lato) inserendo nella
stessa directory un file 'logo' in uno dei seguenti formati: .svg .png .jpg .gif

### Aggiungere il logo della pagina di login

Il logo standard del pannello di Lato può essere sostituito semplicemente inserendo nella directory /assets/images/lato/ un file chiamato 'login_logo' in uno dei seguenti formati: .svg .png .jpg .gif

### Utilizzare le icone svg messe a disposizione da Lato view

Il modulo lato_view possiede una serie di icone in formato svg utilizzabili facilmente in una view che utilizza il layout di Lato (vedi voce: "Impostare il layout di Lato view in un controller personalizzato").

Per stampare tali icone è possibile utilizzare l'helper **put_svg(icon)** dove il parametro *icon* deve essere una stringa contenente il nome dell'icona da stampare.

### Utilizzare le celle per stampare componenti grafiche

Gli elementi grafici che compongono il pannello di Lato sono realizzati utilizzando il sistema di celle messe a disposizione dalla gemma 'rails-cells' (maggori info: https://github.com/apotonick/cells).

Utilizzare le celle per sviluppare una interfaccia utilizzando il layout di Lato significa che ogni componente utilizzata viene gestita come un oggetto istanziato.

Per inizializzare una componente è possibile utilizzare l'helper **view(*names)** dove il parametro *names* deve essere una lista di stringhe contenenti il nome della componente da inizializzare. All'helper bisogna richiamare poi il metodo new() passando i parametri necessari se richiesto dalla componente.

```erb
<% block = view(:layout, :block).new() %>

<%= block %>
```
