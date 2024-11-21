return {
  {
    "rmehri01/onenord.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require('onenord').setup({
        borders = true, -- Split window borders
        fade_nc = false,
        -- Styles can be "bold", "italic", "underline"
        styles = {
          comments = "italic",
          strings = "NONE",
          keywords = "NONE",
          functions = "NONE",
          variables = "NONE",
          diagnostics = "underline",
        },
        disable = {
          background = false,
          cursorline = false,
          eob_lines = true,
        },
        custom_colors = {},
      })

      -- Set the colorscheme
      vim.cmd("colorscheme onenord")
    end
  }
}
