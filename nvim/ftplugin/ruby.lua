-- Fold schema information blocks in Rails model files
local function setup_schema_folding()
  -- Only process if we're in a models directory
  local filepath = vim.fn.expand("%:p")
  if not filepath:match("/models/") then
    return
  end

  -- Find schema information block line numbers
  local bufnr = vim.api.nvim_get_current_buf()
  local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)

  local schema_start = nil
  local schema_end = nil

  for i, line in ipairs(lines) do
    if line:match("^# == Schema Information") then
      schema_start = i
    elseif schema_start and not line:match("^#") then
      schema_end = i - 1
      break
    end
  end

  -- Only set up custom folding if we found a schema block
  if not (schema_start and schema_end and schema_end > schema_start) then
    return
  end

  -- Custom fold expression that combines schema folding with indent folding
  vim.opt_local.foldmethod = "expr"
  vim.opt_local.foldexpr = "v:lua.ruby_fold_expr()"

  -- Store schema boundaries in buffer variable
  vim.b.schema_start = schema_start
  vim.b.schema_end = schema_end

  -- Fold and close the schema block after a short delay
  vim.defer_fn(function()
    vim.api.nvim_win_set_cursor(0, {schema_start, 0})
    vim.cmd("normal! zc")
    vim.api.nvim_win_set_cursor(0, {1, 0})
  end, 10)
end

-- Fold expression function
function _G.ruby_fold_expr()
  local lnum = vim.v.lnum
  local line = vim.fn.getline(lnum)

  -- Check if we're in the schema block
  if vim.b.schema_start and vim.b.schema_end then
    if lnum == vim.b.schema_start then
      return ">1"  -- Start a fold at level 1
    elseif lnum > vim.b.schema_start and lnum <= vim.b.schema_end then
      return "1"   -- Continue fold at level 1
    end
  end

  -- Fall back to indent-based folding for everything else
  local indent = vim.fn.indent(lnum)
  if indent == 0 then
    return "0"
  end
  return tostring(indent / vim.bo.shiftwidth)
end

-- Run after buffer is loaded
vim.api.nvim_create_autocmd("BufWinEnter", {
  buffer = 0,
  once = true,
  callback = setup_schema_folding,
})
