local function keyCode(key, modifiers)
   modifiers = modifiers or {}
   return function()
      hs.eventtap.event.newKeyEvent(modifiers, string.lower(key), true):post()
      hs.timer.usleep(1000)
      hs.eventtap.event.newKeyEvent(modifiers, string.lower(key), false):post()      
   end
end

local function remapKey(modifiers, key, keyCode)
   hs.hotkey.bind(modifiers, key, keyCode, nil, keyCode)
end

local function disableAllHotkeys()
   for k, v in pairs(hs.hotkey.getHotkeys()) do
      v['_hk']:disable()
   end
end

local function enableAllHotkeys()
   for k, v in pairs(hs.hotkey.getHotkeys()) do
      v['_hk']:enable()
   end
end

local function handleGlobalAppEvent(name, event, app)
   if event == hs.application.watcher.activated then
      -- hs.alert.show(name)
      if name ~= "ターミナル" and name ~= "Emacs" then
         enableAllHotkeys()
      else
         disableAllHotkeys()
      end
   end
end

appsWatcher = hs.application.watcher.new(handleGlobalAppEvent)
appsWatcher:start()

-- remap settings
remapKey({'ctrl'}, 'p', keyCode('up'))
remapKey({'ctrl'}, 'n', keyCode('down'))
remapKey({'ctrl'}, 'f', keyCode('right'))
remapKey({'ctrl'}, 'b', keyCode('left'))

remapKey({'ctrl'}, 's', keyCode('f', {'cmd'}))
remapKey({'ctrl'}, 'g', keyCode('escape'))
remapKey({'ctrl'}, 'j', keyCode('return'))

remapKey({'ctrl'}, 'h', keyCode('delete'))
remapKey({'ctrl'}, 'd', keyCode('forwarddelete'))

remapKey({'ctrl'}, 'a', keyCode('left', {'cmd'}))
remapKey({'ctrl'}, 'e', keyCode('right', {'cmd'}))

remapKey({'ctrl'}, 'v', keyCode('pagedown'))
remapKey({'option'}, 'v', keyCode('pageup'))
