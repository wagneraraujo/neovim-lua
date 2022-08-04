local telescope = require("telescope")

telescope.setup{
  pickers = {
    find_files = {
      theme = "dropdown",
    }
  },
  extensions = {
    file_browser = {
      theme = "dropdown",
    }
  }
}


require("telescope").load_extension "ag"

