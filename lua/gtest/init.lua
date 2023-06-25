local M = {}

local default_config = {
  -- gtest_executable = "./gtest",
  gtest_executable = "./tests/test-project/build/Debug/gtest-nvim-test.exe",
  -- tab_based = false,
  tab_based = true,
  prompt_title = "Run GTest"

}

local config = default_config;

M.setup = function(cfg)
  config = cfg
end

-- local state;

M.state = function()
  return config
end

M.set_pattern = function(pattern)
  if config.tab_based then
    vim.t.gtest_pattern = pattern
  else
    vim.g.gtest_pattern = pattern
  end
end

local gtest_filter = function()
  local pattern = nil
  if config.tab_based then
    pattern = vim.t.gtest_pattern
  else
    pattern = vim.g.gtest_pattern
  end

  if pattern == nil then
    return ""
  end

  return " --gtest_filter=" .. pattern
end

local create_command = function()
  -- TODO add support for custom gtest flags
  return config.gtest_executable .. gtest_filter()
end

M.run = function()
  require("gtest.utils").run(create_command())
end

return M
