local Player,Mouse,mouse,UserInputService,ContextActionService = owner
do
	print("FE Compatibility code by Mokiros | Translated to FE by bananabacon98")
	script.Parent = Player.Character
	
	--RemoteEvent for communicating
	local Event = Instance.new("RemoteEvent")
	Event.Name = "UserInput_Event"
	
	--Fake event to make stuff like Mouse.KeyDown work
	local function fakeEvent()
		local t = {_fakeEvent=true,Connect=function(self,f)self.Function=f end}
		t.connect = t.Connect
		return t
	end
	
	--Creating fake input objects with fake variables
	local m = {Target=nil,Hit=CFrame.new(),KeyUp=fakeEvent(),KeyDown=fakeEvent(),Button1Up=fakeEvent(),Button1Down=fakeEvent()}
	local UIS = {InputBegan=fakeEvent(),InputEnded=fakeEvent()}
	local CAS = {Actions={},BindAction=function(self,name,fun,touch,...)
			CAS.Actions[name] = fun and {Name=name,Function=fun,Keys={...}} or nil
		end}
	--Merged 2 functions into one by checking amount of arguments
	CAS.UnbindAction = CAS.BindAction
	
	--This function will trigger the events that have been :Connect()'ed
	local function te(self,ev,...)
		local t = m[ev]
		if t and t._fakeEvent and t.Function then
			t.Function(...)
		end
	end
	m.TrigEvent = te
	UIS.TrigEvent = te
	
	Event.OnServerEvent:Connect(function(plr,io)
		if plr~=Player then return end
		if io.isMouse then
			m.Target = io.Target
			m.Hit = io.Hit
		else
			local b = io.UserInputState == Enum.UserInputState.Begin
			if io.UserInputType == Enum.UserInputType.MouseButton1 then
				return m:TrigEvent(b and "Button1Down" or "Button1Up")
			end
			for _,t in pairs(CAS.Actions) do
				for _,k in pairs(t.Keys) do
					if k==io.KeyCode then
						t.Function(t.Name,io.UserInputState,io)
					end
				end
			end
			m:TrigEvent(b and "KeyDown" or "KeyUp",io.KeyCode.Name:lower())
			UIS:TrigEvent(b and "InputBegan" or "InputEnded",io,false)
		end
	end)
	Event.Parent = NLS([==[
	local Player = owner
	local Event = script:WaitForChild("UserInput_Event")

	local UIS = game:GetService("UserInputService")
	local input = function(io,a)
		if a then return end
		--Since InputObject is a client-side instance, we create and pass table instead
		Event:FireServer({KeyCode=io.KeyCode,UserInputType=io.UserInputType,UserInputState=io.UserInputState})
	end
	UIS.InputBegan:Connect(input)
	UIS.InputEnded:Connect(input)

	local Mouse = Player:GetMouse()
	local h,t
	--Give the server mouse data 30 times every second, but only if the values changed
	--If player is not moving their mouse, client won't fire events
	while wait(1/30) do
		if h~=Mouse.Hit or t~=Mouse.Target then
			h,t=Mouse.Hit,Mouse.Target
			Event:FireServer({isMouse=true,Target=t,Hit=h})
		end
	end]==],Player.Character)
	Mouse,mouse,UserInputService,ContextActionService = m,m,UIS,CAS
end

maus = mouse


-- Made by Zuu_Roku w/ Help from Cass!
-- Venge is ok happy? But nebby is better /e dab

print("Made by Zuu_Roku, Thanks Cass for Cloud CLerp.")

print("Rain Cloud Visualizer (Update 1.2 I guess) Commands:")

print("!play (ID) [Changes song]")

print("!pitch (#) [normal pitch is '10'][THIS IS FIXED AAAAAAAAAAAAAAAAAA, Sound.Pitch was Depreciated and never knew, hence why it never worked]")

print("!snow / !rain [Changes Weather]")

print("!rate (#) [Changes amount of particles]")

print("Click for a Lightning bolt!")



local Player = owner

local Character = Player.Character



local H = Character["Head"]

local multiplier = 4

local ltdb = false

local Cloud = Instance.new('Part',Character)

Cloud.Size = Vector3.new(1,1,1)

Cloud.Anchored = true

Cloud.CanCollide = false

Cloud.Transparency = 0
Cloud.Name = "cld"


local CloudMesh = Instance.new('SpecialMesh',Cloud)

CloudMesh.Scale = Vector3.new(5,1,5)

CloudMesh.MeshId = "http://www.roblox.com/asset/?id=1095708"

CloudMesh.Offset = Vector3.new(0,1,0)


local loudness = 0



local S = Instance.new('Sound',Cloud)

S.SoundId = "rbxassetid://170020261"

S.Looped = true

S.Volume = 8

S.PlaybackSpeed = 1

S.MaxDistance = 100

S:Play()
S.Name = "s"


local Volume = 5



local Rain = Instance.new('ParticleEmitter',Cloud)

Rain.Color = ColorSequence.new(Color3.new(1,1,1),Color3.fromRGB(175,255,255))

Rain.Size = NumberSequence.new(.5)

Rain.Texture = "http://www.roblox.com/asset/?id=241876428"

Rain.Transparency = NumberSequence.new(0,.6)

Rain.Acceleration = Vector3.new(0,-150,0)

Rain.Lifetime = NumberRange.new(5,10)

Rain.Rate = 100



local Shade = Instance.new('PointLight',Cloud)

Shade.Range = 10

Shade.Color = Color3.fromRGB(50,50,50)

Shade.Enabled = true

Shade.Shadows = true



local rad = math.rad

local sin = math.sin

local tan = math.tan

local cos = math.cos

Player.Chatted:connect(function(m)
	
	if m:match("!play%s%d+") then
		
		S:Stop()
		
		S.SoundId = "rbxassetid://"..m:match("!play%s(%d+)")
		
		S:Play()
		
	elseif m:match("!volume%s%d+") then
		
		S.Volume = m:match("!volume%s(%d+)")
		
		Volume = m:match("!volume%s(%d+)")
		
	elseif m:match("!pitch%s%d+") then
		
		S.PlaybackSpeed = m:match("!pitch%s(%d+)")/10
		
	elseif m:match("!snow") then
		
		Rain.Texture = "http://www.roblox.com/asset/?id=605668174"
		
		Rain.Acceleration = Vector3.new(0,-10,0)
		
		Rain.Lifetime = NumberRange.new(15,20)
		
		Rain.Size = NumberSequence.new(.2)
		
	elseif m:match("!rain") then
		
		Rain.Texture = "http://www.roblox.com/asset/?id=241876428"
		
		Rain.Acceleration = Vector3.new(0,-150,0)
		
		Rain.Lifetime = NumberRange.new(5,10)
		
		Rain.Size = NumberSequence.new(.5)
		
	elseif m:match("!rate%s%d+") then
		
		multiplier = m:match("!rate%s(%d+)")
		
	elseif m:match("!rr") then
		
		print(Rain.Rate)
		
	elseif m:match("!pbs") then
		
		print(S.PlaybackSpeed)
		
	elseif m:match("!rot") then
		
		print(Cloud.Rotation)
		
	end
end)



function Weld(x,y)
	
	local w = Instance.new("Weld")
	
	w.Part0 = x
	
	w.Part1 = y
	
	w.Name = tostring(y.Name).."_Weld"
	
	w.Parent = x
	
	return w
	
end



function Clerp(start,destination,increment)
	
	local function slerp(a,b,c)return (1-c)*a+(c*b)end
	
	local c1 = {start.X,start.Y,start.Z,start:toEulerAnglesXYZ()}
	
	local c2 = {destination.X,destination.Y,destination.Z,destination:toEulerAnglesXYZ()}
	
	for i,v in pairs(c1)do c1[i] = slerp(v,c2[i],increment)end
	
	return CFrame.new(c1[1],c1[2],c1[3])*CFrame.Angles(c1[4],c1[5],c1[6])
	
end



DrawLightning = function(Start,End,Times,Offset,Color,Thickness)
	
	if Start.y>End.y then
		
		local magz = (Start - End).magnitude 
		
		local curpos = Start 
		
		local trz = {-Offset,Offset}
		
		for i=1,Times do 
			
			local li = Instance.new("Part",workspace) 
			
			li.TopSurface =10 
			
			li.BottomSurface = 10 
			
			li.Anchored = true  
			
			li.Transparency = 0 
			
			li.BrickColor = Color
			
			li.formFactor = "Custom" 
			
			li.CanCollide = false 
			
			li.Size = Vector3.new(Thickness,Thickness,magz/Times) 
			
			local lt=Instance.new("SpotLight",li)
			
			lt.Range=16
			
			lt.Brightness=5
			
			lt.Shadows=true
			
			lt.Angle=45
			
			lt.Face="Top"
			
			lt.Color=li.BrickColor.Color
			
			local ofz = Vector3.new(trz[math.random(1,2)],trz[math.random(1,2)],trz[math.random(1,2)]) 
			
			local trolpos = CFrame.new(curpos,End)*CFrame.new(0,0,magz/Times).p+ofz
			
			if Times == i then 
				
				local magz2 = (curpos - End).magnitude 
				
				li.Size = Vector3.new(Thickness,Thickness,magz2)
				
				li.CFrame = CFrame.new(curpos,End)*CFrame.new(0,0,-magz2/2)
				
			else
				
				li.CFrame = CFrame.new(curpos,trolpos)*CFrame.new(0,0,magz/Times/2)
				
			end
			
			curpos = li.CFrame*CFrame.new(0,0,magz/Times/2).p Spawn(function() for i=1,5 do wait() li.Transparency = li.Transparency+.2 end li:Destroy() end)
			
		end
		
		for i,x in pairs(workspace:GetChildren()) do if x:IsA'Model' and x:findFirstChild('Head') and x~=Character and x.Name~="Zuu_Roku" then
				
				for a,v in pairs(x:GetChildren()) do if v:IsA'Humanoid' then if (x.Head.CFrame.p-End).magnitude<10 then x:BreakJoints() end end end end end
		
	end
	
end



mouse.Button1Down:connect(function()
	
	if ltdb==false then
		
		ltdb=true
		
		DrawLightning(Cloud.CFrame.p,maus.Hit.p,5,.5,BrickColor.new("New Yeller"),.2)
		
		wait()
		
		ltdb=false
		
	end
	
end)

local Spinny = 0

local NoU = 0
p = 0
function thething(a,b)
	if a == owner then
		p = tonumber(b)
	end
end

localrem = Instance.new("RemoteEvent")
serverrem = Instance.new("RemoteEvent",script)
serverrem.Name = "server"
serverrem.OnServerEvent:Connect(function(plr,...)
	thething(plr,...)
end)
localrem.Parent = NLS([==[
	asd = {}
	function wait(num)
	if num ~= nil then
		return game:GetService("RunService").RenderStepped:wait(num)
	end
	return game:GetService("RunService").RenderStepped:wait()
end
	size = .25
	sounddivide = 2500
	plr = game.Players.LocalPlayer
	character = plr.Character
	while game:GetService("RunService").RenderStepped:wait() and character:FindFirstChild("cld"):FindFirstChild("s") do
		script.Parent.server:FireServer(character.cld.s.PlaybackLoudness)
	end
]==],script)

while true do
	
	Rain.Rate = (S.PlaybackLoudness + 1) * multiplier/5
	
	game:GetService('RunService').Stepped:wait()
	
	local HP = H.CFrame.p
	
	local sizer = S.PlaybackLoudness/55 + 5
	
	Cloud.Size = Vector3.new(sizer,1,sizer)
	
	Shade.Range = sizer
	
	CloudMesh.Scale = Vector3.new(sizer,5,sizer)
	
	Cloud.CFrame = Clerp(Cloud.CFrame, CFrame.new(HP + Vector3.new(0,4,0))*CFrame.Angles(0,rad(90),0), .1)
	
	Cloud.BrickColor = BrickColor.new(Color3.fromRGB(255 - p/2, 255-p/2, 255-p/2))
end
