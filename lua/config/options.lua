local options = {
    expandtab      = true,              -- tabs como espacios
    tabstop        = 8,                 -- numero de espacios por TAB
    softtabstop    = 4,                 -- numero de espacios por TAB al editar
    shiftwidth     = 4,
    smarttab       = true,              -- tabs inteligentes

    wildmenu       = true,              -- autocompletado visual de los comandos
    lazyredraw     = false,             -- redibujado de pantalla selectivo
    ttyfast        = true,              -- optimización de terminal

    encoding       = "utf-8",           -- usamos utf-8
    fileencoding   = "utf-8",           -- tambien en ficheros
    fileformats    = "unix",            -- formato de los ficheros
    ambiwidth      = "single",          -- anchos de carácteres unicode

    laststatus     = 2,                 -- mostrar siempre la barra de estado
    showmode       = false,             -- no mostrar modo actual en la barra
    cmdheight      = 0,                 -- sin línea de comandos si no se usa
    number         = true,              -- mostramos numeros de linea
    relativenumber = true,              --    de forma relativa
    showcmd        = true,              -- mostramos lineas de comandos
    cursorline     = true,              -- no resaltamos la linea del cursor
    cursorlineopt  = "line",            --
    signcolumn     = "yes",             -- siempre mostramos la barra de signos

    showmatch      = true,              -- resaltar parejas de paréntesis
    matchtime      = 2,                 -- décimas de seg para resaltado
    timeoutlen     = 1000,              -- retraso al usar tecla ESC
    ttimeoutlen    = 0,                 --

    scrolloff      = 7,                 -- lineas visibles tras el cursor
    colorcolumn    = "81",              -- ancho del 'papel'
    wrap           = false,             -- no cortar lineas
    textwidth      = 0,                 -- ni palabras
    pumheight      = 10,                -- hacemos los popups más cortitos

    hlsearch       = true,              -- resaltado en las búsquedas
    ignorecase     = true,              -- insensitivo al buscar
    incsearch      = true,              -- búsqueda incremental
    smartcase      = true,              -- repestamos mayúsculas en el patrón

    swapfile       = false,             -- valientes... sin respaldo
    backup         = false,
    writebackup    = false,

    clipboard      = "unnamedplus",     -- acceso al clipboard del sistema

    foldmethod     = "marker",          -- plegado

    guicursor      = "",                -- deshabilitamos el "tema" del cursor
    splitkeep      = "screen",
    termguicolors  = true,              -- habilitamos colores

    completeopt    = { 'menu', 'menuone', 'noselect' },
    shortmess      = "filnxtToOFWIcC",
}

for k, v in pairs(options) do
    vim.opt[k] = v
end

vim.g.snippets = "luasnip"

