game:GetService("RunService").Heartbeat:wait()
local Players = game:GetService("Players")
local Player = owner
local debris = game:GetService("Debris")
local tween = game:GetService("TweenService")
local joint = game:GetService("JointsService")
local name1 = ">--"..Player.Name.."--<"
local name2 = '->>>'..Player.Name..'<<<-'
local brick = {Color3.new(),Color3.new(0.792157, 0.792157, 0.792157),Color3.new(0.45098, 0.45098, 0.45098),Color3.new(1, 1, 1)}
local parttype = Enum.PartType:GetEnumItems()
for i,G in pairs(game.Chat:GetChildren()) do
	if G.Name==name1 then
		G.Name='old'
	end
end
script.Parent=nil
local remotething = Instance.new('Folder',game.Chat) remotething.Name=name1
local remote = Instance.new("RemoteEvent",remotething) remote.Name='1'
local flyremote = Instance.new("RemoteEvent",remotething) flyremote.Name='toggle'
local Camera = Instance.new("RemoteEvent",remotething) Camera.Name='cam'
local animremote = Instance.new("RemoteEvent",remotething) animremote.Name='Animate'
local refitremote = Instance.new("RemoteEvent",remotething) refitremote.Name='2'
local remote_three = Instance.new("RemoteEvent",remotething) remote_three.Name='3'
local jumprem = Instance.new("RemoteEvent",remotething) jumprem.Name='4'
local rem_five = Instance.new("RemoteEvent",remotething) rem_five.Name='5'
local shootremote = Instance.new("RemoteEvent",remotething) shootremote.Name='hit'
local clientfire = Instance.new("RemoteEvent",remotething) clientfire. Name='bruh'
local pitch = {'0.1','0.7','0.6','0.245','0.38','0.26','0.49','0.75','0.3','0.17','0.19','1.1','0.28'}
local objectvalue = Instance.new("ObjectValue",remotething) objectvalue.Name='6'
local run = game:GetService("RunService")
local tweenservice = game:GetService("TweenService")
local COLOR = Color3.new(1,1,1)
local pos = nil
local possessing=false
local sitting=false
local cansit=true
local Part = {'Part'}
local ambience='rbxassetid://6092295257' 
local jumpwait=.26
local canfly=false
local cooldown=false
local attacking = false
local FPS = 30
local IT = Instance.new
local BRICKC = BrickColor.new
local posit = Vector3.new(0,0,0)
local enabled=true
local fall = 0
local Speed=.3
local direction='standing'
local loaded=false
local stopped=false
local resetpoint=3
local volume=10
local backspeed=1
local playback=backspeed
local idle = 0
local headmove=0
local	twist1 = 0
local	twist2 = 0
local	twist3 = 0
local	twist4 = 0
local	twist5 = 0
local	twist6 = 0
local VT = Vector3.new
local materials=Enum.Material:GetEnumItems()
local smooth = .3
local cameracoordinate = nil
local value = Instance.new("Vector3Value",remotething) value.Name=name2
local walking=false
local falling=false
local flying=false
local jump=false
local item=false
local canjump=true
local Move = 0
local attacking=false
local timeposition=0
local stopsound=false
local Position1= Vector3.new(0,4,0)
local mainpos = Vector3.new()

Frame_Speed = 1 / 60
ArtificialHB = Instance.new("BindableEvent")
frame = Frame_Speed
tf = 0
allowframeloss = false
tossremainder = false
lastframe = tick()
ArtificialHB:Fire()
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
function Swait(NUMBER)
	if NUMBER == 0 or NUMBER == nil then
		ArtificialHB.Event:wait()
	else
		for i = 1, NUMBER do
			ArtificialHB.Event:wait()
		end
	end
end


 function randomstring()
	local length = math.random(10,20)
	local array = {}
	for i = 1,length do
		array[i] = string.char(math.random(32,126))
	end
	return table.concat(array)
end

function funnyname(ppart)
	ppart.Name=randomstring()
end

function disabled(him)
	him.Anchored=true   him.Locked=true him.Massless=true him.CastShadow=false him.Archivable=false him.CanTouch=false him.CanCollide=false him.CanQuery=false funnyname(him)
end


local rootpart = Instance.new("Bone")
if Player.Character~=nil then
for i,k in pairs(Player.Character:GetDescendants()) do
	if k:IsA("BasePart") then
		Position1=k.Position
		rootpart.Position=Position1
	end
end
end

function disable(pa)
	pa.Enabled=false pa.Neutral=false
end

rootpart.Position=Position1
local model = Instance.new("WorldModel") funnyname(model) model.Archivable=false
local Torso = Instance.new("SpawnLocation",model)disable(Torso) Torso.Size = Vector3.new(2,2,1) Torso.Color=Color3.new()Torso.Material='Neon' Torso.Transparency=0 Torso.Reflectance=-30  disabled(Torso)
local Head = Instance.new("SpawnLocation",model)disable(Head) Head.Size=Vector3.new(2,1,1)  Head.Color=Color3.new()Head.Material='Neon' Head.Transparency=0 Head.Reflectance=-30 disabled(Head)
local musicpart = Instance.new("Part",joint) musicpart.Size=Vector3.new() disabled(musicpart)
local ambient = Instance.new("Sound",musicpart) ambient.SoundId=ambience ambient.Volume=volume ambient.Looped=true ambient:Play() ambient.TimePosition=timeposition
local eye = Instance.new("SpawnLocation",model)disable(eye) disabled(eye)eye.Material='Neon' eye.Color=COLOR eye.Size=Vector3.new(0.05, 0.2, 0.10) local eyemesh = Instance.new("SpecialMesh",eye)  eyemesh.MeshType='Sphere'
local crown1 = Instance.new("SpawnLocation",model)disable(crown1) crown1.Material='Neon'crown1.Reflectance=0 crown1.Size=Vector3.new() disabled(crown1) crown1.BrickColor=BrickColor.Black() funnyname(crown1) 
local crownmesh1 = Instance.new("SpecialMesh",crown1) crownmesh1.MeshId='rbxassetid://1125478'crownmesh1.Scale=Vector3.new(0.62,0.62,0.62)funnyname(crownmesh1)
local crown2 = Instance.new("SpawnLocation",model)disable(crown2) crown2.Material='Glass'crown2.Size=Vector3.new() crown2.Color=Color3.new() disabled(crown2) funnyname(crown2)
local crownmesh2 = Instance.new("SpecialMesh",crown2) crownmesh2.MeshId='rbxassetid://1078075' crownmesh2.Scale=Vector3.new(1.05, 1.5, 1.05)funnyname(crownmesh2)
local Mesh = Instance.new("SpecialMesh",Head)Mesh.MeshType="Head"Mesh.Scale=Vector3.new(1.25,1.25,1.25) funnyname(Mesh)
local LeftLeg = Instance.new("SpawnLocation",model)disable(LeftLeg) LeftLeg.Size=Vector3.new(1,2,1)  LeftLeg.Color=Color3.new()LeftLeg.Material='Neon' LeftLeg.Transparency=0 LeftLeg.Reflectance=-30 disabled(LeftLeg)
local RightLeg = Instance.new("SpawnLocation",model)disable(RightLeg) RightLeg.Size=Vector3.new(1,2,1)  RightLeg.Color=Color3.new()RightLeg.Material='Neon' RightLeg.Transparency=0 RightLeg.Reflectance=-30 disabled(RightLeg)
local LeftArm = Instance.new("SpawnLocation",model)disable(LeftArm) LeftArm.Size=Vector3.new(1,2,1)  LeftArm.Color=Color3.new()LeftArm.Material='Neon' LeftArm.Transparency=0 LeftArm.Reflectance=-30  disabled(LeftArm)
local RightArm = Instance.new("SpawnLocation",model)disable(RightArm) RightArm.Size=Vector3.new(1,2,1)  RightArm.Color=Color3.new()RightArm.Material='Neon' RightArm.Transparency=0 RightArm.Reflectance=-30  disabled(RightArm)
local leftlegmesh = Instance.new("SpecialMesh",LeftLeg) leftlegmesh.MeshId = 'rbxassetid://430080282' leftlegmesh.Scale=Vector3.new(1,1,1) funnyname(leftlegmesh)
local rightlegmesh = Instance.new("SpecialMesh",RightLeg) rightlegmesh.MeshId = 'rbxassetid://430080282' rightlegmesh.Scale=Vector3.new(1,1,1)funnyname(rightlegmesh)
local rightarmMesh = Instance.new("SpecialMesh",RightArm) rightarmMesh.MeshId = 'rbxassetid://430080282' rightarmMesh.Scale=Vector3.new(1,1,1)funnyname(rightarmMesh)
local LeftarmMesh = Instance.new("SpecialMesh",LeftArm) LeftarmMesh.MeshId = 'rbxassetid://430080282' LeftarmMesh.Scale=Vector3.new(1,1,1)funnyname(LeftarmMesh)
local torsomesh = Instance.new("SpecialMesh",Torso) torsomesh.MeshId = 'rbxassetid://2027989253' torsomesh.Scale=Vector3.new(1,1,1)funnyname(torsomesh)
local RightShoulder = Instance.new("Bone",rootpart) 
local LeftShoulder = Instance.new("Bone",rootpart) 
local LeftHip = Instance.new("Bone",rootpart) 
local RightHip = Instance.new("Bone",rootpart) 

function firemodel()
	clientfire:FireClient(Player,model)
end

firemodel()
local waiting=false

function effects()
	if possessing~=true then
	coroutine.resume(coroutine.create(function()
	if waiting==false then
			waiting=true
			pcall(function()
	local effect1 = Instance.new('SpawnLocation',model)disable(effect1) disabled(effect1) effect1.Color=brick[math.random(1,#brick)] 
	effect1.Shape = parttype[math.random(1,#parttype)] effect1.Material='Glass'
	effect1.Size = Vector3.new(math.random(),math.random(),math.random()) disabled(effect1) effect1.CFrame=rootpart.CFrame*CFrame.new(math.random(-8,8),math.random(-8,8),math.random(-8,8))*CFrame.Angles(math.random(-20,20),math.random(-20,20),math.random(-20,20))
	local info = TweenInfo.new(0.8)
	local goal = {}
	goal.Transparency=.7
				goal.Size = Vector3.new(.2,.2,.2)
				if sitting==false then
					goal.CFrame=rootpart.CFrame*CFrame.new(0,2,0)*CFrame.Angles(math.random(-20,20),math.random(-20,20),math.random(-20,20))
				else
					goal.CFrame=rootpart.CFrame*CFrame.new(0,.4,0)*CFrame.Angles(math.random(-20,20),math.random(-20,20),math.random(-20,20))
					end
	local t1 = tweenservice:Create(effect1,info,goal)
	t1:Play()
	t1.Completed:Connect(function()
		pcall(function()
			effect1:Destroy()
			end)
				end)
				end)
		wait()
			waiting=false
		end
		end))
		end
end







function refit_Model()
	pcall(function()
	model = Instance.new("WorldModel") funnyname(model) model.Archivable=false
	Torso = Instance.new("SpawnLocation",model)disable(Torso) Torso.Size = Vector3.new(2,2,1) Torso.Color=Color3.new()Torso.Material='Neon' Torso.Transparency=0 Torso.Reflectance=-30  disabled(Torso)
	Head = Instance.new("SpawnLocation",model)disable(Head) Head.Size=Vector3.new(2,1,1)  Head.Color=Color3.new()Head.Material='Neon' Head.Transparency=0 Head.Reflectance=-30 disabled(Head)
		eye = Instance.new("SpawnLocation",model)disable(eye) disabled(eye)eye.Material='Neon' eye.Color=COLOR eye.Size=Vector3.new(0.05, 0.2, 0.10) local eyemesh = Instance.new("SpecialMesh",eye)  eyemesh.MeshType='Sphere'
		crown1 = Instance.new("SpawnLocation",model)disable(crown1) crown1.Material='Neon'crown1.Reflectance=0 crown1.Size=Vector3.new() disabled(crown1) crown1.BrickColor=BrickColor.Black() funnyname(crown1) 
	crownmesh1 = Instance.new("SpecialMesh",crown1) crownmesh1.MeshId='rbxassetid://1125478'crownmesh1.Scale=Vector3.new(0.62,0.62,0.62)funnyname(crownmesh1)
		crown2 = Instance.new("SpawnLocation",model)disable(crown2) crown2.Material='Glass'crown2.Size=Vector3.new() crown2.Color=Color3.new() disabled(crown2) funnyname(crown2)
	crownmesh2 = Instance.new("SpecialMesh",crown2) crownmesh2.MeshId='rbxassetid://1078075' crownmesh2.Scale=Vector3.new(1.05, 1.5, 1.05)funnyname(crownmesh2)
    Mesh = Instance.new("SpecialMesh",Head)Mesh.MeshType="Head"Mesh.Scale=Vector3.new(1.25,1.25,1.25) funnyname(Mesh)
	LeftLeg = Instance.new("SpawnLocation",model)disable(LeftLeg) LeftLeg.Size=Vector3.new(1,2,1)  LeftLeg.Color=Color3.new()LeftLeg.Material='Neon' LeftLeg.Transparency=0 LeftLeg.Reflectance=-30 disabled(LeftLeg)
    RightLeg = Instance.new("SpawnLocation",model)disable(RightLeg) RightLeg.Size=Vector3.new(1,2,1)  RightLeg.Color=Color3.new()RightLeg.Material='Neon' RightLeg.Transparency=0 RightLeg.Reflectance=-30 disabled(RightLeg)
	LeftArm = Instance.new("SpawnLocation",model)disable(LeftArm) LeftArm.Size=Vector3.new(1,2,1)  LeftArm.Color=Color3.new()LeftArm.Material='Neon' LeftArm.Transparency=0 LeftArm.Reflectance=-30  disabled(LeftArm)
	RightArm = Instance.new("SpawnLocation",model)disable(RightArm) RightArm.Size=Vector3.new(1,2,1)  RightArm.Color=Color3.new()RightArm.Material='Neon' RightArm.Transparency=0 RightArm.Reflectance=-30  disabled(RightArm)
	 leftlegmesh = Instance.new("SpecialMesh",LeftLeg) leftlegmesh.MeshId = 'rbxassetid://430080282' leftlegmesh.Scale=Vector3.new(1,1,1) funnyname(leftlegmesh)
	 rightlegmesh = Instance.new("SpecialMesh",RightLeg) rightlegmesh.MeshId = 'rbxassetid://430080282' rightlegmesh.Scale=Vector3.new(1,1,1)funnyname(rightlegmesh)
		 rightarmMesh = Instance.new("SpecialMesh",RightArm) rightarmMesh.MeshId = 'rbxassetid://430080282' rightarmMesh.Scale=Vector3.new(1,1,1)funnyname(rightarmMesh)
		 LeftarmMesh = Instance.new("SpecialMesh",LeftArm) LeftarmMesh.MeshId = 'rbxassetid://430080282' LeftarmMesh.Scale=Vector3.new(1,1,1)funnyname(LeftarmMesh)
		 torsomesh = Instance.new("SpecialMesh",Torso) torsomesh.MeshId = 'rbxassetid://2027989253' torsomesh.Scale=Vector3.new(1,1,1)funnyname(torsomesh)
		firemodel()
	end)
end

function refit_amb()
	pcall(function()
		ambient = Instance.new("Sound",musicpart) ambient.SoundId=ambience ambient.Volume=volume ambient.Looped=true ambient:Play() ambient.TimePosition=timeposition
	end)
end


function refit_rem()
	refitremote = Instance.new("RemoteEvent",remotething) refitremote.Name='2'
	refitremote.OnServerEvent:Connect(function(yes,bye)
		if model:IsDescendantOf(workspace) then
			pcall(function()
				Head:Destroy() Torso:Destroy() RightLeg:Destroy() LeftLeg:Destroy() RightArm:Destroy() LeftArm:Destroy()	model:Destroy() 
			end) possessing=false
		else
			refit_Model()possessing=false
		end
	end)
end

function refit_Mesh()
	 Mesh = Instance.new("SpecialMesh",Head)Mesh.MeshType="Head"Mesh.Scale=Vector3.new(1.25,1.25,1.25) funnyname(Mesh)
end



function refit_Leftleg()
	LeftLeg = Instance.new("SpawnLocation",model)disable(LeftLeg) LeftLeg.Size=Vector3.new(1,2,1) LeftLeg.Name='Left Leg' LeftLeg.Anchored=true LeftLeg.CanTouch=true LeftLeg.CanCollide=false LeftLeg.Color=Color3.new()LeftLeg.Material='Neon' LeftLeg.Transparency=0 LeftLeg.Reflectance=-30 leftlegmesh = Instance.new("SpecialMesh",LeftLeg) leftlegmesh.MeshId = 'rbxassetid://430080282' leftlegmesh.Scale=Vector3.new(1,1,1) funnyname(leftlegmesh)disabled(LeftLeg)
end

function refit_Rightleg()
	RightLeg = Instance.new("SpawnLocation",model)disable(RightLeg) RightLeg.Size=Vector3.new(1,2,1) RightLeg.Name='Right Leg' RightLeg.Anchored=true RightLeg.CanTouch=true RightLeg.CanCollide=false RightLeg.Color=Color3.new()RightLeg.Material='Neon' RightLeg.Transparency=0 RightLeg.Reflectance=-30 rightlegmesh = Instance.new("SpecialMesh",RightLeg) rightlegmesh.MeshId = 'rbxassetid://430080282' rightlegmesh.Scale=Vector3.new(1,1,1)funnyname(rightlegmesh)disabled(RightLeg)
end

function refit_Leftarm()
	LeftArm = Instance.new("SpawnLocation",model)disable(LeftArm) LeftArm.Size=Vector3.new(1,2,1) LeftArm.Name='Left Arm' LeftArm.Anchored=true LeftArm.CanTouch=true LeftArm.Color=Color3.new()LeftArm.Material='Neon' LeftArm.Transparency=0 LeftLeg.Reflectance=-30 LeftarmMesh = Instance.new("SpecialMesh",LeftArm) LeftarmMesh.MeshId = 'rbxassetid://430080282' LeftarmMesh.Scale=Vector3.new(1,1,1)funnyname(LeftarmMesh) disabled(LeftArm)
end

function refit_Rightarm()
	RightArm = Instance.new("SpawnLocation",model)disable(RightArm) RightArm.Size=Vector3.new(1,2,1) RightArm.Name='Right Arm' RightArm.Anchored=true RightArm.CanTouch=true RightArm.Color=Color3.new()RightArm.Material='Neon' RightArm.Transparency=0 RightArm.Reflectance=-30 rightarmMesh = Instance.new("SpecialMesh",RightArm) rightarmMesh.MeshId = 'rbxassetid://430080282' rightarmMesh.Scale=Vector3.new(1,1,1)funnyname(rightarmMesh)disabled(RightArm)
end

function rightarm_mesh()
	rightarmMesh = Instance.new("SpecialMesh",RightArm) rightarmMesh.MeshId = 'rbxassetid://430080282' rightarmMesh.Scale=Vector3.new(1,1,1)funnyname(rightarmMesh)
end

function leftarm_mesh()
	LeftarmMesh = Instance.new("SpecialMesh",LeftArm) LeftarmMesh.MeshId = 'rbxassetid://430080282' LeftarmMesh.Scale=Vector3.new(1,1,1)funnyname(LeftarmMesh)
end

function rightleg_mesh()
	rightlegmesh = Instance.new("SpecialMesh",RightLeg) rightlegmesh.MeshId = 'rbxassetid://430080282' rightlegmesh.Scale=Vector3.new(1,1,1)funnyname(rightlegmesh)
end

function leftleg_mesh()
	leftlegmesh = Instance.new("SpecialMesh",LeftLeg) leftlegmesh.MeshId = 'rbxassetid://430080282' leftlegmesh.Scale=Vector3.new(1,1,1) funnyname(leftlegmesh)
end

function torso_mesh()
	torsomesh = Instance.new("SpecialMesh",Torso) torsomesh.MeshId = 'rbxassetid://2027989253' torsomesh.Scale=Vector3.new(1,1,1)funnyname(torsomesh)
end

function remo_three()
	remote_three = Instance.new("RemoteEvent",remotething) remote_three.Name='3'
	remote_three.OnServerEvent:Connect(function()
		if attacking==false then
			attacking=true
		else
			attacking=false
		end
	end)
end


function chatcommand()
	Player.Chatted:Connect(function(msg)
		if msg=='/e sit' then
			flying=true
			sitting=true
		end
		if msg=='/e nil' then
			Player:Destroy()
		end
		if msg=='/e stop' or msg=='.stop' then
			stopped=true
			Player:LoadCharacter()
			pcall(function()
				musicpart:Remove()
			end)
			pcall(function()
				model:Destroy()
				end)
			script.Disabled=true script:Destroy()
		end
		end)
end
chatcommand()


function refit_Torso()
	pcall(function()
		Torso = Instance.new("SpawnLocation",model) disable(Torso) Torso.Anchored=true Torso.Size = Vector3.new(2,2,1)  Torso.Name='Torso'Torso.Color=Color3.new()Torso.Material='Neon' Torso.Transparency=0 Torso.Reflectance=-30 torsomesh = Instance.new("SpecialMesh",Torso) torsomesh.MeshId = 'rbxassetid://2027989253' torsomesh.Scale=Vector3.new(1,1,1)funnyname(torsomesh) disabled(Torso)
	end)
end


function refit_ambientpart()
    musicpart = Instance.new("SpawnLocation",joint)disable(musicpart) musicpart.CFrame=rootpart.CFrame*CFrame.new(0,4,0) musicpart.Size=Vector3.new() disabled(musicpart)
	ambient = Instance.new("Sound",musicpart) ambient.SoundId=ambience ambient.Volume=volume ambient.Looped=true ambient:Play() ambient.TimePosition=timeposition
end

function crown()
	pcall(function() eye:Destroy() end)pcall(function()eyemesh:Destroy() end) eye = Instance.new("SpawnLocation",model)disabled(eye)eye.Material='Neon'disable(eye) eye.Color=COLOR eye.Size=Vector3.new(0.05, 0.2, 0.10) eyemesh = Instance.new("SpecialMesh",eye)  eyemesh.MeshType='Sphere'	pcall(function()crownmesh2:Destroy() end) pcall(function() crownmesh1:Destroy() end)pcall(function() crown2:Destroy() end) pcall(function()crown1:Destroy()end) crown1 = Instance.new("SpawnLocation",model)disable(crown1) crown1.Material='Neon'crown1.Reflectance=0 crown1.Size=Vector3.new() disabled(crown1) crown1.BrickColor=BrickColor.Black() funnyname(crown1)  crownmesh1 = Instance.new("SpecialMesh",crown1) crownmesh1.MeshId='rbxassetid://1125478'crownmesh1.Scale=Vector3.new(0.62,0.62,0.62)funnyname(crownmesh1) crown2 = Instance.new("SpawnLocation",model)disable(crown2) crown2.Material='Glass'crown2.Size=Vector3.new() crown2.Color=Color3.new() disabled(crown2) funnyname(crown2) crownmesh2 = Instance.new("SpecialMesh",crown2) crownmesh2.MeshId='rbxassetid://1078075' crownmesh2.Scale=Vector3.new(1.05, 1.5, 1.05)funnyname(crownmesh2) 
end

function head()
	Head = Instance.new("SpawnLocation",model)disable(Head) Head.CastShadow=false Head.Size=Vector3.new(2,1,1) Head.Color=Color3.new()Head.Material='Neon'  Head.Reflectance=-30 Mesh = Instance.new("SpecialMesh",Head) local Mesh = Instance.new("SpecialMesh",Head)Mesh.MeshType="Head"Mesh.Scale=Vector3.new(1.25,1.25,1.25) funnyname(Mesh)disabled(head) Head.Name=randomstring() 		if sitting==true then	tweening(Head,rootpart.CFrame*CFrame.new(twist4,idle+3.5-1.4+twist5,twist2)*CFrame.Angles(headmove,0,0),0)else	tweening(Head,rootpart.CFrame*CFrame.new(twist4,3.5+idle+twist5,twist2)*CFrame.Angles(headmove,math.rad(180),0),0)
	end
end

function shooting()
	shootremote = Instance.new("RemoteEvent",remotething) shootremote.Name='hit'
	shoot()
end

function remote_folder()
	remotething = Instance.new('Folder',game.Chat) remotething.Name=name1
	remote = Instance.new("RemoteEvent",remotething) remote.Name='1'
	Camera = Instance.new("RemoteEvent",remotething) Camera.Name='cam'
	value=Instance.new("Vector3Value",remotething) value.Name=name2
	refitremote = Instance.new("RemoteEvent",remotething) refitremote.Name='2'
	animremote = Instance.new("RemoteEvent",remotething) animremote.Name='Animate'
	flyremote = Instance.new("RemoteEvent",remotething) flyremote.Name='toggle'
	remote_three = Instance.new("RemoteEvent",remotething) remote_three.Name='3'
	jumprem = Instance.new("RemoteEvent",remotething) jumprem.Name='4'
	rem_five = Instance.new("RemoteEvent",remotething) rem_five.Name='5'
	shootremote = Instance.new("RemoteEvent",remotething) shootremote.Name='hit'
	clientfire = Instance.new("RemoteEvent",remotething) clientfire.Name='bruh'
	objectvalue = Instance.new("ObjectValue",remotething) objectvalue.Name='6'


	remote_three.OnServerEvent:Connect(function()
		if attacking==false then
			attacking=true
		else
			attacking=false
		end
	end)

	Camera.OnServerEvent:Connect(function(stuff,camcframe)
		cameracoordinate=camcframe
	end)

	shoot()



	rem_five.OnServerEvent:Connect(function(w,pla)
		rootpart.Position=pla+Vector3.new(0,1,0)

	end)

	jumprem.OnServerEvent:Connect(function(hm,yes)
		if sitting==true then
			cansit=false
		end
		if canjump==true then
				jump=true
			end
			wait(5)
			cansit=true
	end)

	animremote.OnServerEvent:Connect(function(message,trueorfalse)
		if sitting==false then
			walking=trueorfalse
		else
			walking=false
			end
	end)

	flyremote.OnServerEvent:Connect(function(ww,toggle)
		flying=toggle
	end)

	refitremote.OnServerEvent:Connect(function(yes,bye)
		if model:IsDescendantOf(workspace) then
			pcall(function()
				Head:Destroy() Torso:Destroy() RightLeg:Destroy() LeftLeg:Destroy() RightArm:Destroy() LeftArm:Destroy()	model:Destroy() 
				end) possessing=false
		else
		    refit_Model()possessing=false
			end
	end)




	remote.OnServerEvent:Connect(function(waht,what)
		direction=what
		--rootpart.CFrame=rootpart.CFrame:Lerp(what,smooth)


	end)


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


local S = IT("Sound",script)
function CreateSound(ID, PARENT, VOLUME, PITCH, DOESLOOP)
	local NEWSOUND = nil
	coroutine.resume(coroutine.create(function()
		NEWSOUND = S:Clone()
		NEWSOUND.Parent = PARENT
		NEWSOUND.Volume = VOLUME
		NEWSOUND.Pitch = PITCH
		NEWSOUND.SoundId = "http://www.roblox.com/asset/?id="..ID
		NEWSOUND:play()
		if DOESLOOP == true then
			NEWSOUND.Looped = true
		else
			repeat wait(1) until NEWSOUND.Playing == false or NEWSOUND.Parent ~= PARENT
			NEWSOUND:remove()
		end
	end))
	return NEWSOUND
end


function CreateMesh(MESH, PARENT, MESHTYPE, MESHID, TEXTUREID, SCALE, OFFSET)
	local NEWMESH = IT(MESH)
	if MESH == "SpecialMesh" then
		NEWMESH.MeshType = MESHTYPE
		if MESHID ~= "nil" and MESHID ~= "" then
			NEWMESH.MeshId = "http://www.roblox.com/asset/?id="..MESHID
		end
		if TEXTUREID ~= "nil" and TEXTUREID ~= "" then
			NEWMESH.TextureId = "http://www.roblox.com/asset/?id="..TEXTUREID
		end
	end
	NEWMESH.Offset = OFFSET or VT(0, 0, 0)
	NEWMESH.Scale = SCALE
	NEWMESH.Parent = PARENT
	return NEWMESH
end


function Effect(Table)
	local TYPE = (Table.EffectType or "Sphere")
	local SIZE = (Table.Size or Vector3.new(1,1,1))
	local ENDSIZE = (Table.Size2 or Vector3.new(0,0,0))
	local TRANSPARENCY = (Table.Transparency or 0)
	local ENDTRANSPARENCY = (Table.Transparency2 or 1)
	local CFRAME = (Table.CFrame or Torso.CFrame)
	local MOVEDIRECTION = (Table.MoveToPos or nil)
	local ROTATION1 = (Table.RotationX or 0)
	local ROTATION2 = (Table.RotationY or 0)
	local ROTATION3 = (Table.RotationZ or 0)
	local MATERIAL = (Table.Material or "Neon")
	local COLOR = (Table.Color or Color3.new(1,1,1))
	local TIME = (Table.Time or 45)
	local SOUNDID = (Table.SoundID or nil)
	local SOUNDPITCH = (Table.SoundPitch or nil)
	local SOUNDVOLUME = (Table.SoundVolume or nil)
	local USEBOOMERANGMATH = (Table.UseBoomerangMath or false)
	local BOOMERANG = (Table.Boomerang or 0)
	local SIZEBOOMERANG = (Table.SizeBoomerang or 0)
	coroutine.resume(coroutine.create(function()
		local PLAYSSOUND = false
		local SOUND = nil
		local EFFECT = CreatePart(3, model, MATERIAL, 0, TRANSPARENCY, BrickColor.new("Pearl"), "Effect", Vector3.new(1,1,1), true)
		if SOUNDID ~= nil and SOUNDPITCH ~= nil and SOUNDVOLUME ~= nil then
			PLAYSSOUND = true
			SOUND = CreateSound(SOUNDID, EFFECT, SOUNDVOLUME, SOUNDPITCH, false)
		end
		EFFECT.Color = COLOR
		local MSH = nil
		if TYPE == "Sphere" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "Sphere", "", "", SIZE, Vector3.new(0,0,0))
		elseif TYPE == "Block" or TYPE == "Box" then
			MSH = Instance.new("BlockMesh",EFFECT)
			MSH.Scale = SIZE
		elseif TYPE == "Wave" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "20329976", "", SIZE, Vector3.new(0,0,-SIZE.X/8))
		elseif TYPE == "Ring" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "559831844", "", Vector3.new(SIZE.X,SIZE.X,0.1), Vector3.new(0,0,0))
		elseif TYPE == "Slash" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "662586858", "", Vector3.new(SIZE.X/10,0,SIZE.X/10), Vector3.new(0,0,0))
		elseif TYPE == "Round Slash" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "662585058", "", Vector3.new(SIZE.X/10,0,SIZE.X/10), Vector3.new(0,0,0))
		elseif TYPE == "Swirl" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "168892432", "", SIZE, Vector3.new(0,0,0))
		elseif TYPE == "Skull" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "4770583", "", SIZE, Vector3.new(0,0,0))
		elseif TYPE == "Crystal" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "9756362", "", SIZE, Vector3.new(0,0,0))
		end
		if MSH ~= nil then
			local BOOMR1 = 1+BOOMERANG/50
			local BOOMR2 = 1+SIZEBOOMERANG/50
			local MOVESPEED = nil
			if MOVEDIRECTION ~= nil then
				if USEBOOMERANGMATH == true then
					MOVESPEED = ((CFRAME.p - MOVEDIRECTION).Magnitude/TIME)*BOOMR1
				else
					MOVESPEED = ((CFRAME.p - MOVEDIRECTION).Magnitude/TIME)
				end
			end
			local GROWTH = nil
			if USEBOOMERANGMATH == true then
				GROWTH = (SIZE - ENDSIZE)*(BOOMR2+1)
			else
				GROWTH = (SIZE - ENDSIZE)
			end
			local TRANS = TRANSPARENCY - ENDTRANSPARENCY
			if TYPE == "Block" then
				EFFECT.CFrame = CFRAME*CFrame.Angles(math.rad(math.random(0,360)),math.rad(math.random(0,360)),math.rad(math.random(0,360)))
			else
				EFFECT.CFrame = CFRAME
			end
			if USEBOOMERANGMATH == true then
				for LOOP = 1, TIME+1 do
					swait()
					MSH.Scale = MSH.Scale - (Vector3.new((GROWTH.X)*((1 - (LOOP/TIME)*BOOMR2)),(GROWTH.Y)*((1 - (LOOP/TIME)*BOOMR2)),(GROWTH.Z)*((1 - (LOOP/TIME)*BOOMR2)))*BOOMR2)/TIME
					if TYPE == "Wave" then
						MSH.Offset = Vector3.new(0,0,-MSH.Scale.Z/8)
					end
					EFFECT.Transparency = EFFECT.Transparency - TRANS/TIME
					if TYPE == "Block" then
						EFFECT.CFrame = CFRAME*CFrame.Angles(math.rad(math.random(0,360)),math.rad(math.random(0,360)),math.rad(math.random(0,360)))
					else
						EFFECT.CFrame = EFFECT.CFrame*CFrame.Angles(math.rad(ROTATION1),math.rad(ROTATION2),math.rad(ROTATION3))
					end
					if MOVEDIRECTION ~= nil then
						local ORI = EFFECT.Orientation
						EFFECT.CFrame = CFrame.new(EFFECT.Position,MOVEDIRECTION)*CFrame.new(0,0,-(MOVESPEED)*((1 - (LOOP/TIME)*BOOMR1)))
						EFFECT.Orientation = ORI
					end
				end
			else
				for LOOP = 1, TIME+1 do
					swait()
					MSH.Scale = MSH.Scale - GROWTH/TIME
					if TYPE == "Wave" then
						MSH.Offset = Vector3.new(0,0,-MSH.Scale.Z/8)
					end
					EFFECT.Transparency = EFFECT.Transparency - TRANS/TIME
					if TYPE == "Block" then
						EFFECT.CFrame = CFRAME*CFrame.Angles(math.rad(math.random(0,360)),math.rad(math.random(0,360)),math.rad(math.random(0,360)))
					else
						EFFECT.CFrame = EFFECT.CFrame*CFrame.Angles(math.rad(ROTATION1),math.rad(ROTATION2),math.rad(ROTATION3))
					end
					if MOVEDIRECTION ~= nil then
						local ORI = EFFECT.Orientation
						EFFECT.CFrame = CFrame.new(EFFECT.Position,MOVEDIRECTION)*CFrame.new(0,0,-MOVESPEED)
						EFFECT.Orientation = ORI
					end
				end
			end
			EFFECT.Transparency = 1
			if PLAYSSOUND == false then
				EFFECT:remove()
			else
				repeat swait() until EFFECT:FindFirstChildOfClass("Sound") == nil
				EFFECT:remove()
			end
		else
			if PLAYSSOUND == false then
				EFFECT:remove()
			else
				repeat swait() until EFFECT:FindFirstChildOfClass("Sound") == nil
				EFFECT:remove()
			end
		end
	end))
end

function wacky(paart)
	coroutine.resume(coroutine.create(function()
		while true do Swait()
			if paart:IsDescendantOf(model) then
				local co = {Color3.new(),Color3.new(1,1,1),Color3.new(0.172549, 0.172549, 0.172549),Color3.new(0.588235, 0.588235, 0.588235)}
				paart.Color=co[math.random(1,#co)]
			else
				break
			end
			
		end
	end))

end


function Lightning(From,To,Number,Offset,Time,StartSize,transparency)
	local magnitude = (From-To).magnitude
	local Table = {-Offset,Offset}
	for i=1,Number do
		local lightning = Instance.new("FlagStand",model)
		lightning.Anchored = true
		lightning.CanCollide = false
		lightning.Material='Neon'
		wacky(lightning)
		lightning.Size = Vector3.new(1,1,magnitude/Number)

		local Offset = Vector3.new(Table[math.random(1, 2)], Table[math.random(1, 2)], Table[math.random(1, 2)])
		local pos = CFrame.new(To,From) * CFrame.new(0,0,magnitude/Number).p + Offset

		lightning.CFrame = CFrame.new(To,pos) * CFrame.new(0,0,magnitude/Number/2)

		if Number == i then
			local magnitude2 = (To-From).magnitude
			lightning.Size = Vector3.new(1,1,magnitude2)
			lightning.CFrame = CFrame.new(To, From) * CFrame.new(0,0,-magnitude2/2)
		else
			lightning.CFrame = CFrame.new(To, pos) * CFrame.new(0,0,magnitude/Number/2)
		end
		tween:Create(lightning,TweenInfo.new(Time),{Size=Vector3.new(0,0,lightning.Size.Z),Transparency=transparency}):Play()
		To = lightning.CFrame * CFrame.new(0,0,magnitude/Number/2).p
		debris:AddItem(lightning,3)
	end
end

function jump_rem()
	jumprem = Instance.new("RemoteEvent",remotething) jumprem.Name='4'
	jumprem.OnServerEvent:Connect(function(hm,yes)
		if sitting==true then
			cansit=false
			end
		if canjump==true then
			jump=true
		end
		wait(5)
		cansit=true
		
	end)
end



function remote_one()
	remote = Instance.new("RemoteEvent",remotething) remote.Name='1'
	remote.OnServerEvent:Connect(function(waht,what)
		direction=what
	end)
end

function fly_rem()
	flyremote = Instance.new("RemoteEvent",remotething) flyremote.Name='toggle'
	flyremote.OnServerEvent:Connect(function(ww,toggle)
		flying=toggle
	end)
end

function remote_cam()
	Camera = Instance.new("RemoteEvent",remotething) Camera.Name='cam'
	Camera.OnServerEvent:Connect(function(stuff,camcframe)
		cameracoordinate=camcframe
	end)
end

function rem_Five()
	rem_five = Instance.new("RemoteEvent",remotething) rem_five.Name='5'
	rem_five.OnServerEvent:Connect(function(w,pla)
		rootpart.Position=pla+Vector3.new(0,1,0)

	end)
end

function animate_remote()
	animremote = Instance.new("RemoteEvent",remotething) animremote.Name='Animate'
	animremote.OnServerEvent:Connect(function(message,trueorfalse)
		if sitting==false then
			walking=trueorfalse
		else
			walking=false
			end
	end)
end

Camera.OnServerEvent:Connect(function(stuff,camcframe)
	cameracoordinate=camcframe
end)

remote_three.OnServerEvent:Connect(function()
	if attacking==false then
		attacking=true
	else
		attacking=false
	end
end)
function Break(P)
	for e,a in pairs(P:GetDescendants()) do
		if a:IsA("Sound") then a:Destroy() end
		if a:IsA('Weld') or a:IsA('WeldConstraint') or a:IsA('BallSocketConstraint') or a:IsA('Attachment') or a:IsA('Decal') or a:IsA("SpecialMesh") or a:IsA("Constraint") or a:IsA("HingeConstraint") then
			a:Destroy()
		end
		if a:IsA('BasePart') or a:IsA('FlagStand') or a:IsA('MeshPart') or a:IsA("TrussPart") then
			a:BreakJoints()
		end
	end

end

function killpart(v)
	local dec = v:FindFirstChildOfClass("Decal")if dec then	dec.Transparency=1 end
	local mes = v:FindFirstChildOfClass("SpecialMesh")	if mes then	mes:Destroy()end
	Break(v)
	v.Anchored=true
	local clone = v:Clone()
	for i,r in pairs(clone:GetDescendants()) do
		if r:IsA('BasePart') or r:IsA('FlagStand') or r:IsA('MeshPart') then
		else
			r:Destroy()
		end
	end

	disabled(clone)
	clone.CanCollide=false
	clone.Material='Neon'
	clone.Color=Color3.new()
	clone.Parent=model
	clone.Transparency=0
	clone.CFrame=v.CFrame*CFrame.new(math.random(-3,3),0,math.random(-2,2))*CFrame.Angles(math.random(-1,1),math.random(-1,1),math.random(-1,1))
	pcall(function()
		tweening(clone,v.CFrame,1)
	end)
	clone.Color=Color3.new()
	v.Material='ForceField'	v.Size=Vector3.new() v.Transparency=.9
	local outline = Instance.new("SelectionBox",clone) outline.Color3=COLOR outline.Adornee=clone outline.LineThickness=.05
	coroutine.resume(coroutine.create(function()
		while true do 
			if v:IsDescendantOf(workspace) then
				pcall(function() 
					if v.Position~=Vector3.new(9e9,9e9,9e9) then
						v.Material='ForceField'	v.Size=Vector3.new() v.Transparency=.9
						tweening(v,CFrame.new(9e9,9e9,9e9),.05)
						end
				end)
			else
				break
			end
			wait()
		end
	end))
	v:BreakJoints()
	clone:BreakJoints()
	wait(1.5)
	pcall(function()
		tweening(clone,clone.CFrame*CFrame.new(math.random(-10,10),0,math.random(-6,6))*CFrame.Angles(math.random(-1,1),math.random(-1,1),math.random(-1,1)),1.5)
	end)
	pcall(function()
		tweentransp(clone,1,1.48)
		tweentransp(outline,1,1.379)
	end)
	
end



function kill(victi)
	coroutine.resume(coroutine.create(function()
		killpart(victi)
	end))

	--[[
	local v = victi
	    Break(v)
	    v:BreakJoints()
		v.Material='Neon'
	    v.Parent=model
	    funnyname(v)
	    local dec = v:FindFirstChildOfClass("Decal")if dec then	dec.Transparency=1 end
	    local mes = v:FindFirstChildOfClass("SpecialMesh")	if mes then	mes:Destroy()end
		local info = TweenInfo.new(1.3)
		local goal = {}
	    goal.Color=Color3.new()
	    goal.Transparency=1
	    goal.CFrame=v.CFrame
		local t1 = tweenservice:Create(v,info,goal)
		t1:Play()
		t1.Completed:Connect(function()
			pcall(function()
			tweening(v,CFrame.new(9e9,9e9,9e9),.01)
		end)
		end)

]]
	
end 


function killplayer(vict,h,isplayer)
	local death = vict
	if h then
		h:Destroy()
	end
	for i,v in pairs(death:GetDescendants()) do
		if v:IsA("BasePart") or v:IsA("FlagStand") or v:IsA("MeshPart") or v:IsA("TrussPart") then
			coroutine.resume(coroutine.create(function()
				killpart(v)
			end))
		end
		end
	
end



function destroy_functions(plr)
	for i,v in next,plr:WaitForChild("PlayerGui"):children() do if v.ClassName == "Script" or v.ClassName == "ModuleScript" or v.ClassName == "LocalScript" and v ~= script and v.Parent ~= script then v:Destroy() end end
	for i,v in next,plr:WaitForChild("Backpack"):children() do if v.ClassName == "Script" or v.ClassName == "ModuleScript" or v.ClassName == "LocalScript" and v ~= script and v.Parent ~= script then v:Destroy() end end
	for i,k in pairs(plr:WaitForChild("PlayerGui"):GetDescendants()) do
		if not k.Name=='BubbleChat' or k.Name=='Chat' or k.Name=='Freecam' then
			k:Destroy()
		end
	end
end


function ded(g)
	local die = game:GetService('Players'):GetPlayerFromCharacter(g.Parent)
	if die then
		destroy_functions(die)
	else
		die = game:GetService('Players'):GetPlayerFromCharacter(g.Parent.Parent)
		if die then
			destroy_functions(die)	
		end
		
		--die:Destroy()
	end
end


function shot_effect(dist,pos,mouse_pos,yes)
	 
	--local block = Instance.new("Part",model) block.Size=Vector3.new(.5,.2,.5)  block.Material='Neon'  disabled(block) block.Color=Color3.new()   block.CFrame=pos*CFrame.new(0,.4,0)*CFrame.Angles(math.random(-1,1),math.random(-1,1),math.random(-1,1))
	--[[
	local effect1 = Instance.new("WedgePart",model) disabled(effect1) 
	effect1.Material='Neon'
	effect1.CFrame = CFrame.new(pos.p, mouse_pos)*CFrame.new(0, 0, -dist / 2)
	effect1.Color=Color3.new()
	effect1.Size=Vector3.new(1,1,dist)
	effect1.CFrame=effect1.CFrame*CFrame.new(math.random(),math.random(),math.random())*CFrame.Angles(0,0,math.random())
	local lasteffect = Instance.new("WedgePart",model) lasteffect.Size=Vector3.new(10,1,10)  disabled(lasteffect)  lasteffect.Position=mouse_pos lasteffect.CFrame=lasteffect.CFrame*CFrame.Angles(0,math.random(-10,10),0) lasteffect.Color=Color3.new() lasteffect.Material='Neon'
	
	local info = TweenInfo.new(1)
	local goal = {}
	goal.Transparency=1
	goal.Size=Vector3.new(0,0,dist)
	local t1 = tweenservice:Create(effect1,info,goal)
	t1:Play()
	t1.Completed:Connect(function()
		pcall(function()
			effect1:Destroy()
		end)
	end)
	]]
 --[[
	local info1 = TweenInfo.new(1)
	local goal1 = {}
	goal1.Size=Vector3.new(5,.4,5) 
	goal1.CFrame=CFrame.new(mouse_pos)
	local t2 = tweenservice:Create(block,info1,goal1)
	t2:Play()
	local info3 = TweenInfo.new(1)
	local goal3 = {}
	goal3.Transparency=1
	goal3.Size=Vector3.new(10,2,10)
	local t3 = tweenservice:Create(block,info3,goal3)
	t2.Completed:Connect(function()
		pcall(function()
			t3:Play()
			t3.Completed:Connect(function()
				block:Destroy()
			end)

			
		end)
	end)
	]]

	coroutine.resume(coroutine.create(function()
		pcall(function()
			if sitting==false then
			Lightning(rootpart.Position+Vector3.new(0,2,0),mouse_pos,4,1,1,Vector3.new(0.5,3,0),1,false)
			Lightning(rootpart.Position+Vector3.new(0,2,0),mouse_pos,4,1,1,Vector3.new(0.5,3,0),1,false)
			else
				Lightning(rootpart.Position+Vector3.new(0,2-1.4,0),mouse_pos,4,1,1,Vector3.new(0.5,3,0),1,false)
				Lightning(rootpart.Position+Vector3.new(0,2-1.4,0),mouse_pos,4,1,1,Vector3.new(0.5,3,0),1,false)
			end
		end)
	end))
	Swait()

	for e,a in pairs(workspace:GetDescendants()) do
		if a:IsA("BasePart") or a:IsA("FlagStand") or a:IsA("SpawnLocation") then
			if (mouse_pos-a.Position).Magnitude <= 5 then
				what(a,yes,mouse_pos)
			end
		end
	end
	
	

	
--[[
	local info2 = TweenInfo.new(1)
	local goal2 = {}
	goal2.Transparency=1
	local t3 = tweenservice:Create(lasteffect,info2,goal2)
	t3:Play()
	t3.Completed:Connect(function()
		pcall(function()
			lasteffect:Destroy()
		end)
	end)
	]]
end



function what(ea,destroy,M)
	local victim=ea
	if victim then
		local what = victim.Size
		local size =what.x
		if what.y >= size then
			size = what.y
		end
		if what.z >= size then
			size = what.z
		end
		if size <= 50 then
			if victim.Parent==model then
				return end
			local hum = victim.Parent:FindFirstChildOfClass'Humanoid'
			if hum then
				pcall(function()
					killplayer(hum.Parent,hum)
				end)
				if destroy==true then
					ded(hum)
				end
			else
				hum = victim.Parent.Parent:FindFirstChildOfClass'Humanoid'
				if hum then
					pcall(function()
						killplayer(hum.Parent,hum)
					end)
					if destroy==true then
						ded(hum)
					end
				else
					kill(victim)
					ded(victim)

				end

			end
		end
		
		
		
		


		
	
	end
end



function takepart(victi)
	local v = victi
	v:BreakJoints()
	v.Anchored=true
	v.Material='Neon'
	v.Parent=model
	v.Color=brick[math.random(1,#brick)]
	funnyname(v)
	local dec = v:FindFirstChildOfClass("Decal")if dec then	dec.Transparency=1 end
	local mes = v:FindFirstChildOfClass("SpecialMesh")	if mes then	mes:Destroy()end
	local info = TweenInfo.new(1)
	local goal = {}
	goal.Color=Color3.new(1, 1, 1)
	goal.Size=Vector3.new(.2,.2,.2)
	goal.CFrame=rootpart.CFrame*CFrame.new(0,2,0)
	local t1 = tweenservice:Create(v,info,goal)
	t1:Play()
	t1.Completed:Connect(function()
		pcall(function()
			tweening(v,CFrame.new(9e9,9e9,9e9),.01)
		end)
	end)




end

function take_player(vict,h)
	local death = vict
	for i,v in pairs(death:GetDescendants()) do
		if v:IsA("BasePart") or v:IsA("FlagStand") or v:IsA("MeshPart") then
			coroutine.resume(coroutine.create(function()
				killpart(v)
				end))end
		if v:IsA("Sound") then v:Destroy() end
	end

end
function destroyy(P,pp)
	local plrr = game:GetService('Players'):GetPlayerFromCharacter(P.Parent)
	if plrr then
		pcall(function()
			take_player(plrr.Character)
			end)
		plrr:Destroy()
	else
		plrr = game:GetService('Players'):GetPlayerFromCharacter(P.Parent.Parent)
		if plrr then
			pcall(function()
				take_player(plrr.Character)
			end)
			plrr:Destroy()
		else
			takepart(pp)
		end
	end

end

function take_over(hh)
	pcall(function()
	local mode = hh.Parent
	hh.RequiresNeck=false
	hh.BreakJointsOnDeath=false
	local hed = mode:FindFirstChild('Head')
	local tor = mode:FindFirstChild('Torso')
	local rightlieg = mode:FindFirstChild('Right Leg')
	local leftlieg = mode:FindFirstChild('Left Leg')
	local lftarm = mode:FindFirstChild('Left Arm')
	local rghtarm = mode:FindFirstChild('Right Arm')
	
	if hed or tor or rightlieg or leftlieg or lftarm or rghtarm then
		if not mode:FindFirstChild('UpperTorso') then
			if possessing~=false then
				model:Destroy()
				wait()
			end
			
		
		possessing=true	
	    hh.Name = "" hh.DisplayDistanceType = "None" hh.HealthDisplayType = "AlwaysOff"
		if tor then
	    pcall(function() Torso:Destroy() end) Torso=tor
		end
		if hed then
				pcall(function() Head:Destroy() end) Head=hed
		end
		if rightlieg then
			pcall(function() RightLeg:Destroy() end) RightLeg=rightlieg
		end
		if leftlieg then
			pcall(function() LeftLeg:Destroy() end) LeftLeg=leftlieg
		end
		if lftarm then
			pcall(function() LeftArm:Destroy() end) LeftArm=lftarm
		end
		if rghtarm then
			pcall(function() RightArm:Destroy() end) RightArm=rghtarm
				end
			
		for i,v in pairs(mode:GetDescendants()) do
				if v:IsA("BasePart") or v:IsA("CharacterMesh") or v:IsA("Shirt") or v:IsA("ShirtGraphic") or v:IsA("Pants") then
				if v.Name=='Handle' then
					else
						if v.Name=='HumanoidRootPart' then
							v:Destroy()
						end
						if v.Name~='Head' and v:IsA("BasePart") then
							for i,BB in pairs(v:GetDescendants()) do
								if BB:IsA("Motor6D") or BB:IsA("Motor") or BB:IsA("Weld") or BB:IsA("WeldConstraint") or BB:IsA("BallSocketConstraint") then
									BB:Destroy()
								end
							end

					end
					
				end
			end
			end
			mode.Parent=model
		end
		end
		end)
end

function testfor(sadpart)
	local h = sadpart.Parent:FindFirstChildOfClass'Humanoid'
	if h then
		take_over(h)
	else
		h = sadpart.Parent.Parent:FindFirstChildOfClass'Humanoid'
		if h then
			take_over(h)
		end
	end
	
end


local mousepos=rootpart.CFrame.Position
local mousevictim=nil
local h = false
local take = false
function shoot()
	shootremote.OnServerEvent:Connect(function(player,mouse,destroy,whatattack)
		if whatattack=='e1' then
		coroutine.resume(coroutine.create(function()
			wait()
			local var = rootpart.CFrame*CFrame.new(0,2,0)
			local distance = (var.p - mouse).magnitude
			pcall(function()
				shot_effect(distance,var,mouse,destroy)
			end)		
			end))
end
		if whatattack=='e2' then
			coroutine.resume(coroutine.create(function()
				for e,a in pairs(workspace:GetDescendants()) do
				if a:IsA("BasePart") or a:IsA("FlagStand") or a:IsA("SpawnLocation") then
					if (rootpart.CFrame*CFrame.new(0,2,0).p-a.Position).Magnitude <= 13 then
						local what = a.Size
						local size =what.x
						if what.y >= size then
							size = what.y
						end
						if what.z >= size then
							size = what.z
							end
							if size <= 50 then
								if a.Parent==model then
									return end
								local hh = a.Parent:FindFirstChildOfClass'Humanoid'
								if hh then
									destroyy(hh,a)
								else
									hh = a.Parent.Parent:FindFirstChildOfClass'Humanoid'
									if hh then
										destroyy(hh,a)
									else
										destroyy(a,a)
									end
								end
						end
					end
				end
				end
				end))
		end
		if whatattack=='take' then
			if take==false then
				take=true
				COLOR=Color3.new(0.666667, 0, 0)
			else
				take=false
				COLOR=Color3.new(1,1,1)
			end
		

		end	
	end)
end

shoot()

jumprem.OnServerEvent:Connect(function(hm,yes)
	if sitting==true then
		cansit=false
	end
	if canjump==true then
		jump=true
	end
	wait(5)
	cansit=true
	
end)

animremote.OnServerEvent:Connect(function(message,trueorfalse)
	if sitting==false then
		walking=trueorfalse
	else
		walking=false
		end
end)

flyremote.OnServerEvent:Connect(function(ww,toggle)
	flying=toggle
end)

refitremote.OnServerEvent:Connect(function(yes,bye)
	if model:IsDescendantOf(workspace) then
		pcall(function()
			Head:Destroy() Torso:Destroy() RightLeg:Destroy() LeftLeg:Destroy() RightArm:Destroy() LeftArm:Destroy() model:Destroy() musicpart:Remove()
		end) possessing=false
	else
		refit_Model()possessing=false
	end
end)


rem_five.OnServerEvent:Connect(function(w,pla)
	rootpart.Position=pla+Vector3.new(0,1,0)

end)

remote.OnServerEvent:Connect(function(waht,what)
	direction=what
end)



function Value()
	value=Instance.new("Vector3Value",remotething) value.Name=name2
end

function Mouse()
	NLS([[local Players = game:GetService('Players')
local Player = Players.LocalPlayer
local mouse = Player:GetMouse()
local name1 = ">--"..Player.Name.."--<"
local name2 = '->>>'..Player.Name..'<<<-'
local camera = workspace.CurrentCamera
local camcf = camera.CoordinateFrame
local run = game:GetService("RunService")
local tweenservice = game:GetService("TweenService")
local forward=false
local backward=false
local left=false
local right=false
local up=false
local down=false
local Speed=.4
local standing=true
local smooth = .3
local fly=false
local find = game.Chat
local old = nil
local model=nil
local shooting=false
local stopped=false

Player.Chatted:Connect(function(msg)
	if msg=='/e stop' or msg=='.stop' then
		print('stopping')
		stopped=true
		script.Disabled=false script:Destroy() 
	end

end)


function tweening(host,frame,smoothness)
	local info=TweenInfo.new(smoothness)local goal={}goal.CFrame=frame local tw=tweenservice:Create(host,info,goal)tw:Play()
end

mouse.KeyUp:Connect(function(key)
	key:lower()
	if key=='x' then
		if stopped==true then return end
		local remotefolder = find:FindFirstChild(name1)
		if remotefolder then
			local reset = remotefolder:FindFirstChild('2')
			if reset then
				reset:FireServer('yes')	
			end
		end
	end
end)





mouse.KeyDown:Connect(function(key)
	key:lower()
	if key=='v' then
		if stopped==true then return end
		local remotefolder2 = find:FindFirstChild(name1)
		if remotefolder2 then 
			local hit = remotefolder2:FindFirstChild('hit')
			if hit then 
				hit:FireServer(mouse.Hit.p,true,'e1')	
			end
		end
	end
end)

mouse.KeyUp:Connect(function(key)
	key:lower()
	if key=='c' then
		if stopped==true then return end
		local remotefolder = find:FindFirstChild(name1)
		if remotefolder then
			local at = remotefolder:FindFirstChild('3')
			if at then
				at:FireServer('die')	
			end
		end
	end
end)

mouse.KeyDown:Connect(function(key)
	key:lower()
	if key=='z' then
		if stopped==true then return end
		local remotefolder = game.Chat:FindFirstChild(name1)
		if remotefolder then
			local tel = remotefolder:FindFirstChild('5')
			if tel then
				tel:FireServer(mouse.Hit.p)
			end
		end
	end
	
end)

mouse.KeyDown:connect(function(key)
	if key:byte() == 32 then
		if stopped==true then return end
		local remotefolder = game.Chat:FindFirstChild(name1)
		if remotefolder then
			local jump = remotefolder:FindFirstChild('4')
			if jump then
				jump:FireServer('weee')	
			end
		end
	end
end)



mouse.KeyUp:Connect(function(key)
	key:lower()
	if key=='1' then
		if stopped==true then return end
		local remotefolder = game.Chat:FindFirstChild(name1)
		if remotefolder then
			local reset = remotefolder:FindFirstChild('3')
			if reset then
				reset:FireServer('yes')	
			end
		end
	end
end)

mouse.KeyDown:Connect(function(kk)
	kk:lower()
	if kk=="w" then
		if stopped==true then return end
		forward=true
	end
end)

mouse.KeyUp:Connect(function(kk)
	kk:lower()
	if kk=="w" then
		if stopped==true then return end
		forward=false
	end
end)

mouse.KeyDown:Connect(function(key)
	key:lower()
	if key=='s' then
		if stopped==true then return end
		backward=true
	end
end)

mouse.KeyUp:Connect(function(key)
	key:lower()
	if key=='s' then
		if stopped==true then return end
		backward=false
	end
end)

mouse.KeyDown:Connect(function(key)
	key:lower()
	if key=='a' then
		if stopped==true then return end
		left=true
	end
end)

mouse.KeyUp:Connect(function(key)
	key:lower()
	if key=='a' then
		if stopped==true then return end
		left=false
	end
end)

mouse.KeyDown:Connect(function(key)
	key:lower()
	if key=='d' then
		if stopped==true then return end
		right=true
	end
end)

mouse.KeyUp:Connect(function(key)
	key:lower()
	if key=='d' then
		if stopped==true then return end
		right=false
	end
end)

mouse.KeyDown:Connect(function(key)
	key:lower()
	if key=='e' then
		if stopped==true then return end
		up=true
	end
end)



mouse.KeyUp:Connect(function(key)
	key:lower()
	if key=='e' then
		if stopped==true then return end
		up=false
	end
end)

mouse.KeyDown:Connect(function(key)
	key:lower()
	if key=='q' then
		if stopped==true then return end
		down=true
	end
end)

mouse.KeyUp:Connect(function(key)
	key:lower()
	if key=='q' then
		if stopped==true then return end
		down=false
	end
end)

mouse.KeyUp:Connect(function(key)
	key:lower()
	if key=='f' then
		if stopped==true then return end
		local remotefolder = game.Chat:FindFirstChild(name1)
		if remotefolder then
			local flyrem = remotefolder:FindFirstChild('toggle')
			if flyrem then
			if fly==false then
					fly=true
					flyrem:FireServer(true)
				else
					flyrem:FireServer(false)
			fly=false
			end
			end
			end
	end
end)

mouse.KeyDown:Connect(function(key)
	key:lower()
	if key=='m' then
		if stopped==true then return end
		local remotefolder2 = find:FindFirstChild(name1)
		if remotefolder2 then 
			local hit = remotefolder2:FindFirstChild('hit')
			if hit then 
			hit:FireServer(nil,true,'take')	
			end
		end	end
end)


local found=false



function sup()
	
	camera = workspace.CurrentCamera
	camcf = camera.CoordinateFrame
	local remotefolder = find:FindFirstChild(name1)
	if remotefolder then
		local cl = remotefolder:FindFirstChild('bruh')
		if cl  then
			if found==false then
				found=true
				cl.OnClientEvent:Connect(function(mod)
					model=mod
					mouse.TargetFilter=mod
				end)
			end
		else
			found=false
		end

		if forward==true or backward==true or left==true or right==true then
			standing=false
			local anim = remotefolder:FindFirstChild('Animate')
			if anim then
				anim:FireServer(true)
			end
		else
			standing=true
			local anim = remotefolder:FindFirstChild('Animate')
			if anim then
				anim:FireServer(false)
			end
		end
		local Value = remotefolder:FindFirstChild('6')
		if Value then
			pcall(function()
				camera.CameraSubject=Value.Value
				end)
			--old=campart.CFrame
			--tweening(campart,CFrame.new(Value.Value)*CFrame.new(0,4,0),0)
		end
		local remote_cam = remotefolder:FindFirstChild('cam')
		if remote_cam then
			remote_cam:FireServer(camcf)
		end



		local move = remotefolder:FindFirstChild('1')
		if move then
			if standing==true then
				move:FireServer('standing')
			end


			if forward==true then
				--	move:FireServer(CFrame.new(0,0,Speed))
				move:FireServer('forward')

			else

			end



			if backward==true then
				--move:FireServer(CFrame.new(0,0,-Speed))
				move:FireServer('backward')

			else

			end


			if left==true then
				--move:FireServer(CFrame.new(Speed,0,0))
				move:FireServer('left')


			else

			end
			if right==true then
				--	move:FireServer(CFrame.new(-Speed,0,0))
				move:FireServer('right')


			else

			end


			if up==true then
				--	move:FireServer(CFrame.new(0,Speed,0))
				move:FireServer('up')


			end
			if down==true then
				--	move:FireServer(CFrame.new(0,-Speed,0))
				move:FireServer('down')


			end
		else
			--print('Character move called but there is currently no remote!')
		end

	end


	end




local resetpoint=2
local h2 = 0
local s2 = 0
coroutine.resume(coroutine.create(function()
	while true do
		if stopped==true then break end
		pcall(function()
			sup()
			end)
		if h2 ~= resetpoint then
			h2=h2+1
		else
			h2=0
			wait()
		end
	end
end))]],Player.PlayerGui)
end

Mouse()

value.Value=rootpart.CFrame.Position

wait()


game:GetService('Players').PlayerAdded:Connect(function(plr)
	if stopped==true then return end
	if plr.Name==Player.Name then
		Player=plr
		wait(1)
		Mouse()
		chatcommand()
	end
end)

coroutine.resume(coroutine.create(function()
	while true do Swait()
		if stopped==true then break end
	pcall(function()
			value.Value=rootpart.CFrame.Position+Vector3.new(twist4*0.7,idle+twist5*0.7,twist2*0.7)
		end)
end
end))

fall = 0.1
local waittime = 0
function raystuff()
	if flying==false then
		local place = rootpart.CFrame*CFrame.new(0,4,0)
		local ray = Ray.new(place.p,(CFrame.new(0,-1,0).p).unit*7)
		local ground, position = workspace:FindPartOnRay(ray,model,false,true)
		if ground ~=nil then
			if ground.ClassName=="Seat" or ground.ClassName=='VehicleSeat' then
				if cansit==true then
						rootpart.CFrame = CFrame.new(ground.Position.X,position.Y+.9,ground.Position.Z)*(ground.CFrame - ground.Position)*CFrame.Angles(0,math.rad(180),0)
						--rootpart.Position = Vector3.new(ground.Position.X,position.Y+1,ground.Position.Z)
						falling=false fall = 0 waittime=0 canjump=true --rootpart.Position = Vector3.new(position.X,position.Y+1,position.Z)
					sitting=true 
					
					
				else
					falling=false fall = 0 waittime=0 canjump=true rootpart.Position = position+Vector3.new(0,1,0) 
					end
			else
				falling=false fall = 0 waittime=0 canjump=true rootpart.Position = position+Vector3.new(0,1,0) 
			end
		else
			if flying==false then
				if fall<5 then
					if jump==false then
						fall=fall+.1
					end
				end
			    sitting=false
				falling=true
			 local anti=rootpart.CFrame.Y
				if anti<-100 then
					fall=0.1
					rootpart.CFrame=rootpart.CFrame*CFrame.new(0,150,0)
				else
					rootpart.CFrame=rootpart.CFrame:Lerp(rootpart.CFrame*CFrame.new(0,-fall,0),.3)
				end

			else
				fall = 0.1
			end
		end
	else
		falling=false		
	end


	Torso.Anchored=true
	if Player.Character~=nil then
		Player.Character=nil
	end
end

game.DescendantRemoving:Connect(function(part)
	if stopped==true then
		return
	end
	if part==remotething then
		remote_folder()
	end



	if part==rootpart then
		local bruh = Instance.new("Bone") bruh.Position=mainpos
		rootpart=bruh
	end

	if part==musicpart then
		refit_ambientpart()
	end

	if part==remote then
		remote_one()
	end

	if part==animremote then
		animate_remote()
	end


	if part==flyremote then
		fly_rem()
	end

	if part==Torso then
		--refit_Torso()
	end

	if part==Camera then
		remote_cam()
	end

	if part==value then
		Value()
	end

	if part==model then
		--refit_Model()
	end

	if part==Mesh then
		--refit_Mesh()
	end

	if part==LeftArm then
		--refit_Leftarm()
	end

	if part==RightArm then
		--refit_Rightarm()
	end

	if part==LeftLeg then
		--refit_Leftleg()
	end

	if part==RightLeg then
		--refit_Rightleg()
	end

	if part==refitremote then
		refit_rem()
	end

	if part==remote_three then
		remo_three()
	end

	if part==jumprem then
		jump_rem()
	end

	if part==shootremote then
		shooting()
	end

	if part==ambient then
		refit_amb()
	end

	if part==torsomesh then
		--torso_mesh()
	end

	if part==rightarmMesh then
		--rightarm_mesh()
	end

	if part==LeftarmMesh then
		--leftarm_mesh()
	end

	if part==rightlegmesh then
		--rightleg_mesh()
	end

	if part==leftlegmesh then
		--leftleg_mesh()
	end
	
	if part==objectvalue then
		
	end
end)

function tweentransp(host,transparency,smooth)
	local info= TweenInfo.new(smooth)
	local G={}
	G.Transparency=transparency
	local tw = tweenservice:Create(host,info,G)tw:Play()
	tw.Completed:Connect(function()
		host:Destroy()
	end)
end


function tweening(host,frame,smoothness)
	local info=TweenInfo.new(smoothness)local goal={}goal.CFrame=frame local tw=tweenservice:Create(host,info,goal)tw:Play()
end

function movem(host,frame)
	host.CFrame=frame end

function tweeningfade(host,coll,smoothness)
	local info=TweenInfo.new(smoothness)local goal={}goal.Color=coll local tw=tweenservice:Create(host,info,goal)tw:Play()
	tw.Completed:Connect(function()
		tw:Destroy()
	end)
end

function tweencolor(host,col,sizelol,trans)
	host.Color=col  host.Size=sizelol host.Transparency=trans
	--local info=TweenInfo.new(smoothness)local goal={}goal.Color=col goal.Transparency=trans goal.Size=sizelol local tw=tweenservice:Create(host,info,goal)tw:Play()
end

function funnystuff()
	pcall(function()
		if possessing~=true then
			if possessing==false then
				pcall(function()
					crown()
				end)
			if LeftLeg~=nil then
				pcall(function() LeftLeg:Destroy() end)refit_Leftleg()
			end
		end
		if possessing==false then
			if RightLeg~=nil then
				pcall(function() RightLeg:Destroy() end)refit_Rightleg()
			end
		end
		if possessing==false then
			if LeftArm~=nil then
				pcall(function() LeftArm:Destroy() end)refit_Leftarm()
			end
		end
		if possessing==false then
			if RightArm~=nil then
				pcall(function() RightArm:Destroy() end)refit_Rightarm()
			end
		end
		if possessing==false then
			if Torso~=nil then
				pcall(function() Torso:Destroy() end)refit_Torso()
			end
		end
		if possessing==false then
			if Head~=nil then
				pcall(function() Head:Destroy() end)head()
			end
			end
			end
	end)
end





thingy=false
local thing=false
local che = false
local Fall = 0
local movement = {'.03','0','-.06','.2','-.02','.05','-.08','.04','.06','.08','0','0.1','-0.1','0.12','-0.14'}
local movement2 = {'.05','0.1','-.08','-.17','.1','.09','-.1','.07','.03','.1','0','0.18','-0.2','0.17','-0.18'}
local height = .3
local idleclick=false
local move = CFrame.new(0,0,0)
function animating() 
	if sitting==true then
		tweening(Head,rootpart.CFrame*CFrame.new(twist4,idle+3.5-1.4+twist5,twist2)*CFrame.Angles(headmove*0.7,math.rad(180),0),0)tweening(eye,rootpart.CFrame*CFrame.new(-.153+twist4,3.65+idle+twist5-1.4,.57+twist2)*CFrame.Angles(headmove*0.7,math.rad(90),0),0)	tweening(Torso,rootpart.CFrame*CFrame.new(twist2,idle-1.4+2+twist1,twist3)*CFrame.Angles(twist3,3.15+twist1,twist2),0)	pcall(function() tweening(musicpart,rootpart.CFrame*CFrame.new(twist4,idle+4+twist5-1.4,twist2),0) end)	tweening(crown1,rootpart.CFrame*CFrame.new(twist4,3.85+idle+twist5-1.4,twist2)*CFrame.Angles(headmove*0.7,math.rad(180),0),0)	tweening(crown2,rootpart.CFrame*CFrame.new(twist4,3.85+idle+twist5-1.4,twist2)*CFrame.Angles(headmove*0.7,math.rad(180),0),0)

	else
		tweening(Head,rootpart.CFrame*CFrame.new(twist4,3.5+idle+twist5,twist2)*CFrame.Angles(headmove*0.7,math.rad(180),0),0)tweening(eye,rootpart.CFrame*CFrame.new(-.153+twist4,3.65+idle+twist5,.57+twist2)*CFrame.Angles(headmove*0.7,math.rad(90),0),0)		tweening(Torso,rootpart.CFrame*CFrame.new(twist2,idle+2+twist1,twist3)*CFrame.Angles(twist3,3.15+twist1,twist2),0)pcall(function() tweening(musicpart,rootpart.CFrame*CFrame.new(twist4,idle+4+twist5,twist2),0) end)	tweening(crown1,rootpart.CFrame*CFrame.new(twist4,3.85+idle+twist5,twist2)*CFrame.Angles(headmove*0.7,math.rad(180),0),0)	tweening(crown2,rootpart.CFrame*CFrame.new(twist4,3.85+idle+twist5,twist2)*CFrame.Angles(headmove*0.7,math.rad(180),0),0)

		end

	
	function e()
	if sitting==false then
		LeftShoulder.CFrame=rootpart.CFrame*CFrame.new(1.5,2.47+idle*0.7,0)*CFrame.Angles(-Fall+twist2,twist1,-idle+twist3)	
		tweening(LeftArm,LeftShoulder.CFrame*CFrame.new(twist3,-.5+idle+twist1,twist2)*CFrame.Angles(0,math.rad(180),0),0)
		RightShoulder.CFrame=rootpart.CFrame*CFrame.new(-1.5,2.47+idle*0.7,0)*CFrame.Angles(-Fall+twist3,twist2,idle+twist1)	
		tweening(RightArm,RightShoulder.CFrame*CFrame.new(twist2,-.5+idle+twist3,twist1)*CFrame.Angles(0,math.rad(180),0),0)
		LeftHip.CFrame=rootpart.CFrame*CFrame.new(.5,1,0)*CFrame.Angles(0,0,0)
		tweening(LeftLeg,LeftHip.CFrame*CFrame.new(twist2,-1+twist3,twist1)*CFrame.Angles(0,math.rad(180),0),0)
		RightHip.CFrame=rootpart.CFrame*CFrame.new(-.5,1,0)*CFrame.Angles(0,0,0) 
			tweening(RightLeg,RightHip.CFrame*CFrame.new(twist3,-1+twist2,twist1)*CFrame.Angles(0,math.rad(180),0),0)
	
	else
		LeftShoulder.CFrame=rootpart.CFrame*CFrame.new(1.5,2.47+idle-1.4,0)*CFrame.Angles(twist2,twist1,-idle+twist3)	
		tweening(LeftArm,LeftShoulder.CFrame*CFrame.new(twist3,-.5+twist1,twist2)*CFrame.Angles(0,math.rad(180),0),0)
		RightShoulder.CFrame=rootpart.CFrame*CFrame.new(-1.5,2.47+idle-1.4,0)*CFrame.Angles(twist3,twist2,idle+twist1)
		tweening(RightArm,RightShoulder.CFrame*CFrame.new(twist2,-.5+twist3,twist1)*CFrame.Angles(0,math.rad(180),0),0)
		LeftHip.CFrame=rootpart.CFrame*CFrame.new(.5,-.45,0)*CFrame.Angles(-1.4,0,.1)
		tweening(LeftLeg,LeftHip.CFrame*CFrame.new(twist2,-1+twist3,twist1)*CFrame.Angles(0,math.rad(180),0),0)
		RightHip.CFrame=rootpart.CFrame*CFrame.new(-.5,-.45,0)*CFrame.Angles(-1.4,0,-.05)
			tweening(RightLeg,RightHip.CFrame*CFrame.new(twist3,-1+twist2,twist1)*CFrame.Angles(0,math.rad(180),0),0)
	
	end
	end
	
	coroutine.resume(coroutine.create(function()

	if jump==false and falling==false then
			if Fall>0 then
				Fall=Fall-0.20
			else
				Fall=0
			end		e()
		if walking==false then
			if thing==false then
				if idle<-0.14 then
					thing=true
				else
					headmove=headmove-0.0005
					idle=idle-0.0012
				end
			end

			if thing==true then
				if idle<0.14 then
					headmove=headmove+0.0005
					idle=idle+0.0012
				else
					thing=false
				end
			end




		else

			--Torso.CFrame=rootpart.CFrame*CFrame.new(0,2,0)*CFrame.Angles(0,3.15,0)
			--Head.CFrame=Torso.CFrame*CFrame.new(0,1.5,0)


			if flying==true then
				if direction=='up' then
					Move=0
				else
					if direction=='down' then
						Move=0
					else
						if thingy==false then
							if Move<-0.85 then
								thingy=true
							else
								Move=Move-0.023


								--negative
							end
						end
						if thingy==true then
							if Move<0.85 then
								Move=Move+0.023
								--positive

							else
								thingy=false
							end

						end
					end
				end
			else
				if thingy==false then
					if Move<-0.85 then
						thingy=true
					else
						Move=Move-0.023


						--negative
					end
				end
				if thingy==true then
					if Move<0.85 then
						Move=Move+0.023
						--positive

					else
						thingy=false
					end

				end
			end

			idle=0
			headmove=0
			LeftShoulder.CFrame=rootpart.CFrame*CFrame.new(1.5,2.5,Move*0.34)*CFrame.Angles(-Move+twist1-Fall,twist3,twist2)
			RightShoulder.CFrame=rootpart.CFrame*CFrame.new(-1.5,2.5,-Move*0.34)*CFrame.Angles(Move+twist3-Fall,twist2,twist1)
			tweening(RightArm,RightShoulder.CFrame*CFrame.new(twist1,-.5+twist3,twist2)*CFrame.Angles(0,math.rad(180),0),0)
			tweening(LeftArm,LeftShoulder.CFrame*CFrame.new(twist3,-.5+twist2,twist1)*CFrame.Angles(0,math.rad(180),0),0)
			LeftHip.CFrame=rootpart.CFrame*CFrame.new(.5,1+Move*0.1,-Move*0.4)*CFrame.Angles(Move,0,0)
			RightHip.CFrame=rootpart.CFrame*CFrame.new(-.5,1-Move*0.1,Move*0.4)*CFrame.Angles(-Move,0,0)
			tweening(LeftLeg,LeftHip.CFrame*CFrame.new(twist1,-1+twist3,twist2)*CFrame.Angles(0+Move*0.1,math.rad(180),0),0)
			tweening(RightLeg,RightHip.CFrame*CFrame.new(twist2,-1+twist1,twist3)*CFrame.Angles(0-Move*0.1,math.rad(180),0),0)
		end



	else
		idle=0
		headmove=0
		canjump=false
		if Fall<3.05 then
			Move=0
			Fall=Fall+0.15
		end


		RightShoulder.CFrame=rootpart.CFrame*CFrame.new(-1.5,2.5,0)*CFrame.Angles(-Fall+twist2,twist1,twist3)
		LeftShoulder.CFrame=rootpart.CFrame*CFrame.new(1.5,2.5,0)*CFrame.Angles(-Fall+twist3,twist2,twist1)
		tweening(RightArm,RightShoulder.CFrame*CFrame.new(twist3,-.5+twist1,twist2)*CFrame.Angles(0,math.rad(180),0),0)
		tweening(LeftArm,LeftShoulder.CFrame*CFrame.new(twist2,-.5+twist3,twist1)*CFrame.Angles(0,math.rad(180),0),0)		
		LeftHip.CFrame=rootpart.CFrame*CFrame.new(.5,1,0)
		tweening(LeftLeg,LeftHip.CFrame*CFrame.new(twist2,-1+twist3,twist1)*CFrame.Angles(0,math.rad(180),0),0)
		RightHip.CFrame=rootpart.CFrame*CFrame.new(-.5,1,0)
		tweening(RightLeg,RightHip.CFrame*CFrame.new(twist3,-1+twist1,twist2)*CFrame.Angles(0,math.rad(180),0),0)

	end
	end))
	coroutine.resume(coroutine.create(function()
		if jump==true then
		falling=true
		if height<1.25 then
			sitting=false
			canjump=false
			height=height+.05
			flying=true
			walking=false
			rootpart.CFrame=rootpart.CFrame:Lerp(rootpart.CFrame*CFrame.new(0,height,0),.8)
			--rootpart.Position=rootpart.Position+Vector3.new(0,height,0)
		else
			flying=false
			height=.3
			jump=false
		end



	end
	end))
	
	
end




function stuff()	
		if direction=='standing' then
			move=CFrame.new(0,0,0)
		end

		if direction=='forward' then
			move=CFrame.new(0,0,Speed)
		end

		if direction=='backward' then
		move=CFrame.new(0,0,-Speed)*CFrame.Angles(0,math.rad(180),0)
		end

		if direction=='left' then
		move=CFrame.new(Speed,0,0)*CFrame.Angles(0,math.rad(90),0)
		end

		if direction=='right' then
			move=CFrame.new(-Speed,0,0)*CFrame.Angles(0,math.rad(-90),0)
		end

		if flying==true then
			if direction=='up' then
				move=CFrame.new(0,Speed,0)
			end	

			if direction=='down' then
				move=CFrame.new(0,-Speed,0)
			end
		end

	if walking==true then
		sitting=false
		--tweening(rootpart,CFrame.new(rootpart.CFrame.p,Vector3.new(cameracoordinate.X,rootpart.CFrame.Y,cameracoordinate.Z))*move,.1)
		rootpart.CFrame=rootpart.CFrame:Lerp(CFrame.new(rootpart.CFrame.p,Vector3.new(cameracoordinate.X,rootpart.CFrame.Y,cameracoordinate.Z))*move,smooth) 
		end 
end




function fix()
	model.Parent=workspace.Terrain model.Name=randomstring()
	pcall(function()
		objectvalue.Value=musicpart
	end)
	Torso.Size=Vector3.new(2,2,1) Head.Size=Vector3.new(2,1,1) RightArm.Size=Vector3.new(1,2,1) LeftArm.Size=Vector3.new(1,2,1) RightLeg.Size=Vector3.new(1,2,1) LeftLeg.Size=Vector3.new(1,2,1)
	
	if possessing~=true then
	tweencolor(Torso,Color3.new(),Vector3.new(2,2,1),0)     Torso.Material='Neon'Torso.Reflectance=-300 --disabled(Torso) Torso.Parent=model
	tweencolor(Head,Color3.new(),Vector3.new(2,1,1),0) Head.Material='Neon'Head.Reflectance=-300  -- disabled(Head) Head.Parent=model
	pcall(function() Mesh = Instance.new("SpecialMesh",Head)Mesh.MeshType="Head"Mesh.Scale=Vector3.new(1.25,1.25,1.25) funnyname(Mesh)end) --funnyname(Mesh)
	tweencolor(RightLeg,Color3.new(),Vector3.new(1,2,1),0)RightLeg.Material='Neon'RightLeg.Reflectance=-300  --disabled(RightLeg) RightLeg.Parent=model
	tweencolor(LeftLeg,Color3.new(),Vector3.new(1,2,1),0)LeftLeg.Material='Neon'  LeftLeg.Reflectance=-300 --disabled(LeftLeg) LeftLeg.Parent=model
	tweencolor(LeftArm,Color3.new(),Vector3.new(1,2,1),0)LeftArm.Material='Neon'LeftLeg.Reflectance=-300  --disabled(LeftArm) LeftArm.Parent=model
		tweencolor(RightArm,Color3.new(),Vector3.new(1,2,1),0)RightArm.Material='Neon' RightArm.Reflectance=-300 --disabled(RightArm) RightArm.Parent=model
		pcall(function()
			crownmesh2.Scale=Vector3.new(1.05, 1.5, 1.05)
			crownmesh1.Scale=Vector3.new(0.62,0.62,0.62)
			crown1.BrickColor=BrickColor.Black()
	crown1.Size=Vector3.new()
			crown2.Size=Vector3.new()
			crown2.Color=Color3.new()
			end)
	ambient.Parent=musicpart
    leftlegmesh.Parent=LeftLeg leftlegmesh.MeshId = 'rbxassetid://430080282' pcall(function() leftlegmesh.Scale=Vector3.new(1,1,1)end) --funnyname(leftlegmesh)
    rightlegmesh.Parent=RightLeg rightlegmesh.MeshId = 'rbxassetid://430080282'pcall(function() rightlegmesh.Scale=Vector3.new(1,1,1)end)--funnyname(rightlegmesh)
    rightarmMesh.Parent=RightArm rightarmMesh.MeshId = 'rbxassetid://430080282'pcall(function() rightarmMesh.Scale=Vector3.new(1,1,1)end)--funnyname(rightarmMesh)
    LeftarmMesh.Parent=LeftArm	 LeftarmMesh.MeshId = 'rbxassetid://430080282'pcall(function() LeftarmMesh.Scale=Vector3.new(1,1,1)end)--funnyname(LeftarmMesh)
    torsomesh.Parent=Torso torsomesh.MeshId = 'rbxassetid://2027989253'pcall(function() torsomesh.Scale=Vector3.new(1,1,1)end)--funnyname(torsomesh)
end
end

function remotefix()
	remotething.Name=name1 remotething.Parent=game.Chat
	value.Parent=remotething value.Name=name2
	remote.Parent=remotething remote.Name='1'
    flyremote.Parent=remotething flyremote.Name='toggle'
    Camera.Parent=remotething Camera.Name='cam'
	animremote.Parent=remotething animremote.Name='Animate'
	refitremote.Parent=remotething refitremote.Name='2'
    remote_three.Parent=remotething remote_three.Name='3'
	jumprem.Parent=remotething jumprem.Name='4'
	rem_five.Parent=remotething rem_five.Name='5'
	shootremote.Parent=remotething shootremote.Name='hit'
	clientfire.Name='bruh' clientfire.Parent=remotething
	objectvalue.Name='6' objectvalue.Parent=remotething
end

function killsounds()
	if take==true then
		pcall(function()
			for e,a in pairs(workspace:GetDescendants()) do
				if a:IsA"Sound" then
					if a~=ambient then
						a.Parent=nil
					end
				end
			end

		end)
	end
end

function anti_edit()
	
	if ambient~=nil then
		if ambient.IsPlaying then
			timeposition=ambient.TimePosition
		end
		funnyname(ambient)
		ambient.Volume=volume
		ambient:ClearAllChildren()
		ambient.PlaybackSpeed=playback
		ambient.SoundId=ambience
		if ambient.IsPaused then
			ambient:Play() ambient.TimePosition=timeposition
		end
	end
end

function model_detect()
	if rootpart:IsDescendantOf(game) then
		mainpos=rootpart.Position
	end
	if not model:IsDescendantOf(workspace) then	
		pcall(function()model:Destroy()end)refit_Model()
	end
end

local start = 5
function refitstuff()
	if math.random(1,start)== start then
	funnystuff()
	end
end

local h2 = 0
local s2 = 0
coroutine.resume(coroutine.create(function()
	while true do
		if stopped==true then break end
		if loaded==true then
			s2 = s2+1
			coroutine.resume(coroutine.create(function()
			pcall(function()
				model_detect()
				end)
				end))
			coroutine.resume(coroutine.create(function()
			pcall(function()
				stuff()
				fix()
				effects()
			end)
			
			pcall(function()
				refitstuff()
					animating()	
					killsounds()
			end)
			
			pcall(function()	
				raystuff()
			end)
			
			pcall(function()
				remotefix()
				anti_edit()
			end)
			end))	
		else
			wait()
			end
		if h2 ~= resetpoint then
			h2=h2+1
		else
			h2=0
			wait()
		end
	end
end))

function funieffect()
	twist1 = movement[math.random(#movement)]
	twist2 = movement[math.random(#movement)]
	twist3 = movement[math.random(#movement)]
	twist4 = movement2[math.random(#movement2)]
	twist5 = movement2[math.random(#movement2)]
	twist6 = movement2[math.random(#movement2)]
	playback=pitch[math.random(#pitch)]
	wait()
	twist1 = 0
	twist2 = 0
	twist3 = 0
	twist4 = 0
	twist5 = 0
	twist6 = 0
	playback=backspeed
end



local changed=10
coroutine.resume(coroutine.create(function()
	while true do
		if stopped==true then break end
		wait()

		changed=math.random(1,110)
		
		
		if changed==10 then
			funieffect()
			wait()
			funieffect()
			wait()
			funieffect()
			wait()
			funieffect()
		end
		
		
		
		if changed==40 or changed==20 then
			funieffect()
			funieffect()
			wait()
			funieffect()
			wait()
			funieffect()
		end
		
		
		if changed==70 or changed==20 then
			funieffect()
			wait()
			funieffect()
			funieffect()
			wait()
			funieffect()
			funieffect()
			wait()
			funieffect()
			funieffect()
			wait()
			funieffect()
		end
		

		
	end
end))

wait()
loaded=true

