# Lato Core

**Lato** è un progetto italiano di software modulare sviluppato in Ruby on Rails.
Il modulo **lato_core** è in grado di offrire diverse funzionalità tra le quali:

* Gestione accessi al pannello di amminisrazione del software
* Gestione utenti con permessi di accesso al pannello di amministrazione
* Funzioni per la gestione delle sessioni degli utenti
* Funzioni per la comunicazione con altri moduli
* Funzioni per la generazione dei dati di navigazione tra le pagine dei moduli
* Funzioni per la gestione dell'autenticazione degli utenti
* Funzioni per la gestione dei permessi degli utenti

## Installazione

Aggiungere la gemma alla vostra applicazione

```ruby
gem 'lato_core'
```
Installare la gemma ed eseguire le migrazioni

```console
bundle install
bundle exec rake db:migrate
```
Avviare il server e accedere al pannello di amministrazione attraverso la pagina */lato/core*

I dati di accesso iniziali al pannello sono:

* username: **lato**
* password: **password**

NB: Per il corretto funzionamento del modulo è necessario installare manualmente anche la gemma **[lato_view](https://github.com/gregogalante/lato_view)**

## Configurazione (opzionale)

E possibile configurare Lato inserendo diverse imformazioni nel file di configurazione: */config/lato/config.yml*. Il file può essere generato con il seguente comando:

```console
rake lato_create_config_file
```

Il file generato avrà al suo interno dei dati di esempio che possono essere rimossi se inutilizzati. La struttura del file di configurazione è comunque simile alla seguente:

```yaml
# Impostazione nome applicazione
app_name: Lato

# Impostazione voci del menu
menu:
  example:
    name: Home
    url: /
    icon: align-justify
    position: 1
    permission: 0

# Impostazione assets custom
assets:
  asset_custom_1:
    url: back/back
    type: css
  asset_custom_2:
    url: back/back
    type: js

# Impostazione lingue applicazione
languages: it, en, de

```
* app_name: indica il nome della applicazione principale sviluppata con Lato.
* menu: elenca le voci da inserire nella barra di navigazione di Lato.
* languages: elenca le varie lingue usate dall'applicazione principale sviluppata con Lato.

## Sviluppare con Lato Core

Per sviluppare utilizzando le funzioni messe a disposizione da Lato è possibile consultare la documentazione di ogni singolo modulo.

Per il modulo **lato_core** la documentazione è consultabile nella directory *doc* della repository.
