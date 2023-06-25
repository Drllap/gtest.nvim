local has_telescope, telescope = pcall(require, "telescope")

if not has_telescope then
  error "This plugin requires telescope.nvim (https://github.com/nvim-telescope/telescope.nvim)"
end

local gtest = require('gtest.telescope')

return telescope.register_extension{
  setup = function() --TODO proper setup
  end,
  exports = {
    gtest = gtest.run_test,
  },
}
