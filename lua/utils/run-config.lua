-- TODO: write in form of a plugin that detach from config

local fs = require "lfs"
local xml2lua = require 'xml2lua'
local handler = require 'xmlhandler.tree'
local dap = require 'dap'
local utils = require 'utils/util-fn'

local golandToDap = function()
  local cwd = vim.fn.getcwd()
  local parseConfig = function(cfg)
    return {
      type = "go",
      name = cfg._attr.name,
      request = "launch",
      program = cfg.filePath._attr.value:gsub("%$PROJECT_DIR%$", cwd),
      args = utils.split(cfg.parameters._attr.value)
    }
  end

  local dirPath = vim.fn.getcwd() .. "/.idea/runConfigurations/"

  if not utils.dir_exist(dirPath) then
    vim.api.nvim_err_writeln("Not a valid goland project or no configurations found")
    return false
  end

  local target = {}
  for fname in fs.dir(dirPath) do
    if fname:match("%.xml$") == nil then
      goto continue
    end

    local fhandle = assert(io.open(dirPath .. fname, "r"))
    local xml = fhandle:read("all")
    fhandle:close()

    local cfgHandler = handler:new()
    local parser = xml2lua.parser(cfgHandler)
    parser:parse(xml)

    local config = parseConfig(cfgHandler.root.component.configuration)

    table.insert(target, config)

    ::continue::
  end

  -- handle duplicate
  local source = dap.configurations.go
  for _, cfg in ipairs(target) do
    local found = false

    for i, v in ipairs(source) do
      if v.name == cfg.name then
        source[i] = cfg
        found = true
        break
      end
    end

    if not found then
      table.insert(source, cfg)
    end
  end

  return true
end

local convertRunConfig = function(opts)
  if opts.args ~= "goland" then
    vim.api.nvim_echo({ { "Runconfig loader: Only goland is supported for now" } }, false, {})
  end

  local convertor
  if opts.args == "goland" then
    convertor = golandToDap
  end

  local success, data = pcall(convertor)
  if success then
    if data then
      vim.api.nvim_echo({ { "Runconfig loader: Done" } }, false, {})
    end
  else
    vim.api.nvim_err_writeln(data)
  end

end

return {
  convertRunConfig = convertRunConfig
}
