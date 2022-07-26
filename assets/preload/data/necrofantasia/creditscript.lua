function onSongStart()
		makeLuaSprite('NephCreditNecro', 'NephCreditNecro', -800, 400);
		doTweenX('composermove', 'NephCreditNecro', 0, 1, 'circOut');
		scaleObject('NephCreditNecro', 0.9, 0.9);
		addLuaSprite('NephCreditNecro', true);
		setObjectCamera('NephCreditNecro', 'other');
		runTimer('deletecomposer', 4);
end

function onTimerCompleted(tag, loops, loopsLeft)
if tag == 'deletecomposer' then
	doTweenX('composermove2', getProperty('NephCreditNecro'), -800, 1, 'circIn');
	runTimer('deletecomposer2', 1.2);
end
if tag == 'deletecomposer2' then
removeLuaSprite('NephCreditNecro');
end
end