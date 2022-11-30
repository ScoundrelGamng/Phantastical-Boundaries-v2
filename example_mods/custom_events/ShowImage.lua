function onEvent(name, value1, value2)
--value1 is image name, value2 is to show (1) or delete (0)
if name == "ShowImage" and value2 == '1' then
		makeLuaSprite(value1, value1, -10, -10);
		scaleObject(value1, 0.7, 0.7);
		addLuaSprite(value1, true);
		cameraShake('other', 0.0004, 4.5);
		cameraFlash('other','ffffff', 1.6, true);
		setObjectCamera(value1, 'other');
end
if value2 == '0' then
cameraFlash('other','ffffff', 1.8, true);
removeLuaSprite(value1);
end
end