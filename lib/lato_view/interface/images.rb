module LatoView
  # This module contains function for images.
  module Interface::Images

    # This function return the url of sidebar logo.
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

    # This function return the url of login logo.
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

    # This function return the url of application logo.
    def view_getApplicationLogo
      return VIEW_APPLOGO if defined? VIEW_APPLOGO
      dir = "#{Rails.root}/app/assets/images/lato/"
      if File.exist?("#{dir}/logo.svg")
        return "lato/logo.svg"
      end
      if File.exist?("#{dir}/logo.png")
        return "lato/logo.png"
      end
      if File.exist?("#{dir}/logo.jpg")
        return "lato/logo.jpg"
      end
      if File.exist?("#{dir}/logo.gif")
        return "lato/logo.gif"
      end
      return false
    end

  end
end
