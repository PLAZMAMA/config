local term_buf_name = nil
local fun = vim.fn
local cmd = vim.api.nvim_command

local M = {}
-- Opens a terminal and runs a command if given.
function M.open_terminal(command)
    -- Only creates a new terminal if one doesn't already exist.
    -- This fits my workflow better as I like to have a terminal that shows me what I ran before.
    if fun.bufexists(term_buf_name) ~= 1 then
        cmd("au TermOpen * setlocal signcolumn=no")
        cmd("te")
        term_buf_name = fun.bufname("%")
    elseif fun.bufexists(term_buf_name) then
        cmd("e " .. term_buf_name)
    end
    cmd("startinsert")
    -- Allows caller to choose whether to run a command or not after the terminal opens
    if command ~= nil then
        local job_id = vim.bo.channel
        fun.chansend(job_id, { command .. "\r\n" })
    end
end

return M
