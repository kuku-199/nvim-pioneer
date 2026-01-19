-- lua/config/plugins/embedded/cmake.lua
-- CMake Integration
return {
  "Civitasv/cmake-tools.nvim",
  event = "VeryLazy",
  opts = {
    cmake_command = "cmake", 
    cmake_build_directory = "build", -- Default build folder / 默认构建目录
    cmake_generate_options = { "-DCMAKE_EXPORT_COMPILE_COMMANDS=1" }, -- Generate compile_commands.json
  },
  keys = {
      { "<leader>cg", "<cmd>CMakeGenerate<cr>", desc = "CMake Generate" },
      { "<leader>cb", "<cmd>CMakeBuild<cr>", desc = "CMake Build" },
  }
}
