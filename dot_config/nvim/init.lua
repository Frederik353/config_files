--[[

=====================================================================
==================== READ THIS BEFORE CONTINUING ====================
=====================================================================
========                                    .-----.          ========
========         .----------------------.   | === |          ========
========         |.-""""""""""""""""""-.|   |-----|          ========
========         ||                    ||   | === |          ========
========         ||   KICKSTART.NVIM   ||   |-----|          ========
========         ||                    ||   | === |          ========
========         ||                    ||   |-----|          ========
========         ||:Tutor              ||   |:::::|          ========
========         |'-..................-'|   |____o|          ========
========         `"")----------------(""`   ___________      ========
========        /::::::::::|  |::::::::::\  \ no mouse \     ========
========       /:::========|  |==hjkl==:::\  \ required \    ========
========      '""""""""""""'  '""""""""""""'  '""""""""""'   ========
========                                                     ========
=====================================================================
=====================================================================

What is Kickstart?

  Kickstart.nvim is *not* a distribution.

  Kickstart.nvim is a starting point for your own configuration.
    The goal is that you can read every line of code, top-to-bottom, understand
    what your configuration is doing, and modify it to suit your needs.

    Once you've done that, you can start exploring, configuring and tinkering to
    make Neovim your own! That might mean leaving Kickstart just the way it is for a while
    or immediately breaking it into modular pieces. It's up to you!

    If you don't know anything about Lua, I recommend taking some time to read through
    a guide. One possible example which will only take 10-15 minutes:
      - https://learnxinyminutes.com/docs/lua/

    After understanding a bit more about Lua, you can use `:help lua-guide` as a
    reference for how Neovim integrates Lua.
    - :help lua-guide
    - (or HTML version): https://neovim.io/doc/user/lua-guide.html

Kickstart Guide:

  TODO: The very first thing you should do is to run the command `:Tutor` in Neovim.
    If you don't know what this means, type the following:
      - <escape key>
      - :
      - Tutor
      - <enter key>

    (If you already know the Neovim basics, you can skip this step.)

  Once you've completed that, you can continue working through **AND READING** the rest
  of the kickstart init.lua.

  Next, run AND READ `:help`.
    This will open up a help window with some basic information
    about reading, navigating and searching the builtin help documentation.

    This should be the first place you go to look when you're stuck or confused
    with something. It's one of my favorite Neovim features.

    MOST IMPORTANTLY, we provide a keymap "<space>sh" to [s]earch the [h]elp documentation,
    which is very useful when you're not exactly sure of what you're looking for.

  I have left several `:help X` comments throughout the init.lua
    These are hints about where to find more information about the relevant settings,
    plugins or Neovim features used in Kickstart.

   NOTE: Look for lines like this

    Throughout the file. These are for you, the reader, to help you understand what is happening.
    Feel free to delete them once you know what you're doing, but they should serve as a guide
    for when you are first encountering a few different constructs in your Neovim config.

If you experience any errors while trying to install kickstart, run `:checkhealth` for more info.

I hope you enjoy your Neovim journey,
- TJ

P.S. You can delete this when you're done too. It's your config now! :)
--]]

-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.g.python3_host_prog = '/home/frederik/venv/bin/python'

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

-- [[ Setting options ]]
-- See `:help vim.opt`
-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`

-- Make line numbers default
vim.opt.number = true
-- You can also add relative line numbers, to help with jumping.
--  Experiment for yourself to see if you like it!
vim.opt.relativenumber = false

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = 'a'

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

vim.opt.conceallevel = 1

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
-- vim.opt.clipboard = 'unnamedplus'
vim.opt.clipboard:append { 'unnamed', 'unnamedplus' }

vim.opt.termguicolors = true

vim.opt.termsync = false

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

-- line max width
vim.opt.textwidth = 100

-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Enhanced navigation
vim.keymap.set('n', 'H', '^', { desc = 'Move to beginning of line' })
vim.keymap.set('n', 'L', 'g_', { desc = 'Move to end of line' })
vim.keymap.set('n', 'K', '5k', { desc = 'Move up 5 lines' })
vim.keymap.set('n', 'J', '5j', { desc = 'Move down 5 lines' })

vim.keymap.set('v', 'H', '^', { desc = 'Move to beginning of line' })
vim.keymap.set('v', 'L', 'g_', { desc = 'Move to end of line' })
vim.keymap.set('v', 'K', '5k', { desc = 'Move up 5 lines' })
vim.keymap.set('v', 'J', '5j', { desc = 'Move down 5 lines' })

-- Map <leader>k to toggle comment on a selection in visual mode
vim.keymap.set('n', '<leader>k', '<Plug>(comment_toggle_linewise_current)', { silent = true, desc = 'Toggle comment linewise' })
vim.keymap.set('v', '<leader>k', '<Plug>(comment_toggle_linewise_visual)', { silent = true, desc = 'Toggle comment linewise (visual)' })

vim.keymap.set('n', '<Leader>j', 'J', { desc = 'Join lines' })

-- Exit insert mode with 'jk'
vim.keymap.set('i', 'jk', '<Esc>', { desc = 'Exit insert mode' })

-- Save
vim.keymap.set('n', '<leader>w', ':w<CR>', { desc = 'Save file' })

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

--------------
--
-- >>> oo # from shell, navigate to vault (optional)
--
-- # NEW NOTE
-- >>> on "Note Name" # call my "obsidian new note" shell script (~/bin/on)
-- >>>
-- >>> ))) <leader>on # inside vim now, format note as template
-- >>> ))) # add tag, e.g. fact / blog / video / etc..
-- >>> ))) # add hubs, e.g. [[python]], [[machine-learning]], etc...
-- >>> ))) <leader>of # format title
--
-- # END OF DAY/WEEK REVIEW
-- >>> or # review notes in inbox
-- >>>
-- >>> ))) <leader>ok # inside vim now, move to zettelkasten
-- >>> ))) <leader>odd # or delete
-- >>>
-- >>> og # organize saved notes from zettelkasten into notes/[tag] folders
-- >>> ou # sync local with Notion
--
-- navigate to vault
-- vim.keymap.set('n', '<leader>oo', ':cd ~/vaults/main')

-- convert note to template and remove leading white space
-- vim.keymap.set('n', '<leader>on', ':ObsidianTemplate note<cr> :lua vim.cmd([[1,/^\\S/s/^\\n\\{1,}//]])<cr>')

-- Keybinding to create note with Telescope
-- vim.api.nvim_set_keymap('n', '<leader>on', ':lua CreateNoteWithTelescope()<CR>', { noremap = true, silent = true })

-- vim.keymap.set('n', 'gf', function()
--   if require('obsidian').util.cursor_on_markdown_link() then
--     return '<cmd>ObsidianFollowLink<CR>'
--   else
--     return 'gf'
--   end
-- end, { noremap = false, expr = true })

vim.api.nvim_set_keymap('n', '<leader>ob', ':b#<CR>', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<leader>ob', ':ObsidianBacklinks<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<leader>on', ':lua CreateNote()<CR>', { noremap = true, silent = true })

function CreateNote()
  local file_name = vim.fn.input 'Note Title: '
  if file_name == '' then
    print 'Error: A file name must be set.'
    return
  end

  -- Call the shell script to create the note, passing the flag to not open Neovim
  local handle = io.popen('~/scripts/on.sh -n "' .. file_name .. '"')
  local file_path = handle:read('*a'):gsub('%s+', '') -- Trim whitespace
  handle:close()

  if file_path ~= '' then
    -- Open the new file in Neovim
    vim.cmd('edit ' .. file_path)
  end
end

-- strip date from note title and replace dashes with spaces
-- must have cursor on title
-- vim.keymap.set('n', '<leader>of', ':s/\\(# \\)[^_]*_/\\1/ | s/-/ /g<cr>')
--
-- search for files in full vault
vim.keymap.set('n', '<leader>zo', ':ObsidianSearch<enter>')
vim.keymap.set('n', '<leader>so', ':Telescope find_files search_dirs={"~/vaults/main/"}<cr>')

-- vim.keymap.set('n', '<leader>oz', ':Telescope live_grep search_dirs={"~/vaults/main/"}<cr>')

-- twilight
vim.api.nvim_set_keymap('n', 'tw', ':Twilight<enter>', { noremap = false })

-- ZenMode
vim.api.nvim_set_keymap('n', 'tt', ':ZenMode<enter>', { noremap = false })

--
-- search for files in notes (ignore zettelkasten)
-- vim.keymap.set("n", "<leader>ois", ":Telescope find_files search_dirs={\"/Users/alex/library/Mobile\\ Documents/iCloud~md~obsidian/Documents/ZazenCodes/notes\"}<cr>")
-- vim.keymap.set("n", "<leader>oiz", ":Telescope live_grep search_dirs={\"/Users/alex/library/Mobile\\ Documents/iCloud~md~obsidian/Documents/ZazenCodes/notes\"}<cr>")
--
-- for review workflow
-- move file in current buffer to zettelkasten folder
vim.keymap.set('n', '<leader>ok', ":!mv '%:p' ~/vaults/main/zettelkasten<cr>:bd<cr>")
-- delete file in current buffer
vim.keymap.set('n', '<leader>odd', ":!rm '%:p'<cr>:bd<cr>")

-- markdown preview
vim.keymap.set('n', '<leader>p', ':MarkdownPreviewToggle<cr>', { noremap = false, silent = true })

-- sniprun
vim.keymap.set('v', '<leader>n', '<cmd>SnipRun<CR>', { noremap = true, silent = true })
-- vim. eymap.set('n', '<leader>rc', ':RunClose<CR>', { noremap = true, silent = false })

-- Define a table with filetypes and corresponding commands
local filetype_run_cmds = {
  python = 'python3 %',
  javascript = 'node %',
  c = 'gcc % -o %<.out && %<.out',
  lua = 'lua %',
  -- java = 'javac % && java %<',
  java = 'java %',
  ruby = 'ruby %',
  oz = 'ozc -c % -o %<.oza && ozengine %<.oza',
}

-- Define a function to manage and reuse or create terminal buffers
function _G.run_in_split(cmd)
  -- Save the current window and buffer
  local current_win = vim.api.nvim_get_current_win()
  local current_buf = vim.api.nvim_get_current_buf()

  -- Get current file path
  local file_path = vim.fn.expand '%:p'

  -- Search for an existing terminal window with a different buffer
  local found_terminal = false
  local terminal_win = nil
  local term_buf = nil

  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local buf = vim.api.nvim_win_get_buf(win)
    if vim.api.nvim_buf_get_option(buf, 'buftype') == 'terminal' then
      -- Check if the terminal is running a command for the same file
      local term_job_name = vim.b[buf].term_job_name or ''
      if term_job_name == file_path then
        terminal_win = win
        term_buf = buf
        found_terminal = true
        break
      end
    end
  end

  if not found_terminal then
    vim.cmd 'vsplit | term'
    terminal_win = vim.api.nvim_get_current_win()
    term_buf = vim.api.nvim_win_get_buf(terminal_win)

    -- Save the file path in the terminal buffer variable
    vim.b[term_buf].term_job_name = file_path
  end

  vim.api.nvim_set_current_win(terminal_win)

  vim.cmd 'vertical resize 80'

  local job_id = vim.api.nvim_buf_get_var(term_buf, 'terminal_job_id')

  vim.defer_fn(function()
    vim.fn.chansend(job_id, 'clear\n')

    local file_path_without_ext = vim.fn.expand '%:p:r'
    local final_cmd = cmd:gsub('%%<', file_path_without_ext):gsub('%%', file_path)

    vim.fn.chansend(job_id, final_cmd .. '\n')
  end, 100) -- Adjust the delay if necessary

  vim.api.nvim_set_current_win(current_win)
  vim.api.nvim_set_current_buf(current_buf)
end

-- Define a function to manage and reuse or create terminal buffers in tmux
function _G.run_in_tmux_pane(cmd)
  -- Save the current window and buffer
  local current_win = vim.api.nvim_get_current_win()
  local current_buf = vim.api.nvim_get_current_buf()

  -- Get current file path
  local file_path = vim.fn.expand '%:p'

  -- Check if a tmux pane already exists with the given name
  local pane_id = nil
  local panes = vim.fn.systemlist "tmux list-panes -F '#{pane_id} #{pane_title}'"

  for _, pane in ipairs(panes) do
    local parts = vim.split(pane, ' ')
    local id = parts[1]
    local title = parts[2]
    if title == file_path then
      pane_id = id
      break
    end
  end

  if not pane_id then
    -- Create a new vertical split pane and set the title to the file path
    vim.fn.system(string.format("tmux split-window -v -P -F '#{pane_id}' -t %s", vim.fn.expand '$TMUX_PANE'))
    pane_id = vim.fn.trim(vim.fn.system "tmux last-pane -t %s; tmux display-message -p '#{pane_id}'")

    -- Set the pane title to the file path
    vim.fn.system(string.format("tmux select-pane -t %s; tmux select-pane -T '%s'", pane_id, file_path))
  end

  -- Send the command to the tmux pane
  local file_path_without_ext = vim.fn.expand '%:p:r'
  local final_cmd = cmd:gsub('%%<', file_path_without_ext):gsub('%%', file_path)

  vim.fn.system(string.format("tmux send-keys -t %s 'clear' C-m", pane_id))
  vim.fn.system(string.format("tmux send-keys -t %s '%s' C-m", pane_id, final_cmd))

  -- Restore the current window and buffer
  vim.api.nvim_set_current_win(current_win)
  vim.api.nvim_set_current_buf(current_buf)
end

-- Set up autocommands for each filetype
for filetype, cmd in pairs(filetype_run_cmds) do
  vim.api.nvim_create_autocmd('FileType', {
    pattern = filetype,
    callback = function()
      -- Ensure the function is accessible when called
      vim.api.nvim_buf_set_keymap(0, 'n', '<leader>n', ":w<CR>:lua run_in_split('" .. cmd .. "')<CR>", { noremap = true, silent = true })
      -- vim.api.nvim_buf_set_keymap(0, 'n', '<leader>n', ":w<CR>:run_in_tmux_pane('" .. cmd .. "')<CR>", { noremap = true, silent = true })
    end,
  })
end

-- insert template in inbox md note files for obsidian

vim.api.nvim_create_autocmd({ 'BufReadPost', 'BufWritePost' }, {
  pattern = vim.fn.expand '$HOME' .. '/vaults/main/inbox/*.md',
  callback = function()
    local file_path = vim.fn.expand '%:p'

    -- Read the first few lines of the file to check for frontmatter
    local file_content = vim.fn.readfile(file_path)

    -- Check if file contains frontmatter
    local has_frontmatter = file_content[1] == '---' and vim.tbl_contains(vim.list_slice(file_content, 2), '---')

    -- If frontmatter is not present, insert the template
    if not has_frontmatter then
      vim.fn.system('zsh ~/scripts/insert-template.sh ' .. vim.fn.shellescape(file_path))

      -- Optionally, notify the user
      -- print('Template inserted into file: ' .. file_path)
      vim.cmd('e! ' .. vim.fn.fnameescape(file_path))
      -- else
      -- print 'Frontmatter already exists, skipping template insertion.'
    end
  end,
})

-- saves markdown / obsidian files
vim.api.nvim_create_autocmd({ 'FocusLost' }, {
  pattern = { '*.md' },
  command = 'w',
})

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.

-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Remap >> to indent and stay in visual mode
vim.api.nvim_set_keymap('x', '>', '>gv', { noremap = true, silent = true })

-- Remap << to outdent and stay in visual mode
vim.api.nvim_set_keymap('x', '<', '<gv', { noremap = true, silent = true })

vim.keymap.set('n', '<leader>ee', '<cmd>GoIfErr<cr>', { silent = true, noremap = true })

-- Macro
vim.keymap.set('n', 'q', function()
  if vim.fn.reg_recording() == '' then
    -- Start recording
    vim.cmd 'normal! qa'
  else
    -- Stop recording
    vim.cmd 'normal! q'
  end
end)

vim.keymap.set('n', '<leader>r', '@a', { desc = 'Execute macro' })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Automatically remove ^M characters on save
vim.cmd [[
  autocmd BufWritePre * :%s/\r//ge
]]

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- [[ Configure and install plugins ]]
--
--  To check the current status of your plugins, run
--    :Lazy
--
--  You can press `?` in this menu for help. Use `:q` to close the window
--
--  To update plugins you can run
--    :Lazy update
-- NOTE: Here is where you install your plugins.
require('lazy').setup({
  -- NOTE: Plugins can be added with a link (or for a github repo: 'owner/repo' link).
  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically

  -- NOTE: Plugins can also be added by using a table,
  -- with the first argument being the link and the following
  -- keys can be used to configure plugin behavior/loading/etc.
  --
  -- Use `opts = {}` to force a plugin to be loaded.
  --
  --  This is equivalent to:
  --    require('Comment').setup({})
  ---------- My plugins ---------
  -- makes navigation between nvim and tmux more seeamless
  {
    'christoomey/vim-tmux-navigator',
    cmd = {
      'TmuxNavigateLeft',
      'TmuxNavigateDown',
      'TmuxNavigateUp',
      'TmuxNavigateRight',
      'TmuxNavigatePrevious',
    },

    keys = {
      { '<c-h>', '<cmd><C-U>TmuxNavigateLeft<cr>' },
      { '<c-j>', '<cmd><C-U>TmuxNavigateDown<cr>' },
      { '<c-k>', '<cmd><C-U>TmuxNavigateUp<cr>' },
      { '<c-l>', '<cmd><C-U>TmuxNavigateRight<cr>' },
      { '<c-\\>', '<cmd><C-U>TmuxNavigatePrevious<cr>' },
    },
  },
  {
    -- Nvim Web DevIcons
    'nvim-tree/nvim-web-devicons',
    -- Set up the plugin
    config = function()
      require('nvim-web-devicons').setup {
        -- Default c the defaults are fine)
        default = true,
      }
    end,
  },
  -- Oil.nvim configuration
  {
    'stevearc/oil.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('oil').setup {
        columns = { 'icon' },
        keymaps = {
          ['<C-h>'] = false,
          ['<M-h>'] = 'actions.select_split',
        },
        view_options = {
          show_hidden = true,
        },
      }

      -- Open parent directory in current window
      -- vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })

      -- Open parent directory in floating window
      vim.keymap.set('n', '<space>-', require('oil').toggle_float, { desc = 'Open parent directory' })
    end,
  },
  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    lazy = false,
    requires = { 'nvim-lua/plenary.nvim' }, -- if harpoon requires this
    config = function()
      require('harpoon').setup {}

      -- open harpoon in telescope ui
      local harpoon = require 'harpoon'
      local conf = require('telescope.config').values

      local function toggle_telescope(harpoon_files)
        local file_paths = {}
        for _, item in ipairs(harpoon_files.items) do
          table.insert(file_paths, item.value)
        end

        require('telescope.pickers')
          .new({}, {
            prompt_title = 'Harpoon',
            finder = require('telescope.finders').new_table {
              results = file_paths,
            },
            previewer = conf.file_previewer {},
            sorter = conf.generic_sorter {},
          })
          :find()
      end

      -- vim.keymap.set('n', '<C-e>', function() toggle_telescope(harpoon:list()) end, { desc = 'Open harpoon window' })
      vim.keymap.set('n', '<C-e>', function()
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end, { desc = 'toggle harpoon list' })
      vim.keymap.set('n', '<leader>a', function()
        harpoon:list():add()
      end, { desc = 'harpoon add to list' })
      vim.keymap.set('n', '<M-h>', function()
        harpoon:list():select(1)
      end, { desc = 'harpoon go to mark 1' })
      vim.keymap.set('n', '<M-j>', function()
        harpoon:list():select(2)
      end, { desc = 'harpoon go to mark 2' })
      vim.keymap.set('n', '<M-k>', function()
        harpoon:list():select(3)
      end, { desc = 'harpoon go to mark 3' })
      vim.keymap.set('n', '<M-l>', function()
        harpoon:list():select(4)
      end, { desc = 'harpoon go to mark 4' })
    end,
  },
  {
    'mbbill/undotree',
    vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle, { desc = 'toggle Undotree' }),
  },
  {
    'nvimtools/none-ls.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    event = 'VeryLazy',
    opts = function()
      return require 'custom.configs.none_ls'
    end,
  },

  {
    'rcarriga/nvim-notify',
    config = function()
      require('notify').setup {
        stages = 'fade_in_slide_out',
        render = 'wrapped-compact',
      }

      vim.notify = require 'notify'
    end,
  },

  { -- coderunner/ sniprun
    'michaelb/sniprun',
    build = 'sh install.sh',
    config = function()
      require('sniprun').setup {
        selected_interpreters = { 'Generic' }, -- "use those instead of the default for the current filetype" -- Enable the Generic interpreter
        repl_enable = {}, -- "enable REPL-like behavior for the given interpreters"

        interpreter_options = {
          -- Generic = {
          --   error_truncate = 'long',
          --
          --   OzConfig = {
          --     supported_filetypes = { 'oz' },
          --     extension = '.oz',
          --     boilerplate_pre = 'declare\n',
          --     boilerplate_post = '\n',
          --
          --     interpreter = '',
          --   },
          -- },
        }, -- "specific options for interpreters"
        display = {
          -- 'Classic', -- "display results in the command area"
          -- 'VirtualTextOk', -- "display ok results as virtual text (multiline is shortened)"
          -- 'VirtualTextErr', -- "display error results as virtual text"
          -- 'TempFloatingWindow', -- "display results in a floating window"
          -- 'LongTempFloatingWindow', -- "same as above but only long results"
          'Terminal', -- "display results in a vertical split"
          -- 'TerminalWithCode', -- "display results and code history in a vertical split"
          -- 'NvimNotify', -- "display results with the nvim-notify plugin"
        },
        display_options = {
          terminal_width = 45, -- "change the terminal display option width"
          notification_timeout = 5, -- "timeout for nvim_notify output"
        },
        show_no_output = {
          'Classic',
          'TempFloatingWindow', -- "display methods to use when no result"
        },
        snipruncolors = {
          SniprunVirtualTextOk = { fg = '#66eeff' },
          SniprunFloatingWinOk = { fg = '#66eeff' },
          SniprunVirtualTextErr = { fg = '#881515' },
          SniprunFloatingWinErr = { fg = '#881515' },
        },
        inline_messages = 0, -- "inline_message (0/1) is a one-line way to display messages"
        borders = 'single', -- "display borders for floating windows"
      }
    end,
  },
  {
    -- syntax highlighting for mozart-oz
    'Procrat/oz.vim',
    ft = { 'oz', 'markdown' },
  },

  {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require('colorizer').setup({
        'css',
        'javascript',
        html = {
          mode = 'foreground',
        },
      }, {
        RGB = true, -- Enable #RGB hex codes
        RRGGBB = true, -- Enable #RRGGBB hex codes
        names = true, -- Enable "Name" codes like Blue
        RRGGBBAA = false, -- Disable #RRGGBBAA hex codes
        rgb_fn = false, -- Disable CSS rgb() and rgba() functions
        hsl_fn = false, -- Disable CSS hsl() and hsla() functions
        css = false, -- Disable all CSS features
        css_fn = false, -- Disable all CSS *functions*
        mode = 'background', -- Set the display mode.
      })
    end,
  },
  {
    'epwalsh/obsidian.nvim',
    version = '*', -- recommended, use latest release instead of latest commit
    lazy = false,
    ft = 'markdown',
    -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
    -- event = {
    --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
    --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
    --   -- refer to `:h file-pattern` for more examples
    --   "BufReadPre path/to/my-vault/*.md",
    --   "BufNewFile path/to/my-vault/*.md",
    -- },
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    opts = {
      workspaces = {
        {
          name = 'main',
          path = '~/vaults/main',
        },
      },
      ui = { enable = false },

      disable_frontmatter = true,
      notes_subdir = 'inbox',
      completion = {
        nvim_cmp = true,
        min_chars = 2,
      },
      ---@param url string
      follow_url_func = function(url)
        -- Open the URL in the default web browser.
        -- vim.fn.jobstart { 'xdg-open', url } -- linux

        vim.fn.jobstart { 'firefox', '--new-window', url }
        -- vim.cmd(':silent exec "!start ' .. url .. '"') -- Windows
        -- vim.ui.open(url) -- need Neovim 0.10.0+
      end,

      note_id_func = function(title)
        local name_gen_output = vim.fn.systemlist('zsh ~/scripts/name-gen.sh ' .. vim.fn.shellescape(title))

        local formatted_file_name = name_gen_output[1]
        -- local file_path = vim.fn.expand '$HOME' .. '/vaults/main/inbox/' .. formatted_file_name
        return formatted_file_name
      end,

      note_path_func = function(spec)
        -- Generate the file name using the name generation script
        local name_gen_output = vim.fn.systemlist('zsh ~/scripts/name-gen.sh ' .. vim.fn.shellescape(spec.title))

        -- The generated file name will be the first item in the output
        local formatted_file_name = name_gen_output[1]
        local file_path = vim.fn.expand '$HOME' .. '/vaults/main/inbox/' .. formatted_file_name

        -- Run the template filling function on the generated file path
        -- vim.fn.system('zsh ~/scripts/insert-template.sh ' .. vim.fn.shellescape(file_path))

        -- Return the full path for the new note
        return file_path
      end,

      -- templates = {
      --   folder = 'templates',
      --   date_format = '%Y-%m-%d',
      --   time_format = '%H:%M',
      --   -- A map for custom variables, the key should be the variable and the value a function
      --   substitutions = {},
      -- },
    },
  },
  {
    'MeanderingProgrammer/render-markdown.nvim',
    opts = {
      code = {
        -- style = 'language',
        style = 'none',
        sign = false,
        position = 'left',
        language_pad = 0,
        -- disable_background = { 'diff' },
        -- width = 'full',
        -- left_pad = 0,
        -- right_pad = 0,
        -- min_width = 0,
        --  thin:  when lines are empty overlay the above & below icons
        -- border = 'thin',
        -- above = '▄',
        -- below = '▀',
        -- Highlight for code blocks
        highlight = 'RenderMarkdownCode',
        highlight_inline = 'RenderMarkdownCodeInline',

        --
        -- vim.cmd [[highlight Folded guibg=NONE ctermbg=NONE]]
      },
      heading = {
        sign = false,
        position = 'inline',
        width = 'block',
        -- left_pad = 0,
        right_pad = 1,
        -- min_width = 0,
        max_width = 100,
      },
    },

    -- config = function()
    --   -- vim.cmd [[highlight RenderMarkdownH1Bg guibg=NONE ctermbg=NONE]]
    --   vim.cmd [[
    --       highlight RenderMarkdownH1Bg guibg=NONE
    --       highlight RenderMarkdownH2Bg guibg=NONE
    --       highlight RenderMarkdownH3Bg guibg=NONE
    --       highlight RenderMarkdownH4Bg guibg=NONE
    --       highlight RenderMarkdownH5Bg guibg=NONE
    --       highlight RenderMarkdownH6Bg guibg=NONE
    --       highlight RenderMarkdownCode guibg=NONE
    --     ]]
    -- end,

    dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
  },
  {
    'iamcco/markdown-preview.nvim',
    cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
    build = 'cd app && yarn install',
    init = function()
      vim.g.mkdp_filetypes = { 'markdown' }
      vim.g.mkdp_auto_start = 0
      vim.g.mkdp_auto_close = 1
      vim.g.mkdp_browser = 'firefox'
    end,
    ft = { 'markdown' },
  },
  {
    'folke/twilight.nvim',
    opts = {},
  },
  {
    'folke/zen-mode.nvim',
    opts = {
      window = {
        backdrop = 0.95,
        width = 120, -- width of the Zen window
        height = 1, -- height of the Zen window
        options = {
          signcolumn = 'no', -- disable signcolumn
          number = false, -- disable number column
          relativenumber = false, -- disable relative numbers
          -- cursorline = false, -- disable cursorline
          -- cursorcolumn = false, -- disable cursor column
          -- foldcolumn = "0", -- disable fold column
          -- list = false, -- disable whitespace characters
        },
      },

      plugins = {
        twilight = { enabled = true }, -- enable to start Twilight when zen mode opens
        gitsigns = { enabled = false }, -- disables git signs
        -- tmux = { enabled = true }, -- disables the tmux statusline
        alacritty = {
          enabled = true,
          font = '+20', -- (10% increase per step)
        },
      },
    },
  },
  {
    'kevinhwang91/nvim-ufo',
    dependencies = { 'kevinhwang91/promise-async' },

    config = function()
      -- Define the custom handler function for fold text
      local handler = function(virtText, lnum, endLnum, width, truncate)
        local newVirtText = {}
        local suffix = (' 󰁂 %d '):format(endLnum - lnum)
        local sufWidth = vim.fn.strdisplaywidth(suffix)
        local targetWidth = width - sufWidth
        local curWidth = 0
        for _, chunk in ipairs(virtText) do
          local chunkText = chunk[1]
          local chunkWidth = vim.fn.strdisplaywidth(chunkText)
          if targetWidth > curWidth + chunkWidth then
            table.insert(newVirtText, chunk)
          else
            chunkText = truncate(chunkText, targetWidth - curWidth)
            local hlGroup = chunk[2]
            table.insert(newVirtText, { chunkText, hlGroup })
            chunkWidth = vim.fn.strdisplaywidth(chunkText)
            -- str width returned from truncate() may less than 2nd argument, need padding
            if curWidth + chunkWidth < targetWidth then
              suffix = suffix .. (' '):rep(targetWidth - curWidth - chunkWidth)
            end
            break
          end
          curWidth = curWidth + chunkWidth
        end
        table.insert(newVirtText, { suffix, 'MoreMsg' })
        return newVirtText
      end

      -- Setup nvim-ufo
      require('ufo').setup {
        provider_selector = function(bufnr, filetype, buftype)
          return { 'lsp', 'indent' }
        end,
        fold_virt_text_handler = handler,
      }

      -- Fold settings
      vim.o.foldcolumn = '0' -- Shows the fold column on the left side
      vim.o.foldlevel = 99 -- Use a high fold level (UFO recommends this)
      vim.o.foldlevelstart = 99 -- Open all folds by default
      vim.o.foldenable = true -- Enable folding

      -- Customize the Folded highlight group to remove background color
      vim.cmd [[highlight Folded guibg=NONE ctermbg=NONE]]
      vim.cmd [[highlight UfoFoldedBg guibg=NONE ctermbg=NONE]]

      -- Setup LSP servers with folding capabilities
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities.textDocument.foldingRange = {
        dynamicRegistration = false,
        lineFoldingOnly = true,
      }

      -- Use default `za` functionality for <leader>c
      vim.keymap.set('n', '<leader>c', 'za', { noremap = true, silent = true })
    end,
  },
  {
    'goolord/alpha-nvim',
    -- dependencies = { 'echasnovski/mini.icons' },
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      local startify = require 'alpha.themes.startify'
      startify.file_icons.provider = 'devicons'
      require('alpha').setup(startify.config)
    end,
  },
  {
    'lervag/vimtex',
    lazy = false,
    init = function()
      vim.g.vimtex_view_method = 'zathura'
    end,
  },
  -------------------------------
  -- "gc" to comment visual regions/lines
  {
    'numToStr/Comment.nvim',
    opts = {
      ignore = '^$',
      ignore = '^%s*$',
      timeoutlen = 1000,
    },
    lazy = false,
  },
  -- Here is a more advanced example where we pass configuration
  -- options to `gitsigns.nvim`. This is equivalent to the following Lua:
  -- Here is a more advanced example where we pass configuration
  -- options to `gitsigns.nvim`. This is equivalent to the following Lua:
  --    require('gitsigns').setup({ ... })
  --
  -- See `:help gitsigns` to understand what the configuration keys do
  { -- Adds git related signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    },
  },

  -- NOTE: Plugins can also be configured to run Lua code when they are loaded.
  --
  -- This is often very useful to both group configuration, as well as handle
  -- lazy loading plugins that don't need to be loaded immediately at startup.
  --
  -- For example, in the following configuration, we use:
  --  event = 'VimEnter'
  --
  -- which loads which-key before all the UI elements are loaded. Events can be
  -- normal autocommands events (`:help autocmd-events`).
  --
  -- Then, because we use the `config` key, the configuration only runs
  -- after the plugin has been loaded:
  --  config = function() ... end

  { -- Useful plugin to show you pending keybinds.
    'folke/which-key.nvim',
    event = 'VimEnter', -- Sets the loading event to 'VimEnter'
    opts = {
      icons = {
        -- set icon mappings to true if you have a Nerd Font
        mappings = vim.g.have_nerd_font,
        -- If you are using a Nerd Font: set icons.keys to an empty table which will use the
        -- default whick-key.nvim defined Nerd Font icons, otherwise define a string table
        keys = vim.g.have_nerd_font and {} or {
          Up = '<Up> ',
          Down = '<Down> ',
          Left = '<Left> ',
          Right = '<Right> ',
          C = '<C-…> ',
          M = '<M-…> ',
          D = '<D-…> ',
          S = '<S-…> ',
          CR = '<CR> ',
          Esc = '<Esc> ',
          ScrollWheelDown = '<ScrollWheelDown> ',
          ScrollWheelUp = '<ScrollWheelUp> ',
          NL = '<NL> ',
          BS = '<BS> ',
          Space = '<Space> ',
          Tab = '<Tab> ',
          F1 = '<F1>',
          F2 = '<F2>',
          F3 = '<F3>',
          F4 = '<F4>',
          F5 = '<F5>',
          F6 = '<F6>',
          F7 = '<F7>',
          F8 = '<F8>',
          F9 = '<F9>',
          F10 = '<F10>',
          F11 = '<F11>',
          F12 = '<F12>',
        },
      },

      -- Document existing key chains
      -- spec = {
      --   { '<leader>c', group = '[C]ode', mode = { 'n', 'x' } },
      --   { '<leader>d', group = '[D]ocument' },
      --   { '<leader>r', group = '[R]ename' },
      --   { '<leader>s', group = '[S]earch' },
      --   { '<leader>w', group = '[W]orkspace' },
      --   { '<leader>t', group = '[T]oggle' },
      --   { '<leader>h', group = 'Git [H]unk', mode = { 'n', 'v' } },
      -- },
    },
  },

  -- NOTE: Plugins can specify dependencies.
  --
  -- The dependencies are proper plugin specifications as well - anything
  -- you do for a plugin at the top level, you can do for a dependency.
  --
  -- Use the `dependencies` key to specify the dependencies of a particular plugin

  { -- Fuzzy Finder (files, lsp, etc)
    'nvim-telescope/telescope.nvim',
    event = 'VimEnter',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { -- If encountering errors, see telescope-fzf-native README for installation instructions
        'nvim-telescope/telescope-fzf-native.nvim',

        -- `build` is used to run some command when the plugin is installed/updated.
        -- This is only run then, not every time Neovim starts up.
        build = 'make',

        -- `cond` is a condition used to determine whether this plugin should be
        -- installed and loaded.
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
      { 'nvim-telescope/telescope-ui-select.nvim' },

      -- Useful for getting pretty icons, but requires a Nerd Font.
      { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
    },
    config = function()
      -- Telescope is a fuzzy finder that comes with a lot of different things that
      -- it can fuzzy find! It's more than just a "file finder", it can search
      -- many different aspects of Neovim, your workspace, LSP, and more!
      --
      -- The easiest way to use Telescope, is to start by doing something like:
      --  :Telescope help_tags
      --
      -- After running this command, a window will open up and you're able to
      -- type in the prompt window. You'll see a list of `help_tags` options and
      -- a corresponding preview of the help.
      --
      -- Two important keymaps to use while in Telescope are:
      --  - Insert mode: <c-/>
      --  - Normal mode: ?
      --
      -- This opens a window that shows you all of the keymaps for the current
      -- Telescope picker. This is really useful to discover what Telescope can
      -- do as well as how to actually do it!

      -- [[ Configure Telescope ]]
      -- See `:help telescope` and `:help telescope.setup()`
      require('telescope').setup {
        -- You can put your default mappings / updates / etc. in here
        --  All the info you're looking for is in `:help telescope.setup()`
        --
        -- defaults = {
        --   mappings = {
        --     i = { ['<c-enter>'] = 'to_fuzzy_refine' },
        --   },
        -- },
        -- pickers = {}
        extensions = {
          ['ui-select'] = {
            require('telescope.themes').get_dropdown(),
          },
        },
      }

      -- Enable Telescope extensions if they are installed
      pcall(require('telescope').load_extension, 'fzf')
      pcall(require('telescope').load_extension, 'ui-select')

      -- See `:help telescope.builtin`
      local builtin = require 'telescope.builtin'
      vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
      vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
      -- vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
      vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
      vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
      vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
      vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
      vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
      vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
      vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
      vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })

      -- Slightly advanced example of overriding default behavior and theme
      vim.keymap.set('n', '<leader>/', function()
        -- You can pass additional configuration to Telescope to change the theme, layout, etc.
        builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
          winblend = 10,
          previewer = false,
        })
      end, { desc = '[/] Fuzzily search in current buffer' })

      -- It's also possible to pass additional configuration options.
      --  See `:help telescope.builtin.live_grep()` for information about particular keys
      vim.keymap.set('n', '<leader>s/', function()
        builtin.live_grep {
          grep_open_files = true,
          prompt_title = 'Live Grep in Open Files',
        }
      end, { desc = '[S]earch [/] in Open Files' })

      -- Shortcut for searching your Neovim configuration files
      vim.keymap.set('n', '<leader>sn', function()
        builtin.find_files { cwd = vim.fn.stdpath 'config' }
      end, { desc = '[S]earch [N]eovim files' })
    end,
  },

  { -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Automatically install LSPs and related tools to stdpath for Neovim
      { 'williamboman/mason.nvim', config = true }, -- NOTE: Must be loaded before dependants
      'williamboman/mason-lspconfig.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',

      -- Useful status updates for LSP.
      -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
      { 'j-hui/fidget.nvim', opts = {} },

      -- `neodev` configures Lua LSP for your Neovim config, runtime and plugins
      -- used for completion, annotations and signatures of Neovim apis
      { 'folke/neodev.nvim', opts = {} },
    },
    config = function()
      -- Brief aside: **What is LSP?**
      --
      -- LSP is an initialism you've probably heard, but might not understand what it is.
      --
      -- LSP stands for Language Server Protocol. It's a protocol that helps editors
      -- and language tooling communicate in a standardized fashion.
      --
      -- In general, you have a "server" which is some tool built to understand a particular
      -- language (such as `gopls`, `lua_ls`, `rust_analyzer`, etc.). These Language Servers
      -- (sometimes called LSP servers, but that's kind of like ATM Machine) are standalone
      -- processes that communicate with some "client" - in this case, Neovim!
      --
      -- LSP provides Neovim with features like:
      --  - Go to definition
      --  - Find references
      --  - Autocompletion
      --  - Symbol Search
      --  - and more!
      --
      -- Thus, Language Servers are external tools that must be installed separately from
      -- Neovim. This is where `mason` and related plugins come into play.
      --
      -- If you're wondering about lsp vs treesitter, you can check out the wonderfully
      -- and elegantly composed help section, `:help lsp-vs-treesitter`

      --  This function gets run when an LSP attaches to a particular buffer.
      --    That is to say, every time a new file is opened that is associated with
      --    an lsp (for example, opening `main.rs` is associated with `rust_analyzer`) this
      --    function will be executed to configure the current buffer
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
        callback = function(event)
          -- NOTE: Remember that Lua is a real programming language, and as such it is possible
          -- to define small helper and utility functions so you don't have to repeat yourself.
          --
          -- In this case, we create a function that lets us more easily define mappings specific
          -- for LSP related items. It sets the mode, buffer and description for us each time.
          local map = function(keys, func, desc)
            vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
          end

          -- Jump to the definition of the word under your cursor.
          --  This is where a variable was first declared, or where a function is defined, etc.
          --  To jump back, press <C-t>.
          map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')

          -- Find references for the word under your cursor.
          map('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')

          -- Jump to the implementation of the word under your cursor.
          --  Useful when your language has ways of declaring types without an actual implementation.
          map('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')

          -- Jump to the type of the word under your cursor.
          --  Useful when you're not sure what type a variable is and you want to see
          --  the definition of its *type*, not where it was *defined*.
          map('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')

          -- Fuzzy find all the symbols in your current document.
          --  Symbols are things like variables, functions, types, etc.
          map('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')

          -- Fuzzy find all the symbols in your current workspace.
          --  Similar to document symbols, except searches over your entire project.
          map('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

          -- Rename the variable under your cursor.
          --  Most Language Servers support renaming across files, etc.
          map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')

          -- Execute a code action, usually your cursor needs to be on top of an error
          -- or a suggestion from your LSP for this to activate.
          map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

          -- Opens a popup that displays documentation about the word under your cursor
          map('<leader>m', vim.lsp.buf.hover, 'Hover Documentation')

          -- WARN: This is not Goto Definition, this is Goto Declaration.
          --  For example, in C this would take you to the header.
          map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
          -- Automatically remove ^M characters on save
          vim.cmd [[
  autocmd BufWritePre * :%s/\r//ge
]]

          -- Source init.lua whenever it is written to
          vim.cmd [[
  autocmd BufWritePost ~/.config/nvim/init.lua source %
]]
          -- The following two autocommands are used to highlight references of the
          -- word under your cursor when your cursor rests there for a little while.
          --    See `:help CursorHold` for information about when this is executed
          --
          -- When you move your cursor, the highlights will be cleared (the second autocommand).
          local client = vim.lsp.get_client_by_id(event.data.client_id)
          if client and client.server_capabilities.documentHighlightProvider then
            local highlight_augroup = vim.api.nvim_create_augroup('kickstart-lsp-highlight', { clear = false })
            vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.document_highlight,
            })

            vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.clear_references,
            })

            vim.api.nvim_create_autocmd('LspDetach', {
              group = vim.api.nvim_create_augroup('kickstart-lsp-detach', { clear = true }),
              callback = function(event2)
                vim.lsp.buf.clear_references()
                vim.api.nvim_clear_autocmds { group = 'kickstart-lsp-highlight', buffer = event2.buf }
              end,
            })
          end

          -- The following autocommand is used to enable inlay hints in your
          -- code, if the language server you are using supports them
          --
          -- This may be unwanted, since they displace some of your code
          if client and client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
            map('<leader>th', function()
              vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
            end, '[T]oggle Inlay [H]ints')
          end
        end,
      })

      -- LSP servers and clients are able to communicate to each other what features they support.
      --  By default, Neovim doesn't support everything that is in the LSP specification.
      --  When you add nvim-cmp, luasnip, etc. Neovim now has *more* capabilities.
      --  So, we create new capabilities with nvim cmp, and then broadcast that to the servers.
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

      -- Enable the following language servers
      --  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
      --
      --  Add any additional override configuration in the following tables. Available keys are:
      --  - cmd (table): Override the default command used to start the server
      --  - filetypes (table): Override the default list of associated filetypes for the server
      --  - capabilities (table): Override fields in capabilities. Can be used to disable certain LSP features.
      --  - settings (table): Override the default settings passed when initializing the server.
      --        For example, to see the options for `lua_ls`, you could go to: https://luals.github.io/wiki/settings/
      local servers = {
        -- clangd = {},
        -- gopls = {},
        -- rust_analyzer = {},
        -- ... etc. See `:help lspconfig-all` for a list of all the pre-configured LSPs
        --
        -- Some languages (like typescript) have entire language plugins that can be useful:
        --    https://github.com/pmizio/typescript-tools.nvim
        --
        -- But for many setups, the LSP (`tsserver`) will work just fine
        -- tsserver = {},
        --
        hyprls = {},
        lua_ls = {
          -- cmd = {...},
          -- filetypes = { ...},
          -- capabilities = {},
          settings = {
            Lua = {
              completion = {
                callSnippet = 'Replace',
              },
              -- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
              -- diagnostics = { disable = { 'missing-fields' } },
            },
          },
        },
        -- pyright = {},
        asm_lsp = {
          cmd = { 'asm-lsp' },
          filetypes = { 'asm', 'vmasm', 's', 'S' },
        },
      }

      -- Ensure the servers and tools above are installed
      --  To check the current status of installed tools and/or manually install
      --  other tools, you can run
      --    :Mason
      --
      --  You can press `g?` for help in this menu.
      require('mason').setup()

      -- You can add other tools here that you want Mason to install
      -- for you, so that they are available from within Neovim.
      local ensure_installed = vim.tbl_keys(servers or {})
      vim.list_extend(ensure_installed, {
        'stylua', -- Lua formatter
        'ruff', -- Python linting
        'mypy', -- Python type checker
        'isort', -- Python import sorter
        'yapf', -- Python formatter
        'clangd', -- c++ formatter
        'jdtls', -- java
        'clangd', -- c / c++
        'sqlls',
      })
      require('mason-tool-installer').setup { ensure_installed = ensure_installed }

      require('mason-lspconfig').setup {
        handlers = {
          function(server_name)
            local server = servers[server_name] or {}
            -- This handles overriding only values explicitly passed
            -- by the server configuration above. Useful when disabling
            -- certain features of an LSP (for example, turning off formatting for tsserver)
            server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
            require('lspconfig')[server_name].setup(server)
          end,
        },
      }
    end,
  },

  { -- Autoformat
    'stevearc/conform.nvim',
    lazy = false,
    keys = {
      {
        '<leader>f',
        function()
          require('conform').format { async = true, lsp_fallback = true }
        end,
        mode = '',
        desc = '[F]ormat buffer',
      },
    },
    opts = {
      notify_on_error = false,
      format_on_save = function(bufnr)
        -- Disable "format_on_save lsp_fallback" for languages that don't
        -- have a well standardized coding style. You can add additional
        -- languages here or re-enable it for the disabled ones.
        local disable_filetypes = { c = true, cpp = true, markdown = true }
        return {
          timeout_ms = 500,
          lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
        }
      end,
      formatters_by_ft = {
        lua = { 'stylua' },
        -- Conform can also run multiple formatters sequentially
        python = { 'isort', 'yapf' },
        -- You can use a sub-list to tell conform to run *until* a formatter
        -- is found.
        -- javascript = { { "prettierd", "prettier" } },
      },
    },
  },

  { -- Autocompletion
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      -- Snippet Engine & its associated nvim-cmp source
      {
        'L3MON4D3/LuaSnip',
        build = (function()
          -- Build Step is needed for regex support in snippets.
          -- This step is not supported in many windows environments.
          -- Remove the below condition to re-enable on windows.
          if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
            return
          end
          return 'make install_jsregexp'
        end)(),
        dependencies = {
          -- `friendly-snippets` contains a variety of premade snippets.
          --    See the README about individual language/framework/plugin snippets:
          --    https://github.com/rafamadriz/friendly-snippets
          -- {
          --   'rafamadriz/friendly-snippets',
          --   config = function()
          --     require('luasnip.loaders.from_vscode').lazy_load()
          --   end,
          -- },
        },
      },
      'saadparwaiz1/cmp_luasnip',

      -- Adds other completion capabilities.
      --  nvim-cmp does not ship with all sources by default. They are split
      --  into multiple repos for maintenance purposes.
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
    },
    config = function()
      -- See `:help cmp`
      local cmp = require 'cmp'
      local luasnip = require 'luasnip'
      luasnip.config.setup {}

      cmp.setup {
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        completion = { completeopt = 'menu,menuone,noinsert' },

        -- For an understanding of why these mappings were
        -- chosen, you will need to read `:help ins-completion`
        --
        -- No, but seriously. Please read `:help ins-completion`, it is really good!
        mapping = cmp.mapping.preset.insert {
          -- Select the [n]ext item
          ['<C-n>'] = cmp.mapping.select_next_item(),
          -- Select the [p]revious item
          ['<C-p>'] = cmp.mapping.select_prev_item(),

          -- Scroll the documentation window [b]ack / [f]orward
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),

          -- Accept ([y]es) the completion.
          --  This will auto-import if your LSP supports it.
          --  This will expand snippets if the LSP sent a snippet.
          ['<C-y>'] = cmp.mapping.confirm { select = true },

          -- If you prefer more traditional completion keymaps,
          -- you can uncomment the following lines
          --['<CR>'] = cmp.mapping.confirm { select = true },
          --['<Tab>'] = cmp.mapping.select_next_item(),
          --['<S-Tab>'] = cmp.mapping.select_prev_item(),

          -- Manually trigger a completion from nvim-cmp.
          --  Generally you don't need this, because nvim-cmp will display
          --  completions whenever it has completion options available.
          ['<C-Space>'] = cmp.mapping.complete {},

          -- Think of <c-l> as moving to the right of your snippet expansion.
          --  So if you have a snippet that's like:
          --  function $name($args)
          --    $body
          --  end
          --
          -- <c-l> will move you to the right of each of the expansion locations.
          -- <c-h> is similar, except moving you backwards.
          ['<C-l>'] = cmp.mapping(function()
            if luasnip.expand_or_locally_jumpable() then
              luasnip.expand_or_jump()
            end
          end, { 'i', 's' }),
          ['<C-h>'] = cmp.mapping(function()
            if luasnip.locally_jumpable(-1) then
              luasnip.jump(-1)
            end
          end, { 'i', 's' }),

          -- For more advanced Luasnip keymaps (e.g. selecting choice nodes, expansion) see:
          --    https://github.com/L3MON4D3/LuaSnip?tab=readme-ov-file#keymaps
        },
        sources = {
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
          { name = 'path' },
        },
      }
    end,
  },

  { -- You can easily change to a different colorscheme.
    -- Change the name of the colorscheme plugin below, and then
    -- change the command in the config to whatever the name of that colorscheme is.
    --
    -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
    'folke/tokyonight.nvim',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    -- init = function()
    -- Load the colorscheme here.
    -- Like many other themes, this one has different styles, and you could load
    -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.

    -- config = function()
    -- vim.cmd.colorscheme 'tokyonight-storm'
    -- end,
    -- You can configure highlights by doing something like:
    -- vim.cmd.hi 'Comment gui=none'
    -- end,
  },
  { 'Mofiqul/dracula.nvim' },
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,

    config = function()
      -- You can configure Catppuccin options here if needed
      require('catppuccin').setup {
        flavour = 'frappe', -- Can be 'latte', 'frappe', 'macchiato', 'mocha'
      }
      -- Set the colorscheme
      vim.cmd.colorscheme 'catppuccin-frappe'
    end,
  },
  -- Highlight todo, notes, etc in comments
  { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },

  {
    'wilmanbarrios/palenight.nvim',

    -- config = function()
    -- vim.cmd.colorscheme 'palenight'
    -- end,
  },
  { -- Collection of various small independent plugins/modules
    'echasnovski/mini.nvim',
    config = function()
      -- Better Around/Inside textobjects
      --
      -- Examples:
      --  - va)  - [V]isually select [A]round [)]paren
      --  - yinq - [Y]ank [I]nside [N]ext [']quote
      --  - ci'  - [C]hange [I]nside [']quote
      require('mini.ai').setup { n_lines = 500 }

      -- Add/delete/replace surroundings (brackets, quotes, etc.)
      --
      -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
      -- - sd'   - [S]urround [D]elete [']quotes
      -- - sr)'  - [S]urround [R]eplace [)] [']
      require('mini.surround').setup()

      -- Simple and easy statusline.
      --  You could remove this setup call if you don't like it,
      --  and try some other statusline plugin
      local statusline = require 'mini.statusline'
      -- set use_icons to true if you have a Nerd Font
      statusline.setup { use_icons = vim.g.have_nerd_font }

      -- You can configure sections in the statusline by overriding their
      -- default behavior. For example, here we set the section for
      -- cursor location to LINE:COLUMN
      ---@diagnostic disable-next-line: duplicate-set-field
      statusline.section_location = function()
        return '%2l:%-2v'
      end

      -- ... and there is more!
      --  Check out: https://github.com/echasnovski/mini.nvim
    end,
  },
  { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    opts = {
      ensure_installed = { 'bash', 'c', 'diff', 'html', 'lua', 'luadoc', 'markdown', 'markdown_inline', 'vim', 'vimdoc', 'hyprlang', 'jsonc' },
      -- Autoinstall languages that are not installed
      auto_install = true,
      highlight = {
        enable = true,
        -- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
        --  If you are experiencing weird indenting issues, add the language to
        --  the list of additional_vim_regex_highlighting and disabled languages for indent.
        additional_vim_regex_highlighting = { 'ruby', 'latex' },
      },
      indent = { enable = true, disable = { 'ruby' } },
    },
    config = function(_, opts)
      -- [[ Configure Treesitter ]] See `:help nvim-treesitter`

      -- Prefer git instead of curl in order to improve connectivity in some environments
      require('nvim-treesitter.install').prefer_git = true
      ---@diagnostic disable-next-line: missing-fields

      -- There are additional nvim-treesitter modules that you can use to interact
      -- with nvim-treesitter. You should go explore a few and see what interests you:
      --
      --    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
      --    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
      --    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
      vim.filetype.add {
        extension = { rasi = 'rasi' },
        pattern = {
          ['.*/waybar/config'] = 'jsonc',
          ['.*/hypr/.*%.conf'] = 'hyprlang',
        },
      }

      require('nvim-treesitter.configs').setup(opts)
    end,
  },

  -- The following two comments only work if you have downloaded the kickstart repo, not just copy pasted the
  -- init.lua. If you want these files, they are in the repository, so you can just download them and
  -- place them in the correct locations.

  -- NOTE: Next step on your Neovim journey: Add/Configure additional plugins for Kickstart
  --
  --  Here are some example plugins that I've included in the Kickstart repository.
  --  Uncomment any of the lines below to enable them (you will need to restart nvim).
  --
  require 'kickstart.plugins.debug',
  require 'kickstart.plugins.indent_line',
  -- require 'kickstart.plugins.lint',
  -- require 'kickstart.plugins.autopairs',
  -- require 'kickstart.plugins.neo-tree',
  require 'kickstart.plugins.gitsigns', -- adds gitsigns recommend keymaps

  -- NOTE: The import below can automatically add your own plugins, configuration, etc from `lua/custom/plugins/*.lua`
  --    This is the easiest way to modularize your config.
  --
  --  Uncomment the following line and add your plugins to `lua/custom/plugins/*.lua` to get going.
  --    For additional information, see `:help lazy.nvim-lazy.nvim-structuring-your-plugins`
  -- { import = 'custom.plugins' },
}, {
  ui = {
    -- If you are using a Nerd Font: set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
