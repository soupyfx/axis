local title = {}

function title.new(parents, name, options)
	local title = {}
	title.data = parents.libary.internal.verify({
		title = "title",
	}, options or {})
	
	local instance = parents.libary.gui.assets.title:Clone()
	instance.Text = title.data.title
	instance.LayoutOrder = parents.tab._layout()
	instance.Parent = parents.tab.instances.frame.objects
	
	title.instance = instance
	
	--[[
	/ destroy
	/ destroys the title
	]]

	function title.destroy()
		table.remove(parents.libary.internal.elements.title, table.find(parents.libary.internal.elements.title, name, 1))
		title.instance:Destroy()
	end
	
	--[[
	/ rename
	/ renames the title
	/ title <string>
	]]

	function title.rename(new)
		title.data.title = new
		title.instance.Text = new
	end

	print("----- title -----")
	print(title)

	return title
end

return title
