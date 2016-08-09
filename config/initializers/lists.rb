# Definisce una serie di liste di valori usati su lato_view.
# per controllare i valori corretti delle classi delle celle, dei temi
# supprotati ecc.

# Valori per celle
# ------------------------------------------------------------------------------

# Lista dimensioni griglia della cella block
VIEW_GRIDCLASS = %w(small-1 small-2 small-3 small-4 small-5 small-6
                    small-7 small-8 small-9 small-10 small-11 small-12
                    small-half small-full medium-1 medium-2 medium-3
                    medium-4 medium-5 medium-6 medium-7 medium-8 medium-9
                    medium-10 medium-11 medium-12 medium-half medium-full
                    large-1 large-2 large-3 large-4 large-5 large-6 large-7
                    large-8 large-9 large-10 large-11 large-12 large-half
                    large-full xlarge-1 xlarge-2 xlarge-3 xlarge-4 xlarge-5
                    xlarge-6 xlarge-7 xlarge-8 xlarge-9 xlarge-10 xlarge-11
                    xlarge-12 xlarge-half xlarge-full)

# Lista possibili tipi di input utilizzabili con la cella input
VIEW_INPUTTYPES = %w(text number select password email editor checkbox radio
                     textarea file date multiple-select time)

# Lista possibili lunghezze elementi della cella input
VIEW_INPUTWIDTH = %w(large half third fourth two-third three-fourth)

# Insieme di valori di stile per elementi vari delle celle
VIEW_CELLSSTYLES = %w(normal rounded)

# Valori per i templates
# ------------------------------------------------------------------------------

# Nomi dei possibili templates pronti supportati da lavo view
VIEW_TEMPLATES = %w(base black)
