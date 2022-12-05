local status_ok, neotree = pcall(require, "neo-tree")
if not status_ok then
	return
end
neotree.setup({
	close_if_last_window = true,
	enable_diagnostics = false,
	source_selector = {
		winbar = true,
		content_layout = "center",
		-- tab_labels = {
		--   filesystem = astronvim.get_icon "FolderClosed" .. " File",
		--   buffers = astronvim.get_icon "DefaultFile" .. " Bufs",
		--   git_status = astronvim.get_icon "Git" .. " Git",
		--   diagnostics = astronvim.get_icon "Diagnostic" .. " Diagnostic",
		-- },
	},
	default_component_configs = {
		indent = {
			padding = 0,
		},
		-- icon = {
		--   folder_closed = astronvim.get_icon "FolderClosed",
		--   folder_open = astronvim.get_icon "FolderOpen",
		--   folder_empty = astronvim.get_icon "FolderEmpty",
		--   default = astronvim.get_icon "DefaultFile",
		-- },
		-- -- git_status = {
		--   symbols = {
		--     added = astronvim.get_icon "GitAdd",
		--     deleted = astronvim.get_icon "GitDelete",
		--     modified = astronvim.get_icon "GitChange",
		--     renamed = astronvim.get_icon "GitRenamed",
		--     untracked = astronvim.get_icon "GitUntracked",
		--     ignored = astronvim.get_icon "GitIgnored",
		--     unstaged = astronvim.get_icon "GitUnstaged",
		--     staged = astronvim.get_icon "GitStaged",
		--     conflict = astronvim.get_icon "GitConflict",
		--   },
		-- },
	},
	window = {
		width = 40,
		mappings = {
			["o"] = "open",
			["p"] = function(state)
				local node = state.tree:get_node()
				require("neo-tree.ui.renderer").focus_node(state, node:get_parent_id())
			end,
		},
	},
	filesystem = {
		filtered_items = {
			visible = true, -- This is what you want: If you set this to `true`, all "hide" just mean "dimmed out"
			hide_dotfiles = false,
			hide_gitignored = true,
		},
		follow_current_file = true,
		hijack_netrw_behavior = "open_current",
		use_libuv_file_watcher = true,
	},
	event_handlers = {
		{
			event = "neo_tree_buffer_enter",
			handler = function(_)
				vim.opt_local.signcolumn = "auto"
			end,
		},
	},
})
