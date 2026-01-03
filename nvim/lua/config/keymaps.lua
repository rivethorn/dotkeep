-- Shorten function name
local keymap = vim.keymap.set
local map = vim.keymap.set
-- Silent keymap option
local opts = { silent = true }

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Clear highlights
keymap("n", "<leader>h", "<cmd>nohlsearch<CR>", opts)

-- Better paste
keymap("v", "p", '"_dP', opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

map("n", ";", ":")

map("n", "<leader>;", "<cmd>Alpha<CR>", { desc = "Open Dashboard" })

-- obsidian
map("n", "<leader>zs", ":ObsidianSearch<cr>", { desc = "Search for (or create) notes in your vault" })
map("n", "<leader>ztt", ":ObsidianTags<cr>", { desc = "A picker list of all occurrences of the given tags" })
map("n", "<leader>ztd", ":ObsidianToday<cr>", { desc = "Open/create a new daily note" })
map("n", "<leader>zto", ":ObsidianTomorrow<cr>", { desc = "Open/create the daily note for the next working day" })

-- Comment
keymap("n", "<leader>lc", ":Commentary<cr>", { desc = "Comment line or selection" })
keymap("x", "<leader>lc", ":Commentary<cr>", { desc = "Comment line or selection" })

keymap("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>")

map("n", "<leader>xr", ":CargoRun<cr>", { desc = "Run Cargo project in a floating window" })
map(
  "n",
  "<leader>xR",
  ":CargoRunTerm<cr>",
  { desc = "Run Cargo project in terminal mode (better for interactive applications)" }
)
map("n", "<leader>xb", ":CargoBuild<cr>", { desc = "Build the Cargo project" })

map("n", "<leader>gor", ":GoRun<cr>", { desc = "Run the Go project" })
map("n", "<leader>gob", ":GoBuild<cr>", { desc = "Build the Go project" })
