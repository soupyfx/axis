local paragraph = {}

function paragraph.new(parents, name, options)
	local paragraph = {}
	paragraph.data = parents.libary.internal.verify({
		text = "axis made by soupyfx github.com/soupyfx/axis",
		size = 14
	}, options or {})
	
	local instance = parents.libary.gui.assets.paragraph:Clone()
	instance.Text = paragraph.data.text
	instance.TextSize = paragraph.data.size
	instance.LayoutOrder = parents.tab._layout()
	instance.Parent = parents.tab.instances.frame.objects
	
	paragraph.instance = instance
	
	function paragraph._update()
		paragraph.instance.Size = UDim2.new(paragraph.instance.Size.X.Scale,paragraph.instance.Size.X.Offset,0,math.huge)
		paragraph.instance.Size = UDim2.new(paragraph.instance.Size.X.Scale,paragraph.instance.Size.X.Offset,0,paragraph.instance.TextBounds.Y)
	end
	paragraph._update()
	
	--[[
	/ destroy
	/ destroys the paragraph
	]]

	function paragraph.destroy()
		table.remove(parents.libary.internal.elements.paragraph, table.find(parents.libary.internal.elements.paragraph, name, 1))
		paragraph.instance:Destroy()
	end

	--[[
	/ rename
	/ renames the paragraph
	/ title <string>
	]]

	function paragraph.rename(title)
		paragraph.data.title = title
		paragraph.instance.Text = title
		
		paragraph._update()
	end
	
	--[[
	/ resize
	/ renames the paragraph
	/ name <string>
	]]

	function paragraph.resize(size)
		paragraph.data.size = size
		paragraph.instance.TextSize = size

		paragraph._update()
	end

	print("----- paragraph -----")
	print(paragraph)

	return paragraph
end

return paragraph