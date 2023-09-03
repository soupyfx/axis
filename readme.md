# axis

axis is a simple ui framework that i made

```lua
loadstring = loadstring(game:HttpGet("https://raw.githubusercontent.com/soupyfx/axis/main/main.lua"))()
```
## progress

- [x]  button
- [x]  toggle
- [x]  slider
- [x]  dropdown
- [x]  title
- [x]  pargraph
- [x]  notifcation
- [ ]  loading screen
- [ ]  textbox
- [ ]  keybind
- [ ]  themes
- [ ]  color selector
- [ ]  active list
- [ ]  sound

## usage

the usage of the libary (its the docs lol)

### syntax

when creating a new object the function always follows this syntax (except creating a new window)
```lua
thing.object( name, data )
```
#### name
> a unique identifier for the object and can only be set once per object type

example
> not allowed
> ```lua
> thing.button("thing", {))
> thing.button("thing", {))
> ```
> allowed
> ```lua
> thing.button("thing", {))
> thing.slider("thing", {))
> ```
#### data
> data is uniquie to the object type and contains the data for the object

### window
```lua
axis = loadstring.new{
	title = "my gaming chair",
	key = { enabled = true, key = "somethingsecret" }
}
```
> [!IMPORTANT]
> its recomended to return from your script if the .new returns nil because that means that the key was not accepted
> ```lua
> if not axis then return end
> ```
### tab
#### creating
```lua
tab = axis.tab("tab", { 
    title = "tab" 
})
```
#### select
> select the tab and unselects the current tab
```lua
tab.select()
```
### button
#### creating
```lua
button = tab.button("button", { 
    title = "press this to explode", 
    callback = function() 
        -- code to explode player
    end})
```
#### rename
```lua
button.rename("press this for secret")
```
#### destroying
```lua
button.destroy()
```
#### callback 
> changes the callback to the function
```lua
button.callback(function()
    print("haha get pranked you arnt going to explode")
end)
```
### toggle
#### creating
```lua
toggle = tab.toggle("button", { 
    title = "fly", 
    callback = function() 
        -- code to fly
    end})
```
#### rename
```lua
toggle.rename("unfly")
```
#### destroying
```lua
toggle.destroy()
```
#### callback 
> changes the callback to the function
```lua
toggle.callback(function()
    -- i dont have a funny joke for this one
end)
```
#### set
> sets the value of the toggle
```lua
toggle.set(false)
```
#### toggle
> toggles the toggle
```lua
toggle.toggle()
```
### slider
#### creating
```lua
slider = tab.slider("walkspeed", { 
    title = "nil", 
    min = 0, 
    max = 100, 
    callback = function() 
        -- code to set the players speed
    end})
```
#### rename
```lua
slider.rename("speedier")
```
#### destroying
```lua
slider.destroy()
```
#### callback
> changes the callback to the function
```lua
slider.callback(function()
    -- i am speed
end)
```
#### set
> sets the value of the toggle
```lua
slider.set(101)
```
> [!IMPORTANT]
> you can set the slider to above the max or min but it isnt recomended as can cause unexpected behavor
### dropdown
#### creating
```lua
dropdown = tab.dropdown("dropdown", { 
    title = "explode player", 
    values = {"player one", "soupyfx", "gamer"}, 
    callback = function() 
        -- code to explode
    end})
```
#### rename
```lua
dropdown.rename("sheeeesh")
```
#### destroying
```lua
dropdown.destroy()
```
#### toggle
> toggles the dropdown to be open or closed
```lua
dropdown.toggle()
```
#### set
> sets the value of the dropdown to be opened or closed
```lua
dropdown.set(true)
```
#### callback
```lua
dropdown.callback(function()
    -- code to explode
end)
```
#### values
> sets the values
```lua
dropdown.values{"player one", "player two", "player three"}
```
### title
#### creating
```lua
title = tab.title("title", { title = "cool title" })
```
#### rename
```lua
title.rename("even cooler title")
```
#### destroying
```lua
title.destroy()
```
### pargraph
#### creating
```lua
paragraph = tab.paragraph("paragraph", { 
    text = "i am a paragraph", 
    size = 0})
```
> [!NOTE]
> size in this context is the size of the text
#### rename
```lua
paragraph.rename("i am a longer paragraph")
```
#### destroying
```lua
paragraph.destroy()
```
#### resizing 
> changes the size of the text
```lua
paragraph.resize(1) -- ity bity
```
