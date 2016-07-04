include LatoCore::Interface

# Task che genera il file di configurazione di lato_view nella cache
# dell'applicazione principale
desc 'Create view.yml file for Lato configuration'
task :lato_view_initialize do
  # determino la directory di cache
  directory = core_getCacheDirectory
  FileUtils.cp "#{LatoView::Engine.root}/config/example.yml", "#{Rails.root}/config/lato/view.yml"

end
