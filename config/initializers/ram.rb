include LatoCore::Interface
include LatoView::Interface

# Insieme di variabili globali che mantengono dati altrimenti
# memorizzati in file yaml.
# Solitamente contengono la lettura del file di configurazione.
# Cambiare l'ordine in cui sono inserite potrebbe compromettere il corretto
# funzionamento del modulo.

# DETERMINO LISTA ASSETS CUSTOM

VIEW_LATOASSETS = view_getLatoAssetsItems
VIEW_APPASSETS = view_getApplicationsAssetsItems

# DETERMINO URL IMMAGINE LOGO

VIEW_APPLOGO = view_getApplicationLogo
VIEW_SIDEBARLOGO = view_getSidebarLogo
VIEW_LOGINLOGO = view_getLoginLogo

# DETERMINO NOME TEMPLATE UTILIZZATO

VIEW_CURRENTTEMPLATENAME = view_getCurrentTemplateName
