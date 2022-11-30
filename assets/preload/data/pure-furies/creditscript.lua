function onSongStart()
		makeLuaSprite('NephCreditPF', 'NephCreditPF', -840, 400);
		doTweenX('composermove', 'NephCreditPF', 0, 1, 'circOut');
		scaleObject('NephCreditPF', 0.9, 0.9);
		addLuaSprite('NephCreditPF', true);
		setObjectCamera('NephCreditPF', 'other');
		runTimer('deletecomposer', 4);
end

function onTimerCompleted(tag, loops, loopsLeft)
if tag == 'deletecomposer' then
	doTweenX('composermove2', getProperty('NephCreditPF'), -840, 1, 'circIn');
	runTimer('deletecomposer2', 1.2);
end
if tag == 'deletecomposer2' then
removeLuaSprite('NephCreditPF');
end
end