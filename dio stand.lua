InternalData = {}
do
    script.Parent = owner.Character
    local Event = Instance.new("RemoteEvent")
    Event.Name = "UserInput"
    local function NewFakeEvent()
        local Fake = {fakeEvent=true,Connect=function(self,Func)self.Function=Func end}Fake.connect = Fake.Connect
        return Fake
    end
    local Mouse = {Target=nil,Hit=CFrame.new(),KeyUp=NewFakeEvent(),KeyDown=NewFakeEvent(),Button1Up=NewFakeEvent(),Button1Down=NewFakeEvent()}
    local UserInputService = {InputBegan=NewFakeEvent(),InputEnded=NewFakeEvent()}
    local ContextActionService = {Actions={},BindAction = function(self,actionName,Func,touch,...)
        self.Actions[actionName] = Func and {Name=actionName,Function=Func,Keys={...}} or nil
    end};ContextActionService.UnBindAction = ContextActionService.BindAction
    local function TriggerEvent(self,Event,...)
        local Trigger = Mouse[Event]
        if Trigger and Trigger.fakeEvent and Trigger.Function then
            Trigger.Function(...)
        end
    end
    Mouse.TrigEvent = TriggerEvent
    UserInputService.TrigEvent = TriggerEvent
    Event.OnServerEvent:Connect(function(FiredBy,Input)
        if FiredBy.Name ~= owner.Name then end
        if Input.MouseEvent then
            Mouse.Target = Input.Target
            Mouse.Hit = Input.Hit
        else
            local Begin = Input.UserInputState == Enum.UserInputState.Begin
            if Input.UserInputType == Enum.UserInputType.MouseButton1 then
                return Mouse:TrigEvent(Begin and "Button1Down" or "Button1Up")
            end
            for _,Action in pairs(ContextActionService.Actions) do
                for _,Key in pairs(Action.Keys) do
                    if Key==Input.KeyCode then
                        Action.Function(Action.Name,Input.UserInputState,Input)
                    end
                end
            end
            Mouse:TrigEvent(Begin and "KeyDown" or "KeyUp",Input.KeyCode.Name:lower())
            UserInputService:TrigEvent(Begin and "InputBegan" or "InputEnded",Input,false)
        end
    end)
    InternalData["Mouse"] = Mouse
    InternalData["ContextActionService"] = ContextActionService
    InternalData["UserInputService"] = UserInputService
    Event.Parent = NLS([[
        local Player = owner
        local Event = script:WaitForChild("UserInput")
        local UserInputService = game:GetService("UserInputService")
        local Mouse = Player:GetMouse()
        local Input = function(Input,gameProcessedEvent)
            if gameProcessedEvent then return end
            Event:FireServer({KeyCode=Input.KeyCode,UserInputType=Input.UserInputType,UserInputState=Input.UserInputState})
        end
        UserInputService.InputBegan:Connect(Input)
        UserInputService.InputEnded:Connect(Input)
        local Hit,Target
        while wait(1/30) do
            if Hit ~= Mouse.Hit or Target ~= Mouse.Target then
                Hit,Target = Mouse.Hit,Mouse.Target
                Event:FireServer({["MouseEvent"]=true,["Target"]=Target,["Hit"]=Hit})
            end
        end
    ]],owner.Character)
end
RealGame = game;game = setmetatable({},{
    __index = function (self,Index)
        local Sandbox = function (Thing)
            if Thing:IsA("Player") then
                local RealPlayer = Thing
                return setmetatable({},{
                    __index = function (self,Index)
                        local Type = type(RealPlayer[Index])
                        if Type == "function" then
                            if Index:lower() == "getmouse" or Index:lower() == "mouse" then
                                return function (self)
                                    return InternalData["Mouse"]
                                end
                            end
                            return function (self,...)
                                return RealPlayer[Index](RealPlayer,...)
                            end
                        else
                            return RealPlayer[Index]
                        end
                    end;
                    __tostring = function(self)
                        return RealPlayer.Name
                    end
                })
            end
        end
        if RealGame[Index] then
            local Type = type(RealGame[Index])
            if Type == "function" then
                if Index:lower() == "getservice" or Index:lower() == "service" then
                    return function (self,Service)
                        if Service:lower() == "players" then
                            return setmetatable({},{
                                __index = function (self2,Index2)
                                    local RealService = RealGame:GetService(Service)
                                    local Type2 = type(Index2)
                                    if Type2 == "function" then
                                        return function (self,...)
                                            return RealService[Index2](RealService,...)
                                        end
                                    else
                                        if Index2:lower() == "localplayer" then
                                            return Sandbox(owner)
                                        end
                                        return RealService[Index2]
                                    end
                                end;
                                __tostring = function(self)
                                    return RealGame:GetService(Service).Name
                                end
                            })
                        elseif Service:lower() == "contextactionservice" then
                            return InternalData["ContextActionService"]
                        elseif Service:lower() == "contextactionservice" then
                            return InternalData["UserInputService"]
                        elseif Service:lower() == "runservice" then
                            return setmetatable({},{
                                __index = function(self2,Index2)
                                    local RealService = RealGame:GetService(Service)
                                    local Type2 = type(Index2)
                                    if Type2 == "function" then
                                        return function (self,...)
                                            return RealService[Index2](RealService,...)
                                        end
                                    else
                                        if Index2:lower() == "bindtorenderstep" then
                                            return function (self,Name,Priority,Function)
                                                return RealGame:GetService("RunService").Stepped:Connect(Function)
                                            end
                                        end
                                        if Index2:lower() == "renderstepped" then
                                            return RealService["Stepped"]
                                        end
                                        return RealService[Index2]
                                    end
                                end
                            })
                        else
                            return RealGame:GetService(Service)
                        end
                    end
                end
                return function (self,...)
                    return RealGame[Index](RealGame,...)
                end
            else
                if game:GetService(Index) then
                    return game:GetService(Index)
                end
                return RealGame[Index]
            end
        else
            return nil
        end
    end
});Game = game;owner = game:GetService("Players").LocalPlayer
print("Complete! Running...")

 print"Created and Perfected by lanceron2, took 3 days to make"

wait(0.1)
local Player = game.Players.LocalPlayer
local Character = Player.Character
local Humanoid = Character.Humanoid
Humanoid.Name = "DIO"
local Mouse = Player:GetMouse()
local LeftArm = Character["Left Arm"]
local RightArm = Character["Right Arm"]
local LeftLeg = Character["Left Leg"]
local RightLeg = Character["Right Leg"]
local Head = Character.Head
local Torso = Character.Torso
function chatfunc(text)
local chat = coroutine.wrap(function()
if Character:FindFirstChild("TalkingBillBoard")~= nil then
Character:FindFirstChild("TalkingBillBoard"):destroy()
end
local naeeym2 = Instance.new("BillboardGui",Character)
naeeym2.Size = UDim2.new(0,100,0,40)
naeeym2.StudsOffset = Vector3.new(0,3,0)
naeeym2.Adornee = Head
naeeym2.Name = "TalkingBillBoard"
 tecks2 = Instance.new("TextLabel",naeeym2)
tecks2.BackgroundTransparency = 1
tecks2.BorderSizePixel = 0
tecks2.Text = ""
tecks2.Font = "Fantasy"
tecks2.TextSize = 30
tecks2.TextStrokeTransparency = 0
tecks2.TextColor3 = Color3.new(0,0,0)
tecks2.TextStrokeColor3 = Color3.new(0,0,255)
tecks2.Size = UDim2.new(1,0,0.5,0)
local tecks3 = Instance.new("TextLabel",naeeym2)
tecks3.BackgroundTransparency = 1
tecks3.BorderSizePixel = 0
tecks3.Text = ""
tecks3.Font = "Fantasy"
tecks3.TextSize = 30
tecks3.TextStrokeTransparency = 0
tecks3.TextColor3 = Color3.new(244/255,173/255,59/255)
tecks3.TextStrokeColor3 = Color3.new(244/255,173/255,59/255)
tecks3.Size = UDim2.new(1,0,0.5,0)
for i = 1,string.len(text),1 do

tecks2.Text = string.sub(text,1,i)
tecks3.Text = string.sub(text,1,i)
wait(0.01)
end
wait(2)
for i = 1, 50 do

tecks2.Position = tecks2.Position - UDim2.new(math.random(-.4,.4),math.random(-5,5),.05,math.random(-5,5))
tecks2.Rotation = tecks2.Rotation - .8
tecks2.TextStrokeTransparency = tecks2.TextStrokeTransparency +.04
tecks2.TextTransparency = tecks2.TextTransparency + .04
tecks3.Position = tecks2.Position - UDim2.new(math.random(-.4,.4),math.random(-5,5),.05,math.random(-5,5))
tecks3.Rotation = tecks2.Rotation + .8
tecks3.TextStrokeTransparency = tecks2.TextStrokeTransparency +.04
tecks3.TextTransparency = tecks2.TextTransparency + .04
end
naeeym2:Destroy()
end)
chat()
local txt = Instance.new("BillboardGui", Character)
txt.Adornee = Character.Head
txt.Name = "_status"
txt.Size = UDim2.new(4, 0, 2.5, 0)
txt.StudsOffset = Vector3.new(-4, 2, 0)
local text = Instance.new("TextLabel", txt)
text.Size = UDim2.new(3, 0, 0.5, 0)
text.FontSize = "Size24"
text.TextScaled = true
text.TextTransparency = 0
text.BackgroundTransparency = 1
text.TextTransparency = 0
text.TextStrokeTransparency = 0
text.Font = "SciFi"
text.TextStrokeColor3 = Color3.new(244/255,173/255,59/255)
text.Text = ""
Player = game:service'Players'.LocalPlayer
Character = Player.Character
local ms = Player:GetMouse()
CV="Bright red"
 
local txt = Instance.new("BillboardGui", chr)
txt.Adornee = Character.Head
txt.Name = "_status"
txt.Size = UDim2.new(4, 0, 2.5, 0)
txt.StudsOffset = Vector3.new(-4, 1.5, 0)
local text = Instance.new("TextLabel", txt)
text.Size = UDim2.new(3, 0, 0.5, 0)
text.FontSize = "Size24"
text.TextScaled = false
text.TextTransparency = 0
text.BackgroundTransparency = 1
text.TextTransparency = 0
text.TextStrokeTransparency = 0
text.Font = "SciFi"
text.TextStrokeColor3 = Color3.new(125/255,30/255,64/255)
text.Text = "by lanceron2"  
end
shirt = Instance.new("Shirt", Character)
shirt.Name = "Shirt"
pants = Instance.new("Pants", Character)
pants.Name = "Pants"
Character.Shirt.ShirtTemplate = "http://www.roblox.com/asset/?id=3466467576"
Character.Pants.PantsTemplate = "http://www.roblox.com/asset/?id=2620599974"
Head.face.Texture = "http://www.roblox.com/asset/?id=3954683705"
Head.BrickColor = BrickColor.new("Pastel brown")
    for i,v in pairs(Character:GetChildren()) do
        if v.ClassName == "Accessory" or v.ClassName == "Hat" then
            v:destroy()
        end
    end
Humanoid.Health = Humanoid.MaxHealth
local BC = Character["Body Colors"]
BC.HeadColor = BrickColor.new("Pastel brown")
BC.LeftArmColor = BrickColor.new("Pastel brown")
BC.LeftLegColor = BrickColor.new("Pastel brown")
BC.RightArmColor = BrickColor.new("Pastel brown")
BC.RightLegColor = BrickColor.new("Pastel brown")
BC.TorsoColor = BrickColor.new("Pastel brown")
local Hair = Instance.new("Part")
Hair.Parent = Character
Hair.Name = "Hair"
Hair.Size = Vector3.new(1, 1, 1)
Hair.CFrame = Head.CFrame
Hair:BreakJoints()
Hair.CanCollide = false
Hair.TopSurface = "Smooth"
Hair.BottomSurface = "Smooth"
Hair.BrickColor = BrickColor.new("White")
Weld = Instance.new("Weld")
Weld.Name = "Weld"
Weld.Part0 = Head
Weld.Part1 = Hair
Weld.Parent = Head
Weld.C0 = CFrame.new(0.01,0.05,0.099)*CFrame.fromEulerAnglesXYZ(0,3,-3.2)
Mesh = Instance.new("SpecialMesh")
Mesh.Parent = Hair
Mesh.MeshId = "rbxassetid://901575276"
Mesh.TextureId = "rbxassetid://901575299"
Mesh.Scale = Vector3.new(-0.03,-0.03,-0.03)
local Camera = game.Workspace.CurrentCamera
local RootPart = Character.HumanoidRootPart
local Music = Instance.new("Sound",RootPart)
        Music.Pitch = 1
        Music.Volume = 5
        Music.Looped = true
        Music.SoundId = "rbxassetid://3619953008"
        Music:play()
local RootJoint = RootPart.RootJoint
local Pause = false
local attack = false
local Change = false
local DDZ = false
local LOL = false
local Anim = 'Idle'
local attacktype = 1
local delays = false
local play = true
local Time = 7
local targetted = nil
local Torsovelocity = (RootPart.Velocity * Vector3.new(1, 0, 1)).magnitude
local velocity = RootPart.Velocity.y
local sine = 0
local change = 1
local D = false
Loop = false
local DD = false
local doe = 0
local Create = LoadLibrary("RbxUtility").Create
local Stand = Instance.new("Model",Character)
Stand.Name = "Stand"
local ST = Instance.new("Part",Stand)
ST.Size = Vector3.new(2,2,1)
ST.BrickColor = BrickColor.new("Light brick yellow")
ST.CanCollide = false
local ST2 = Instance.new("SpecialMesh",ST)
ST2.MeshId = "rbxasset://fonts/torso.mesh"
ST2.Scale = Vector3.new(1,1,1)
local ST3 = Instance.new("Weld",ST)
ST3.Part0 = RootPart
ST3.Part1 = ST
ST3.C0 = CFrame.new(0,0,0)
local SH = Instance.new("Part",Stand)
SH.Size = Vector3.new(1.25,1.25,1.25)
SH.CanCollide = false
SH.BrickColor = BrickColor.new("Light brick yellow")
local SH2 = Instance.new("SpecialMesh",SH)
SH2.MeshType = "Head"
SH2.Scale = Vector3.new(1,1,1)
local SH2 = Instance.new("Weld",SH)
SH2.Part0 = ST
SH2.Part1 = SH
SH2.C0 = CFrame.new(0,1.5,0)
local SRA = Instance.new("Part",Stand)
SRA.Size = Vector3.new(1,2,1)
SRA.CanCollide = false
SRA.BrickColor = BrickColor.new("Bright orange")
local SRA2 = Instance.new("SpecialMesh",SRA)
SRA2.MeshId = "rbxasset://fonts/rightarm.mesh"
SRA2.Scale = Vector3.new(1,1,1)
local SRA3 = Instance.new("Weld",SRA)
SRA3.Part0 = ST
SRA3.Part1 = SRA
SRA3.C0 = CFrame.new(1.5,0,0)
local SLA = Instance.new("Part",Stand)
SLA.Size = Vector3.new(1,2,1)
SLA.CanCollide = false
SLA.BrickColor = BrickColor.new("Bright orange")
local SLA2 = Instance.new("SpecialMesh",SLA)
SLA2.MeshId = "rbxasset://fonts/leftarm.mesh"
SLA2.Scale = Vector3.new(1,1,1)
local SLA3 = Instance.new("Weld",SLA)
SLA3.Part0 = ST
SLA3.Part1 = SLA
SLA3.C0 = CFrame.new(-1.5,0,0)
local SRL = Instance.new("Part",Stand)
SRL.Size = Vector3.new(1,2,1)
SRL.CanCollide = false
SRL.BrickColor = BrickColor.new("Bright orange")
local SRL2 = Instance.new("SpecialMesh",SRL)
SRL2.MeshId = "rbxasset://fonts/rightleg.mesh"
SRL2.Scale = Vector3.new(1,1,1)
local SRL3 = Instance.new("Weld",SRL)
SRL3.Part0 = ST
SRL3.Part1 = SRL
SRL3.C0 = CFrame.new(0.5,-2,0)
local ArmsA = Instance.new("Part",Stand)
ArmsA.BrickColor = BrickColor.new("Bright orange")
ArmsA.CanCollide = false
local ArmsA2 = Instance.new("SpecialMesh",ArmsA)
ArmsA2.MeshId = "rbxassetid://1412262458"
ArmsA2.Scale = Vector3.new(0.018,0.021,0.018)
local ArmsA3 = Instance.new("Weld",ArmsA)
ArmsA3.Part0 = SLA
ArmsA3.Part1 = ArmsA
ArmsA3.C0 = CFrame.new(-0.21,0.1,-0.11)*CFrame.Angles(0,3.1,0)
local OtArmsA = Instance.new("Part",Stand)
OtArmsA.BrickColor = BrickColor.new("Bright orange")
OtArmsA.CanCollide = false
local OtArmsA2 = Instance.new("SpecialMesh",OtArmsA)
OtArmsA2.MeshId = "rbxassetid://1412262458"
OtArmsA2.Scale = Vector3.new(0.02,0.021,0.019)
local OtArmsA3 = Instance.new("Weld",OtArmsA)
OtArmsA3.Part0 = SRA
OtArmsA3.Part1 = OtArmsA
OtArmsA3.C0 = CFrame.new(0.17,0.2,0.09)*CFrame.Angles(0,6.265,0)
local SLL = Instance.new("Part",Stand)
SLL.Size = Vector3.new(1,2,1)
SLL.CanCollide = false
SLL.BrickColor = BrickColor.new("Bright orange")
local SLL2 = Instance.new("SpecialMesh",SLL)
SLL2.MeshId = "rbxasset://fonts/leftleg.mesh"
SLL2.Scale = Vector3.new(1,1,1)
local SLL3 = Instance.new("Weld",SLL)
SLL3.Part0 = ST
SLL3.Part1 = SLL
SLL3.C0 = CFrame.new(-0.5,-2,0)
local Face = Instance.new("Decal",SH)
Face.Face = "Front"
Face.Texture = "http://www.roblox.com/asset/?id=3423965424"
local StarH = Instance.new("Part",Stand)
StarH.BrickColor = BrickColor.new("Light brick yellow")
StarH.CanCollide = false
local StarH2 = Instance.new("SpecialMesh",StarH)
StarH2.MeshId = "rbxassetid://3410915323"
StarH2.Scale = Vector3.new(1,1,1)
local StarH3 = Instance.new("Weld",StarH)
StarH3.Part0 = SH
StarH3.Part1 = StarH
StarH3.C0 = CFrame.new(0,0.5,0.29)*CFrame.Angles(-0.9,0,0)
local ARW = Instance.new("Part",Stand)
ARW.BrickColor = BrickColor.new("Med. reddish violet")
ARW.CanCollide = false
local ARW2 = Instance.new("SpecialMesh",ARW)
ARW2.MeshId = "rbxassetid://2248726963"
ARW2.Scale = Vector3.new(0.20, 0.20, 0.20)
local ARW3 = Instance.new("Weld",ARW)
ARW3.Part0 = SH
ARW3.Part1 = ARW
ARW3.C0 = CFrame.new(0,0.5,-0.51)*CFrame.Angles(0.3,0,0)
local Scarf = Instance.new("Part",Stand)
Scarf.BrickColor = BrickColor.new("Med. reddish violet")
Scarf.CanCollide = false
local Scarf2 = Instance.new("SpecialMesh",Scarf)
Scarf2.MeshId = "rbxassetid://2248726963"
Scarf2.Scale = Vector3.new(0.600, 0.500, 0.600)
local Scarf3 = Instance.new("Weld",Scarf)
Scarf3.Part0 = ST
Scarf3.Part1 = Scarf
Scarf3.C0 = CFrame.new(0,0.5,-0.7)*CFrame.Angles(0,0,0)
local AM= Instance.new("Part",Stand)
AM.BrickColor = BrickColor.new("Bright orange")
AM.CanCollide = false
local AM2= Instance.new("SpecialMesh",AM)
AM2.MeshId = "rbxassetid://1175220072"
AM2.Scale = Vector3.new(0.01,0.01,0.01)
local AM3 = Instance.new("Weld",AM)
AM3.Part0 = ST
AM3.Part1 = AM
AM3.C0 = CFrame.new(0,0.3,0)*CFrame.Angles(0,0,0)
local Clot = Instance.new("Part",Stand)
Clot.BrickColor = BrickColor.new("Med. reddish violet")
Clot.CanCollide = false
local Clot2 = Instance.new("SpecialMesh",Clot)
Clot2.MeshId = "http://www.roblox.com/asset/?id=532220036"
Clot2.Scale = Vector3.new(1.1,1.1,1.1)
local Clot3 = Instance.new("Weld",Clot)
Clot3.Part0 = ST
Clot3.Part1 = Clot
Clot3.C0 = CFrame.new(0,-0.8,0)*CFrame.Angles(0,0,0)
local BClot = Instance.new("Part",Stand)
BClot.BrickColor = BrickColor.new("Med. reddish violet")
BClot.CanCollide = false
local BClot2 = Instance.new("SpecialMesh",BClot)
BClot2.MeshId = "http://www.roblox.com/asset/?id=532220036"
BClot2.Scale = Vector3.new(0.0000001,0.0000001,0.0000001)
local BClot3 = Instance.new("Weld",BClot)
BClot3.Part0 = ST
BClot3.Part1 = BClot
BClot3.C0 = CFrame.new(-0.7,-2,0)*CFrame.Angles(0,0,0)
local LegA = Instance.new("Part",Stand)
LegA.BrickColor = BrickColor.new("Light brick yellow")
LegA.CanCollide = false
local LegA2 = Instance.new("SpecialMesh",LegA)
LegA2.MeshId = "rbxassetid://1412404633"
LegA2.Scale = Vector3.new(0.0098,0.01,0.01)
local LegA3 = Instance.new("Weld",LegA)
LegA3.Part0 = SLL
LegA3.Part1 = LegA
LegA3.C0 = CFrame.new(0,0,0)*CFrame.Angles(0.06,0,0)
local OtLegA = Instance.new("Part",Stand)
OtLegA.BrickColor = BrickColor.new("Light brick yellow")
OtLegA.CanCollide = false
local OtLegA2 = Instance.new("SpecialMesh",OtLegA)
OtLegA2.MeshId = "rbxassetid://1412404633"
OtLegA2.Scale = Vector3.new(0.010,0.010,0.010)
local OtLegA3 = Instance.new("Weld",OtLegA)
OtLegA3.Part0 = SRL
OtLegA3.Part1 = OtLegA
OtLegA3.C0 = CFrame.new(0,0,0)*CFrame.Angles(6.4,3.1,0)
local Shoulder = Instance.new("Part",Stand)
Shoulder.BrickColor = BrickColor.new("Light brick yellow")
Shoulder.CanCollide = false
local Shoulder2 = Instance.new("SpecialMesh",Shoulder)
Shoulder2.MeshId = "rbxassetid://1412255210"
Shoulder2.Scale = Vector3.new(0.01,0.01,0.01)
local Shoulder3 = Instance.new("Weld",Shoulder)
Shoulder3.Part0 = SRA
Shoulder3.Part1 = Shoulder
Shoulder3.C0 = CFrame.new(0.1,0.1,0)*CFrame.Angles(0,0,0)
local OtShoulder = Instance.new("Part",Stand)
OtShoulder.BrickColor = BrickColor.new("Light brick yellow")
OtShoulder.CanCollide = false
local OtShoulder2 = Instance.new("SpecialMesh",OtShoulder)
OtShoulder2.MeshId = "rbxassetid://1412255210"
OtShoulder2.Scale = Vector3.new(0.01,0.01,0.01)
local OtShoulder3 = Instance.new("Weld",OtShoulder)
OtShoulder3.Part0 = SLA
OtShoulder3.Part1 = OtShoulder
OtShoulder3.C0 = CFrame.new(-0.1,0.1,0)*CFrame.Angles(0,3.1,0)
local ArmsA = Instance.new("Part",Stand)
ArmsA.BrickColor = BrickColor.new("Sea green")
ArmsA.CanCollide = false
local ArmsA2 = Instance.new("SpecialMesh",ArmsA)
ArmsA2.MeshId = "rbxassetid://3429797627"
ArmsA2.Scale = Vector3.new(0.2,0.2,0.2)
local ArmsA3 = Instance.new("Weld",ArmsA)
ArmsA3.Part0 = SLA
ArmsA3.Part1 = ArmsA
ArmsA3.C0 = CFrame.new(-0.65,0.1,0)*CFrame.Angles(0,0,0)
local OtArmsA = Instance.new("Part",Stand)
OtArmsA.BrickColor = BrickColor.new("Sea green")
OtArmsA.CanCollide = false
local OtArmsA2 = Instance.new("SpecialMesh",OtArmsA)
OtArmsA2.MeshId = "rbxassetid://3429797627"
OtArmsA2.Scale = Vector3.new(0.2,0.2,0.2)
local OtArmsA3 = Instance.new("Weld",OtArmsA)
OtArmsA3.Part0 = SRA
OtArmsA3.Part1 = OtArmsA
OtArmsA3.C0 = CFrame.new(0.65,0.1,0)*CFrame.Angles(0,3,0)
local Abs = Instance.new("Part",Stand)
Abs.BrickColor = BrickColor.new("Light brick yellow")
Abs.CanCollide = false
local Abs2 = Instance.new("SpecialMesh",Abs)
Abs2.MeshId = "rbxassetid://958074736"
Abs2.Scale = Vector3.new(0.009,0.01,0.01)
local Abs3 = Instance.new("Weld",Abs)
Abs3.Part0 = ST
Abs3.Part1 = Abs
Abs3.C0 = CFrame.new(0,0.2,-0.5)*CFrame.Angles(-12.4,0,0)
Humanoid.Animator.Parent = nil
Character.Animate.Parent = nil
mas = Instance.new("Model",game:GetService("Lighting"))
WeldConstraint0 = Instance.new("WeldConstraint")
WeldConstraint1 = Instance.new("WeldConstraint")
WeldConstraint2 = Instance.new("WeldConstraint")
WeldConstraint3 = Instance.new("WeldConstraint")
WeldConstraint4 = Instance.new("WeldConstraint")
WeldConstraint5 = Instance.new("WeldConstraint")
WeldConstraint6 = Instance.new("WeldConstraint")
WeldConstraint7 = Instance.new("WeldConstraint")
WeldConstraint8 = Instance.new("WeldConstraint")
WeldConstraint9 = Instance.new("WeldConstraint")
WeldConstraint10 = Instance.new("WeldConstraint")
WeldConstraint11 = Instance.new("WeldConstraint")
WeldConstraint12 = Instance.new("WeldConstraint")
WeldConstraint13 = Instance.new("WeldConstraint")
Part14 = Instance.new("Part")
Part15 = Instance.new("Part")
WeldConstraint16 = Instance.new("WeldConstraint")
WeldConstraint17 = Instance.new("WeldConstraint")
WeldConstraint18 = Instance.new("WeldConstraint")
WeldConstraint19 = Instance.new("WeldConstraint")
WeldConstraint20 = Instance.new("WeldConstraint")
WeldConstraint21 = Instance.new("WeldConstraint")
WeldConstraint22 = Instance.new("WeldConstraint")
WeldConstraint23 = Instance.new("WeldConstraint")
WeldConstraint24 = Instance.new("WeldConstraint")
WeldConstraint25 = Instance.new("WeldConstraint")
WeldConstraint26 = Instance.new("WeldConstraint")
WeldConstraint27 = Instance.new("WeldConstraint")
WeldConstraint28 = Instance.new("WeldConstraint")
WeldConstraint29 = Instance.new("WeldConstraint")
Part30 = Instance.new("Part")
Part31 = Instance.new("Part")
Part32 = Instance.new("Part")
Part33 = Instance.new("Part")
Part34 = Instance.new("Part")
Part35 = Instance.new("Part")
Part36 = Instance.new("Part")
Part37 = Instance.new("Part")
Part38 = Instance.new("Part")
Part39 = Instance.new("Part")
Part40 = Instance.new("Part")
Part41 = Instance.new("Part")
Part42 = Instance.new("Part")
WeldConstraint20.Parent = Part15
WeldConstraint20.Part0 = Part15
WeldConstraint20.Part1 = Part33
WeldConstraint22.Parent = Part15
WeldConstraint22.Part0 = Part15
WeldConstraint22.Part1 = Part35
WeldConstraint21.Parent = Part15
WeldConstraint21.Part0 = Part15
WeldConstraint21.Part1 = Part34
WeldConstraint23.Parent = Part15
WeldConstraint23.Part0 = Part15
WeldConstraint23.Part1 = Part36
WeldConstraint24.Parent = Part15
WeldConstraint24.Part0 = Part15
WeldConstraint24.Part1 = Part37
WeldConstraint25.Parent = Part15
WeldConstraint25.Part0 = Part15
WeldConstraint25.Part1 = Part38
WeldConstraint26.Parent = Part15
WeldConstraint26.Part0 = Part15
WeldConstraint26.Part1 = Part39
WeldConstraint27.Parent = Part15
WeldConstraint27.Part0 = Part15
WeldConstraint27.Part1 = Part40
WeldConstraint29.Parent = Part15
WeldConstraint29.Part0 = Part15
WeldConstraint29.Part1 = Part42
WeldConstraint28.Parent = Part15
WeldConstraint28.Part0 = Part15
WeldConstraint28.Part1 = Part41
WeldConstraint16.Parent = Part15
WeldConstraint16.Part0 = Part15
WeldConstraint16.Part1 = Part14
WeldConstraint17.Parent = Part15
WeldConstraint17.Part0 = Part15
WeldConstraint17.Part1 = Part30
WeldConstraint18.Parent = Part15
WeldConstraint18.Part0 = Part15
WeldConstraint18.Part1 = Part31
WeldConstraint19.Parent = Part15
WeldConstraint19.Part0 = Part15
WeldConstraint19.Part1 = Part32
Part14.Name = "Glove"
Part14.Parent = mas
Part14.CFrame = CFrame.new(-5.02166224, 2.51579881, -1.10017455, -0.999604464, 0, 0.0281260125, 0, 1, 0, -0.0281260125, 0, -0.999604464)
Part14.Orientation = Vector3.new(0, 178.389999, 0)
Part14.Position = Vector3.new(-5.02166224, 2.51579881, -1.10017455)
Part14.Rotation = Vector3.new(-180, 1.61000001, -180)
Part14.Color = Color3.new(0.972549, 0.972549, 0.972549)
Part14.Size = Vector3.new(0.830001354, 1.06999958, 1.04000032)
Part14.BottomSurface = Enum.SurfaceType.Smooth
Part14.BrickColor = BrickColor.new("Light brick yellow")
Part14.CanCollide = false
Part14.Material = Enum.Material.SmoothPlastic
Part14.TopSurface = Enum.SurfaceType.Smooth
Part14.brickColor = BrickColor.new("Light brick yellow")
Part15.Name = "LeftHandle"
Part15.Parent = mas
Part15.CFrame = CFrame.new(-5.38319588, 3.51649904, -1.08419061, -0.999990106, 0, 0.00455299765, 0, 1, 0, -0.00455299765, 0, -0.999990106)
Part15.Orientation = Vector3.new(0, 179.73999, 0)
Part15.Position = Vector3.new(-5.38319588, 3.51649904, -1.08419061)
Part15.Rotation = Vector3.new(-180, 0.25999999, -180)
Part15.Color = Color3.new(1, 1, 0)
Part15.Size = Vector3.new(0.211860612, 0.211860612, 0.211860612)
Part15.BottomSurface = Enum.SurfaceType.Smooth
Part15.BrickColor = BrickColor.new("Light brick yellow")
Part15.CanCollide = false
Part15.Material = Enum.Material.SmoothPlastic
Part15.TopSurface = Enum.SurfaceType.Smooth
Part15.brickColor = BrickColor.new("Light brick yellow")
Part15.Shape = Enum.PartType.Ball
WeldConstraint16.Parent = Part15
WeldConstraint16.Part0 = Part15
WeldConstraint16.Part1 = Part14
WeldConstraint17.Parent = Part15
WeldConstraint17.Part0 = Part15
WeldConstraint17.Part1 = Part30
WeldConstraint18.Parent = Part15
WeldConstraint18.Part0 = Part15
WeldConstraint18.Part1 = Part31
WeldConstraint19.Parent = Part15
WeldConstraint19.Part0 = Part15
WeldConstraint19.Part1 = Part32
WeldConstraint20.Parent = Part15
WeldConstraint20.Part0 = Part15
WeldConstraint20.Part1 = Part33
WeldConstraint21.Parent = Part15
WeldConstraint21.Part0 = Part15
WeldConstraint21.Part1 = Part34
WeldConstraint22.Parent = Part15
WeldConstraint22.Part0 = Part15
WeldConstraint22.Part1 = Part35
WeldConstraint23.Parent = Part15
WeldConstraint23.Part0 = Part15
WeldConstraint23.Part1 = Part36
WeldConstraint24.Parent = Part15
WeldConstraint24.Part0 = Part15
WeldConstraint24.Part1 = Part37
WeldConstraint25.Parent = Part15
WeldConstraint25.Part0 = Part15
WeldConstraint25.Part1 = Part38
WeldConstraint26.Parent = Part15
WeldConstraint26.Part0 = Part15
WeldConstraint26.Part1 = Part39
WeldConstraint27.Parent = Part15
WeldConstraint27.Part0 = Part15
WeldConstraint27.Part1 = Part40
WeldConstraint28.Parent = Part15
WeldConstraint28.Part0 = Part15
WeldConstraint28.Part1 = Part41
WeldConstraint29.Parent = Part15
WeldConstraint29.Part0 = Part15
WeldConstraint29.Part1 = Part42
Part30.Parent = mas
Part30.CFrame = CFrame.new(-5.44359446, 2.70850396, -0.860742211, -0.999606609, 0, 0.0281260796, 0, 1, 0, -0.0281260796, 0, -0.999606609)
Part30.Orientation = Vector3.new(0, 178.389999, 0)
Part30.Position = Vector3.new(-5.44359446, 2.70850396, -0.860742211)
Part30.Rotation = Vector3.new(-180, 1.61000001, -180)
Part30.Color = Color3.new(1, 1, 0)
Part30.Size = Vector3.new(0.161860615, 0.161860615, 0.161860615)
Part30.BottomSurface = Enum.SurfaceType.Smooth
Part30.BrickColor = BrickColor.new("Light brick yellow")
Part30.CanCollide = false
Part30.Material = Enum.Material.SmoothPlastic
Part30.TopSurface = Enum.SurfaceType.Smooth
Part30.brickColor = BrickColor.new("Light brick yellow")
Part30.Shape = Enum.PartType.Ball
Part31.Parent = mas
Part31.CFrame = CFrame.new(-5.43280172, 2.54659009, -1.24430549, -0.999606609, 0, 0.0281260796, 0, 1, 0, -0.0281260796, 0, -0.999606609)
Part31.Orientation = Vector3.new(0, 178.389999, 0)
Part31.Position = Vector3.new(-5.43280172, 2.54659009, -1.24430549)
Part31.Rotation = Vector3.new(-180, 1.61000001, -180)
Part31.Color = Color3.new(1, 1, 0)
Part31.Size = Vector3.new(0.161860615, 0.161860615, 0.161860615)
Part31.BottomSurface = Enum.SurfaceType.Smooth
Part31.BrickColor = BrickColor.new("Bright yellow")
Part31.CanCollide = false
Part31.Material = Enum.Material.SmoothPlastic
Part31.TopSurface = Enum.SurfaceType.Smooth
Part31.brickColor = BrickColor.new("New Yeller")
Part31.Shape = Enum.PartType.Ball
Part32.Parent = mas
Part32.CFrame = CFrame.new(-5.43926716, 2.70850396, -1.01440942, -0.999606609, 0, 0.0281260796, 0, 1, 0, -0.0281260796, 0, -0.999606609)
Part32.Orientation = Vector3.new(0, 178.389999, 0)
Part32.Position = Vector3.new(-5.43926716, 2.70850396, -1.01440942)
Part32.Rotation = Vector3.new(-180, 1.61000001, -180)
Part32.Color = Color3.new(1, 1, 0)
Part32.Size = Vector3.new(0.161860615, 0.161860615, 0.161860615)
Part32.BottomSurface = Enum.SurfaceType.Smooth
Part32.BrickColor = BrickColor.new("Light brick yellow")
Part32.CanCollide = false
Part32.Material = Enum.Material.SmoothPlastic
Part32.TopSurface = Enum.SurfaceType.Smooth
Part32.brickColor = BrickColor.new("Light brick yellow")
Part32.Shape = Enum.PartType.Ball
Part33.Parent = mas
Part33.CFrame = CFrame.new(-5.43478155, 2.70850396, -1.17381823, -0.999606609, 0, 0.0281260796, 0, 1, 0, -0.0281260796, 0, -0.999606609)
Part33.Orientation = Vector3.new(0, 178.389999, 0)
Part33.Position = Vector3.new(-5.43478155, 2.70850396, -1.17381823)
Part33.Rotation = Vector3.new(-180, 1.61000001, -180)
Part33.Color = Color3.new(1, 1, 0)
Part33.Size = Vector3.new(0.161860615, 0.161860615, 0.161860615)
Part33.BottomSurface = Enum.SurfaceType.Smooth
Part33.BrickColor = BrickColor.new("Light brick yellow")
Part33.CanCollide = false
Part33.Material = Enum.Material.SmoothPlastic
Part33.TopSurface = Enum.SurfaceType.Smooth
Part33.brickColor = BrickColor.new("Light brick yellow")
Part33.Shape = Enum.PartType.Ball
Part34.Parent = mas
Part34.CFrame = CFrame.new(-5.43068886, 2.70850396, -1.31938517, -0.999606609, 0, 0.0281260796, 0, 1, 0, -0.0281260796, 0, -0.999606609)
Part34.Orientation = Vector3.new(0, 178.389999, 0)
Part34.Position = Vector3.new(-5.43068886, 2.70850396, -1.31938517)
Part34.Rotation = Vector3.new(-180, 1.61000001, -180)
Part34.Color = Color3.new(1, 1, 0)
Part34.Size = Vector3.new(0.161860615, 0.161860615, 0.161860615)
Part34.BottomSurface = Enum.SurfaceType.Smooth
Part34.BrickColor = BrickColor.new("Light brick yellow")
Part34.CanCollide = false
Part34.Material = Enum.Material.SmoothPlastic
Part34.TopSurface = Enum.SurfaceType.Smooth
Part34.brickColor = BrickColor.new("Light brick yellow")
Part34.Shape = Enum.PartType.Ball
Part35.Parent = mas
Part35.CFrame = CFrame.new(-5.43728685, 2.54659009, -1.0848968, -0.999606609, 0, 0.0281260796, 0, 1, 0, -0.0281260796, 0, -0.999606609)
Part35.Orientation = Vector3.new(0, 178.389999, 0)
Part35.Position = Vector3.new(-5.43728685, 2.54659009, -1.0848968)
Part35.Rotation = Vector3.new(-180, 1.61000001, -180)
Part35.Color = Color3.new(1, 1, 0)
Part35.Size = Vector3.new(0.161860615, 0.161860615, 0.161860615)
Part35.BottomSurface = Enum.SurfaceType.Smooth
Part35.BrickColor = BrickColor.new("Light brick yellow")
Part35.CanCollide = false
Part35.Material = Enum.Material.SmoothPlastic
Part35.TopSurface = Enum.SurfaceType.Smooth
Part35.brickColor = BrickColor.new("New Yeller")
Part35.Shape = Enum.PartType.Ball
Part36.Parent = mas
Part36.CFrame = CFrame.new(-5.44160986, 2.54659009, -0.931219518, -0.999606609, 0, 0.0281260796, 0, 1, 0, -0.0281260796, 0, -0.999606609)
Part36.Orientation = Vector3.new(0, 178.389999, 0)
Part36.Position = Vector3.new(-5.44160986, 2.54659009, -0.931219518)
Part36.Rotation = Vector3.new(-180, 1.61000001, -180)
Part36.Color = Color3.new(1, 1, 0)
Part36.Size = Vector3.new(0.161860615, 0.161860615, 0.161860615)
Part36.BottomSurface = Enum.SurfaceType.Smooth
Part36.BrickColor = BrickColor.new("Light brick yellow")
Part36.CanCollide = false
Part36.Material = Enum.Material.SmoothPlastic
Part36.TopSurface = Enum.SurfaceType.Smooth
Part36.brickColor = BrickColor.new("Light brick yellow")
Part36.Shape = Enum.PartType.Ball
Part37.Parent = mas
Part37.CFrame = CFrame.new(-5.4347682, 2.38718915, -1.17450416, -0.999606609, 0, 0.0281260796, 0, 1, 0, -0.0281260796, 0, -0.999606609)
Part37.Orientation = Vector3.new(0, 178.389999, 0)
Part37.Position = Vector3.new(-5.4347682, 2.38718915, -1.17450416)
Part37.Rotation = Vector3.new(-180, 1.61000001, -180)
Part37.Color = Color3.new(1, 1, 0)
Part37.Size = Vector3.new(0.161860615, 0.161860615, 0.161860615)
Part37.BottomSurface = Enum.SurfaceType.Smooth
Part37.BrickColor = BrickColor.new("Light brick yellow")
Part37.CanCollide = false
Part37.Material = Enum.Material.SmoothPlastic
Part37.TopSurface = Enum.SurfaceType.Smooth
Part37.brickColor = BrickColor.new("Light brick yellow")
Part37.Shape = Enum.PartType.Ball
Part38.Parent = mas
Part38.CFrame = CFrame.new(-5.43925047, 2.38718915, -1.01509559, -0.999606609, 0, 0.0281260796, 0, 1, 0, -0.0281260796, 0, -0.999606609)
Part38.Orientation = Vector3.new(0, 178.389999, 0)
Part38.Position = Vector3.new(-5.43925047, 2.38718915, -1.01509559)
Part38.Rotation = Vector3.new(-180, 1.61000001, -180)
Part38.Color = Color3.new(1, 1, 0)
Part38.Size = Vector3.new(0.161860615, 0.161860615, 0.161860615)
Part38.BottomSurface = Enum.SurfaceType.Smooth
Part38.BrickColor = BrickColor.new("Light brick yellow")
Part38.CanCollide = false
Part38.Material = Enum.Material.SmoothPlastic
Part38.TopSurface = Enum.SurfaceType.Smooth
Part38.brickColor = BrickColor.new("Light brick yellow")
Part38.Shape = Enum.PartType.Ball
Part39.Parent = mas
Part39.CFrame = CFrame.new(-5.43697119, 2.22288823, -1.09609091, -0.999606609, 0, 0.0281260796, 0, 1, 0, -0.0281260796, 0, -0.999606609)
Part39.Orientation = Vector3.new(0, 178.389999, 0)
Part39.Position = Vector3.new(-5.43697119, 2.22288823, -1.09609091)
Part39.Rotation = Vector3.new(-180, 1.61000001, -180)
Part39.Color = Color3.new(1, 1, 0)
Part39.Size = Vector3.new(0.161860615, 0.161860615, 0.161860615)
Part39.BottomSurface = Enum.SurfaceType.Smooth
Part39.BrickColor = BrickColor.new("Bright yellow")
Part39.CanCollide = false
Part39.Material = Enum.Material.SmoothPlastic
Part39.TopSurface = Enum.SurfaceType.Smooth
Part39.brickColor = BrickColor.new("Light brick yellow")
Part39.Shape = Enum.PartType.Ball
Part40.Parent = mas
Part40.CFrame = CFrame.new(-5.03661871, 2.2724297, -1.10532296, -0.999606609, 0, 0.0281260796, 0, 1, 0, -0.0281260796, 0, -0.999606609)
Part40.Orientation = Vector3.new(0, 178.389999, 0)
Part40.Position = Vector3.new(-5.03661871, 2.2724297, -1.10532296)
Part40.Rotation = Vector3.new(-180, 1.61000001, -180)
Part40.Color = Color3.new(1, 1, 0)
Part40.Size = Vector3.new(0.830001056, 0.100000069, 1.04999971)
Part40.BottomSurface = Enum.SurfaceType.Smooth
Part40.BrickColor = BrickColor.new("Light brick yellow")
Part40.CanCollide = false
Part40.Material = Enum.Material.SmoothPlastic
Part40.TopSurface = Enum.SurfaceType.Smooth
Part40.brickColor = BrickColor.new("Light brick yellow")
Part41.Parent = mas
Part41.CFrame = CFrame.new(-5.03661871, 2.6140368, -1.10532296, -0.999606609, 0, 0.0281260796, 0, 1, 0, -0.0281260796, 0, -0.999606609)
Part41.Orientation = Vector3.new(0, 178.389999, 0)
Part41.Position = Vector3.new(-5.03661871, 2.6140368, -1.10532296)
Part41.Rotation = Vector3.new(-180, 1.61000001, -180)
Part41.Color = Color3.new(1, 1, 0)
Part41.Size = Vector3.new(0.830001056, 0.100000069, 1.04999971)
Part41.BottomSurface = Enum.SurfaceType.Smooth
Part41.BrickColor = BrickColor.new("Light brick yellow")
Part41.CanCollide = false
Part41.Material = Enum.Material.SmoothPlastic
Part41.TopSurface = Enum.SurfaceType.Smooth
Part41.brickColor = BrickColor.new("Light brick yellow")
Part42.Parent = mas
Part42.CFrame = CFrame.new(-4.98317862, 3.50830507, -1.10285795, -0.999992013, 0, 0.00455300882, 0, 1, 0, -0.00455300882, 0, -0.999992013)
Part42.Orientation = Vector3.new(0, 179.73999, 0)
Part42.Position = Vector3.new(-4.98317862, 3.50830507, -1.10285795)
Part42.Rotation = Vector3.new(-180, 0.25999999, -180)
Part42.Color = Color3.new(0.972549, 0.972549, 0.972549)
Part42.Size = Vector3.new(0.830001056, 0.110000081, 1.04999971)
Part42.BottomSurface = Enum.SurfaceType.Smooth
Part42.BrickColor = BrickColor.new("Light brick yellow")
Part42.CanCollide = false
Part42.Material = Enum.Material.SmoothPlastic
Part42.TopSurface = Enum.SurfaceType.Smooth
Part42.brickColor = BrickColor.new("Light brick yellow")
for i,v in pairs(mas:GetChildren()) do
    v.Parent = game:GetService("Players").LocalPlayer.Character.Stand
    pcall(function() v:MakeJoints() end)
end
local Wld = Instance.new("Weld",Part15)
Wld.Part0 = SLA
Wld.Part1 = Part15
Wld.C0 = CFrame.new(-0.49,0.55,0.03)*CFrame.Angles(0,3.15,0)
mas2 = Instance.new("Model",game:GetService("Lighting"))
WeldConstraint0 = Instance.new("WeldConstraint")
WeldConstraint1 = Instance.new("WeldConstraint")
WeldConstraint2 = Instance.new("WeldConstraint")
WeldConstraint3 = Instance.new("WeldConstraint")
WeldConstraint4 = Instance.new("WeldConstraint")
WeldConstraint5 = Instance.new("WeldConstraint")
WeldConstraint6 = Instance.new("WeldConstraint")
WeldConstraint7 = Instance.new("WeldConstraint")
WeldConstraint8 = Instance.new("WeldConstraint")
WeldConstraint9 = Instance.new("WeldConstraint")
WeldConstraint10 = Instance.new("WeldConstraint")
WeldConstraint11 = Instance.new("WeldConstraint")
WeldConstraint12 = Instance.new("WeldConstraint")
WeldConstraint13 = Instance.new("WeldConstraint")
Part14 = Instance.new("Part")
Part15 = Instance.new("Part")
WeldConstraint16 = Instance.new("WeldConstraint")
WeldConstraint17 = Instance.new("WeldConstraint")
WeldConstraint18 = Instance.new("WeldConstraint")
WeldConstraint19 = Instance.new("WeldConstraint")
WeldConstraint20 = Instance.new("WeldConstraint")
WeldConstraint21 = Instance.new("WeldConstraint")
WeldConstraint22 = Instance.new("WeldConstraint")
WeldConstraint23 = Instance.new("WeldConstraint")
WeldConstraint24 = Instance.new("WeldConstraint")
WeldConstraint25 = Instance.new("WeldConstraint")
WeldConstraint26 = Instance.new("WeldConstraint")
WeldConstraint27 = Instance.new("WeldConstraint")
WeldConstraint28 = Instance.new("WeldConstraint")
WeldConstraint29 = Instance.new("WeldConstraint")
Part30 = Instance.new("Part")
Part31 = Instance.new("Part")
Part32 = Instance.new("Part")
Part33 = Instance.new("Part")
Part34 = Instance.new("Part")
Part35 = Instance.new("Part")
Part36 = Instance.new("Part")
Part37 = Instance.new("Part")
Part38 = Instance.new("Part")
Part39 = Instance.new("Part")
Part40 = Instance.new("Part")
Part41 = Instance.new("Part")
Part42 = Instance.new("Part")
WeldConstraint20.Parent = Part15
WeldConstraint20.Part0 = Part15
WeldConstraint20.Part1 = Part33
WeldConstraint22.Parent = Part15
WeldConstraint22.Part0 = Part15
WeldConstraint22.Part1 = Part35
WeldConstraint21.Parent = Part15
WeldConstraint21.Part0 = Part15
WeldConstraint21.Part1 = Part34
WeldConstraint23.Parent = Part15
WeldConstraint23.Part0 = Part15
WeldConstraint23.Part1 = Part36
WeldConstraint24.Parent = Part15
WeldConstraint24.Part0 = Part15
WeldConstraint24.Part1 = Part37
WeldConstraint25.Parent = Part15
WeldConstraint25.Part0 = Part15
WeldConstraint25.Part1 = Part38
WeldConstraint26.Parent = Part15
WeldConstraint26.Part0 = Part15
WeldConstraint26.Part1 = Part39
WeldConstraint27.Parent = Part15
WeldConstraint27.Part0 = Part15
WeldConstraint27.Part1 = Part40
WeldConstraint29.Parent = Part15
WeldConstraint29.Part0 = Part15
WeldConstraint29.Part1 = Part42
WeldConstraint28.Parent = Part15
WeldConstraint28.Part0 = Part15
WeldConstraint28.Part1 = Part41
WeldConstraint16.Parent = Part15
WeldConstraint16.Part0 = Part15
WeldConstraint16.Part1 = Part14
WeldConstraint17.Parent = Part15
WeldConstraint17.Part0 = Part15
WeldConstraint17.Part1 = Part30
WeldConstraint18.Parent = Part15
WeldConstraint18.Part0 = Part15
WeldConstraint18.Part1 = Part31
WeldConstraint19.Parent = Part15
WeldConstraint19.Part0 = Part15
WeldConstraint19.Part1 = Part32
Part14.Name = "Glove"
Part14.Parent = mas2
Part14.CFrame = CFrame.new(-5.02166224, 2.51579881, -1.10017455, -0.999604464, 0, 0.0281260125, 0, 1, 0, -0.0281260125, 0, -0.999604464)
Part14.Orientation = Vector3.new(0, 178.389999, 0)
Part14.Position = Vector3.new(-5.02166224, 2.51579881, -1.10017455)
Part14.Rotation = Vector3.new(-180, 1.61000001, -180)
Part14.Color = Color3.new(0.972549, 0.972549, 0.972549)
Part14.Size = Vector3.new(0.830001354, 1.06999958, 1.04000032)
Part14.BottomSurface = Enum.SurfaceType.Smooth
Part14.BrickColor = BrickColor.new("Light brick yellow")
Part14.CanCollide = false
Part14.Material = Enum.Material.SmoothPlastic
Part14.TopSurface = Enum.SurfaceType.Smooth
Part14.brickColor = BrickColor.new("Light brick yellow")
Part15.Name = "LeftHandle"
Part15.Parent = mas2
Part15.CFrame = CFrame.new(-5.38319588, 3.51649904, -1.08419061, -0.999990106, 0, 0.00455299765, 0, 1, 0, -0.00455299765, 0, -0.999990106)
Part15.Orientation = Vector3.new(0, 179.73999, 0)
Part15.Position = Vector3.new(-5.38319588, 3.51649904, -1.08419061)
Part15.Rotation = Vector3.new(-180, 0.25999999, -180)
Part15.Color = Color3.new(1, 1, 0)
Part15.Size = Vector3.new(0.211860612, 0.211860612, 0.211860612)
Part15.BottomSurface = Enum.SurfaceType.Smooth
Part15.BrickColor = BrickColor.new("Light brick yellow")
Part15.CanCollide = false
Part15.Material = Enum.Material.SmoothPlastic
Part15.TopSurface = Enum.SurfaceType.Smooth
Part15.brickColor = BrickColor.new("Light brick yellow")
Part15.Shape = Enum.PartType.Ball
WeldConstraint16.Parent = Part15
WeldConstraint16.Part0 = Part15
WeldConstraint16.Part1 = Part14
WeldConstraint17.Parent = Part15
WeldConstraint17.Part0 = Part15
WeldConstraint17.Part1 = Part30
WeldConstraint18.Parent = Part15
WeldConstraint18.Part0 = Part15
WeldConstraint18.Part1 = Part31
WeldConstraint19.Parent = Part15
WeldConstraint19.Part0 = Part15
WeldConstraint19.Part1 = Part32
WeldConstraint20.Parent = Part15
WeldConstraint20.Part0 = Part15
WeldConstraint20.Part1 = Part33
WeldConstraint21.Parent = Part15
WeldConstraint21.Part0 = Part15
WeldConstraint21.Part1 = Part34
WeldConstraint22.Parent = Part15
WeldConstraint22.Part0 = Part15
WeldConstraint22.Part1 = Part35
WeldConstraint23.Parent = Part15
WeldConstraint23.Part0 = Part15
WeldConstraint23.Part1 = Part36
WeldConstraint24.Parent = Part15
WeldConstraint24.Part0 = Part15
WeldConstraint24.Part1 = Part37
WeldConstraint25.Parent = Part15
WeldConstraint25.Part0 = Part15
WeldConstraint25.Part1 = Part38
WeldConstraint26.Parent = Part15
WeldConstraint26.Part0 = Part15
WeldConstraint26.Part1 = Part39
WeldConstraint27.Parent = Part15
WeldConstraint27.Part0 = Part15
WeldConstraint27.Part1 = Part40
WeldConstraint28.Parent = Part15
WeldConstraint28.Part0 = Part15
WeldConstraint28.Part1 = Part41
WeldConstraint29.Parent = Part15
WeldConstraint29.Part0 = Part15
WeldConstraint29.Part1 = Part42
Part30.Parent = mas2
Part30.CFrame = CFrame.new(-5.44359446, 2.70850396, -0.860742211, -0.999606609, 0, 0.0281260796, 0, 1, 0, -0.0281260796, 0, -0.999606609)
Part30.Orientation = Vector3.new(0, 178.389999, 0)
Part30.Position = Vector3.new(-5.44359446, 2.70850396, -0.860742211)
Part30.Rotation = Vector3.new(-180, 1.61000001, -180)
Part30.Color = Color3.new(1, 1, 0)
Part30.Size = Vector3.new(0.161860615, 0.161860615, 0.161860615)
Part30.BottomSurface = Enum.SurfaceType.Smooth
Part30.BrickColor = BrickColor.new("Light brick yellow")
Part30.CanCollide = false
Part30.Material = Enum.Material.SmoothPlastic
Part30.TopSurface = Enum.SurfaceType.Smooth
Part30.brickColor = BrickColor.new("Light brick yellow")
Part30.Shape = Enum.PartType.Ball
Part31.Parent = mas2
Part31.CFrame = CFrame.new(-5.43280172, 2.54659009, -1.24430549, -0.999606609, 0, 0.0281260796, 0, 1, 0, -0.0281260796, 0, -0.999606609)
Part31.Orientation = Vector3.new(0, 178.389999, 0)
Part31.Position = Vector3.new(-5.43280172, 2.54659009, -1.24430549)
Part31.Rotation = Vector3.new(-180, 1.61000001, -180)
Part31.Color = Color3.new(1, 1, 0)
Part31.Size = Vector3.new(0.161860615, 0.161860615, 0.161860615)
Part31.BottomSurface = Enum.SurfaceType.Smooth
Part31.BrickColor = BrickColor.new("Light brick yellow")
Part31.CanCollide = false
Part31.Material = Enum.Material.SmoothPlastic
Part31.TopSurface = Enum.SurfaceType.Smooth
Part31.brickColor = BrickColor.new("Light brick yellow")
Part31.Shape = Enum.PartType.Ball
Part32.Parent = mas2
Part32.CFrame = CFrame.new(-5.43926716, 2.70850396, -1.01440942, -0.999606609, 0, 0.0281260796, 0, 1, 0, -0.0281260796, 0, -0.999606609)
Part32.Orientation = Vector3.new(0, 178.389999, 0)
Part32.Position = Vector3.new(-5.43926716, 2.70850396, -1.01440942)
Part32.Rotation = Vector3.new(-180, 1.61000001, -180)
Part32.Color = Color3.new(1, 1, 0)
Part32.Size = Vector3.new(0.161860615, 0.161860615, 0.161860615)
Part32.BottomSurface = Enum.SurfaceType.Smooth
Part32.BrickColor = BrickColor.new("Light brick yellow")
Part32.CanCollide = false
Part32.Material = Enum.Material.SmoothPlastic
Part32.TopSurface = Enum.SurfaceType.Smooth
Part32.brickColor = BrickColor.new("Light brick yellow")
Part32.Shape = Enum.PartType.Ball
Part33.Parent = mas2
Part33.CFrame = CFrame.new(-5.43478155, 2.70850396, -1.17381823, -0.999606609, 0, 0.0281260796, 0, 1, 0, -0.0281260796, 0, -0.999606609)
Part33.Orientation = Vector3.new(0, 178.389999, 0)
Part33.Position = Vector3.new(-5.43478155, 2.70850396, -1.17381823)
Part33.Rotation = Vector3.new(-180, 1.61000001, -180)
Part33.Color = Color3.new(1, 1, 0)
Part33.Size = Vector3.new(0.161860615, 0.161860615, 0.161860615)
Part33.BottomSurface = Enum.SurfaceType.Smooth
Part33.BrickColor = BrickColor.new("Light brick yellow")
Part33.CanCollide = false
Part33.Material = Enum.Material.SmoothPlastic
Part33.TopSurface = Enum.SurfaceType.Smooth
Part33.brickColor = BrickColor.new("Light brick yellow")
Part33.Shape = Enum.PartType.Ball
Part34.Parent = mas2
Part34.CFrame = CFrame.new(-5.43068886, 2.70850396, -1.31938517, -0.999606609, 0, 0.0281260796, 0, 1, 0, -0.0281260796, 0, -0.999606609)
Part34.Orientation = Vector3.new(0, 178.389999, 0)
Part34.Position = Vector3.new(-5.43068886, 2.70850396, -1.31938517)
Part34.Rotation = Vector3.new(-180, 1.61000001, -180)
Part34.Color = Color3.new(1, 1, 0)
Part34.Size = Vector3.new(0.161860615, 0.161860615, 0.161860615)
Part34.BottomSurface = Enum.SurfaceType.Smooth
Part34.BrickColor = BrickColor.new("Light brick yellow")
Part34.CanCollide = false
Part34.Material = Enum.Material.SmoothPlastic
Part34.TopSurface = Enum.SurfaceType.Smooth
Part34.brickColor = BrickColor.new("Light brick yellow")
Part34.Shape = Enum.PartType.Ball
Part35.Parent = mas2
Part35.CFrame = CFrame.new(-5.43728685, 2.54659009, -1.0848968, -0.999606609, 0, 0.0281260796, 0, 1, 0, -0.0281260796, 0, -0.999606609)
Part35.Orientation = Vector3.new(0, 178.389999, 0)
Part35.Position = Vector3.new(-5.43728685, 2.54659009, -1.0848968)
Part35.Rotation = Vector3.new(-180, 1.61000001, -180)
Part35.Color = Color3.new(1, 1, 0)
Part35.Size = Vector3.new(0.161860615, 0.161860615, 0.161860615)
Part35.BottomSurface = Enum.SurfaceType.Smooth
Part35.BrickColor = BrickColor.new("Light brick yellow")
Part35.CanCollide = false
Part35.Material = Enum.Material.SmoothPlastic
Part35.TopSurface = Enum.SurfaceType.Smooth
Part35.brickColor = BrickColor.new("Light brick yellow")
Part35.Shape = Enum.PartType.Ball
Part36.Parent = mas2
Part36.CFrame = CFrame.new(-5.44160986, 2.54659009, -0.931219518, -0.999606609, 0, 0.0281260796, 0, 1, 0, -0.0281260796, 0, -0.999606609)
Part36.Orientation = Vector3.new(0, 178.389999, 0)
Part36.Position = Vector3.new(-5.44160986, 2.54659009, -0.931219518)
Part36.Rotation = Vector3.new(-180, 1.61000001, -180)
Part36.Color = Color3.new(1, 1, 0)
Part36.Size = Vector3.new(0.161860615, 0.161860615, 0.161860615)
Part36.BottomSurface = Enum.SurfaceType.Smooth
Part36.BrickColor = BrickColor.new("Light brick yellow")
Part36.CanCollide = false
Part36.Material = Enum.Material.SmoothPlastic
Part36.TopSurface = Enum.SurfaceType.Smooth
Part36.brickColor = BrickColor.new("Light brick yellow")
Part36.Shape = Enum.PartType.Ball
Part37.Parent = mas2
Part37.CFrame = CFrame.new(-5.4347682, 2.38718915, -1.17450416, -0.999606609, 0, 0.0281260796, 0, 1, 0, -0.0281260796, 0, -0.999606609)
Part37.Orientation = Vector3.new(0, 178.389999, 0)
Part37.Position = Vector3.new(-5.4347682, 2.38718915, -1.17450416)
Part37.Rotation = Vector3.new(-180, 1.61000001, -180)
Part37.Color = Color3.new(1, 1, 0)
Part37.Size = Vector3.new(0.161860615, 0.161860615, 0.161860615)
Part37.BottomSurface = Enum.SurfaceType.Smooth
Part37.BrickColor = BrickColor.new("Light brick yellow")
Part37.CanCollide = false
Part37.Material = Enum.Material.SmoothPlastic
Part37.TopSurface = Enum.SurfaceType.Smooth
Part37.brickColor = BrickColor.new("Light brick yellow")
Part37.Shape = Enum.PartType.Ball
Part38.Parent = mas2
Part38.CFrame = CFrame.new(-5.43925047, 2.38718915, -1.01509559, -0.999606609, 0, 0.0281260796, 0, 1, 0, -0.0281260796, 0, -0.999606609)
Part38.Orientation = Vector3.new(0, 178.389999, 0)
Part38.Position = Vector3.new(-5.43925047, 2.38718915, -1.01509559)
Part38.Rotation = Vector3.new(-180, 1.61000001, -180)
Part38.Color = Color3.new(1, 1, 0)
Part38.Size = Vector3.new(0.161860615, 0.161860615, 0.161860615)
Part38.BottomSurface = Enum.SurfaceType.Smooth
Part38.BrickColor = BrickColor.new("Light brick yellow")
Part38.CanCollide = false
Part38.Material = Enum.Material.SmoothPlastic
Part38.TopSurface = Enum.SurfaceType.Smooth
Part38.brickColor = BrickColor.new("Light brick yellow")
Part38.Shape = Enum.PartType.Ball
Part39.Parent = mas2
Part39.CFrame = CFrame.new(-5.43697119, 2.22288823, -1.09609091, -0.999606609, 0, 0.0281260796, 0, 1, 0, -0.0281260796, 0, -0.999606609)
Part39.Orientation = Vector3.new(0, 178.389999, 0)
Part39.Position = Vector3.new(-5.43697119, 2.22288823, -1.09609091)
Part39.Rotation = Vector3.new(-180, 1.61000001, -180)
Part39.Color = Color3.new(1, 1, 0)
Part39.Size = Vector3.new(0.161860615, 0.161860615, 0.161860615)
Part39.BottomSurface = Enum.SurfaceType.Smooth
Part39.BrickColor = BrickColor.new("Light brick yellow")
Part39.CanCollide = false
Part39.Material = Enum.Material.SmoothPlastic
Part39.TopSurface = Enum.SurfaceType.Smooth
Part39.brickColor = BrickColor.new("Light brick yellow")
Part39.Shape = Enum.PartType.Ball
Part40.Parent = mas2
Part40.CFrame = CFrame.new(-5.03661871, 2.2724297, -1.10532296, -0.999606609, 0, 0.0281260796, 0, 1, 0, -0.0281260796, 0, -0.999606609)
Part40.Orientation = Vector3.new(0, 178.389999, 0)
Part40.Position = Vector3.new(-5.03661871, 2.2724297, -1.10532296)
Part40.Rotation = Vector3.new(-180, 1.61000001, -180)
Part40.Color = Color3.new(1, 1, 0)
Part40.Size = Vector3.new(0.830001056, 0.100000069, 1.04999971)
Part40.BottomSurface = Enum.SurfaceType.Smooth
Part40.BrickColor = BrickColor.new("Light brick yellow")
Part40.CanCollide = false
Part40.Material = Enum.Material.SmoothPlastic
Part40.TopSurface = Enum.SurfaceType.Smooth
Part40.brickColor = BrickColor.new("Light brick yellow")
Part41.Parent = mas2
Part41.CFrame = CFrame.new(-5.03661871, 2.6140368, -1.10532296, -0.999606609, 0, 0.0281260796, 0, 1, 0, -0.0281260796, 0, -0.999606609)
Part41.Orientation = Vector3.new(0, 178.389999, 0)
Part41.Position = Vector3.new(-5.03661871, 2.6140368, -1.10532296)
Part41.Rotation = Vector3.new(-180, 1.61000001, -180)
Part41.Color = Color3.new(1, 1, 0)
Part41.Size = Vector3.new(0.830001056, 0.100000069, 1.04999971)
Part41.BottomSurface = Enum.SurfaceType.Smooth
Part41.BrickColor = BrickColor.new("Light brick yellow")
Part41.CanCollide = false
Part41.Material = Enum.Material.SmoothPlastic
Part41.TopSurface = Enum.SurfaceType.Smooth
Part41.brickColor = BrickColor.new("Light brick yellow")
Part42.Parent = mas2
Part42.CFrame = CFrame.new(-4.98317862, 3.50830507, -1.10285795, -0.999992013, 0, 0.00455300882, 0, 1, 0, -0.00455300882, 0, -0.999992013)
Part42.Orientation = Vector3.new(0, 179.73999, 0)
Part42.Position = Vector3.new(-4.98317862, 3.50830507, -1.10285795)
Part42.Rotation = Vector3.new(-180, 0.25999999, -180)
Part42.Color = Color3.new(0.972549, 0.972549, 0.972549)
Part42.Size = Vector3.new(0.830001056, 0.110000081, 1.04999971)
Part42.BottomSurface = Enum.SurfaceType.Smooth
Part42.BrickColor = BrickColor.new("Light brick yellow")
Part42.CanCollide = false
Part42.Material = Enum.Material.SmoothPlastic
Part42.TopSurface = Enum.SurfaceType.Smooth
Part42.brickColor = BrickColor.new("Bright yellow")
for i,v in pairs(mas2:GetChildren()) do
    v.Parent = game:GetService("Players").LocalPlayer.Character.Stand
    pcall(function() v:MakeJoints() end)
end
local Wld = Instance.new("Weld",Part15)
Wld.Part0 = SRA
Wld.Part1 = Part15
Wld.C0 = CFrame.new(0.49,0.55,-0.01)*CFrame.Angles(0,0,0)
for i,v in pairs(mas:children()) do
    if v:IsA("Part") then
        v.Transparency = 1
    end
end
for i,v in pairs(Character.Stand:children()) do
    if v:IsA("Part") then
        v.Transparency = 1
        Face.Transparency = 1
    end
end
local newMotor = function(part0, part1, c0, c1)
    local w = Create('Motor'){
        Parent = part0,
        Part0 = part0,
        Part1 = part1,
        C0 = c0,
        C1 = c1,
    }
    return w
end
function clerp(a, b, t)
    return a:lerp(b, t)
end
 
coroutine.resume(coroutine.create(function()
while true do
    Humanoid.MaxHealth = 100
                ST.Anchored = false
                SH.Anchored = false
                SRL.Anchored = false
                SLL.Anchored = false
                SRA.Anchored = false
                SLA.Anchored = false
    game:GetService("RunService").RenderStepped:wait()
end
end))
RootCF = CFrame.fromEulerAnglesXYZ(-1.57, 0, 3.14)
NeckCF = CFrame.new(0, 1, 0, -1, -0, -0, 0, 0, 1, 0, 1, 0)
 
local RW = newMotor(Torso, RightArm, CFrame.new(1.5, 0, 0), CFrame.new(0, 0, 0))
local LW = newMotor(Torso, LeftArm, CFrame.new(-1.5, 0, 0), CFrame.new(0, 0, 0))
local RH = newMotor(Torso, RightLeg, CFrame.new(.5, -2, 0), CFrame.new(0, 0, 0))
local LH = newMotor(Torso, LeftLeg, CFrame.new(-.5, -2, 0), CFrame.new(0, 0, 0))
RootJoint.C1 = CFrame.new(0, 0, 0)
RootJoint.C0 = CFrame.new(0, 0, 0)
Torso.Neck.C1 = CFrame.new(0, 0, 0)
Torso.Neck.C0 = CFrame.new(0, 1.5, 0)
 
local rarmc1 = RW.C1
local larmc1 = LW.C1
local rlegc1 = RH.C1
local llegc1 = LH.C1
 
local resetc1 = false
 
function PlayAnimationFromTable(table, speed, bool)
    RootJoint.C0 = clerp(RootJoint.C0, table[1], speed)
    Torso.Neck.C0 = clerp(Torso.Neck.C0, table[2], speed)
    RW.C0 = clerp(RW.C0, table[3], speed)
    LW.C0 = clerp(LW.C0, table[4], speed)
    RH.C0 = clerp(RH.C0, table[5], speed)
    LH.C0 = clerp(LH.C0, table[6], speed)
    if bool == true then
        if resetc1 == false then
            resetc1 = true
            RootJoint.C1 = RootJoint.C1
            Torso.Neck.C1 = Torso.Neck.C1
            RW.C1 = rarmc1
            LW.C1 = larmc1
            RH.C1 = rlegc1
            LH.C1 = llegc1
        end
    end
end
 
ArtificialHB = Create("BindableEvent", script){
    Parent = script,
    Name = "Heartbeat",
}
 
script:WaitForChild("Heartbeat")
 
frame = 1 / 30
tf = 0
allowframeloss = false
tossremainder = false
lastframe = tick()
script.Heartbeat:Fire()
 
game:GetService("RunService").Heartbeat:connect(function(s, p)
    tf = tf + s
    if tf >= frame then
        if allowframeloss then
            script.Heartbeat:Fire()
            lastframe = tick()
        else
            for i = 1, math.floor(tf / frame) do
                script.Heartbeat:Fire()
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
 
function swait(num)
    if num == 0 or num == nil then
        ArtificialHB.Event:wait()
    else
        for i = 0, num do
            ArtificialHB.Event:wait()
        end
    end
end
 
Mouse.KeyDown:connect(function(key)
    if key == "q" then
        if Change == false then
            Stand()
            Change = true
        elseif Change == true then
            UnStand()
            Change = false
        end
    end
end)
 
function Stand()
    if D == false then
        D = true
        Pause = true
        for i = 0,0.1,0.1 do
        swait()
        PlayAnimationFromTable({
         CFrame.new(0,0,0) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0),
         CFrame.new(0,1.5,0) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0),
         CFrame.new(1.5,0,0) * CFrame.new(0, 0, 0) * CFrame.Angles(0,0,0),
         CFrame.new(-1.5,0,0) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0),
         CFrame.new(0.5,-2,0) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0),
         CFrame.new(-0.5,-2,0) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0),
        }, .5, false)
        ST3.C0 = clerp(ST3.C0,CFrame.new(0,0,0)*CFrame.Angles(0,0,0),0.3)
        end
        coroutine.resume(coroutine.create(function()
        for i = 0,1.2,0.1 do
        swait()
        PlayAnimationFromTable({
         CFrame.new(0,0,0) * CFrame.new(0, 0, 0) * CFrame.Angles(0.2, 0.5, 0),
         CFrame.new(0,1.5,0) * CFrame.new(0, 0, 0) * CFrame.Angles(-0.1, -0.4, 0),
         CFrame.new(1.5,0.5,-0.5) * CFrame.new(0, 0, 0) * CFrame.Angles(1.45,0,0.7),
         CFrame.new(-1.5,0,0) * CFrame.new(0, 0, 0) * CFrame.Angles(-0.2, 0.2, 0),
         CFrame.new(0.6,-2.1,0) * CFrame.new(0, 0, 0) * CFrame.Angles(-0.2, -0.5, 0.1),
         CFrame.new(-0.6,-2,0) * CFrame.new(0, 0, 0) * CFrame.Angles(-0.2, 0.2, -0.1),
        }, .5, false)
        ST3.C0 = clerp(ST3.C0,CFrame.new(1,1.5,1.5)*CFrame.Angles(0,0,0),0.3)
        end
        Pause = false
        end))
        local Sound = Instance.new("Sound",ST)
        Sound.Pitch = 1
        Sound.Volume = 10
        Sound.Looped = false
        Sound.SoundId = "rbxassetid://3378937315"
        Sound:play()
        local Sound = Instance.new("Sound",ST)
        Sound.Pitch = 1
        Sound.Volume = 10
        Sound.Looped = false
        Sound.SoundId = "rbxassetid://3991855114"
        Sound:play()
chatfunc("Golden Experience Requiem!")
        coroutine.resume(coroutine.create(function()
        for i,v in pairs(mas:children()) do
            if v:IsA("Part") then
                coroutine.resume(coroutine.create(function()
                v.Transparency = v.Transparency - 0.1
                game:GetService("RunService").RenderStepped:wait() 
                end))
                v.Transparency = 1
            end
        end
        end))
        for i,v in pairs(Character.Stand:children()) do
            if v:IsA("Part") then
                coroutine.resume(coroutine.create(function()
                for i = 1,11 do
                v.Transparency = v.Transparency - 0.1
                Face.Transparency = Face.Transparency - 0.1
                game:GetService("RunService").RenderStepped:wait()
                end
                end))
            end
        end
   CFuncs = {
    Part = {
      Create = function(Parent, Material, Reflectance, Transparency, BColor, Name, Size)
        local Part = Create("Part")({
          Parent = Parent,
          Reflectance = Reflectance,
          Transparency = Transparency,
          CanCollide = false,
          Locked = true,
          BrickColor = BrickColor.new(tostring(BColor)),
          Name = Name,
          Size = Size,
          Material = Material
        })
        RemoveOutlines(Part)
        return Part
      end
    },
    Mesh = {
      Create = function(Mesh, Part, MeshType, MeshId, OffSet, Scale)
        local Msh = Create(Mesh)({
          Parent = Part,
          Offset = OffSet,
          Scale = Scale
        })
        if Mesh == "SpecialMesh" then
          Msh.MeshType = MeshType
          Msh.MeshId = MeshId
        end
        return Msh
      end
    },
    Weld = {
      Create = function(Parent, Part0, Part1, C0, C1)
        local Weld = Create("Weld")({
          Parent = Parent,
          Part0 = Part0,
          Part1 = Part1,
          C0 = C0,
          C1 = C1
        })
        return Weld
      end
    },
    Sound = {
      Create = function(id, par, vol, pit)
        local Sound = Create("Sound")({
          Volume = vol,
          Pitch = pit or 1,
          SoundId = "rbxassetid://" .. id,
          Parent = par or workspace
        })
        Sound:play()
        game:GetService("Debris"):AddItem(Sound, 130)
        return Sound
      end
    },
    Decal = {
      Create = function(Color, Texture, Transparency, Name, Parent)
        local Decal = Create("Decal")({
          Color3 = Color,
          Texture = "rbxassetid://" .. Texture,
          Transparency = Transparency,
          Name = Name,
          Parent = Parent
        })
        return Decal
      end
    },
    BillboardGui = {
      Create = function(Parent, Image, Position, Size)
        local BillPar = CFuncs.Part.Create(Parent, "SmoothPlastic", 0, 1, BrickColor.new("Black"), "BillboardGuiPart", Vector3.new(1, 1, 1))
        BillPar.CFrame = CFrame.new(Position)
        local Bill = Create("BillboardGui")({
          Parent = BillPar,
          Adornee = BillPar,
          Size = UDim2.new(1, 0, 1, 0),
          SizeOffset = Vector2.new(Size, Size)
        })
        local d = Create("ImageLabel", Bill)({
          Parent = Bill,
          BackgroundTransparency = 1,
          Size = UDim2.new(1, 0, 1, 0),
          Image = "rbxassetid://" .. Image
        })
        return BillPar
      end
    },
    ParticleEmitter = {
      Create = function(Parent, Color1, Color2, LightEmission, Size, Texture, Transparency, ZOffset, Accel, Drag, LockedToPart, VelocityInheritance, EmissionDirection, Enabled, LifeTime, Rate, Rotation, RotSpeed, Speed, VelocitySpread)
        local Particle = Create("ParticleEmitter")({
          Parent = Parent,
          Color = ColorSequence.new(Color1, Color2),
          LightEmission = LightEmission,
          Size = Size,
          Texture = Texture,
          Transparency = Transparency,
          ZOffset = ZOffset,
          Acceleration = Accel,
          Drag = Drag,
          LockedToPart = LockedToPart,
          VelocityInheritance = VelocityInheritance,
          EmissionDirection = EmissionDirection,
          Enabled = Enabled,
          Lifetime = LifeTime,
          Rate = Rate,
          Rotation = Rotation,
          RotSpeed = RotSpeed,
          Speed = Speed,
          VelocitySpread = VelocitySpread
        })
        return Particle
      end
    },
    CreateTemplate = {}
  }
cooldown = false
        ZZZ = Mouse.KeyDown:connect(function(key)
    if key == "q" then
        if Change == false then
            Stand()
            Change = true
        elseif Change == true then
            UnStand()
            Change = false
        end
    end
    if key == ""  and cooldown == false and DDZ == false then
   
   game.Lighting.OutdoorAmbient=Color3.new(0,14,135)
        game.Lighting.TimeOfDay="00:00:00"
wait(0.000004)
game.Lighting.OutdoorAmbient=Color3.new(135/255, 135/255, 128/255)
        game.Lighting.TimeOfDay="15:00:00"
        Torso.CFrame = CFrame.new(Vector3.new(Mouse.Hit.p.X,Mouse.Hit.p.Y+1.5,Mouse.Hit.p.Z),Torso.CFrame.p)
   bam = CFuncs.Sound.Create("2553988018")
bam.Volume = 10
cooldown = true
wait(0.3)
bam:Destroy()
cooldown = false
 
end
            if key == "t" and Change == true then
                Scorpion()
            end
            if key == "l" and Change == true then
                Speech()
            end
            if key == "p" and Change == true then
                Credits()
            end
            if key == "y" and Change == true then
                Heal()
            end
            if key == "r" and Change == true then
                LifeForceMuda()
            end
            if key == "e" and Change == true then
                GERmuda()
            end
            if key == "f" and Change == true then
                RTZ()
            end
            if key == "z" and Change == true then
                Jump()
            end
        end)
function Credits()
wait(2)
chatfunc("Gold Experience Requiem By lanceron2")
end

function Speech()
        local Sound = Instance.new("Sound",ST)
        Sound.Pitch = 1
        Sound.Volume = 10
        Sound.Looped = false
        Sound.SoundId = "rbxassetid://3555506426"
        Sound:play()
        Music:Pause()
wait(4)

wait(35)
Music:Play()
end


        ZZZ1 = Mouse.KeyUp:connect(function(key)
            if key == "e" and Change == true then
                Stop()
            end
        end)
        wait(0.5)
        D = false
    end
end
 
function Scorpion()
    if D == false then
        D = true
        Pause = true
        for i = 0,1.2,0.1 do
        swait()
        PlayAnimationFromTable({
         CFrame.new(0,0,0) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0),
         CFrame.new(0,1.5,0) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0),
         CFrame.new(1.5,0,0) * CFrame.new(0, 0, 0) * CFrame.Angles(0,0,0),
         CFrame.new(-1.5,0,0) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0),
         CFrame.new(0.5,-2,0) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0),
         CFrame.new(-0.5,-2,0) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0),
        }, .5, false)
        SRA3.C0 = clerp(SRA3.C0,CFrame.new(2,0.5,0)*CFrame.new(0,0,0)*CFrame.Angles(0,0,1.65),0.3)
        SLA3.C0 = clerp(SLA3.C0,CFrame.new(-1.5,0,0)*CFrame.new(0,0,0)*CFrame.Angles(0,0,0),0.3)
        SRL3.C0 = clerp(SRL3.C0,CFrame.new(0.5,-2,0)*CFrame.Angles(0,0,0),0.3)
        SLL3.C0 = clerp(SLL3.C0,CFrame.new(-0.5,-2,0)*CFrame.Angles(0,0,0),0.3)
        ST3.C0 = clerp(ST3.C0,CFrame.new(0,0.5,-2.7)*CFrame.new(0,0,0)*CFrame.Angles(0,1.55,0),0.3)
        SH2.C0 = clerp(SH2.C0,CFrame.new(0,1.5,0)*CFrame.Angles(0,-1.55,0),0.3)
        end
        coroutine.resume(coroutine.create(function()
        wait(0.7)
        Pause = false
        end))
        local Bl = Instance.new("Part",workspace)
        Bl.CanCollide = false
        Bl.Material = "Neon"
        Bl.Shape = "Ball"
        Bl.Size = Vector3.new(0.7,0.5,0.7)
        Bl.BrickColor = BrickColor.new("New Yeller")
        Bl.CFrame = RootPart.CFrame*CFrame.new(0,0,-5)*CFrame.new(0,0,0)*CFrame.Angles(0,-1.55,0)
        local bl2 = Instance.new("SpecialMesh",Bl)
        bl2.MeshId = "rbxassetid://490893357"
        bl2.TextureId = "rbxassetid://490893474"
        bl2.Scale = Vector3.new(0.5,0.1,0.5)
                                                                        trail = Instance.new("Trail")
        local attach1 = Instance.new("Attachment",Bl)
        attach1.Position = Vector3.new(0,1,0.5)
        local attach2 = Instance.new("Attachment",Bl)
        attach2.Position = Vector3.new(0,-1,0)
        trail.Attachment0 = attach1
        trail.Attachment1 = attach2
        trail.Texture = "rbxassetid://461231644"
        trail.Color = ColorSequence.new(Color3.fromRGB(1,1,1),Color3.fromRGB(254,203,0))
        trail.Lifetime = 0.8
        trail.Parent = Bl
        local Fl = Instance.new("BodyVelocity",Bl)
        Fl.maxForce = Vector3.new(math.huge,math.huge,math.huge)
if DDZ == true then
        Fl.Velocity = RootPart.CFrame.lookVector*0
         D = false
repeat
      wait()
    until DDZ == false
        Fl.Velocity = RootPart.CFrame.lookVector*160
       elseif DDZ == false then
        Fl.Velocity = RootPart.CFrame.lookVector*160
            end
        local Ring = Instance.new("Part",RootPart)
        Ring.Size = Vector3.new(1,1,1)
        Ring.CanCollide = false
        Ring.CFrame = RootPart.CFrame*CFrame.new(0,0,-9)*CFrame.Angles(0,0,0)
        Ring.Anchored = true
        Ring.BrickColor = BrickColor.new("Bright yellow")
        Ring.Transparency = 0
        local Ring2 = Instance.new("SpecialMesh",Ring)
        Ring2.MeshId = "rbxassetid://3270017"
        Ring2.Scale = Vector3.new(1,1,0.1)
        coroutine.resume(coroutine.create(function()
        for i = 1,50 do
            Ring2.Scale = Ring2.Scale + Vector3.new(1,1,0)
            Ring.Transparency = Ring.Transparency + 0.07
            game:GetService("RunService").RenderStepped:wait()
        end
        Ring:remove()
        end))
        Bl.Touched:connect(function(hit)
            if hit.Parent:FindFirstChild("Torso") or hit.Parent:FindFirstChild("UpperTorso") and hit.Parent ~= nil and hit.Parent.Name ~= Character.Name then
                Bl:remove()
                local S = Instance.new("Sound",hit.Parent.Head)
                S.SoundId = "rbxassetid://785201669"
                S.Volume = 1
                S.Looped = false
                S:play()

                hit.Parent.Humanoid:TakeDamage(40)
                hit.Parent.Humanoid.WalkSpeed = 18
                    local random = math.random(-3,3)
                    local random2 = math.random(-3,3)
                    local random3 = math.random(-3,3)
                    local Ef = Instance.new("Part",workspace)
                    Ef.Size = Vector3.new(0.3,0.3,2)
                    Ef.CanCollide = false
                    Ef.Material = "ForceField"
                    Ef.BrickColor = BrickColor.new("Burlap")
                    Ef.Anchored = true
                    Ef.CFrame = hit.Parent.Torso.CFrame*CFrame.new(0,0,0)*CFrame.Angles(random,random2,random3)
                    local Ef2 = Instance.new("SpecialMesh",Ef)
                    Ef2.MeshType = "Sphere"
                    Ef2.Scale = Vector3.new(0.1,0.1,0.1)
                    local Part = Instance.new("Part",workspace)
                    Part.Size = Vector3.new(0.3,0.3,2)
                    Part.CanCollide = false
                    Part.BrickColor = BrickColor.new("Burlap")
                    Part.Material = "ForceField"
                    Part.Anchored = true
                    Part.CFrame = hit.Parent.Torso.CFrame*CFrame.new(0,0,0)*CFrame.Angles(random,random2,random3)
                    local Part2 = Instance.new("SpecialMesh",Part)
                    Part2.MeshType = "Sphere"
                    Part2.Scale = Vector3.new(0.3,0.3,2)
                    for i = 1,50 do
                        Part2.Scale = Part2.Scale + Vector3.new(0.1,0.1,1)
                        Part.Transparency = Part.Transparency + 0.07
                        Ef2.Scale = Ef2.Scale + Vector3.new(0.3,0.3,2)
                        Ef.Transparency = Ef.Transparency + 0.07
                        game:GetService("RunService").RenderStepped:wait()
                    end
                    Part:remove()
                    Ef:remove()
            end
        end)
        wait(0.5)
        D = false
    end
end
 
function Jump()
    if DD == false then
        DD = true
        print("ASD")
        local Bod = Instance.new("BodyPosition",RootPart)
        Bod.maxForce = Vector3.new(math.huge,math.huge,math.huge)
        Bod.Position = RootPart.CFrame*CFrame.new(0,80,-80).p
        local Ef = Instance.new("Part",workspace)
        Ef.Size = Vector3.new(1,1,1)
        Ef.CanCollide = false
        Ef.Anchored = true
        Ef.BrickColor = BrickColor.new("New Yeller")
        Ef.Material = "Neon"
        Ef.Shape = "Ball"
        Ef.CFrame = ST.CFrame*CFrame.new(0,-2.3,0)
        coroutine.resume(coroutine.create(function()
        for i = 1,30 do
            Ef.Size = Ef.Size + Vector3.new(0.8,0.8,0.8)
            Ef.Transparency = Ef.Transparency + 0.07
            game:GetService("RunService").RenderStepped:wait()
        end
        Ef:remove()
        end))
        wait(0.1)
        Bod:remove()
        wait(1)
        DD = false
    end
end
 
function RTZ()
    if DDZ == false then
        DDZ = true
Music:Pause()
chatfunc("Golden Experience Requiem!, You Will Never Reach the Truth")
        local S = Instance.new("Sound",ST)
        S.SoundId = "rbxassetid://2665147339"
        S.Pitch = 1
        S.Volume = 12312
        S.Looped = false
        S:play()
        DDZ = true
        local Ef = Instance.new("Part",workspace)
        Ef.Size = Vector3.new(1,1,1)
        Ef.Material = "ForceField"
        Ef.BrickColor = BrickColor.new("Black")
        Ef.Transparency = 0.4
        Ef.CFrame = RootPart.CFrame*CFrame.new(0,0,0)
        Ef.Anchored = true
        Ef.CanCollide = false
        Ef.Shape = "Ball"
        local Ef2 = Instance.new("SpecialMesh",Ef)
        Ef2.MeshType = "Sphere"
        Ef2.Scale = Vector3.new(1,1,1)
        coroutine.resume(coroutine.create(function()
        for i = 1,70 do
            Ef2.Scale = Ef2.Scale + Vector3.new(1,1,1)
            game:GetService("RunService").RenderStepped:wait()
        end

        for i = 1,70 do
            Ef2.Scale = Ef2.Scale - Vector3.new(1,1,1)
            game:GetService("RunService").RenderStepped:wait()
        end
        Ef:remove()
        end))
        local HB = Instance.new("Part",workspace)
        HB.CanCollide = false
        HB.Anchored = true
        HB.CFrame = RootPart.CFrame*CFrame.new(0,0,0)
        HB.Size = Vector3.new(1000,1000,1000)
        HB.Transparency = 1
        HB.Touched:connect(function(hit)
        DDZ = true
            if hit.Parent:FindFirstChild("Torso") and hit.Parent ~= nil and hit.Parent.Name ~= Character.Name then
                hit.Parent.Torso.Anchored = false
                hit.Parent.Head.Anchored = false
                hit.Parent["Right Arm"].Anchored = false
                hit.Parent["Left Arm"].Anchored = false
                hit.Parent["Right Leg"].Anchored = false
                hit.Parent["Left Leg"].Anchored = false
                wait(3)
        Music:Resume()
                hit.Parent.Torso.Anchored = false
                hit.Parent.Head.Anchored = false
                hit.Parent["Right Arm"].Anchored = false
                hit.Parent["Left Arm"].Anchored = false
                hit.Parent["Right Leg"].Anchored = false
                hit.Parent["Left Leg"].Anchored = false
                hit.Parent.Humanoid.WalkSpeed = 18
                hit.Parent.Torso.Transparency = 0
                hit.Parent.Head.Transparency = 0
                hit.Parent["Right Arm"].Transparency = 0
                hit.Parent["Left Arm"].Transparency = 0
                hit.Parent["Right Leg"].Transparency = 0
                hit.Parent["Left Leg"].Transparency = 0
           end
        end)
        DDZ = false
        wait(5)
        HB:remove()
    end
end
function LifeForceMuda()
    if D == false then
        D = true
        Pause = true
        local HB = Instance.new("Part",SRA)
        HB.CanCollide = false
        HB.Transparency = 1
        HB.Size = Vector3.new(1,1,1)
        local HB2 = Instance.new("Weld",HB)
        HB2.Part0 = SRA
        HB2.Part1 = HB
        HB2.C0 = CFrame.new(0,0,0)
        HB.Touched:connect(function(hit)
            if hit.Parent:FindFirstChild("Torso") or hit.Parent:FindFirstChild("UpperTorso") and hit.Parent ~= nil and hit.Parent.Name ~= Character.Name then
                HB:remove()
                hit.Parent.Humanoid:TakeDamage(40)
                hit.Parent.Humanoid.WalkSpeed = 2
                hit.Parent.Humanoid.PlatformStand = true
                local Ef = Instance.new("Part",workspace)
                Ef.Size = Vector3.new(0.1,0.1,0.1)
                Ef.CanCollide = false
                Ef.Anchored = true
                Ef.Shape = "Ball"
                Ef.CFrame = hit.Parent.Torso.CFrame*CFrame.new(0,0,0)
                Ef.Material = "ForceField"
                Ef.BrickColor = BrickColor.new("Burlap")
                local Ef2 = Instance.new("SpecialMesh",Ef)
                Ef2.MeshType = "Sphere"
                Ef2.Scale = Vector3.new(0.1,0.1,0.1)
                coroutine.resume(coroutine.create(function()
                for i = 1,5 do
                local random = math.random(-3,3)
                local random2 = math.random(-3,3)
                local random3 = math.random(-3,3)
                local ZC = Instance.new("Part",workspace)
                ZC.Size = Vector3.new(0.1,0.1,0.1)
                ZC.CanCollide = false
                ZC.Anchored = true
                ZC.CFrame = hit.Parent.Torso.CFrame*CFrame.new(0,0,0)*CFrame.Angles(random,random2,random3)
                ZC.Shape = "Ball"
                ZC.Material = "ForceField"
                ZC.BrickColor = BrickColor.new("Burlap")
                local ZC2 = Instance.new("SpecialMesh",ZC)
                ZC2.MeshType = "Sphere"
                ZC2.Scale = Vector3.new(0.1,0.1,0.1)
                coroutine.resume(coroutine.create(function()
                for i = 1,100 do
                    ZC2.Scale = ZC2.Scale + Vector3.new(0.3,0.3,2)
                    ZC.Transparency = ZC.Transparency + 0.03
                    game:GetService("RunService").RenderStepped:wait()
                end
                ZC:remove()
                end))
                end
                end))
                coroutine.resume(coroutine.create(function()
                for i = 1,100 do
                    Ef2.Scale = Ef2.Scale + Vector3.new(0.6,0.6,0.6)
                    Ef.Transparency = Ef.Transparency + 0.03
                    game:GetService("RunService").RenderStepped:wait()
                end
                Ef:remove()
                end))
                local Fl = Instance.new("BodyVelocity",hit.Parent.Head)
                Fl.maxForce = Vector3.new(math.huge,math.huge,math.huge)
                Fl.velocity = RootPart.CFrame.lookVector*190
                wait(0.3)
                Fl:remove()
                wait(0.5)
                hit.Parent.Humanoid.PlatformStand = false
            end
        end)
        for i = 0,0.5,0.1 do
        swait()
        PlayAnimationFromTable({
         CFrame.new(0,0,0) * CFrame.new(0, 0, 0) * CFrame.Angles(0.2, 0.5, 0),
         CFrame.new(0,1.5,0) * CFrame.new(0, 0, 0) * CFrame.Angles(-0.1, -0.4, 0),
         CFrame.new(1.5,0.5,-0.5) * CFrame.new(0, 0, 0) * CFrame.Angles(1.45,0,0.7),
         CFrame.new(-1.5,0,0) * CFrame.new(0, 0, 0) * CFrame.Angles(-0.2, 0.2, 0),
         CFrame.new(0.6,-2.1,0) * CFrame.new(0, 0, 0) * CFrame.Angles(-0.2, -0.5, 0.1),
         CFrame.new(-0.6,-2,0) * CFrame.new(0, 0, 0) * CFrame.Angles(-0.2, 0.2, -0.1),  
        }, .5, false)
        SRA3.C0 = clerp(SRA3.C0,CFrame.new(1.5,0,0)*CFrame.new(0,0.5,0.5)*CFrame.Angles(1.55,0,0.5),0.3)
        SLA3.C0 = clerp(SLA3.C0,CFrame.new(-1.5,0,0)*CFrame.new(0,0,0)*CFrame.Angles(-0.1,0,0),0.3)
        SRL3.C0 = clerp(SRL3.C0,CFrame.new(0.5,-1.8,-0.2)*CFrame.Angles(-0.5,0,0),0.3)
        SLL3.C0 = clerp(SLL3.C0,CFrame.new(-0.5,-2,0)*CFrame.Angles(-0.2,0,0),0.3)
        ST3.C0 = clerp(ST3.C0,CFrame.new(0,0,-1)*CFrame.new(0,0,0)*CFrame.Angles(0.2,-2,0),0.3)
        SH2.C0 = clerp(SH2.C0,CFrame.new(0,1.5,0)*CFrame.Angles(0,0.5,0),0.3)
        end
        local Ora = Instance.new("Sound",ST)
        Ora.SoundId = "rbxassetid://3552369081"
        Ora.Pitch = 1
        Ora.Looped = false
        Ora.Volume = 7
        Ora:play()
        for i = 0,0.6,0.1 do
        swait()
        PlayAnimationFromTable({
        CFrame.new(0,0,0) * CFrame.new(0, 0, 0) * CFrame.Angles(0.2, 0.5, 0),
         CFrame.new(0,1.5,0) * CFrame.new(0, 0, 0) * CFrame.Angles(-0.1, -0.4, 0),
         CFrame.new(1.5,0.5,-0.5) * CFrame.new(0, 0, 0) * CFrame.Angles(1.45,0,0.7),
         CFrame.new(-1.5,0,0) * CFrame.new(0, 0, 0) * CFrame.Angles(-0.2, 0.2, 0),
         CFrame.new(0.6,-2.1,0) * CFrame.new(0, 0, 0) * CFrame.Angles(-0.2, -0.5, 0.1),
         CFrame.new(-0.6,-2,0) * CFrame.new(0, 0, 0) * CFrame.Angles(-0.2, 0.2, -0.1),
        }, .5, false)
        SRA3.C0 = clerp(SRA3.C0,CFrame.new(1,0,0)*CFrame.new(0,1,-2)*CFrame.Angles(1.77,0,-0.5),0.5)
        SLA3.C0 = clerp(SLA3.C0,CFrame.new(-1.5,0,0)*CFrame.new(0,0,0)*CFrame.Angles(-0.1,0,0),0.5)
        SRL3.C0 = clerp(SRL3.C0,CFrame.new(0.5,-1.7,-0.3)*CFrame.Angles(-0.4,0,0),0.5)
        SLL3.C0 = clerp(SLL3.C0,CFrame.new(-0.5,-1.8,0.2)*CFrame.Angles(-0.2,0,0),0.5)
        ST3.C0 = clerp(ST3.C0,CFrame.new(0,0.4,-2)*CFrame.new(0,0,0)*CFrame.Angles(-0.2,0.8,0),0.5)
        SH2.C0 = clerp(SH2.C0,CFrame.new(0,1.5,0)*CFrame.Angles(0.2,0,0),0.5)
        end
        coroutine.resume(coroutine.create(function()
        wait(0.4)
        HB:remove()
        end))
        Pause = false
        wait(0.5)
        D = false
    end
end
function Heal()
    if D == false then
        D = true
        Pause = true
        local HB = Instance.new("Part",SRA)
        HB.CanCollide = false
        HB.Transparency = 1
        HB.Size = Vector3.new(1,1,1)
        local HB2 = Instance.new("Weld",HB)
        HB2.Part0 = SRA
        HB2.Part1 = HB
        HB2.C0 = CFrame.new(0,0,0)
        HB.Touched:connect(function(hit)
            if hit.Parent:FindFirstChild("Torso") or hit.Parent:FindFirstChild("UpperTorso") and hit.Parent ~= nil and hit.Parent.Name ~= Character.Name then
                HB:remove()
                hit.Parent.Humanoid:TakeDamage(-40)
                hit.Parent.Humanoid.WalkSpeed = 18
                hit.Parent.Humanoid.PlatformStand = true
                local Ef = Instance.new("Part",workspace)
                Ef.Size = Vector3.new(0.1,0.1,0.1)
                Ef.CanCollide = false
                Ef.Anchored = true
                Ef.Shape = "Ball"
                Ef.CFrame = hit.Parent.Torso.CFrame*CFrame.new(0,0,0)
                Ef.Material = "ForceField"
                Ef.BrickColor = BrickColor.new("Sea green")
                local Ef2 = Instance.new("SpecialMesh",Ef)
                Ef2.MeshType = "Sphere"
                Ef2.Scale = Vector3.new(0.1,0.1,0.1)
                coroutine.resume(coroutine.create(function()
                for i = 1,5 do
                local random = math.random(-3,3)
                local random2 = math.random(-3,3)
                local random3 = math.random(-3,3)
                local ZC = Instance.new("Part",workspace)
                ZC.Size = Vector3.new(0.1,0.1,0.1)
                ZC.CanCollide = false
                ZC.Anchored = true
                ZC.CFrame = hit.Parent.Torso.CFrame*CFrame.new(0,0,0)*CFrame.Angles(random,random2,random3)
                ZC.Shape = "Ball"
                ZC.Material = "ForceField"
                ZC.BrickColor = BrickColor.new("Burlap")
                local ZC2 = Instance.new("SpecialMesh",ZC)
                ZC2.MeshType = "Sphere"
                ZC2.Scale = Vector3.new(0.1,0.1,0.1)
                coroutine.resume(coroutine.create(function()
                for i = 1,100 do
                    ZC2.Scale = ZC2.Scale + Vector3.new(0.3,0.3,2)
                    ZC.Transparency = ZC.Transparency + 0.03
                    game:GetService("RunService").RenderStepped:wait()
                end
                ZC:remove()
                end))
                end
                end))
                coroutine.resume(coroutine.create(function()
                for i = 1,100 do
                    Ef2.Scale = Ef2.Scale + Vector3.new(0.6,0.6,0.6)
                    Ef.Transparency = Ef.Transparency + 0.03
                    game:GetService("RunService").RenderStepped:wait()
                end
                Ef:remove()
                end))
                local Fl = Instance.new("BodyVelocity",hit.Parent.Head)
                Fl.maxForce = Vector3.new(1,1,1)
                Fl.velocity = RootPart.CFrame.lookVector*190
                wait(0.3)
                Fl:remove()
                wait(0.5)
                hit.Parent.Humanoid.PlatformStand = false
            end
        end)
        for i = 0,0.5,0.1 do
        swait()
        PlayAnimationFromTable({
         CFrame.new(0,0,0) * CFrame.new(0, 0, 0) * CFrame.Angles(0.2, 0.5, 0),
         CFrame.new(0,1.5,0) * CFrame.new(0, 0, 0) * CFrame.Angles(-0.1, -0.4, 0),
         CFrame.new(1.5,0.5,-0.5) * CFrame.new(0, 0, 0) * CFrame.Angles(1.45,0,0.7),
         CFrame.new(-1.5,0,0) * CFrame.new(0, 0, 0) * CFrame.Angles(-0.2, 0.2, 0),
         CFrame.new(0.6,-2.1,0) * CFrame.new(0, 0, 0) * CFrame.Angles(-0.2, -0.5, 0.1),
         CFrame.new(-0.6,-2,0) * CFrame.new(0, 0, 0) * CFrame.Angles(-0.2, 0.2, -0.1),  
        }, .5, false)
        SRA3.C0 = clerp(SRA3.C0,CFrame.new(1.5,0,0)*CFrame.new(0,0.5,0.5)*CFrame.Angles(1.55,0,0.5),0.3)
        SLA3.C0 = clerp(SLA3.C0,CFrame.new(-1.5,0,0)*CFrame.new(0,0,0)*CFrame.Angles(-0.1,0,0),0.3)
        SRL3.C0 = clerp(SRL3.C0,CFrame.new(0.5,-1.8,-0.2)*CFrame.Angles(-0.5,0,0),0.3)
        SLL3.C0 = clerp(SLL3.C0,CFrame.new(-0.5,-2,0)*CFrame.Angles(-0.2,0,0),0.3)
        ST3.C0 = clerp(ST3.C0,CFrame.new(0,0,-1)*CFrame.new(0,0,0)*CFrame.Angles(0.2,-2,0),0.3)
        SH2.C0 = clerp(SH2.C0,CFrame.new(0,1.5,0)*CFrame.Angles(0,0.5,0),0.3)
        end
        local Ora = Instance.new("Sound",ST)
        Ora.SoundId = "rbxassetid://3378924410"
        Ora.Pitch = 1
        Ora.Looped = false
        Ora.Volume = 7
        Ora:play()
        for i = 0,0.6,0.1 do
        swait()
        PlayAnimationFromTable({
        CFrame.new(0,0,0) * CFrame.new(0, 0, 0) * CFrame.Angles(0.2, 0.5, 0),
         CFrame.new(0,1.5,0) * CFrame.new(0, 0, 0) * CFrame.Angles(-0.1, -0.4, 0),
         CFrame.new(1.5,0.5,-0.5) * CFrame.new(0, 0, 0) * CFrame.Angles(1.45,0,0.7),
         CFrame.new(-1.5,0,0) * CFrame.new(0, 0, 0) * CFrame.Angles(-0.2, 0.2, 0),
         CFrame.new(0.6,-2.1,0) * CFrame.new(0, 0, 0) * CFrame.Angles(-0.2, -0.5, 0.1),
         CFrame.new(-0.6,-2,0) * CFrame.new(0, 0, 0) * CFrame.Angles(-0.2, 0.2, -0.1),
        }, .5, false)
        SRA3.C0 = clerp(SRA3.C0,CFrame.new(1,0,0)*CFrame.new(0,1,-2)*CFrame.Angles(1.77,0,-0.5),0.5)
        SLA3.C0 = clerp(SLA3.C0,CFrame.new(-1.5,0,0)*CFrame.new(0,0,0)*CFrame.Angles(-0.1,0,0),0.5)
        SRL3.C0 = clerp(SRL3.C0,CFrame.new(0.5,-1.7,-0.3)*CFrame.Angles(-0.4,0,0),0.5)
        SLL3.C0 = clerp(SLL3.C0,CFrame.new(-0.5,-1.8,0.2)*CFrame.Angles(-0.2,0,0),0.5)
        ST3.C0 = clerp(ST3.C0,CFrame.new(0,0.4,-2)*CFrame.new(0,0,0)*CFrame.Angles(-0.2,0.8,0),0.5)
        SH2.C0 = clerp(SH2.C0,CFrame.new(0,1.5,0)*CFrame.Angles(0.2,0,0),0.5)
        end
        coroutine.resume(coroutine.create(function()
        wait(0.4)
        HB:remove()
        end))
        Pause = false
        wait(0.5)
        D = false
    end
end

function GERmuda()
    if D == false then
        D = true
        Pause = true
        Loop = true
                                                                        trail = Instance.new("Trail")
        local attach1 = Instance.new("Attachment",SRA)
        attach1.Position = Vector3.new(0,1,0.5)
        local attach2 = Instance.new("Attachment",SRA)
        attach2.Position = Vector3.new(0,-1,0.5)
        trail.Attachment0 = attach1
        trail.Attachment1 = attach2
        trail.Texture = "rbxassetid://1369718163"
        trail.Color = ColorSequence.new(Color3.fromRGB(0,0,0),Color3.fromRGB(234,221,169))
        trail.Lifetime = 1
        trail.Parent = SRA
                                                                        trail2 = Instance.new("Trail")
        local attach1 = Instance.new("Attachment",SLA)
        attach1.Position = Vector3.new(0,1,0.5)
        local attach2 = Instance.new("Attachment",SLA)
        attach2.Position = Vector3.new(0,-1,0.5)
        trail2.Attachment0 = attach1
        trail2.Attachment1 = attach2
        trail2.Texture = "461231644"
        trail2.Color = ColorSequence.new(Color3.fromRGB(0,0,0),Color3.fromRGB(234,221,169))
        trail2.Lifetime = 1
        trail2.Parent = SLA
        SoundZ = Instance.new("Sound",ST)
        SoundZ.SoundId = "rbxassetid://3443190191"
        SoundZ.Volume = 10
        SoundZ.Looped = true
        SoundZ.Pitch = 1
        SoundZ:play()
        while Loop do
            local HB = Instance.new("Part",SRA)
            HB.CanCollide = false
            HB.Transparency = 1
            local HB2 = Instance.new("Weld",HB)
            HB2.Part0 = SRA
            HB2.Part1 = HB
            HB2.C0 = CFrame.new(0,-1.1,0)
            HB.Touched:connect(function(hit)
                if hit.Parent:FindFirstChild("Humanoid") and hit.Parent ~= nil and hit.Parent.Name ~= Character.Name then
                    hit.Parent.Humanoid:TakeDamage(0.9)
                    hit.Parent.Humanoid.WalkSpeed = 18
                    local random = math.random(-3,3)
                    local random2 = math.random(-3,3)
                    local random3 = math.random(-3,3)
                    end
            end)
            for i = 0,0.15,0.1 do
            swait()
            PlayAnimationFromTable({
         CFrame.new(0,0,0) * CFrame.new(0, 0, 0) * CFrame.Angles(0.2, 0.5, 0),
         CFrame.new(0,1.5,0) * CFrame.new(0, 0, 0) * CFrame.Angles(-0.1, -0.4, 0),
         CFrame.new(1.5,0.5,-0.5) * CFrame.new(0, 0, 0) * CFrame.Angles(1.45,0,0.7),
         CFrame.new(-1.5,0,0) * CFrame.new(0, 0, 0) * CFrame.Angles(-0.2, 0.2, 0),
         CFrame.new(0.6,-2.1,0) * CFrame.new(0, 0, 0) * CFrame.Angles(-0.2, -0.5, 0.1),
         CFrame.new(-0.6,-2,0) * CFrame.new(0, 0, 0) * CFrame.Angles(-0.2, 0.2, -0.1),
        }, .5, false)
            SRA3.C0 = clerp(SRA3.C0,CFrame.new(1,0,0)*CFrame.new(0,1,-4)*CFrame.Angles(2.2,0,-0.4),0.3)
            SLA3.C0 = clerp(SLA3.C0,CFrame.new(-1.5,0,0)*CFrame.new(0,0.5,3)*CFrame.Angles(1.55,0,0.4),0.3)
            SRL3.C0 = clerp(SRL3.C0,CFrame.new(0.5,-1,-0.2)*CFrame.Angles(-0.5,0,0),0.3)
            SLL3.C0 = clerp(SLL3.C0,CFrame.new(-0.5,-1.8,0.3)*CFrame.Angles(-0.5,0,0),0.3)
            ST3.C0 = clerp(ST3.C0,CFrame.new(0,0.5,-5)*CFrame.new(0,0,0)*CFrame.Angles(-0.3,1,0),0.3)
            SH2.C0 = clerp(SH2.C0,CFrame.new(0,1.5,0)*CFrame.Angles(0.3,-0.5,0),0.3)
            end
            coroutine.resume(coroutine.create(function()
                wait(1)
                HB:remove()
            end))
            local CCB = Instance.new("Part",SRA)
            CCB.CanCollide = false
            CCB.Transparency = 1
            local CCB2 = Instance.new("Weld",CCB)
            CCB2.Part0 = SRA
            CCB2.Part1 = CCB
            CCB2.C0 = CFrame.new(0,-1.1,0)
            CCB.Touched:connect(function(hit)
                if hit.Parent:FindFirstChild("Humanoid") and hit.Parent ~= nil and hit.Parent.Name ~= Character.Name then
                    CCB:remove()

                    hit.Parent.Humanoid:TakeDamage(1)
                    hit.Parent.Humanoid.WalkSpeed = 18
                    local random = math.random(3,3)
                    local random2 = math.random(3,3)
                    local random3 = math.random(3,3)
                end
            end)
            for i = 0,0.15,0.1 do
            swait()
            PlayAnimationFromTable({
         CFrame.new(0,0,0) * CFrame.new(0, 0, 0) * CFrame.Angles(0.2, 0.5, 0),
         CFrame.new(0,1.5,0) * CFrame.new(0, 0, 0) * CFrame.Angles(-0.1, -0.4, 0),
         CFrame.new(1.5,0.5,-0.5) * CFrame.new(0, 0, 0) * CFrame.Angles(1.45,0,0.7),
         CFrame.new(-1.5,0,0) * CFrame.new(0, 0, 0) * CFrame.Angles(-0.2, 0.2, 0),
         CFrame.new(0.6,-2.1,0) * CFrame.new(0, 0, 0) * CFrame.Angles(-0.2, -0.5, 0.1),
         CFrame.new(-0.6,-2,0) * CFrame.new(0, 0, 0) * CFrame.Angles(-0.2, 0.2, -0.1),
        }, .5, false)
            SRA3.C0 = clerp(SRA3.C0,CFrame.new(1.5,0,0)*CFrame.new(0,0.5,3)*CFrame.Angles(1.55,2,0.4),0.3)
            SLA3.C0 = clerp(SLA3.C0,CFrame.new(-1,0,0)*CFrame.new(0,1,-4)*CFrame.Angles(2.2,-2,0.4),0.3)
            SRL3.C0 = clerp(SRL3.C0,CFrame.new(0.5,-1,-0.2)*CFrame.Angles(-0.5,0,0),0.3)
            SLL3.C0 = clerp(SLL3.C0,CFrame.new(-0.5,-1.8,0.3)*CFrame.Angles(-0.5,0,0),0.3)
            ST3.C0 = clerp(ST3.C0,CFrame.new(0,0.5,-2)*CFrame.new(0,0,0)*CFrame.Angles(-0.3,-1,0),0.3)
            SH2.C0 = clerp(SH2.C0,CFrame.new(0,1.5,0)*CFrame.Angles(0.3,0.5,0),0.3)
            end
            coroutine.resume(coroutine.create(function()
                wait(1)
                CCB:remove()
            end))
            game:GetService("RunService").RenderStepped:wait()
        end
        wait(0.2)
        D = false
    end
end
 
function Stop()
    Pause = false
if SoundZ ~= nil then
    SoundZ:remove()
end
    Loop = false
if trail ~= nil and trail2 ~= nil then
   trail:remove()
   trail2:remove()
   end
end
 
function UnStand()
    if D == false then
        D = true
        Pause = true
        coroutine.resume(coroutine.create(function()
        for i = 0,1.2,0.1 do
        swait()
        PlayAnimationFromTable({
         CFrame.new(0,0,0) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0),
         CFrame.new(0,1.5,0) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0),
         CFrame.new(1.5,0,0) * CFrame.new(0, 0, 0) * CFrame.Angles(0,0,0),
         CFrame.new(-1.5,0,0) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0),
         CFrame.new(0.5,-2,0) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0),
         CFrame.new(-0.5,-2,0) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0),
        }, .5, false)
        ST3.C0 = clerp(ST3.C0,CFrame.new(0,0,0)*CFrame.Angles(0,0,0),0.3)
        end
        Pause = false
        end))
        for i,v in pairs(Character.Stand:children()) do
            if v:IsA("Part") then
                coroutine.resume(coroutine.create(function()
                for i = 1,11 do
                v.Transparency = v.Transparency + 0.1
                Face.Transparency = Face.Transparency + 0.1
                game:GetService("RunService").RenderStepped:wait()
                end
                end))
            end
        end
        wait(0.5)
        D = false
       
    end
end
 
 
New = function(Object, Parent, Name, Data)
    local Object = Instance.new(Object)
    for Index, Value in pairs(Data or {}) do
        Object[Index] = Value
    end
    Object.Parent = Parent
    Object.Name = Name
    return Object
end
function rayCast(Position, Direction, Range, Ignore)
    return game:service("Workspace"):FindPartOnRay(Ray.new(Position, Direction.unit * (Range or 999.999)), Ignore)
end
 

 
while true do
    swait()
    for i, v in pairs(Character:GetChildren()) do
        if v:IsA("Part") then
            v.Material = "SmoothPlastic"
        elseif v:IsA("Accessory") then
            v:WaitForChild("Handle").Material = "SmoothPlastic"
        end
    end
 
    Torsovelocity = (RootPart.Velocity * Vector3.new(1, 0, 1)).magnitude
    velocity = RootPart.Velocity.y
    sine = sine + change
    local hit, pos = rayCast(RootPart.Position, (CFrame.new(RootPart.Position, RootPart.Position - Vector3.new(0, 1, 0))).lookVector, 4, Character)
        if RootPart.Velocity.y > 1 and hit == nil then
            Anim = "Jump"
            if Pause == false then
        PlayAnimationFromTable({
          CFrame.new(0,0,0) * CFrame.new(0, 0, 0) * CFrame.Angles(-0.4, 0, 0), -- Torso,
         CFrame.new(0,1.5,0) * CFrame.new(0, 0, 0) * CFrame.Angles(0.2, 0, 0), ----- Head
         CFrame.new(1.5,0,0) * CFrame.new(0, 0, 0) * CFrame.Angles(-0.2,0,0),  --- RightArm
         CFrame.new(-1.5,0,0) * CFrame.new(0, 0, 0) * CFrame.Angles(-0.2, 0, 0),--LeftArm
         CFrame.new(0.5,-1.6,-0.1) * CFrame.new(0, 0, 0) * CFrame.Angles(-0.3, 0, 0), --RightLeg
         CFrame.new(-0.5,-1.8,0.2) * CFrame.new(0, 0, 0) * CFrame.Angles(-0.2, 0, 0), --LeftLeg
        }, .3, false)
        SRA3.C0 = clerp(SRA3.C0,CFrame.new(1.5,0,0)*CFrame.new(0,0,0)*CFrame.Angles(0,0,0),0.3)
        SLA3.C0 = clerp(SLA3.C0,CFrame.new(-1.5,0,0)*CFrame.new(0,0,0)*CFrame.Angles(0,0,0),0.3)
        SRL3.C0 = clerp(SRL3.C0,CFrame.new(0.5,-2,0)*CFrame.Angles(0,0,0),0.3)
        SLL3.C0 = clerp(SLL3.C0,CFrame.new(-0.5,-2,0)*CFrame.Angles(0,0,0),0.3)
        ST3.C0 = clerp(ST3.C0,CFrame.new(1,1.5,2)*CFrame.new(0,0,0)*CFrame.Angles(0,0,0),0.3)
        SH2.C0 = clerp(SH2.C0,CFrame.new(0,1.5,0)*CFrame.Angles(0,0,0),0.3)
                    end
        elseif RootPart.Velocity.y < -1 and hit == nil then
            Anim = "Fall"
            if Pause == false then
        PlayAnimationFromTable({
          CFrame.new(0,0,0) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), -- Torso,
         CFrame.new(0,1.5,0) * CFrame.new(0, 0, 0) * CFrame.Angles(-0.2, 0, 0), ----- Head
         CFrame.new(1.78,0.1,0) * CFrame.new(0, 0, 0) * CFrame.Angles(0,0,0.4),  --- RightArm
         CFrame.new(-1.78,0.1,0) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, -0.4),--LeftArm
         CFrame.new(0.7,-2,0) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0.2), --RightLeg
         CFrame.new(-0.7,-2,0) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, -0.2), --LeftLeg
        }, .3, false)
        SRA3.C0 = clerp(SRA3.C0,CFrame.new(1.5,0,0)*CFrame.new(0,0,0)*CFrame.Angles(0,0,0),0.3)
        SLA3.C0 = clerp(SLA3.C0,CFrame.new(-1.5,0,0)*CFrame.new(0,0,0)*CFrame.Angles(0,0,0),0.3)
        SRL3.C0 = clerp(SRL3.C0,CFrame.new(0.5,-2,0)*CFrame.Angles(0,0,0),0.3)
        SLL3.C0 = clerp(SLL3.C0,CFrame.new(-0.5,-2,0)*CFrame.Angles(0,0,0),0.3)
        ST3.C0 = clerp(ST3.C0,CFrame.new(0,5,3)*CFrame.new(0,0,0)*CFrame.Angles(0,0,0),0.3)
        SH2.C0 = clerp(SH2.C0,CFrame.new(0,1.5,0)*CFrame.Angles(0,0,0),0.3)
                    end
        elseif Torsovelocity < 1 and hit ~= nil then
            Anim = "Idle"
            if Pause == false then
                change = 1
        PlayAnimationFromTable({
         CFrame.new(0,0-.05*math.sin(tick()*2),0) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0),-- torso
         CFrame.new(0,1.5,0) * CFrame.new(0, 0, 0) * CFrame.Angles(0-.1*math.sin(tick()*2), 0, 0),--head
         CFrame.new(0.8,0.2,-0.59) * CFrame.new(0, 0, 0) * CFrame.Angles(0,3,2),--right arm
         CFrame.new(-1.29,0,0) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0.7, 0.4),--left arm
         CFrame.new(0.6,-2,0) * CFrame.new(0, 0+.05*math.sin(tick()*2), 0) * CFrame.Angles(0, 0, 0.1),--right leg
         CFrame.new(-0.9,-2,0) * CFrame.new(0, 0+.05*math.sin(tick()*2), 0) * CFrame.Angles(0, 1, -0.311),--left leg
        }, .3, false)
        SRA3.C0 = clerp(SRA3.C0,CFrame.new(1.5,0,0)*CFrame.new(0,0,0)*CFrame.Angles(0,0,-0),0.3)
        SLA3.C0 = clerp(SLA3.C0,CFrame.new(-0.8,-0.2,0.6)*CFrame.new(0,0,0)*CFrame.Angles(-5.8,-0,-0),0.3)
        SRL3.C0 = clerp(SRL3.C0,CFrame.new(0.5,-2,0)*CFrame.Angles(-0.5,-1.5,0),0.3)
        SLL3.C0 = clerp(SLL3.C0,CFrame.new(-0.5,-2,0.6)*CFrame.Angles(-0.3,0,0),0.3)
        SH2.C0 = clerp(SH2.C0,CFrame.new(0,1.5,0)*CFrame.Angles(0,1.5,0),0.3)
        ST3.C0 = clerp(ST3.C0,CFrame.new(-1.4,0.5,-1)*CFrame.new(0,0-.1*math.sin(tick()*3),0)*CFrame.Angles(0,-2,0),0.3)
            end
        elseif Torsovelocity > 2 and hit ~= nil then
            Anim = "Walk"
            if Pause == false then
        PlayAnimationFromTable({       
        CFrame.new(0,0,0) * CFrame.new(0, 0-.1*math.sin(tick()*11), 0) * CFrame.Angles(-0.1-.1*math.sin(tick()*11), 0, 0+RootPart.RotVelocity.Y/33),
         CFrame.new(0,1.5,0) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0+RootPart.RotVelocity.Y/20, 0),
         CFrame.new(1.5,0,0) * CFrame.new(0, 0, 0- 0.5 * math.cos((sine) / 5)) * CFrame.Angles(math.rad(0+ 20 * math.cos((sine) / 5)),  0, 0),
         CFrame.new(-1.5,0,0) * CFrame.new(0, 0, 0+ 0.5 * math.cos((sine) / 5)) * CFrame.Angles(math.rad(0- 20 * math.cos((sine) / 5)),  0, 0),
         CFrame.new(0.5,-2,0) * CFrame.new(0, 0, 0+ .9 * math.cos((sine) / 5)) * CFrame.Angles(math.rad(0 - 30 * math.cos((sine) / 5)), 0, 0-RootPart.RotVelocity.Y/33),
         CFrame.new(-0.5,-2,0) * CFrame.new(0, 0, 0- .9 * math.cos((sine) / 5)) * CFrame.Angles(math.rad(0 + 30 * math.cos((sine) / 5)), 0, 0-RootPart.RotVelocity.Y/33),  
        }, .3, false)
        SRA3.C0 = clerp(SRA3.C0,CFrame.new(1.5,0,0)*CFrame.new(0,0,0)*CFrame.Angles(-0.3,0,0),0.3)
        SLA3.C0 = clerp(SLA3.C0,CFrame.new(-1.5,0,0)*CFrame.new(0,0,0)*CFrame.Angles(-0.3,0,0),0.3)
        SRL3.C0 = clerp(SRL3.C0,CFrame.new(0.5,-2,0)*CFrame.Angles(-0.5,0,0),0.3)
        SLL3.C0 = clerp(SLL3.C0,CFrame.new(-0.5,-2,0)*CFrame.Angles(-0.3,0,0),0.3)
        SH2.C0 = clerp(SH2.C0,CFrame.new(0,1.5,0)*CFrame.Angles(0.4,0,0),0.3)
        ST3.C0 = clerp(ST3.C0,CFrame.new(-1,0,-2)*CFrame.new(0,0-.1*math.sin(tick()*6),0)*CFrame.Angles(-0.4,0,0),0.3)
            end
        end
end
