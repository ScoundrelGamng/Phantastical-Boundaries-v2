function onSongStart()
		makeLuaSprite('NephCreditIT', 'NephCreditIT', -840, 400);
		doTweenX('composermove', 'NephCreditIT', 0, 1, 'circOut');
		scaleObject('NephCreditIT', 0.9, 0.9);
		addLuaSprite('NephCreditIT', true);
		setObjectCamera('NephCreditIT', 'other');
		runTimer('deletecomposer', 4);
end

function onTimerCompleted(tag, loops, loopsLeft)
if tag == 'deletecomposer' then
	doTweenX('composermove2', getProperty('NephCreditIT'), -840, 1, 'circIn');
	runTimer('deletecomposer2', 1.2);
end
if tag == 'deletecomposer2' then
removeLuaSprite('NephCreditIT');
end
end