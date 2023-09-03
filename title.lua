local title = {}

function title.new(parents, name, options)
	local title = {}
	title.options = parents.libary.internal.verify({
		title = "title",
	}, options or {})
	
	local instance = parents.libary.gui.assets.title:Clone()
	instance.Text = title.options.title
	instance.LayoutOrder = parents.tab._layout()
	instance.Parent = parents.tab.instances.frame.objects
	
	title.instance = instance
	
	--[[
	/ destroy
	/ destroys the title
	]]

	function title.destroy()
		table.remove(parents.libary.elements.title, table.find(parents.libary.elements.title, name, 1))
		title.instance:Destroy()
	end
	
	--[[
	/ rename
	/ renames the title
	/ title <string>
	]]

	function title.rename(new)
		title.options.title = new
		title.instance.Text = new
	end

	return title
end

return title
