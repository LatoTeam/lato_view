module LatoView
  module Interface
    # Insieme di funzioni usate per gestire le immagini di lato_view
    module Images

      # Ritorna l'url del logo da visualizzare nella sidebar. L'url puo' essere
      # utilizzato per usare l'helper image_tag.
      def view_getSidebarLogo
        return VIEW_SIDEBARLOGO if defined? VIEW_SIDEBARLOGO
        dir = "#{Rails.root}/app/assets/images/lato/"
        if File.exist?("#{dir}/sidebar_logo.svg")
          return "lato/sidebar_logo.svg"
        end
        if File.exist?("#{dir}/sidebar_logo.png")
          return "lato/sidebar_logo.png"
        end
        if File.exist?("#{dir}/sidebar_logo.jpg")
          return "lato/sidebar_logo.jpg"
        end
        if File.exist?("#{dir}/sidebar_logo.gif")
          return "lato/sidebar_logo.gif"
        end
        return view_getApplicationLogo
      end

      # Ritorna l'url del logo da visualizzare nella pagina di login. L'url puo' essere
      # utilizzato per usare l'helper image_tag.
      def view_getLoginLogo
        return VIEW_LOGINLOGO if defined? VIEW_LOGINLOGO
        dir = "#{Rails.root}/app/assets/images/lato/"
        if File.exist?("#{dir}/login_logo.svg")
          return "lato/login_logo.svg"
        end
        if File.exist?("#{dir}/login_logo.png")
          return "lato/login_logo.png"
        end
        if File.exist?("#{dir}/login_logo.jpg")
          return "lato/login_logo.jpg"
        end
        if File.exist?("#{dir}/login_logo.gif")
          return "lato/login_logo.gif"
        end
        return view_getApplicationLogo
      end

      # Ritorna l'url del logo dell'applicazione. L'url puo' essere
      # utilizzato per usare l'helper image_tag.
      def view_getApplicationLogo
        return VIEW_APPLOGO if defined? VIEW_APPLOGO
        dir = "#{Rails.root}/app/assets/images/lato/"
        if File.exist?("#{dir}/logo.svg") || File.exist?("#{dir}/logo.png") ||
           File.exist?("#{dir}/logo.jpg") || File.exist?("#{dir}/logo.gif")
          return "lato/logo"
        end
        return false
      end

    end

  end
end
