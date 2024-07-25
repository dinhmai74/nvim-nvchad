local M = {}

M.ellipse_start = function(text, maxlength)
  if string.len(text) > maxlength then
    text = text:sub(1, maxlength)
    return text .. '..'
  end

  return text
end

M.ellipse_end = function(text, maxlength)
  if string.len(text) > maxlength then
    text = text:sub(-maxlength)
    return '..' .. text
  end
  return text
end
return M
