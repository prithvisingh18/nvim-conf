# AGENTS.md

## Repo Shape
- This is a personal Neovim config, not an app/package; `init.lua` loads `lua/prithvisingh18/init.lua`.
- Runtime order is `remap` -> `lazy` -> `plugin_remap` -> `config.lsp` -> `config.cmp`; keep plugin `require(...)` calls after Lazy is initialized.
- Lazy plugin specs live in `lua/prithvisingh18/plugins/`; runtime setup and many plugin keymaps live in `lua/prithvisingh18/plugin_remap.lua`.
- Update `lazy-lock.json` only when intentionally syncing/changing plugin versions.

## Commands
- No repo-local test, lint, formatter, or task-runner config exists.
- Smoke-test with `nvim --headless -u init.lua '+qa'` after plugins are installed; first run may bootstrap `lazy.nvim`.
- Use `nvim --headless -u init.lua '+Lazy! sync' '+qa'` only when intentionally installing/updating plugins or the lockfile.

## Neovim Details
- Target Neovim is 0.11.x; LSP uses `vim.lsp.config(...)`, not older `require("lspconfig").SERVER.setup(...)`.
- Mason ensures `basedpyright`, `ts_ls`, `html`, `bashls`, `rust_analyzer`, and `angularls`; `lua_ls` is configured separately.
- `.luarc.json` is the Lua language-server source of truth: LuaJIT runtime, `vim` global, and `lua/?.lua` plus `lua/?/init.lua` paths.
- Neoformat is the formatter path via `<leader>nf`; it expects external tools such as local `prettier`, `autopep8`, `rustfmt --edition 2024`, and `yamlfmt`.
- `image.nvim` intentionally has `build = false` and uses `backend = "ueberzug"` with `processor = "magick_cli"`.
