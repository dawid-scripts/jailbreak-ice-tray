if getfenv().script ~= "LocalScript" then
    game:GetService("Players").LocalPlayer.Character:BreakJoints()
    assert(getfenv().script=="LocalScript","stop cheating")
end
