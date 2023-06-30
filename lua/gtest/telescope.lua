local M = {}

local gtest = require("gtest")

local pickers = require 'telescope.pickers'
local finders = require 'telescope.finders'
local actions = require 'telescope.actions'
local action_state = require 'telescope.actions.state'

local start_telescope = function(test_list)
  -- TODO try out async finder
  local gtest_finder = finders.new_table {
    results = test_list,
    -- TODO Add ordering
    -- TODO support regex
    -- entry_maker = function(entry)
    --   vim.print("selected:" .. entry)
    --   { entry, entry }
    -- end
  }
  -- TODO support forwarding options from config
  local opts = {}
  pickers.new(opts, {
    prompt_title = "Run GTest",
    finder = gtest_finder,
    attach_mappings = function(prompt_bufnr, _)
      actions.select_default:replace(function(prompt_bufnr)
        local current_picker = action_state.get_current_picker(prompt_bufnr)
        local pattern = current_picker:_get_prompt()
        actions.close(prompt_bufnr)
        gtest.set_pattern(pattern)
        gtest.run()
      end)
      return true
    end,
  }):find()
end

M.run_test = function()
  require("gtest.utils").create_test_list(gtest.state().gtest_executable, start_telescope)
end

return M
