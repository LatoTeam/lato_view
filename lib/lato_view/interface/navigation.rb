module LatoView
  # This module contains function for the navigationbar.
  module Interface::Navigation

    # This function is used to set active the sidebar menu voice with the
    # key set as params.
    def view_setCurrentVoice(unique_name)
      @view_navbar_unique_name = unique_name
    end

  end
end
