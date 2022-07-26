function onEvent(name, value1, value2)
--value1 is image name, value2 is to show (1) or delete (0)
if name == "ShowComposer" then
		makeLuaSprite(value1, value1, -800, 500);
		doTweenX('composermove', value1, 0, 1, 'circOut');
		scaleObject(value1, 0.8, 0.8);
		addLuaSprite(value1, true);
		setObjectCamera(value1, 'other');
		runTimer('deletecomposer', 2);
end
end

function onTimerCompleted(tag, loops, loopsLeft)
if tag == 'deletecomposer' then
	doTweenX('composermove2', getProperty(value1), -800, 1, 'circOut');
end
end