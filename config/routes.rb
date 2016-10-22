LatoView::Engine.routes.draw do

  root 'develop#home'

  # All vendor rouets
  scope :vendor do
    get 'trumbowyg_icons', to: 'assets#trumbowyg_icons'
  end

end
