# Neovim configuration

This is a [LazyVim](https://www.lazyvim.org/) configuration with C and C++ support through clangd, Treesitter, CMake, and CodeLLDB. Open Neovim in a CMake project and let LazyVim install the enabled extras. The first plugin installation needs network access.

## C++ projects

For CMake projects, put a `CMakeLists.txt` at the project root. `<leader>` is **Space**. Run the shortcuts below in normal mode unless a row says otherwise. CMake commands use the nearest `CMakeLists.txt` above the current file and a `build/` directory beside it. Configure first; this creates a Debug build and a compilation database for clangd. The build uses your project's default target. Tests use CTest, so the project must define tests for the test shortcut to do useful work.

### Configure, build, and test

| Keys | Action |
| --- | --- |
| `<leader>cG` | Configure with CMake in `build/` (`Debug`, export `compile_commands.json`) |
| `<leader>cb` | Build the default target with `cmake --build build` |
| `<leader>ct` | Run `ctest --test-dir build --output-on-failure` |
| `<leader>ft` | Open a terminal at the project root for other build commands |

Each CMake shortcut opens a terminal with command output. A failed command leaves its output visible.

### Project files and search

| Keys | Action |
| --- | --- |
| `<leader>e` | Open the project file explorer |
| `<leader>ff` | Find a file in the project |
| `<leader>fg` | Find a Git tracked file |
| `<leader>fb` | Switch buffers |
| `<leader>sg` or `<leader>/` | Search project text |
| `<leader>sw` | Search for the word under the cursor or visual selection |

### C++ editing and navigation

| Keys | Action |
| --- | --- |
| `<leader>ch` | Switch between source and header (clangd) |
| `gd` | Go to definition |
| `gD` | Go to declaration |
| `gI` | Go to implementation |
| `gy` | Go to type definition |
| `gr` | Find references |
| `]]` / `[[` | Next / previous highlighted reference |
| `K` | Show symbol documentation |
| `gK` | Show signature help |
| `<C-k>` | Show signature help (insert mode) |
| `<leader>cr` | Rename symbol |
| `<leader>cR` | Rename file, when the language server supports it |
| `<leader>ca` | Show code actions (normal or visual mode) |
| `<leader>cA` | Show source code actions |
| `<leader>cf` | Format the current buffer or visual selection |
| `<leader>cs` | Show document symbols |
| `<leader>cS` | Show LSP references and definitions |
| `<leader>cl` | Show LSP information |
| `<leader>cd` | Show diagnostics on the current line |
| `]d` / `[d` | Next / previous diagnostic |
| `]e` / `[e` | Next / previous error |
| `]w` / `[w` | Next / previous warning |
| `<leader>xx` | Show project diagnostics |
| `<leader>xX` | Show current buffer diagnostics |
| `<leader>cm` | Open Mason to inspect installed language tools |

Automatic formatting is disabled in this config; use `<leader>cf` to format explicitly. clangd uses the compilation database to understand project include paths and compiler flags.

C++ buffers always use four spaces for indentation and the Tab key (`shiftwidth`, `softtabstop`, and `tabstop` are 4; `expandtab` is on). This setting takes precedence over project EditorConfig and modelines for C++ files.

### Debugging

Build the executable first, then use `<leader>dc` and choose **Launch file**. Enter the executable path when prompted. The C++ adapter is CodeLLDB; **Attach to process** is also available from the same launch menu.

| Keys | Action |
| --- | --- |
| `<leader>db` | Toggle breakpoint |
| `<leader>dB` | Set conditional breakpoint |
| `<leader>dc` | Launch or continue |
| `<leader>da` | Launch with arguments |
| `<leader>dC` | Run to cursor |
| `<leader>dO` | Step over |
| `<leader>di` | Step into |
| `<leader>do` | Step out |
| `<leader>dP` | Pause |
| `<leader>dj` / `<leader>dk` | Move down / up the call stack |
| `<leader>dg` | Go to line without executing |
| `<leader>dl` | Run the last debug configuration |
| `<leader>de` | Evaluate expression (normal or visual mode) |
| `<leader>dw` | Show debugger widgets |
| `<leader>dr` | Toggle debugger REPL |
| `<leader>du` | Toggle debugger UI |
| `<leader>ds` | Show debugger session |
| `<leader>dt` | Terminate debugging |

Press `<leader>` and wait to browse the available shortcuts through Which Key.

## Markdown preview

Open a `.md` file and use `<leader>um` to toggle formatted Markdown inside Neovim. It renders headings, lists, code blocks, and tables while you edit. Use `<leader>cp` to open or close a rendered browser preview when you want to read the document as a page. Both shortcuts come from LazyVim's Markdown extra and are available after its plugins install.
