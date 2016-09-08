# Initialize module on project
desc 'Create view.yml file for Lato configuration'
task :lato_view_initialize do
  directory = core_getCacheDirectory
  FileUtils.cp "#{LatoView::Engine.root}/config/example.yml", "#{Rails.root}/config/lato/view.yml"
end
