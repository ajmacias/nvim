local M = {}

M.lspservers = {
  { name = 'phpactor' },
  { name = 'pyright' },
}

M.tools = {
  { name = 'stylua' },
}

M.toggle_completion = function()
  local title = 'nvim-cmp'
  local ok, cmp = pcall(require, 'cmp')
  if ok then
    local next_cmp_toggle_flag = not vim.g.cmp_toggle_flag
    if next_cmp_toggle_flag then
      vim.notify('completion on', 'info', { title = title })
    else
      vim.notify('completion off', 'info', { title = title })
    end
    cmp.setup {
      enabled = function()
        vim.g.cmp_toggle_flag = next_cmp_toggle_flag
        if next_cmp_toggle_flag then
          return vim.api.nvim_buf_get_option(0, 'buftype') ~= 'prompt'
        else
          return next_cmp_toggle_flag
        end
      end,
    }
  else
    vim.notify('completion not available', 'error', { title = title })
  end
end

return M
