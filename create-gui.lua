local create = {}
local Objects = {}

function create:CreateInstance(class, parent, properties)
	local obj = Instance.new(class)
	if parent then
		obj.Parent = parent
	end
	
	for i,v in next, properties do
		obj[i] = v
	end
	
	table.insert(Objects, obj)
	return obj
end

function create:ScreenGui(name, parent)
	name = name or "ScreenGui"

	local ScreenGui = create:CreateInstance("ScreenGui", parent, {
		Name = name
	})
end

return create
