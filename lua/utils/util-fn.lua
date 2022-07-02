local fs = require 'lfs'

return {

  dir_exist = function(path)
    return fs.attributes(path, 'mode') == 'directory'
  end,

  split = function(s)
    local res = {}
    for v in string.gmatch(s, "%S+") do
      table.insert(res, v)
    end
    return res
  end

}
