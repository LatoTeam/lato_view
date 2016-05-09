module LatoCore
  module Interface

    # Insieme di funzioni che permettono alla applicazione di gestire le sessioni di utenze per l'accesso al backoffice.
    module Session

      # Funzione che crea una nuova sessione per permettere di accedere
      # alle funzionalità del backoffice.
      # * *Args*    :
      # - +username+ -> username dell'utente
      # - +password+ -> password dell'utente
      # * *Returns* :
      # - true se l'utente se la sessione è stata creata correttamente
      # - false se i dati ricevuti come parametro non sono corretti
      def core_createSession(username, password)
        if(user = LatoCore::Superuser.find_by(username: username) and
          user.authenticate(password))
          # genero un session_code
          code = SecureRandom.urlsafe_base64
          # memorizzo il session_code sul db
          user.update_attribute('session_code', code)
          # genero le sessioni
          session[:user] = user.id
          session[:session_code] = code
          # ritorno true
          return true
        else
          # ritorno false
          return false
        end
      end


      # Funzione che elimina una sessione di accesso al backoffice se presente
      # * *Returns* :
      # - true se la sessione è stata eliminata
      # - false se la sessione è ancora attiva
      def core_destroySession
        if(session[:user] and session[:session_code])
          # determino l'utente della sessione
          user = LatoCore::Superuser.find(session[:user])
          # se l'utente esiste elimino il suo session_code dal db
          if(user)
            user.update_attribute('session_code', nil)
          end
          # elimino le sessioni
          session[:user] = nil
          session[:session_code] = nil
          # ritorno true
          return true
        else
          # ritorno false
          return false
        end
      end


      # Funzione che controlla se l'utente ha una sessione valida.
      # * *Returns* :
      # - true se la sessione dell'utente risulta valida
      # - false se la sessione non esiste o non è valida
      def core_controlSession
        if(session[:user] and session[:session_code] and
          user = LatoCore::Superuser.find(session[:user]) and
          user.session_code === session[:session_code] and
          user.session_code  != nil)
          return true
        else
          return false
        end
      end

    end

  end
end
