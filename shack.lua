local shack = Instance.new("Model")
local zxmbi = Instance.new("Model")
local head = Instance.new("Part")
local face = Instance.new("Decal")
local handle = Instance.new("Part")
local mesh = Instance.new("SpecialMesh")
local mesh_2 = Instance.new("SpecialMesh")
local humanoidrootpart = Instance.new("Part")
local left_arm = Instance.new("Part")
local left_leg = Instance.new("Part")
local right_arm = Instance.new("Part")
local right_leg = Instance.new("Part")
local torso = Instance.new("Part")
local humanoid = Instance.new("Humanoid", zxmbi)
local charactermesh = Instance.new("CharacterMesh")
local charactermesh_2 = Instance.new("CharacterMesh")
local charactermesh_3 = Instance.new("CharacterMesh")
local charactermesh_4 = Instance.new("CharacterMesh")
local charactermesh_5 = Instance.new("CharacterMesh")
local pants = Instance.new("Pants")
local shirt = Instance.new("Shirt")
local part = Instance.new("Part")
local part_2 = Instance.new("Part")
local part_3 = Instance.new("Part")
local part_4 = Instance.new("Part")
local part_5 = Instance.new("Part")
local part_6 = Instance.new("Part")
local part_7 = Instance.new("Part")
local surfacegui = Instance.new("SurfaceGui")
local textlabel = Instance.new("TextLabel")
local part_8 = Instance.new("Part")
local part_9 = Instance.new("Part")
local part_10 = Instance.new("Part")
local part_11 = Instance.new("Part")
local part_12 = Instance.new("Part")
local part_13 = Instance.new("Part")
local oc_star_glitcher_drawing = Instance.new("Decal")
local part_14 = Instance.new("Part")
local decal = Instance.new("Decal")
local lua = Instance.new("Decal")
local part_15 = Instance.new("Part")
local part_16 = Instance.new("Part")
local attachment = Instance.new("Attachment", part_16)
local part_17 = Instance.new("Part")
local attachment_2 = Instance.new("Attachment", part_17)
local ropeconstraint = Instance.new("RopeConstraint")
local pointlight = Instance.new("PointLight")

shack.Name = "shack"
shack.Parent = script
zxmbi.PrimaryPart = humanoidrootpart
zxmbi.Name = "Zxmbi"
zxmbi.Parent = shack
head.Anchored = true
head.Size = Vector3.new(0.571, 0.286, 0.286)
head.Color = Color3.new(0.803922, 0.803922, 0.803922)
head.Orientation = Vector3.new(15.04, 110.17, 9.2)
head.Name = "head"
head.BrickColor = BrickColor.new("Mid gray")
head.TopSurface = Enum.SurfaceType.Smooth
head.Parent = zxmbi
head.CFrame = CFrame.new(224.571, 3.694, 6.588) * CFrame.Angles(2.48, 1.135, -2.366)
face.Texture = "rbxassetid://629660131"
face.Name = "face"
face.Parent = head
handle.Anchored = true
handle.CanCollide = false
handle.Locked = true
handle.Size = Vector3.new(0.286, 0.286, 0.571)
handle.BottomSurface = Enum.SurfaceType.Smooth
handle.Orientation = Vector3.new(15.04, 110.17, 9.2)
handle.Name = "handle"
handle.TopSurface = Enum.SurfaceType.Smooth
handle.Parent = head
handle.CFrame = CFrame.new(224.527, 3.781, 6.616) * CFrame.Angles(2.48, 1.135, -2.366)
mesh.VertexColor = Vector3.new(1.2, 1.4, 1.4)
mesh.MeshId = "http://www.roblox.com/asset/?id=83293901"
mesh.Scale = Vector3.new(0.286, 0.3, 0.286)
mesh.TextureId = "http://www.roblox.com/asset/?id=83284747"
mesh.MeshType = Enum.MeshType.FileMesh
mesh.Parent = handle
mesh_2.Scale = Vector3.new(0.357, 0.357, 0.357)
mesh_2.MeshType = Enum.MeshType.FileMesh
mesh_2.MeshId = "http://www.roblox.com/asset/?id=83001675"
mesh_2.Parent = head
humanoidrootpart.Anchored = true
humanoidrootpart.CanCollide = false
humanoidrootpart.Size = Vector3.new(0.571, 0.571, 0.286)
humanoidrootpart.RightParamA = 0
humanoidrootpart.RightParamB = 0
humanoidrootpart.Orientation = Vector3.new(0, 112.5, 0)
humanoidrootpart.LeftParamA = 0
humanoidrootpart.Name = "humanoidrootpart"
humanoidrootpart.TopSurface = Enum.SurfaceType.Smooth
humanoidrootpart.LeftParamB = 0
humanoidrootpart.Transparency = 1
humanoidrootpart.BottomSurface = Enum.SurfaceType.Smooth
humanoidrootpart.Parent = zxmbi
humanoidrootpart.CFrame = CFrame.new(224.219, 3.298, 6.702) * CFrame.Angles(-3.142, 1.178, -3.142)
left_arm.Anchored = true
left_arm.CanCollide = false
left_arm.Size = Vector3.new(0.286, 0.571, 0.286)
left_arm.Name = "Left Arm"
left_arm.Color = Color3.new(0.803922, 0.803922, 0.803922)
left_arm.Orientation = Vector3.new(-11.86, 110.14, 0.06)
left_arm.BrickColor = BrickColor.new("Mid gray")
left_arm.Parent = zxmbi
left_arm.CFrame = CFrame.new(224.657, 3.205, 6.986) * CFrame.Angles(-2.594, 1.165, 2.632)
left_leg.Anchored = true
left_leg.CanCollide = false
left_leg.Size = Vector3.new(0.286, 0.571, 0.286)
left_leg.Orientation = Vector3.new(90, 112.5, 0)
left_leg.BrickColor = BrickColor.new("Mid gray")
left_leg.Name = "Left Leg"
left_leg.BottomSurface = Enum.SurfaceType.Smooth
left_leg.Color = Color3.new(0.803922, 0.803922, 0.803922)
left_leg.Parent = zxmbi
left_leg.CFrame = CFrame.new(224.022, 2.978, 6.927) * CFrame.Angles(1.571, 0, -1.963)
right_arm.Anchored = true
right_arm.CanCollide = false
right_arm.Size = Vector3.new(0.286, 0.571, 0.286)
right_arm.Name = "Right Arm"
right_arm.Color = Color3.new(0.803922, 0.803922, 0.803922)
right_arm.Orientation = Vector3.new(-21.19, 110.13, 0.06)
right_arm.BrickColor = BrickColor.new("Mid gray")
right_arm.Parent = zxmbi
right_arm.CFrame = CFrame.new(224.4, 3.207, 6.167) * CFrame.Angles(-2.297, 1.066, 2.364)
right_leg.Anchored = true
right_leg.CanCollide = false
right_leg.Size = Vector3.new(0.286, 0.571, 0.286)
right_leg.Orientation = Vector3.new(90, 112.5, 0)
right_leg.BrickColor = BrickColor.new("Mid gray")
right_leg.Name = "Right Leg"
right_leg.BottomSurface = Enum.SurfaceType.Smooth
right_leg.Color = Color3.new(0.803922, 0.803922, 0.803922)
right_leg.Parent = zxmbi
right_leg.CFrame = CFrame.new(223.913, 2.978, 6.663) * CFrame.Angles(1.571, 0, -1.963)
torso.Anchored = true
torso.Size = Vector3.new(0.571, 0.571, 0.286)
torso.Orientation = Vector3.new(30.03, 110.18, 0.06)
torso.LeftParamA = 0
torso.LeftParamB = 0
torso.Name = "Torso"
torso.RightParamA = 0
torso.RightParamB = 0
torso.RightSurface = Enum.SurfaceType.Weld
torso.LeftSurface = Enum.SurfaceType.Weld
torso.Color = Color3.new(0.803922, 0.803922, 0.803922)
torso.BrickColor = BrickColor.new("Mid gray")
torso.Parent = zxmbi
torso.CFrame = CFrame.new(224.395, 3.3, 6.626) * CFrame.Angles(2.109, 0.949, -2.203)
charactermesh.BodyPart = Enum.BodyPart.Torso
charactermesh.MeshId = 82907945
charactermesh.Parent = zxmbi
charactermesh_2.BodyPart = Enum.BodyPart.LeftLeg
charactermesh_2.MeshId = 81487640
charactermesh_2.Parent = zxmbi
charactermesh_3.BodyPart = Enum.BodyPart.RightLeg
charactermesh_3.MeshId = 81487710
charactermesh_3.Parent = zxmbi
charactermesh_4.BodyPart = Enum.BodyPart.LeftArm
charactermesh_4.MeshId = 82907977
charactermesh_4.Parent = zxmbi
charactermesh_5.BodyPart = Enum.BodyPart.RightArm
charactermesh_5.MeshId = 82908019
charactermesh_5.Parent = zxmbi
pants.Name = "Pants"
pants.PantsTemplate = "http://www.roblox.com/asset/?id=144076759"
pants.Parent = zxmbi
shirt.Name = "Shirt"
shirt.ShirtTemplate = "http://www.roblox.com/asset/?id=144076357"
shirt.Parent = zxmbi
part.Anchored = true
part.Size = Vector3.new(9.5, 2, 2.25)
part.Orientation = Vector3.new(0, -90, 0)
part.Material = Enum.Material.WoodPlanks
part.BottomSurface = Enum.SurfaceType.Smooth
part.BrickColor = BrickColor.new("Brown")
part.TopSurface = Enum.SurfaceType.Smooth
part.Color = Color3.new(0.486275, 0.360784, 0.27451)
part.Parent = shack
part.CFrame = CFrame.new(217.834, 1.363, 8.354) * CFrame.Angles(0, -1.571, 0)
part_2.Anchored = true
part_2.Size = Vector3.new(0.75, 2, 6)
part_2.Orientation = Vector3.new(0, -90, 0)
part_2.Material = Enum.Material.WoodPlanks
part_2.BottomSurface = Enum.SurfaceType.Smooth
part_2.BrickColor = BrickColor.new("Brown")
part_2.TopSurface = Enum.SurfaceType.Smooth
part_2.Color = Color3.new(0.486275, 0.360784, 0.27451)
part_2.Parent = shack
part_2.CFrame = CFrame.new(221.959, 1.363, 3.979) * CFrame.Angles(0, -1.571, 0)
part_3.Anchored = true
part_3.Size = Vector3.new(0.75, 2, 0.75)
part_3.Orientation = Vector3.new(0, -90, 0)
part_3.Material = Enum.Material.WoodPlanks
part_3.BottomSurface = Enum.SurfaceType.Smooth
part_3.BrickColor = BrickColor.new("Brown")
part_3.TopSurface = Enum.SurfaceType.Smooth
part_3.Color = Color3.new(0.486275, 0.360784, 0.27451)
part_3.Parent = shack
part_3.CFrame = CFrame.new(224.584, 1.363, 12.729) * CFrame.Angles(0, -1.571, 0)
part_4.Anchored = true
part_4.Size = Vector3.new(9.5, 0.25, 6.25)
part_4.Orientation = Vector3.new(0, -90, 0)
part_4.Material = Enum.Material.WoodPlanks
part_4.BottomSurface = Enum.SurfaceType.Smooth
part_4.BrickColor = BrickColor.new("Brown")
part_4.TopSurface = Enum.SurfaceType.Smooth
part_4.Color = Color3.new(0.486275, 0.360784, 0.27451)
part_4.Parent = shack
part_4.CFrame = CFrame.new(222.084, 0.488, 8.354) * CFrame.Angles(0, -1.571, 0)
part_5.Anchored = true
part_5.Size = Vector3.new(0.5, 6, 0.5)
part_5.Orientation = Vector3.new(0, -90, 0)
part_5.Material = Enum.Material.WoodPlanks
part_5.BottomSurface = Enum.SurfaceType.Smooth
part_5.BrickColor = BrickColor.new("Brown")
part_5.TopSurface = Enum.SurfaceType.Smooth
part_5.Color = Color3.new(0.486275, 0.360784, 0.27451)
part_5.Parent = shack
part_5.CFrame = CFrame.new(216.959, 5.363, 3.854) * CFrame.Angles(0, -1.571, 0)
part_6.Anchored = true
part_6.Size = Vector3.new(0.5, 6, 0.5)
part_6.Orientation = Vector3.new(0, -90, 0)
part_6.Material = Enum.Material.WoodPlanks
part_6.BottomSurface = Enum.SurfaceType.Smooth
part_6.BrickColor = BrickColor.new("Brown")
part_6.TopSurface = Enum.SurfaceType.Smooth
part_6.Color = Color3.new(0.486275, 0.360784, 0.27451)
part_6.Parent = shack
part_6.CFrame = CFrame.new(216.959, 5.363, 12.854) * CFrame.Angles(0, -1.571, 0)
part_7.Anchored = true
part_7.Size = Vector3.new(9.5, 2, 0.5)
part_7.Orientation = Vector3.new(0, -90, 0)
part_7.Material = Enum.Material.WoodPlanks
part_7.BottomSurface = Enum.SurfaceType.Smooth
part_7.BrickColor = BrickColor.new("Brown")
part_7.TopSurface = Enum.SurfaceType.Smooth
part_7.Color = Color3.new(0.486275, 0.360784, 0.27451)
part_7.Parent = shack
part_7.CFrame = CFrame.new(216.959, 9.363, 8.354) * CFrame.Angles(0, -1.571, 0)
surfacegui.LightInfluence = 1
surfacegui.Face = Enum.NormalId.Back
surfacegui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
surfacegui.ClipsDescendants = true
surfacegui.Parent = part_7
textlabel.TextWrapped = true
textlabel.BackgroundTransparency = 1
textlabel.BackgroundColor3 = Color3.new(1, 1, 1)
textlabel.TextSize = 14
textlabel.TextScaled = true
textlabel.Font = Enum.Font.SourceSans
textlabel.Text = "A random shack"
textlabel.TextStrokeTransparency = 0
textlabel.TextColor3 = Color3.new(1, 1, 1)
textlabel.Size = UDim2.new(1, 0, 1, 0)
textlabel.Parent = surfacegui
part_8.Anchored = true
part_8.Size = Vector3.new(9.5, 0.25, 8)
part_8.Orientation = Vector3.new(0, -90, 0)
part_8.Material = Enum.Material.WoodPlanks
part_8.BottomSurface = Enum.SurfaceType.Smooth
part_8.BrickColor = BrickColor.new("Brown")
part_8.TopSurface = Enum.SurfaceType.Smooth
part_8.Color = Color3.new(0.486275, 0.360784, 0.27451)
part_8.Parent = shack
part_8.CFrame = CFrame.new(221.209, 10.238, 8.354) * CFrame.Angles(0, -1.571, 0)
part_9.Anchored = true
part_9.Size = Vector3.new(9.5, 9.75, 0.25)
part_9.Orientation = Vector3.new(0, -90, 0)
part_9.Material = Enum.Material.WoodPlanks
part_9.BottomSurface = Enum.SurfaceType.Smooth
part_9.BrickColor = BrickColor.new("Brown")
part_9.TopSurface = Enum.SurfaceType.Smooth
part_9.Color = Color3.new(0.486275, 0.360784, 0.27451)
part_9.Parent = shack
part_9.CFrame = CFrame.new(225.084, 5.238, 8.354) * CFrame.Angles(0, -1.571, 0)
part_10.Anchored = true
part_10.Size = Vector3.new(0.25, 1.75, 7.75)
part_10.Orientation = Vector3.new(0, -90, 0)
part_10.Material = Enum.Material.WoodPlanks
part_10.BottomSurface = Enum.SurfaceType.Smooth
part_10.BrickColor = BrickColor.new("Brown")
part_10.TopSurface = Enum.SurfaceType.Smooth
part_10.Color = Color3.new(0.486275, 0.360784, 0.27451)
part_10.Parent = shack
part_10.CFrame = CFrame.new(221.084, 9.238, 3.729) * CFrame.Angles(0, -1.571, 0)
part_11.Anchored = true
part_11.Size = Vector3.new(0.25, 1.75, 7.75)
part_11.Orientation = Vector3.new(0, -90, 0)
part_11.Material = Enum.Material.WoodPlanks
part_11.BottomSurface = Enum.SurfaceType.Smooth
part_11.BrickColor = BrickColor.new("Brown")
part_11.TopSurface = Enum.SurfaceType.Smooth
part_11.Color = Color3.new(0.486275, 0.360784, 0.27451)
part_11.Parent = shack
part_11.CFrame = CFrame.new(221.084, 9.238, 12.979) * CFrame.Angles(0, -1.571, 0)
part_12.Anchored = true
part_12.Size = Vector3.new(5.25, 0.25, 1.5)
part_12.Orientation = Vector3.new(0, -90, 0)
part_12.Material = Enum.Material.WoodPlanks
part_12.BottomSurface = Enum.SurfaceType.Smooth
part_12.BrickColor = BrickColor.new("Brown")
part_12.TopSurface = Enum.SurfaceType.Smooth
part_12.Color = Color3.new(0.486275, 0.360784, 0.27451)
part_12.Parent = shack
part_12.CFrame = CFrame.new(224.209, 2.738, 8.354) * CFrame.Angles(0, -1.571, 0)
part_13.Anchored = true
part_13.Size = Vector3.new(3, 3, 0.05)
part_13.Orientation = Vector3.new(0, -90, 33.75)
part_13.Material = Enum.Material.SmoothPlastic
part_13.BottomSurface = Enum.SurfaceType.Smooth
part_13.BrickColor = BrickColor.new("Institutional white")
part_13.TopSurface = Enum.SurfaceType.Smooth
part_13.Color = Color3.new(0.972549, 0.972549, 0.972549)
part_13.Parent = shack
part_13.CFrame = CFrame.new(224.937, 6.338, 6.504) * CFrame.Angles(-0.589, -1.571, 0)
oc_star_glitcher_drawing.Texture = "http://www.roblox.com/asset/?id=4372078628"
oc_star_glitcher_drawing.Name = "oc star glitcher drawing"
oc_star_glitcher_drawing.Face = Enum.NormalId.Back
oc_star_glitcher_drawing.Parent = part_13
part_14.Anchored = true
part_14.Size = Vector3.new(3, 3, 0.05)
part_14.Orientation = Vector3.new(0, -90, -11.25)
part_14.Material = Enum.Material.SmoothPlastic
part_14.BottomSurface = Enum.SurfaceType.Smooth
part_14.BrickColor = BrickColor.new("Institutional white")
part_14.TopSurface = Enum.SurfaceType.Smooth
part_14.Color = Color3.new(0.972549, 0.972549, 0.972549)
part_14.Parent = shack
part_14.CFrame = CFrame.new(224.937, 7.29, 10.749) * CFrame.Angles(0.196, -1.571, 0)
lua.Texture = "http://www.roblox.com/asset/?id=2164076881"
lua.Name = "Lua"
lua.Face = Enum.NormalId.Back
lua.Parent = part_14
part_15.Anchored = true
part_15.Size = Vector3.new(0.75, 2, 2.5)
part_15.Orientation = Vector3.new(0, -90, 0)
part_15.Material = Enum.Material.WoodPlanks
part_15.BottomSurface = Enum.SurfaceType.Smooth
part_15.BrickColor = BrickColor.new("Brown")
part_15.TopSurface = Enum.SurfaceType.Smooth
part_15.Color = Color3.new(0.486275, 0.360784, 0.27451)
part_15.Parent = shack
part_15.CFrame = CFrame.new(220.209, 1.363, 12.729) * CFrame.Angles(0, -1.571, 0)
part_16.Anchored = true
part_16.Shape = Enum.PartType.Cylinder
part_16.Size = Vector3.new(0.25, 2, 2)
part_16.Material = Enum.Material.DiamondPlate
part_16.Orientation = Vector3.new(0, 0, 90)
part_16.BottomSurface = Enum.SurfaceType.Smooth
part_16.BrickColor = BrickColor.new("Mid gray")
part_16.Color = Color3.new(0.803922, 0.803922, 0.803922)
part_16.TopSurface = Enum.SurfaceType.Smooth
part_16.Parent = shack
part_16.CFrame = CFrame.new(221.209, 9.988, 8.354) * CFrame.Angles(0, 0, 1.571)
part_17.Shape = Enum.PartType.Ball
part_17.Size = Vector3.new(1, 1, 1)
part_17.Orientation = Vector3.new(0, 0, 90)
part_17.Material = Enum.Material.Neon
part_17.BottomSurface = Enum.SurfaceType.Smooth
part_17.BrickColor = BrickColor.new("Institutional white")
part_17.TopSurface = Enum.SurfaceType.Smooth
part_17.Color = Color3.new(0.972549, 0.972549, 0.972549)
part_17.Parent = shack
part_17.CFrame = CFrame.new(221.209, 7.488, 8.354) * CFrame.Angles(0, 0, 1.571)
ropeconstraint.Visible = true
ropeconstraint.Length = 2
ropeconstraint.Thickness = 0.2
ropeconstraint.Attachment1 = attachment
ropeconstraint.Color = BrickColor.new("Institutional white")
ropeconstraint.Attachment0 = attachment_2
ropeconstraint.Parent = part_17
pointlight.Brightness = 8
pointlight.Range = 10
pointlight.Shadows = true
pointlight.Parent = part_17
