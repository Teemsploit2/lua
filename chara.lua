local Player,game,owner = owner,game
local RealPlayer = Player
do
    local rp = RealPlayer
    --RemoteEvent for communicating
    local Event = Instance.new("RemoteEvent")
    Event.Name = "UserInput_Event"
 
    --Fake event to make stuff like Mouse.KeyDown work
    local function fakeEvent()
        local t = {_fakeEvent=true,Functions={},Connect=function(self,f)table.insert(self.Functions,f) end}
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
        if t and t._fakeEvent then
            for _,f in pairs(t.Functions) do
                f(...)
            end
        end
    end
    m.TrigEvent = te
    UIS.TrigEvent = te
 
    Event.OnServerEvent:Connect(function(plr,io)
        if plr~=rp then return end
        m.Target = io.Target
        m.Hit = io.Hit
        if not io.isMouse then
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
    local Player = game:GetService("Players").LocalPlayer
    local Event = script:WaitForChild("UserInput_Event")
 
    local Mouse = Player:GetMouse()
    local UIS = game:GetService("UserInputService")
    local input = function(io,a)
        if a then return end
        --Since InputObject is a client-side instance, we create and pass table instead
        Event:FireServer({KeyCode=io.KeyCode,UserInputType=io.UserInputType,UserInputState=io.UserInputState,Hit=Mouse.Hit,Target=Mouse.Target})
    end
    UIS.InputBegan:Connect(input)
    UIS.InputEnded:Connect(input)
 
    local h,t
    --Give the server mouse data 30 times every second, but only if the values changed
    --If player is not moving their mouse, client won't fire events
    while wait(1/30) do
        if h~=Mouse.Hit or t~=Mouse.Target then
            h,t=Mouse.Hit,Mouse.Target
            Event:FireServer({isMouse=true,Target=t,Hit=h})
        end
    end]==],Player.Character)
 
    ----Sandboxed game object that allows the usage of client-side methods and services
    --Real game object
    local _rg = game
 
    --Metatable for fake service
    local fsmt = {
        __index = function(self,k)
            local s = rawget(self,"_RealService")
            if s then return s[k] end
        end,
        __newindex = function(self,k,v)
            local s = rawget(self,"_RealService")
            if s then s[k]=v end
        end,
        __call = function(self,...)
            local s = rawget(self,"_RealService")
            if s then return s(...) end
        end
    }
    local function FakeService(t,RealService)
        t._RealService = typeof(RealService)=="string" and _rg:GetService(RealService) or RealService
        return setmetatable(t,fsmt)
    end
 
    --Fake game object
    local g = {
        GetService = function(self,s)
            return self[s]
        end,
        Players = FakeService({
            LocalPlayer = FakeService({GetMouse=function(self)return m end},Player)
        },"Players"),
        UserInputService = FakeService(UIS,"UserInputService"),
        ContextActionService = FakeService(CAS,"ContextActionService"),
    }
    rawset(g.Players,"localPlayer",g.Players.LocalPlayer)
    g.service = g.GetService
   
    g.RunService = FakeService({
        RenderStepped = _rg:GetService("RunService").Heartbeat,
        BindToRenderStep = function(self,name,_,fun)
            self._btrs[name] = self.Heartbeat:Connect(fun)
        end,
        UnbindFromRenderStep = function(self,name)
            self._btrs[name]:Disconnect()
        end,
    },"RunService")
 
    setmetatable(g,{
        __index=function(self,s)
            return _rg:GetService(s) or typeof(_rg[s])=="function"
            and function(_,...)return _rg[s](_rg,...)end or _rg[s]
        end,
        __newindex = fsmt.__newindex,
        __call = fsmt.__call
    })
    --Changing owner to fake player object to support owner:GetMouse()
    game,owner = g,g.Players.LocalPlayer
end

Player = game:GetService("Players").LocalPlayer
PlayerGui = Player.PlayerGui
Cam = workspace.CurrentCamera
Backpack = Player.Backpack
Character = Player.Character
Humanoid = Character.Humanoid
local Mouse = Player:GetMouse()
RootPart = Character.HumanoidRootPart
Torso = Character.Torso
Head = Character.Head
RightArm = Character["Right Arm"]
LeftArm = Character["Left Arm"]
RightLeg = Character["Right Leg"]
LeftLeg = Character["Left Leg"]
RootJoint = RootPart.RootJoint
Neck = Torso.Neck
RightShoulder = Torso["Right Shoulder"]
LeftShoulder = Torso["Left Shoulder"]
RightHip = Torso["Right Hip"]
LeftHip = Torso["Left Hip"]
IT = Instance.new
CF = CFrame.new
VT = Vector3.new
RAD = math.rad
C3 = Color3.new
UD2 = UDim2.new
BRICKC = BrickColor.new
ANGLES = CFrame.Angles
EULER = CFrame.fromEulerAnglesXYZ
COS = math.cos
ACOS = math.acos
SIN = math.sin
ASIN = math.asin
ABS = math.abs
MRANDOM = math.random
FLOOR = math.floor
Animation_Speed = 3
Frame_Speed = 0.016666666666666666
local Speed = 16
local ROOTC0 = CF(0, 0, 0) * ANGLES(RAD(-90), RAD(0), RAD(180))
local NECKC0 = CF(0, 1, 0) * ANGLES(RAD(-90), RAD(0), RAD(180))
local RIGHTSHOULDERC0 = CF(-0.5, 0, 0) * ANGLES(RAD(0), RAD(90), RAD(0))
local LEFTSHOULDERC0 = CF(0.5, 0, 0) * ANGLES(RAD(0), RAD(-90), RAD(0))
local DAMAGEMULTIPLIER = 1
local ANIM = "Idle"
local ATTACK = false
local EQUIPPED = false
local HOLD = false
local COMBO = 1
local Rooted = false
local SINE = 0
local KEYHOLD = false
local CHANGE = 2 / Animation_Speed
local WALKINGANIM = false
local VALUE1 = false
local VALUE2 = false
char = Player.Character
local hum = char.HumanoidRootPart
local root = char.Torso
local left = char["Left Arm"]
local right = char["Right Arm"]
local rightl = char["Right Leg"]
local leftl = char["Left Leg"]
local tors = char["Torso"]
local ROBLOXIDLEANIMATION = IT("Animation")
ROBLOXIDLEANIMATION.Name = "Roblox Idle Animation"
ROBLOXIDLEANIMATION.AnimationId = "http://www.roblox.com/asset/?id=180435571"
local WEAPONGUI = IT("ScreenGui", PlayerGui)
WEAPONGUI.Name = "Weapon GUI"
local Effects = IT("Folder", Character)
Effects.Name = "Effects"
local ANIMATOR = Humanoid.Animator
ANIMATOR:Destroy()
local ANIMATE = Character.Animate
local UNANCHOR = true
local HEADTURN = true
ArtificialHB = Instance.new("BindableEvent", script)
ArtificialHB.Name = "ArtificialHB"
script:WaitForChild("ArtificialHB")
frame = Frame_Speed
tf = 0
allowframeloss = false
tossremainder = false
lastframe = tick()
script.ArtificialHB:Fire()
game:GetService("RunService").Heartbeat:connect(function(s, p)
	tf = tf + s
	if tf >= frame then
		if allowframeloss then
			ArtificialHB:Fire()
			lastframe = tick()
		else
			for i = 1, math.floor(tf / frame) do
				ArtificialHB:Fire()
			end
			lastframe = tick()
		end
		if tossremainder then
			tf = 0
		else
			tf = tf - frame * math.floor(tf / frame)
		end
	end
end)
function Raycast(POSITION, DIRECTION, RANGE, IGNOREDECENDANTS)
	return workspace:FindPartOnRay(Ray.new(POSITION, DIRECTION.unit * RANGE), IGNOREDECENDANTS)
end
function PositiveAngle(NUMBER)
	if NUMBER >= 0 then
		NUMBER = 0
	end
	return NUMBER
end
function NegativeAngle(NUMBER)
	if NUMBER <= 0 then
		NUMBER = 0
	end
	return NUMBER
end
function Swait(NUMBER)
	if NUMBER == 0 or NUMBER == nil then
		ArtificialHB.Event:wait()
	else
		for i = 1, NUMBER do
			ArtificialHB.Event:wait()
		end
	end
end
function CreateMesh(MESH, PARENT, MESHTYPE, MESHID, TEXTUREID, SCALE, OFFSET)
	local NEWMESH = IT(MESH)
	if MESH == "SpecialMesh" then
		NEWMESH.MeshType = MESHTYPE
		if MESHID ~= "nil" and MESHID ~= "" then
			NEWMESH.MeshId = "http://www.roblox.com/asset/?id=" .. MESHID
		end
		if TEXTUREID ~= "nil" and TEXTUREID ~= "" then
			NEWMESH.TextureId = "http://www.roblox.com/asset/?id=" .. TEXTUREID
		end
	end
	NEWMESH.Offset = OFFSET or VT(0, 0, 0)
	NEWMESH.Scale = SCALE
	NEWMESH.Parent = PARENT
	return NEWMESH
end
function CreatePart(FORMFACTOR, PARENT, MATERIAL, REFLECTANCE, TRANSPARENCY, BRICKCOLOR, NAME, SIZE, ANCHOR)
	local NEWPART = IT("Part")
	NEWPART.formFactor = FORMFACTOR
	NEWPART.Reflectance = REFLECTANCE
	NEWPART.Transparency = TRANSPARENCY
	NEWPART.CanCollide = false
	NEWPART.Locked = true
	NEWPART.Anchored = true
	if ANCHOR == false then
		NEWPART.Anchored = false
	end
	NEWPART.BrickColor = BRICKC(tostring(BRICKCOLOR))
	NEWPART.Name = NAME
	NEWPART.Size = SIZE
	NEWPART.Position = Torso.Position
	NEWPART.Material = MATERIAL
	NEWPART:BreakJoints()
	NEWPART.Parent = PARENT
	return NEWPART
end
local weldBetween = function(a, b)
	local weldd = Instance.new("ManualWeld")
	weldd.Part0 = a
	weldd.Part1 = b
	weldd.C0 = CFrame.new()
	weldd.C1 = b.CFrame:inverse() * a.CFrame
	weldd.Parent = a
	return weldd
end
function QuaternionFromCFrame(cf)
	local mx, my, mz, m00, m01, m02, m10, m11, m12, m20, m21, m22 = cf:components()
	local trace = m00 + m11 + m22
	if trace > 0 then
		local s = math.sqrt(1 + trace)
		local recip = 0.5 / s
		return (m21 - m12) * recip, (m02 - m20) * recip, (m10 - m01) * recip, s * 0.5
	else
		local i = 0
		if m00 < m11 then
			i = 1
		end
		if m22 > (i == 0 and m00 or m11) then
			i = 2
		end
		if i == 0 then
			local s = math.sqrt(m00 - m11 - m22 + 1)
			local recip = 0.5 / s
			return 0.5 * s, (m10 + m01) * recip, (m20 + m02) * recip, (m21 - m12) * recip
		elseif i == 1 then
			local s = math.sqrt(m11 - m22 - m00 + 1)
			local recip = 0.5 / s
			return (m01 + m10) * recip, 0.5 * s, (m21 + m12) * recip, (m02 - m20) * recip
		elseif i == 2 then
			local s = math.sqrt(m22 - m00 - m11 + 1)
			local recip = 0.5 / s
			return (m02 + m20) * recip, (m12 + m21) * recip, 0.5 * s, (m10 - m01) * recip
		end
	end
end
function QuaternionToCFrame(px, py, pz, x, y, z, w)
	local xs, ys, zs = x + x, y + y, z + z
	local wx, wy, wz = w * xs, w * ys, w * zs
	local xx = x * xs
	local xy = x * ys
	local xz = x * zs
	local yy = y * ys
	local yz = y * zs
	local zz = z * zs
	return CFrame.new(px, py, pz, 1 - (yy + zz), xy - wz, xz + wy, xy + wz, 1 - (xx + zz), yz - wx, xz - wy, yz + wx, 1 - (xx + yy))
end
function QuaternionSlerp(a, b, t)
	local cosTheta = a[1] * b[1] + a[2] * b[2] + a[3] * b[3] + a[4] * b[4]
	local startInterp, finishInterp
	if cosTheta >= 1.0E-4 then
		if 1 - cosTheta > 1.0E-4 then
			local theta = ACOS(cosTheta)
			local invSinTheta = 1 / SIN(theta)
			startInterp = SIN((1 - t) * theta) * invSinTheta
			finishInterp = SIN(t * theta) * invSinTheta
		else
			startInterp = 1 - t
			finishInterp = t
		end
	elseif 1 + cosTheta > 1.0E-4 then
		local theta = ACOS(-cosTheta)
		local invSinTheta = 1 / SIN(theta)
		startInterp = SIN((t - 1) * theta) * invSinTheta
		finishInterp = SIN(t * theta) * invSinTheta
	else
		startInterp = t - 1
		finishInterp = t
	end
	return a[1] * startInterp + b[1] * finishInterp, a[2] * startInterp + b[2] * finishInterp, a[3] * startInterp + b[3] * finishInterp, a[4] * startInterp + b[4] * finishInterp
end
function Clerp(a, b, t)
	local qa = {
		QuaternionFromCFrame(a)
	}
	local qb = {
		QuaternionFromCFrame(b)
	}
	local ax, ay, az = a.x, a.y, a.z
	local bx, by, bz = b.x, b.y, b.z
	local _t = 1 - t
	return QuaternionToCFrame(_t * ax + t * bx, _t * ay + t * by, _t * az + t * bz, QuaternionSlerp(qa, qb, t))
end
function CreateFrame(PARENT, TRANSPARENCY, BORDERSIZEPIXEL, POSITION, SIZE, COLOR, BORDERCOLOR, NAME)
	local frame = IT("Frame")
	frame.BackgroundTransparency = TRANSPARENCY
	frame.BorderSizePixel = BORDERSIZEPIXEL
	frame.Position = POSITION
	frame.Size = SIZE
	frame.BackgroundColor3 = COLOR
	frame.BorderColor3 = BORDERCOLOR
	frame.Name = NAME
	frame.Parent = PARENT
	return frame
end
function CreateLabel(PARENT, TEXT, TEXTCOLOR, TEXTFONTSIZE, TEXTFONT, TRANSPARENCY, BORDERSIZEPIXEL, STROKETRANSPARENCY, NAME)
	local label = IT("TextLabel")
	label.BackgroundTransparency = 1
	label.Size = UD2(1, 0, 1, 0)
	label.Position = UD2(0, 0, 0, 0)
	label.TextColor3 = TEXTCOLOR
	label.TextStrokeTransparency = STROKETRANSPARENCY
	label.TextTransparency = TRANSPARENCY
	label.FontSize = TEXTFONTSIZE
	label.Font = TEXTFONT
	label.BorderSizePixel = BORDERSIZEPIXEL
	label.TextScaled = false
	label.Text = TEXT
	label.Name = NAME
	label.Parent = PARENT
	return label
end
function NoOutlines(PART)
	PART.TopSurface, PART.BottomSurface, PART.LeftSurface, PART.RightSurface, PART.FrontSurface, PART.BackSurface = 10, 10, 10, 10, 10, 10
end
function CreateWeldOrSnapOrMotor(TYPE, PARENT, PART0, PART1, C0, C1)
	local NEWWELD = IT(TYPE)
	NEWWELD.Part0 = PART0
	NEWWELD.Part1 = PART1
	NEWWELD.C0 = C0
	NEWWELD.C1 = C1
	NEWWELD.Parent = PARENT
	return NEWWELD
end
local S = IT("Sound")
function CreateSound(ID, PARENT, VOLUME, PITCH, DOESLOOP)
	local NEWSOUND
	coroutine.resume(coroutine.create(function()
		NEWSOUND = S:Clone()
		NEWSOUND.Parent = PARENT
		NEWSOUND.Volume = VOLUME
		NEWSOUND.Pitch = PITCH
		NEWSOUND.SoundId = "rbxassetid://" .. ID
		NEWSOUND:play()
		NEWSOUND.EmitterSize = VOLUME * 3
		if DOESLOOP == true then
			NEWSOUND.Looped = true
		else
			repeat
				wait(1)
			until NEWSOUND.Playing == false
			NEWSOUND:remove()
		end
	end))
	return NEWSOUND
end
function CFrameFromTopBack(at, top, back)
	local right = top:Cross(back)
	return CF(at.x, at.y, at.z, right.x, top.x, back.x, right.y, top.y, back.y, right.z, top.z, back.z)
end
function WACKYEFFECT(Table)
	local TYPE = Table.EffectType or "Sphere"
	local SIZE = Table.Size or VT(1, 1, 1)
	local ENDSIZE = Table.Size2 or VT(0, 0, 0)
	local TRANSPARENCY = Table.Transparency or 0
	local ENDTRANSPARENCY = Table.Transparency2 or 1
	local CFRAME = Table.CFrame or Torso.CFrame
	local MOVEDIRECTION = Table.MoveToPos or nil
	local ROTATION1 = Table.RotationX or 0
	local ROTATION2 = Table.RotationY or 0
	local ROTATION3 = Table.RotationZ or 0
	local MATERIAL = Table.Material or "Neon"
	local COLOR = Table.Color or C3(1, 1, 1)
	local TIME = Table.Time or 45
	local SOUNDID = Table.SoundID or nil
	local SOUNDPITCH = Table.SoundPitch or nil
	local SOUNDVOLUME = Table.SoundVolume or nil
	local USEBOOMERANGMATH = Table.UseBoomerangMath or false
	local BOOMERANG = Table.Boomerang or 0
	local SIZEBOOMERANG = Table.SizeBoomerang or 0
	coroutine.resume(coroutine.create(function()
		local PLAYSSOUND = false
		local SOUND
		local EFFECT = CreatePart(3, Effects, MATERIAL, 0, TRANSPARENCY, BRICKC("Pearl"), "Effect", VT(1, 1, 1), true)
		if SOUNDID ~= nil and SOUNDPITCH ~= nil and SOUNDVOLUME ~= nil then
			PLAYSSOUND = true
			SOUND = CreateSound(SOUNDID, nil, SOUNDVOLUME, SOUNDPITCH, false)
		end
		EFFECT.Color = COLOR
		local MSH
		if TYPE == "Sphere" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "Sphere", "", "", SIZE, VT(0, 0, 0))
		elseif TYPE == "Block" or TYPE == "Box" then
			MSH = IT("BlockMesh", EFFECT)
			MSH.Scale = SIZE
		elseif TYPE == "Wave" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "20329976", "", SIZE, VT(0, 0, -SIZE.X / 8))
		elseif TYPE == "Ring" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "559831844", "", VT(SIZE.X, SIZE.X, 0.1), VT(0, 0, 0))
		elseif TYPE == "Slash" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "662586858", "", VT(SIZE.X / 10, 0, SIZE.X / 10), VT(0, 0, 0))
		elseif TYPE == "Round Slash" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "662585058", "", VT(SIZE.X / 10, 0, SIZE.X / 10), VT(0, 0, 0))
		elseif TYPE == "Swirl" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "168892432", "", SIZE, VT(0, 0, 0))
		elseif TYPE == "Skull" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "4770583", "", SIZE, VT(0, 0, 0))
		elseif TYPE == "Crystal" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "9756362", "", SIZE, VT(0, 0, 0))
		end
		if MSH ~= nil then
			local BOOMR1 = 1 + BOOMERANG / 50
			local BOOMR2 = 1 + SIZEBOOMERANG / 50
			local MOVESPEED
			if MOVEDIRECTION ~= nil then
				if USEBOOMERANGMATH == true then
					MOVESPEED = CFRAME.p - MOVEDIRECTION.Magnitude / TIME * BOOMR1
				else
					MOVESPEED = CFRAME.p - MOVEDIRECTION.Magnitude / TIME
				end
			end
			local GROWTH
			if USEBOOMERANGMATH == true then
				GROWTH = (SIZE - ENDSIZE) * (BOOMR2 + 1)
			else
				GROWTH = SIZE - ENDSIZE
			end
			local TRANS = TRANSPARENCY - ENDTRANSPARENCY
			if TYPE == "Block" then
				EFFECT.CFrame = CFRAME * ANGLES(RAD(MRANDOM(0, 360)), RAD(MRANDOM(0, 360)), RAD(MRANDOM(0, 360)))
			else
				EFFECT.CFrame = CFRAME
			end
			if SOUND then
				SOUND.Parent = EFFECT
			end
			if USEBOOMERANGMATH == true then
				for LOOP = 1, TIME + 1 do
					Swait()
					MSH.Scale = MSH.Scale - VT(GROWTH.X * (1 - LOOP / TIME * BOOMR2), GROWTH.Y * (1 - LOOP / TIME * BOOMR2), GROWTH.Z * (1 - LOOP / TIME * BOOMR2)) * BOOMR2 / TIME
					if TYPE == "Wave" then
						MSH.Offset = VT(0, 0, -MSH.Scale.Z / 8)
					end
					EFFECT.Transparency = EFFECT.Transparency - TRANS / TIME
					if TYPE == "Block" then
						EFFECT.CFrame = CFRAME * ANGLES(RAD(MRANDOM(0, 360)), RAD(MRANDOM(0, 360)), RAD(MRANDOM(0, 360)))
					else
						EFFECT.CFrame = EFFECT.CFrame * ANGLES(RAD(ROTATION1), RAD(ROTATION2), RAD(ROTATION3))
					end
					if MOVEDIRECTION ~= nil then
						local ORI = EFFECT.Orientation
						EFFECT.CFrame = CF(EFFECT.Position, MOVEDIRECTION) * CF(0, 0, -MOVESPEED * (1 - LOOP / TIME * BOOMR1))
						EFFECT.CFrame = CF(EFFECT.Position) * ANGLES(RAD(ORI.X), RAD(ORI.Y), RAD(ORI.Z))
					end
				end
			else
				for LOOP = 1, TIME + 1 do
					Swait()
					MSH.Scale = MSH.Scale - GROWTH / TIME
					if TYPE == "Wave" then
						MSH.Offset = VT(0, 0, -MSH.Scale.Z / 8)
					end
					EFFECT.Transparency = EFFECT.Transparency - TRANS / TIME
					if TYPE == "Block" then
						EFFECT.CFrame = CFRAME * ANGLES(RAD(MRANDOM(0, 360)), RAD(MRANDOM(0, 360)), RAD(MRANDOM(0, 360)))
					else
						EFFECT.CFrame = EFFECT.CFrame * ANGLES(RAD(ROTATION1), RAD(ROTATION2), RAD(ROTATION3))
					end
					if MOVEDIRECTION ~= nil then
						local ORI = EFFECT.Orientation
						EFFECT.CFrame = CF(EFFECT.Position, MOVEDIRECTION) * CF(0, 0, -MOVESPEED)
						EFFECT.CFrame = CF(EFFECT.Position) * ANGLES(RAD(ORI.X), RAD(ORI.Y), RAD(ORI.Z))
					end
				end
			end
			EFFECT.Transparency = 1
			if PLAYSSOUND == false then
				EFFECT:remove()
			else
				repeat
					Swait()
				until EFFECT:FindFirstChildOfClass("Sound") == nil
				EFFECT:remove()
			end
		elseif PLAYSSOUND == false then
			EFFECT:remove()
		else
			repeat
				Swait()
			until EFFECT:FindFirstChildOfClass("Sound") == nil
			EFFECT:remove()
		end
	end))
end
function MakeForm(PART, TYPE)
	if TYPE == "Cyl" then
		local MSH = IT("CylinderMesh", PART)
	elseif TYPE == "Ball" then
		local MSH = IT("SpecialMesh", PART)
		MSH.MeshType = "Sphere"
	elseif TYPE == "Wedge" then
		local MSH = IT("SpecialMesh", PART)
		MSH.MeshType = "Wedge"
	end
end
Debris = game:GetService("Debris")
function CastProperRay(StartPos, EndPos, Distance, Ignore)
	local DIRECTION = CF(StartPos, EndPos).lookVector
	local Ignore = type(Ignore) == "table" and Ignore or {Ignore}
	return game:GetService("Workspace"):FindPartOnRayWithIgnoreList(Ray.new(StartPos, DIRECTION * Distance), Ignore)
end
local Particle = IT("ParticleEmitter", nil)
Particle.Enabled = false
Particle.LightEmission = 0.9
Particle.Rate = 150
Particle.ZOffset = 0.2
Particle.Rotation = NumberRange.new(-180, 180)
function ParticleEmitter(Table)
	local PRTCL = Particle:Clone()
	local Color1 = Table.Color1 or C3(1, 1, 1)
	local Color2 = Table.Color2 or C3(1, 1, 1)
	local Speed = Table.Speed or 5
	local Drag = Table.Drag or 0
	local Size1 = Table.Size1 or 1
	local Size2 = Table.Size2 or 5
	local Lifetime1 = Table.Lifetime1 or 1
	local Lifetime2 = Table.Lifetime2 or 1.5
	local Parent = Table.Parent or Torso
	local Emit = Table.Emit or 100
	local Offset = Table.Offset or 360
	local Acel = Table.Acel or VT(0, 0, 0)
	local Enabled = Table.Enabled or false
	local Texture = Table.Texture or "281983280"
	local RotS = Table.RotSpeed or NumberRange.new(-15, 15)
	local Trans1 = Table.Transparency1 or 1
	local Trans2 = Table.Transparency2 or 0
	PRTCL.Parent = Parent
	PRTCL.RotSpeed = RotS
	PRTCL.Transparency = NumberSequence.new({
		NumberSequenceKeypoint.new(0, Trans1),
		NumberSequenceKeypoint.new(1, Trans2)
	})
	PRTCL.Texture = "http://www.roblox.com/asset/?id=" .. Texture
	PRTCL.Color = ColorSequence.new(Color1, Color2)
	PRTCL.Size = NumberSequence.new(Size1, Size2)
	PRTCL.Lifetime = NumberRange.new(Lifetime1, Lifetime2)
	PRTCL.Speed = NumberRange.new(Speed)
	PRTCL.VelocitySpread = Offset
	PRTCL.Drag = Drag
	PRTCL.Acceleration = Acel
	if Enabled == false then
		PRTCL:Emit(Emit)
		Debris:AddItem(PRTCL, Lifetime2)
	else
		PRTCL.Enabled = true
	end
	return PRTCL
end

local Player_Size = 1

function CamShake(SHAKE, TIMER)
	coroutine.resume(coroutine.create(function()
		local FADER = SHAKE / TIMER
		for i = 1, TIMER do
			wait()
			Humanoid.CameraOffset = VT(MRANDOM(-(SHAKE - FADER * i), SHAKE - FADER * i) / 10, MRANDOM(-(SHAKE - FADER * i), SHAKE - FADER * i) / 10, MRANDOM(-(SHAKE - FADER * i), SHAKE - FADER * i) / 10)
		end
		Humanoid.CameraOffset = VT(0, 0, 0)
	end))
end
function GetRoot(MODEL, ROOT)
	if ROOT == true then
		return MODEL:FindFirstChild("HumanoidRootPart") or MODEL:FindFirstChild("Torso") or MODEL:FindFirstChild("UpperTorso")
	else
		return MODEL:FindFirstChild("Torso") or MODEL:FindFirstChild("UpperTorso")
	end
end

arm1 = Instance.new("Weld")
arm1.Parent = left
arm1.Part0 = left

arm2 = Instance.new("Weld")
arm2.Parent = right
arm2.Part0 = right

arm2.C0 = CFrame.new(1.5, 0, 0.5)
arm2.C1 = CFrame.Angles(0, 0, 0)
arm1.C0 = CFrame.new(-1.5, 0, 0.5)
arm1.C1 = CFrame.Angles(0, 0, 0)

local SCARF = CreatePart(3, Character, "Fabric", 0, 0, BRICKC("Pearl"), "Scarf", VT(1, 1, 1), false)
CreateWeldOrSnapOrMotor("Weld", Torso, Torso, SCARF, CF(0, 0, 0), CF(0, 0, 0))
CreateMesh("SpecialMesh", SCARF, "FileMesh", "0", "", VT(0.6, 1, 1), VT(0, 0.15, 0))

local S = Instance.new('Sound',Head)
S.SoundId = "rbxassetid://524533645"
S.Looped = true
S.Volume = 5
S.PlaybackSpeed = 1
S.MaxDistance = 30
S:Play()

Player.Chatted:connect(function(m)
    if m:match("pl%s%d+") then
        S:Stop()
        S.SoundId = "rbxassetid://"..m:match("pl%s(%d+)")
        S:Play()
  end
end)

Humanoid.Changed:connect(function(Jump)
	if Jump == "Jump" and Disable_Jump == true then
		Humanoid.Jump = false
	end
end)
local TIMESTAMP = 0
while true do
	Swait()
			for _, c in pairs(Character:GetChildren()) do
		if c.ClassName == "Part" then
			if c:FindFirstChildOfClass("BodyPosition") then
				c:FindFirstChildOfClass("BodyPosition"):remove()
			end
		end
		end
	script.Parent = WEAPONGUI
	ANIMATE.Parent = nil
	for _, v in next, Humanoid:GetPlayingAnimationTracks() do
		v:Stop()
	end
	SINE = SINE + CHANGE
	local TORSOVELOCITY = (RootPart.Velocity * VT(1, 0, 1)).magnitude
	local TORSOVERTICALVELOCITY = RootPart.Velocity.y
	local HITFLOOR = Raycast(RootPart.Position, CF(RootPart.Position, RootPart.Position + VT(0, -1, 0)).lookVector, 4, Character)
	local WALKSPEEDVALUE = 8 / (Humanoid.WalkSpeed / 16)
	local SPEED = WALKSPEEDVALUE
	if SPEED > 2 then
		SPEED = 2
	end
    if ANIM == "Walk" and TORSOVELOCITY > 1 then
        RootJoint.C1 = Clerp(RootJoint.C1, ROOTC0 * CF(0, 0, 0.1 * COS(SINE / (WALKSPEEDVALUE / 2))) * ANGLES(RAD(0), RAD(0), RAD(0)), 2 / Animation_Speed)
        Neck.C1 = Clerp(Neck.C1, CF(0, -0.5, 0) * ANGLES(RAD(-90), RAD(0), RAD(180)) * ANGLES(RAD(0), RAD(0), RAD(0) - Head.RotVelocity.Y / 30), 0.6 / Animation_Speed)
        RightHip.C1 = Clerp(RightHip.C1, CF(0.5, 0.875 - 0.125 * SIN(SINE / WALKSPEEDVALUE) - 0.15 * COS(SINE / WALKSPEEDVALUE * 2), 0.25 * SIN(SINE / WALKSPEEDVALUE)) * ANGLES(RAD(0), RAD(90), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(10 + 50 * COS(SINE / WALKSPEEDVALUE))), 0.6 * SPEED / Animation_Speed)
        LeftHip.C1 = Clerp(LeftHip.C1, CF(-0.5, 0.875 + 0.125 * SIN(SINE / WALKSPEEDVALUE) - 0.15 * COS(SINE / WALKSPEEDVALUE * 2), -0.25 * SIN(SINE / WALKSPEEDVALUE)) * ANGLES(RAD(0), RAD(-90), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(-10 + 50 * COS(SINE / WALKSPEEDVALUE))), 0.6 * SPEED / Animation_Speed)
    elseif ANIM ~= "Walk" or TORSOVELOCITY < 1 then
        RootJoint.C1 = Clerp(RootJoint.C1, ROOTC0 * CF(0, 0, 0) * ANGLES(RAD(0), RAD(0), RAD(0)), 0.2 / Animation_Speed)
        Neck.C1 = Clerp(Neck.C1, CF(0, -0.5, 0) * ANGLES(RAD(-90), RAD(0), RAD(180)) * ANGLES(RAD(0), RAD(0), RAD(0)), 0.2 / Animation_Speed)
        RightHip.C1 = Clerp(RightHip.C1, CF(0.5, 1, 0) * ANGLES(RAD(0), RAD(90), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 0.7 / Animation_Speed)
        LeftHip.C1 = Clerp(LeftHip.C1, CF(-0.5, 1, 0) * ANGLES(RAD(0), RAD(-90), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 0.7 / Animation_Speed)
    end
    if TORSOVERTICALVELOCITY > 1 and HITFLOOR == nil then
        ANIM = "Jump"
        if ATTACK == false then
            RootJoint.C0 = Clerp(RootJoint.C0, ROOTC0 * CF(0, 0, 0) * ANGLES(RAD(-5), RAD(0), RAD(0)), 1 / Animation_Speed)
            Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0) * ANGLES(RAD(-25), RAD(0), RAD(0)), 1 / Animation_Speed)
RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5, 0.1, 0) * ANGLES(RAD(45), RAD(0), RAD(-45)) * LEFTSHOULDERC0, 0.25 / Animation_Speed)
           LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5, 0.1, 0) * ANGLES(RAD(45), RAD(0), RAD(45)) * LEFTSHOULDERC0, 0.25 / Animation_Speed)
            RightHip.C0 = Clerp(RightHip.C0, CF(1, -0.4, -0.6) * ANGLES(RAD(1), RAD(90), RAD(0)) * ANGLES(RAD(-1 * SIN(SINE / 6)), RAD(0), RAD(0)), 1 / Animation_Speed)
            LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -1, 0) * ANGLES(RAD(0), RAD(-85), RAD(0)) * ANGLES(RAD(-1 * SIN(SINE / 6)), RAD(0), RAD(0)), 1 / Animation_Speed)
        end
    elseif TORSOVERTICALVELOCITY < -1 and HITFLOOR == nil then
        ANIM = "Fall"
        if ATTACK == false then
            RootJoint.C0 = Clerp(RootJoint.C0, ROOTC0 * CF(0, 0, 0) * ANGLES(RAD(15), RAD(0), RAD(0)), 1 / Animation_Speed)
            Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0) * ANGLES(RAD(15), RAD(0), RAD(0)), 1 / Animation_Speed)
RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5, 0.1, 0) * ANGLES(RAD(45), RAD(0), RAD(-45)) * LEFTSHOULDERC0, 0.25 / Animation_Speed)
          LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5, 0.1, 0) * ANGLES(RAD(45), RAD(0), RAD(45)) * LEFTSHOULDERC0, 0.25 / Animation_Speed)
            RightHip.C0 = Clerp(RightHip.C0, CF(1, -0.3, -0.7) * ANGLES(RAD(-25 + 5 * SIN(SINE / 12)), RAD(90), RAD(0)) * ANGLES(RAD(-1 * SIN(SINE / 6)), RAD(0), RAD(0)), 1 / Animation_Speed)
            LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -0.8, -0.3) * ANGLES(RAD(-10), RAD(-80), RAD(0)) * ANGLES(RAD(-1 * SIN(SINE / 6)), RAD(0), RAD(0)), 1 / Animation_Speed)
        end
    elseif TORSOVELOCITY < 1 and HITFLOOR ~= nil then
				ANIM = "Idle"
				if ATTACK == false then
			RootJoint.C0 = Clerp(RootJoint.C0, ROOTC0 * CF(0, 0, -0.1 + 0.1 * COS(SINE / 20)) * ANGLES(RAD(0), RAD(0), RAD(0)), 0.4 / Animation_Speed*3)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(15), RAD(0), RAD(0)), 0.4 / Animation_Speed)				
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.1, 0.4 - 0.05 * COS(SINE / 30), 0.25 - 0.025 * COS(SINE / 20)) * ANGLES(RAD(-30), RAD(0), RAD(-30)) * RIGHTSHOULDERC0, 0.4 / Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.1, 0.4 - 0.05 * COS(SINE / 30), 0.25 - 0.025 * COS(SINE / 20)) * ANGLES(RAD(-30), RAD(0), RAD(30)) * LEFTSHOULDERC0, 0.4 / Animation_Speed)
			RightHip.C0 = Clerp(RightHip.C0, CF(1, -0.9 - 0.1 * COS(SINE / 20), 0.025 * COS(SINE / 20)) * ANGLES(RAD(0), RAD(90), RAD(0)) * ANGLES(RAD(-4.5), RAD(0), RAD(0)), 0.4 / Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -0.9 - 0.1 * COS(SINE / 20), 0.025 * COS(SINE / 20)) * ANGLES(RAD(0), RAD(-90), RAD(0)) * ANGLES(RAD(-6.5), RAD(0), RAD(0)), 0.4 / Animation_Speed)
				end
    elseif TORSOVELOCITY > 1 and HITFLOOR ~= nil then
        ANIM = "Walk"
        if ATTACK == false then
            if Humanoid.WalkSpeed < 25 then
            RootJoint.C0 = Clerp(RootJoint.C0, ROOTC0 * CF(0, 0, -0.175 + 0.025 * COS(SINE / 3.5) + -SIN(SINE / 3.5) / 7) * ANGLES(RAD(4-2.5 * COS(SINE / 3.5)), RAD(0) - RootPart.RotVelocity.Y / 75, RAD(5 * COS(SINE / 7))), 0.15)
            Torso.Neck.C0 = Clerp(Torso.Neck.C0, NECKC0 * ANGLES(RAD(-2.5 * SIN(SINE / 20)), RAD(0), RAD(0) - Head.RotVelocity.Y / 15), 0.3)
			RightHip.C0 = Clerp(RightHip.C0, CF(1 , -1, 0.15) * ANGLES(RAD(0), RAD(85), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 0.6 / Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -1, 0.15) * ANGLES(RAD(0), RAD(-85), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 0.6 / Animation_Speed)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.1, 0.4 - 0.05 * COS(SINE / 30), 0.25 - 0.025 * COS(SINE / 20)) * ANGLES(RAD(-30), RAD(0), RAD(-30)) * RIGHTSHOULDERC0, 0.4 / Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.1, 0.4 - 0.05 * COS(SINE / 30), 0.25 - 0.025 * COS(SINE / 20)) * ANGLES(RAD(-30), RAD(0), RAD(30)) * LEFTSHOULDERC0, 0.4 / Animation_Speed)
            else
                RootJoint.C0 = Clerp(RootJoint.C0, ROOTC0 * CF(0, 0, -0.1) * ANGLES(RAD(-35), RAD(0), RAD(0)), 1 / Animation_Speed)
                Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0) * ANGLES(RAD(-15), RAD(0), RAD(0)), 1 / Animation_Speed)
RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5, 0.1, 0) * ANGLES(RAD(45), RAD(0), RAD(-45)) * LEFTSHOULDERC0, 0.25 / Animation_Speed)
              LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5, 0.1, 0) * ANGLES(RAD(45), RAD(0), RAD(45)) * LEFTSHOULDERC0, 0.25 / Animation_Speed)
                RightHip.C0 = Clerp(RightHip.C0, CF(1, -1, 0) * ANGLES(RAD(-45), RAD(85), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
                LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -1, 0) * ANGLES(RAD(-45), RAD(-85), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
            end
        end
    end
    if HEADTURN == true and ANIM == "Idle" then
        if NECKK then
            NECKK:Remove()
            NECKK = nil
        end
end
 
    Humanoid.MaxHealth = 1000
    Humanoid.Health = 1000
    if Rooted == false then
        Disable_Jump = false
        Humanoid.WalkSpeed = Speed
    elseif Rooted == true then
        Disable_Jump = true
        Humanoid.WalkSpeed = 0
    end
end
 
 
-------------------------------------------------
