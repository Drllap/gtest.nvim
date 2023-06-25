local M = {}

local parse_test_list = function(lines)
  local ret = {}
  local test_suite = {}
  for _, line in ipairs(lines) do
    if nil == lines then return ret end
    if 1 ~= string.find(line, ' ') then
      -- New test suite starting
      test_suite = vim.trim(line)
      goto continue

    end

    table.insert(ret, test_suite .. vim.trim(line))

    ::continue::
  end
  return ret
end

M.create_test_list = function(gtest_exec, callback)
  -- TODO test if gtest_exec exists
  vim.fn.jobstart(
    { gtest_exec, "--gtest_list_tests" },
    { stdout_buffered = true,
    on_stdout = function(_, data)
      callback(parse_test_list(data))
    end
  })
end

M.bang_run = function(cmd)
  vim.cmd('! ' .. cmd)
end

M.dispatch_run = function(cmd)
  -- TODO Check if tpop dispatch is installed
  vim.cmd('Dispatch ' .. cmd)
end

M.buffer_run = function(cmd)
  -- TODO
end

-- M.run = M.bang_run
M.run = M.dispatch_run

return M
