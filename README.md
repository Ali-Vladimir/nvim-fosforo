# fosforo.nvim

Configuración personal de Neovim con estilo de terminal IBM antigua: fondo negro,
acentos de fósforo verde, IBM Plex Mono, cursor de bloque que parpadea y nada de
iconos raros. Solo texto plano.

Usa exactamente la paleta de mi alacritty: negro puro `#000000` y colores brillantes
(verde `#22ff22`, azul `#00aaff`, cian, amarillo, magenta), con una barra de estado
de bloques de color por modo.

```
 NORMAL  git:main  init.lua                         E:1 lua  12:5  40%
└verde┘                                                       └verde┘
 INSERTAR = amarillo · VISUAL = magenta · COMANDO = cian · REEMPLAZO = rojo
```

## Instalación

```sh
sudo xbps-install -S neovim xclip fd
git clone https://github.com/Ali-Vladimir/nvim-fosforo ~/Documents/PP/nvim-fosforo
ln -s ~/Documents/PP/nvim-fosforo ~/.config/nvim
nvim   # la primera vez descarga los plugins y los servidores LSP solos
```

## Estructura

```
init.lua                 punto de entrada
colors/fosforo.lua       el tema de colores (cambia la paleta aquí)
lua/config/options.lua   opciones generales
lua/config/keymaps.lua   atajos propios
lua/config/autocmds.lua  acciones automáticas
lua/config/statusline.lua barra de estado (sin plugins)
lua/config/lazy.lua      gestor de plugins
lua/plugins/editor.lua   buscador, explorador, git, which-key, autopairs
lua/plugins/lsp.lua      LSP (inteligencia de código) y autocompletado
```

## Lo primero: los modos

Vim tiene **modos**. Esa es la gran diferencia con VS Code.

| Modo | Cómo entras | Para qué |
|---|---|---|
| NORMAL | `Esc` o `jk` | moverte y dar órdenes (aquí pasas la mayor parte del tiempo) |
| INSERTAR | `i` `a` `o` | escribir texto |
| VISUAL | `v` `V` `Ctrl+v` | seleccionar |
| COMANDO | `:` | comandos como `:w`, `:q` |

Para practicar: abre `nvim` y escribe `:Tutor`. Son 30 minutos y vale mucho la pena.

## Movimientos básicos (modo NORMAL)

| Tecla | Acción |
|---|---|
| `h` `j` `k` `l` | izquierda, abajo, arriba, derecha |
| `w` / `b` | siguiente palabra / palabra anterior |
| `0` / `$` | inicio / final de la línea |
| `gg` / `G` | inicio / final del archivo |
| `5j` | bajar 5 líneas (los números relativos a la izquierda te dicen cuántas) |
| `Ctrl+d` / `Ctrl+u` | media página abajo / arriba |
| `%` | saltar al paréntesis/llave pareja |
| `/texto` | buscar; `n` siguiente, `N` anterior, `Esc` quita el resaltado |

## Edición básica

| Tecla | Acción |
|---|---|
| `i` / `a` | insertar antes / después del cursor |
| `o` / `O` | nueva línea abajo / arriba |
| `x` | borrar carácter |
| `dd` / `yy` / `p` | cortar línea / copiar línea / pegar |
| `dw` / `ciw` | borrar palabra / cambiar palabra entera |
| `u` / `Ctrl+r` | deshacer / rehacer |
| `.` | repetir la última acción |
| `ci"` | cambiar lo que está dentro de las comillas (prueba también `ci(` `ci{`) |

## Atajos de esta config

`<leader>` es la tecla **Espacio**. Presiónala y espera: aparece un menú con todo.

### General
| Tecla | Acción |
|---|---|
| `Ctrl+s` o `Espacio w` | guardar |
| `Espacio q` / `Espacio Q` | cerrar ventana / salir de nvim |
| `jk` (en insertar) | volver a NORMAL |
| `Alt+j` / `Alt+k` | mover línea (o selección) abajo / arriba |
| `Ctrl+/` o `gcc` | comentar línea (`gc` en visual) |
| `<` `>` (en visual) | indentar sin perder la selección |
| `Espacio p` (en visual) | pegar encima sin perder lo copiado |

### Archivos y búsqueda
| Tecla | Acción |
|---|---|
| `Ctrl+p` o `Espacio ff` | buscar archivo |
| `Espacio fg` | buscar texto en todo el proyecto |
| `Espacio /` | buscar en el archivo actual |
| `Espacio fr` | archivos recientes |
| `Espacio fb` | archivos abiertos (buffers) |
| `Espacio fk` | buscar entre todos los atajos |
| `Espacio e` | explorador lateral (`a` crear, `d` borrar, `r` renombrar, `g?` ayuda) |
| `Shift+h` / `Shift+l` | buffer anterior / siguiente |
| `Espacio bd` | cerrar buffer |

### Ventanas
| Tecla | Acción |
|---|---|
| `Espacio sv` / `Espacio sh` | dividir vertical / horizontal |
| `Ctrl+h/j/k/l` | moverte entre ventanas |

### Código (LSP)
| Tecla | Acción |
|---|---|
| `gd` o `F12` | ir a la definición |
| `K` | ver documentación |
| `Espacio lr` o `F2` | renombrar |
| `Espacio la` | acciones de código (imports, arreglos rápidos) |
| `Espacio lR` | ver referencias |
| `Espacio ld` | ver el error de la línea |
| `Espacio lf` | formatear archivo |
| `Espacio fd` | todos los errores del proyecto |
| `Ctrl+o` | regresar a donde estabas (después de `gd`) |

Autocompletado: `Tab`/`Shift+Tab` para moverte, `Enter` para aceptar,
`Ctrl+Espacio` para abrir el menú.

Servidores incluidos: Lua, TypeScript/JavaScript, HTML, CSS, JSON, Tailwind, Prisma, Go.
Para más lenguajes: `:Mason`.

### Git y terminal
| Tecla | Acción |
|---|---|
| `Espacio gg` | lazygit en ventana flotante |
| `]h` / `[h` | siguiente / anterior cambio |
| `Espacio gp` | ver el cambio |
| `Espacio gr` | deshacer el cambio |
| `Espacio gb` | quién escribió esta línea |
| `Espacio t` | terminal flotante (`Esc Esc` para salir del modo terminal) |

## Comandos útiles

| Comando | Acción |
|---|---|
| `:Tutor` | tutorial interactivo |
| `:Lazy` | ver / actualizar plugins |
| `:Mason` | instalar servidores de lenguaje |
| `:checkhealth` | diagnosticar problemas |
| `:help algo` | ayuda de cualquier cosa |
