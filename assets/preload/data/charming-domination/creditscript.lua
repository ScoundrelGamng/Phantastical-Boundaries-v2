function onSongStart()
		makeLuaSprite('NephCreditCD', 'NephCreditCD', -840, 400);
		doTweenX('composermove', 'NephCreditCD', 0, 1, 'circOut');
		scaleObject('NephCreditCD', 0.9, 0.9);
		addLuaSprite('NephCreditCD', true);
		setObjectCamera('NephCreditCD', 'other');
		runTimer('deletecomposer', 4);
end

function onTimerCompleted(tag, loops, loopsLeft)
if tag == 'deletecomposer' then
	doTweenX('composermove2', getProperty('NephCreditCD'), -840, 1, 'circIn');
	runTimer('deletecomposer2', 1.2);
end
if tag == 'deletecomposer2' then
removeLuaSprite('NephCreditCD');
end
end