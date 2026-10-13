return {
  'vyfor/cord.nvim',
  build = ':Cord update',
  event = 'VeryLazy',
  opts = {
    log_level = 'error',
    editor = {
      image = nil,
      client = 'neovim',
      tooltip = 'Neovim',
    },
    display = {
      theme = 'default', -- 'default', 'atom', 'catppuccin', 'minecraft', 'void', 'classic'
      flavor = 'dark',   -- 'dark', 'light', 'accent'
    },
    idle = {
      enable = true,
      timeout = 300000,   -- 5 minutes in ms
      show_status = true, -- Replaces 'show_idle_time'
    },
  },
}
