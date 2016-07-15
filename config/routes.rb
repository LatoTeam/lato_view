LatoView::Engine.routes.draw do

  root 'develop#home'

  scope :vendor do
    get 'trumbowyg_icons', to: 'assets#trumbowyg_icons'
  end

end
