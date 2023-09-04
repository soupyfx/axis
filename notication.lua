local notication = {}

function notication.new(libary, name, options)
	local notication = {}
	notication.data = libary.internal.verify({
		title = "title",
        text = "text",
        lifetime = 5
	}, options or {})
	
	local instance = libary.gui.assets.notication:Clone()
	instance.title.Text = notication.data.title
	instance.text.Text = notication.data.text
	instance.Parent = libary.gui.notications.objects
	
	notication.instance = instance
	
	--[[
	/ destroy
	/ destroys the notication
	]]

	function notication.destroy()
		table.remove(libary.internal.elements.notication, table.find(libary.internal.elements.title, notication, 1))
		notication.instance:Destroy()
	end

	task.defer(function()
		task.wait(notication.data.lifetime)
		notication.destroy()
	end)

	notication.instance.button.Activated:Connect(function()
		notication.destroy()
	end)

	print("----- notifcation -----")
	print(notication)

	return notication
end

return notication
