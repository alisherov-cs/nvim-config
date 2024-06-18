require('nvim-ts-autotag').setup({
  opts = {
    enable_close = true, -- Auto close tags
    enable_rename = true, -- Auto rename pairs of tags
    enable_close_on_slash = true -- Auto close on trailing </
  },
  per_filetype = {
      ["javascriptreact"] = {
          enable_close = true,
          enable_rename = true,
          enable_close_on_slash = true
      },
      ["typescriptreact"] = {
          enable_close = true,
          enable_rename = true,
          enable_close_on_slash = true
      }
  }
})
