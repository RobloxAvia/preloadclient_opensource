-- CHECK THE README.MD FILE BEFORE USING [ USE THE CODE BELOW THIS LINE ]


--> Variables
local optional = {} -- optional assets to load
local cp = game:GetService("ContentProvider")

-- disabled services, stuff you dont want to load
local disabledServices = {
	["Lighting"] = false;
	["TestService"] = false;
	["LocalizationService"] = false;
	
  -- these are services you can disable/you dont want to preload these certain services
}

--> set a blur while the game is preloading services
local blur = Instance.new("BlurEffect", game:GetService("Workspace").CurrentCamera)

-- begins tick/preloading
warn("preloading")
local startTick = tick() -- starts a tick

-- preloads optional assets
cp:PreloadAsync(optional)

-- loads the game services
for i, service in pairs(game:GetChildren()) do -- gets game children or services
	pcall(function()
		if not disabledServices[service.Name] then -- this checks if the service is not in the disabled services table
			cp:PreloadAsync({service}) -- if it isnt, it preloads the service
		end
	end)
end

-- done preloading
print("preload completed, time: "..string.sub(tick()-startTick, 1, 5).."s") -- prints in output that the preload is done for this player with how long it took
blur:Remove() -- removes blur
