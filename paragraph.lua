local paragraph = {}

function paragraph.new(parents, name, options)
	local paragraph = {}
	paragraph.options = parents.libary.internal.verify({
		text = "axis made by soupyfx github.com/soupyfx/axis",
		size = 14
	}, options or {})
	
	local instance = parents.libary.gui.assets.paragraph:Clone()
	instance.Text = paragraph.options.text
	instance.TextSize = paragraph.options.size
	instance.LayoutOrder = parents.tab._layout()
	instance.Parent = parents.tab.instances.frame.objects
	
	paragraph.instance = instance
	
	function paragraph._update()
		instance.Size = UDim2.new(instance.Size.X.Scale,instance.Size.X.Offset,0,math.huge)
		instance.Size = UDim2.new(instance.Size.X.Scale,instance.Size.X.Offset,0,instance.TextBounds.Y)
	end
	paragraph._update()
	
	--[[
	/ destroy
	/ destroys the paragraph
	]]

	function paragraph.destroy()
		table.remove(parents.libary.elements.paragraph, table.find(parents.libary.elements.paragraph, name, 1))
		paragraph.instance:Destroy()
	end

	--[[
	/ rename
	/ renames the paragraph
	/ title <string>
	]]

	function paragraph.rename(title)
		paragraph.options.title = title
		paragraph.instance.Text = title
		
		paragraph._update()
	end
	
	--[[
	/ resize
	/ renames the paragraph
	/ name <string>
	]]

	function paragraph.resize(size)
		paragraph.options.size = size
		paragraph.instance.TextSize = size

		paragraph._update()
	end

	return paragraph
end

return paragraph