require("lua.env") -- technically not needed but who knows

function TermRun (app)
  if app == "" then
    hl.notification.create({ "Flopesque ton call", 3 })
  else
    hl.dsp.exec_cmd(Terminal .. " " .. app)
  end
end
