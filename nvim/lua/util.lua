-------------------------------------------------
-- lua/util.lua
-------------------------------------------------

function Map(mode, shortcut, command)
	vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end

function Nmap(shortcut, command)
	Map("n", shortcut, command)
end

function Nmap_with_buf(key, command, buf)
	vim.keymap.set("n", key, command, buf)
end

function Imap(shortcut, command)
	Map("i", shortcut, command)
end

function Dump(o)
	if type(o) == "table" then
		local s = "{ "
		for k, v in pairs(o) do
			if type(k) ~= "number" then
				k = '"' .. k .. '"'
			end
			s = s .. "[" .. k .. "] = " .. Dump(v) .. ","
		end
		return s .. "} "
	else
		return tostring(o)
	end
end
