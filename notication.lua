local notication = {}

function notication.new(libary, name, options)
	local notication = {}
	notication.options = libary.internal.verify({
		title = "title",
        text = "text",
        lifetime = 5
	}, options or {})
	
	local instance = libary.gui.assets.notication:Clone()
	instance.title.Text = notication.options.title
	instance.text.Text = notication.options.text
	instance.Parent = libary.gui.notications.objects
	
	notication.instance = instance
	
	--[[
	/ destroy
	/ destroys the notication
	]]

	function notication.destroy()
		table.remove(libary.elements.notication, table.find(libary.elements.title, notication, 1))
		notication.instance:Destroy()
	end

	task.defer(function()
		task.wait(notication.options.lifetime)
		notication.destroy()
	end)

	notication.instance.button.Activated:Connect(function()
		notication.destroy()
	end)

	return notication
end

return notication
