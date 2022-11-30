function onSongStart()
		makeLuaSprite('NephCreditUT', 'NephCreditUT', -840, 400);
		doTweenX('composermove', 'NephCreditUT', 0, 1, 'circOut');
		scaleObject('NephCreditUT', 0.9, 0.9);
		addLuaSprite('NephCreditUT', true);
		setObjectCamera('NephCreditUT', 'other');
		runTimer('deletecomposer', 4);
end

function onTimerCompleted(tag, loops, loopsLeft)
if tag == 'deletecomposer' then
	doTweenX('composermove2', getProperty('NephCreditUT'), -840, 1, 'circIn');
	runTimer('deletecomposer2', 1.2);
end
if tag == 'deletecomposer2' then
removeLuaSprite('NephCreditUT');
end
end