local M = {}

local function project_root()
  local file = vim.api.nvim_buf_get_name(0)
  local start = file ~= "" and vim.fs.dirname(file) or vim.fn.getcwd()
  local cmake_file = vim.fs.find("CMakeLists.txt", { path = start, upward = true })[1]
  if not cmake_file then
    vim.notify("No CMakeLists.txt found above the current file", vim.log.levels.WARN)
    return nil
  end
  return vim.fs.dirname(cmake_file)
end

local function run(command)
  local root = project_root()
  if root then
    Snacks.terminal.open(command, { cwd = root, interactive = false })
  end
end

function M.configure()
  run("cmake -S . -B build -DCMAKE_BUILD_TYPE=Debug -DCMAKE_EXPORT_COMPILE_COMMANDS=ON")
end

function M.build()
  run("cmake --build build")
end

function M.test()
  run("ctest --test-dir build --output-on-failure")
end

return M
