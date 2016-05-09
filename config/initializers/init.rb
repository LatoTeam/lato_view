include LatoCore::Interface

# IMPOSTAZIONE FILE DI LINGUA

CORE_LANG = core_loadModuleLanguages('lato_core')

# IMPOSTAZIONE LISTA ASSETS

CORE_ASSETS = core_getAssetsItems()

# IMPOSTAZIONE VOCI DI NAVIGAZIONE

CORE_NAVIGATION = core_getNavbarItems()

# IMPOSTAZIONE NOME APPLICAZIONE

CORE_APPNAME = core_getApplicationName()

# IMPOSTAZIONE LINGUE DELL'APPLICAZIONE

CORE_APPLANGUAGES = core_getApplicationLanguages()

# IMPOSTAZIONE UTENTE AMMINISTRATORE

if(ActiveRecord::Base.connection.table_exists? 'lato_core_superusers' and LatoCore::Superuser.first === nil)
  LatoCore::Superuser.create(name: "Admin", username: "lato", email: "lato@mail.com", permission: 10, password: "password", password_confirmation: "password")
end
