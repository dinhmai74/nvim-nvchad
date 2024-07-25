local test_bufnr = nil
local test_split = nil

-- Function to process and format the output
function process_output(data)
  local formatted_data = {}
  for _, line in ipairs(data) do
    -- Apply formatting, indentation, or other manipulations
    local formatted_line = '  ' .. line -- Example: Add indentation
    table.insert(formatted_data, formatted_line)
  end
  return formatted_data
end
local attach_to_buffer = function(output_bufnr, pattern, command)
  gon.autocmd('BufWritePost', {
    group = gon.nvim_create_augroup('jest-autotest', { clear = true }),
    pattern = pattern,
    callback = function()
      if test_bufnr == nil then
        local Split = require 'nui.split'

        test_split = Split {
          position = 'right',
          size = '50%',
          winid = 42,
          enter = true,
        }
        test_bufnr = test_split.bufnr
        test_split:mount()
      elseif test_split ~= nil then
        test_split:show()
      else
        print 'test_split is nil'
      end

      local bufnr = test_bufnr or test_split.bufnr

      _G.my_test_pannel = {}
      _G.my_test_pannel.hide_test_split = function()
        if test_split ~= nil then
          test_split:hide()
        end
      end

      vim.api.nvim_buf_set_keymap(bufnr, 'n', '<ESC>', '<cmd>lua my_test_pannel.hide_test_split()<cr>', { noremap = true, silent = true })
      vim.api.nvim_buf_set_keymap(bufnr, 'n', 'q', '<cmd>lua my_test_pannel.hide_test_split()<cr>', { noremap = true, silent = true })

      vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, { 'Testing the code...' .. bufnr })
      vim.api.nvim_buf_set_option(bufnr, 'filetype', 'sh')

      vim.fn.jobstart(command, {
        stdout_buffered = true,
        on_stdout = function(_, data)
          if data then
            local formatted_data = process_output(data)

            -- Append the output to the buffer
            vim.api.nvim_buf_set_lines(bufnr, -1, -1, false, formatted_data)
          end
        end,
        on_stderr = function(_, data)
          if data then
            local formatted_data = process_output(data)

            -- Append the error output to the buffer
            vim.api.nvim_buf_set_lines(bufnr, -1, -1, false, formatted_data)
          end
        end,
        -- on_exit = function(_, code)
        --   if code == 0 then
        --     print 'Command finished successfully'
        --   else
        --     print('Command failed with exit code: ' .. code)
        --   end
        -- end,
      })
    end,
  })
end

gon.user_command('JestAutoTest', function()
  gon.noti_mini 'Jest will run test on save file...'
  local bufnr = vim.api.nvim_get_current_buf()
  local currentfile = vim.fn.expand '%t'

  attach_to_buffer(bufnr, { '*.js', '*.ts', '*.tsx' }, { 'yarn', 'test', currentfile })
end)
