---@type nvim_config.DisableFormatOnSave Determine when to disable format on save, globally or per-buffer.
vim.g.disable_format_on_save = function(bufnr)
  local absolute_path = vim.api.nvim_buf_get_name(bufnr)
  local relative_path = vim.fn.fnamemodify(absolute_path, ":.")
  if relative_path == ".config/karabiner/karabiner.json" then
    return true
  end
  return false
end

---@type nvim_config.CommitConvention The convention to use for git commit messages.
vim.g.commit_convention = "gitmoji"
