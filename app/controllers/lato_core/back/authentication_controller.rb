require_dependency "lato_core/back/back_controller"

module LatoCore
  class Back::AuthenticationController < Back::BackController

    # Richiama la view della pagina di login
    def login

    end


    # Esegue il login e, se l'utente è autenticato lo rimanda
    # alla homepage del backoffice
    def exec_login
      if(core_createSession(params[:username], params[:password]))
        redirect_to lato_core.root_path
      else
        redirect_to lato_core.login_path
      end
    end


    # Esegue il logout e rimanda alla pagina di login del backoffice
    def exec_logout
      if(core_destroySession)
        redirect_to lato_core.login_path
      else
        redirect_to lato_core.login_path
      end
    end

  end
end
