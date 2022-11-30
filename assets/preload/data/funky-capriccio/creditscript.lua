function onSongStart()
		makeLuaSprite('ScoundrelCreditFC', 'ScoundrelCreditFC', -840, 400);
		doTweenX('composermove', 'ScoundrelCreditFC', 0, 1, 'circOut');
		scaleObject('ScoundrelCreditFC', 0.9, 0.9);
		addLuaSprite('ScoundrelCreditFC', true);
		setObjectCamera('ScoundrelCreditFC', 'other');
		runTimer('deletecomposer', 4);
end

function onTimerCompleted(tag, loops, loopsLeft)
if tag == 'deletecomposer' then
	doTweenX('composermove2', getProperty('ScoundrelCreditFC'), -840, 1, 'circIn');
	runTimer('deletecomposer2', 1.2);
end
if tag == 'deletecomposer2' then
removeLuaSprite('ScoundrelCreditFC');
end
end