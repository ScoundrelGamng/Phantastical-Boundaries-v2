function onSongStart()
		makeLuaSprite('NephCreditBoL', 'NephCreditBoL', -840, 400);
		doTweenX('composermove', 'NephCreditBoL', 0, 1, 'circOut');
		scaleObject('NephCreditBoL', 0.9, 0.9);
		addLuaSprite('NephCreditBoL', true);
		setObjectCamera('NephCreditBoL', 'other');
		runTimer('deletecomposer', 4);
end

function onTimerCompleted(tag, loops, loopsLeft)
if tag == 'deletecomposer' then
	doTweenX('composermove2', getProperty('NephCreditBoL'), -840, 1, 'circIn');
	runTimer('deletecomposer2', 1.2);
end
if tag == 'deletecomposer2' then
removeLuaSprite('NephCreditBoL');
end
end