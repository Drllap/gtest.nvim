-- if true then return end
package.loaded["gtest"] = nil
package.loaded["gtest.telescope"] = nil
package.loaded["gtest.utils"] = nil
package.loaded["gtest.telescope._extensions.gtest"] = nil

vim.api.nvim_command('messages clear')
-- local utils = require("gtest.utils")

-- local gtest_executable = "./tests/test-project/build/Debug/gtest-nvim-test.exe"
-- require("gtest.utils").create_test_list(gtest_executable)

local tele = require("gtest.telescope")
tele.run_test()
-- local ext = require("gtest.telescope._extensions"j
-- vim.api.nvim_command('messages':

-- require("gtest").run()
