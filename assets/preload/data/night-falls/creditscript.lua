function onSongStart()
		makeLuaSprite('NephCreditNF', 'NephCreditNF', -800, 400);
		doTweenX('composermove', 'NephCreditNF', 0, 1, 'circOut');
		scaleObject('NephCreditNF', 0.9, 0.9);
		addLuaSprite('NephCreditNF', true);
		setObjectCamera('NephCreditNF', 'other');
		runTimer('deletecomposer', 4);
end

function onTimerCompleted(tag, loops, loopsLeft)
if tag == 'deletecomposer' then
	doTweenX('composermove2', getProperty('NephCreditNF'), -800, 1, 'circIn');
	runTimer('deletecomposer2', 1.2);
end
if tag == 'deletecomposer2' then
removeLuaSprite('NephCreditNF');
end
end