module LatoView
  # This module contain default lato_view application.
  module ApplicationHelper

    # This function render a cell set with params.
    def view(*names)
      # mantain compatibility with old cells (lato_view 1.0)
      if names.length === 1
        puts "YOU ARE USING AND OLD VERSION OF CELLS. PLEASE CONSIDER TO UPDATE YOUR CODE"
        old_cell = "LatoView::CellsV1::#{names.first.capitalize}::Cell".constantize
        return old_cell
      end
      # return correct cell
      cell_class = "LatoView::"
      names.each do |name|
        cell_class = "#{cell_class}#{name.capitalize}::"
      end
      cell_class = "#{cell_class}Cell".constantize
      return cell_class
    end

    # This function render an icon set as params.
    def put_svg(icon)
      # check params
      raise 'You must send an icon value as parameter' if !icon || icon.nil? || icon.blank?
      # render icon
      render "lato_view/icons/#{icon}.svg"
    end

  end
end
