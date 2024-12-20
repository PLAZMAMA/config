-- Fuzzy Finder (files, lsp, etc)
return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        -- Fuzzy Finder Algorithm which requires local dependencies to be built.
        -- Only load if `make` is available. Make sure you have the system
        -- requirements installed.
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            -- NOTE: If you are having trouble with this installation,
            --       refer to the README for telescope-fzf-native for more instructions.
            build = "make",
            cond = function()
                return vim.fn.executable("make") == 1
            end,
        },
    },
    keys = {
        {
            "<leader>sc",
            function()
                require("telescope.builtin").command_history()
            end,
            desc = "[S]earch [C]ommand History",
        },
        {
            "<leader>?",
            function()
                require("telescope.builtin").oldfiles()
            end,
            desc = "[?] Find recently opened files",
        },
        {
            "<leader><space>",
            function()
                require("telescope.builtin").buffers()
            end,
            desc = "[ ] Find existing buffers",
        },
        {
            "<leader>st",
            function()
                require("telescope.builtin").builtin()
            end,
            desc = "[S]earch Select [T]elescope",
        },
        {
            "<leader>gf",
            function()
                require("telescope.builtin").git_files()
            end,
            desc = "Search [G]it [F]iles",
        },
        {
            "<leader>sf",
            function()
                require("telescope.builtin").find_files()
            end,
            desc = "[S]earch [F]iles",
        },
        {
            "<leader>sh",
            function()
                require("telescope.builtin").help_tags()
            end,
            desc = "[S]earch [H]elp",
        },
        {
            "<leader>sw",
            function()
                require("telescope.builtin").grep_string()
            end,
            desc = "[S]earch current [W]ord",
        },
        {
            "<leader>sg",
            function()
                require("telescope.builtin").live_grep()
            end,
            desc = "[S]earch by [G]rep",
        },
        {
            "<leader>st",
            function()
                require("telescope.builtin").builtin()
            end,
            desc = "[S]earch Select [T]elescope",
        },
        {
            "<leader>gf",
            function()
                require("telescope.builtin").git_files()
            end,
            desc = "Search [G]it [F]iles",
        },
        {
            "<leader>sf",
            function()
                require("telescope.builtin").find_files()
            end,
            desc = "[S]earch [F]iles",
        },
        {
            "<leader>sh",
            function()
                require("telescope.builtin").help_tags()
            end,
            desc = "[S]earch [H]elp",
        },
        {
            "<leader>sw",
            function()
                require("telescope.builtin").grep_string()
            end,
            desc = "[S]earch current [W]ord",
        },
        {
            "<leader>sg",
            function()
                require("telescope.builtin").live_grep()
            end,
            desc = "[S]earch by [G]rep",
        },
        {
            "<leader>sG",
            ":LiveGrepGitRoot<cr>",
            desc = "[S]earch by [G]rep on Git Root",
        },
        {
            "<leader>sd",
            function()
                require("telescope.builtin").diagnostics()
            end,
            desc = "[S]earch [D]iagnostics",
        },
        {
            "<leader>sr",
            function()
                require("telescope.builtin").resume()
            end,
            desc = "[S]earch [R]esume",
        },
        {
            "<leader>sk",
            function()
                require("telescope.builtin").keymaps()
            end,
            desc = "[S]earch [K]eymaps",
        },
        {
            "<leader>s/",
            function()
                require("telescope.builtin").live_grep {
                    grep_open_files = true,
                    prompt_title = "Live Grep in Open Files",
                }
            end,
            desc = "[S]earch [/] in Open Files",
        },
    },
    config = function()
        -- See `:help telescope` and `:help telescope.setup()`
        require("telescope").setup {
            defaults = {
                layout_strategy = "vertical",
                layout_config = {
                    height = 0.95,
                    width = 0.95,
                },
                mappings = {
                    i = {
                        ["<C-u>"] = false,
                        ["<C-d>"] = false,
                    },
                },
            },
        }

        -- Enable telescope fzf native, if installed
        pcall(require("telescope").load_extension, "fzf")

        -- Telescope live_grep in git root
        -- Function to find the git root directory based on the current buffer's path
        local function find_git_root()
            -- Use the current buffer's path as the starting point for the git search
            local current_file = vim.api.nvim_buf_get_name(0)
            local current_dir
            local cwd = vim.fn.getcwd()
            -- If the buffer is not associated with a file, return nil
            if current_file == "" then
                current_dir = cwd
            else
                -- Extract the directory from the current file's path
                current_dir = vim.fn.fnamemodify(current_file, ":h")
            end

            -- Find the Git root directory from the current file's path
            local git_root = vim.fn.systemlist(
                "git -C "
                    .. vim.fn.escape(current_dir, " ")
                    .. " rev-parse --show-toplevel"
            )[1]
            if vim.v.shell_error ~= 0 then
                print("Not a git repository. Searching on current working directory")
                return cwd
            end
            return git_root
        end

        -- Custom live_grep function to search in git root
        local function live_grep_git_root()
            local git_root = find_git_root()
            if git_root then
                require("telescope.builtin").live_grep {
                    search_dirs = { git_root },
                }
            end
        end

        vim.api.nvim_create_user_command("LiveGrepGitRoot", live_grep_git_root, {})
    end,
}
