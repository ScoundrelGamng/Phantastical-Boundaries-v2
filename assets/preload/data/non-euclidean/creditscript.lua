function onSongStart()
		makeLuaSprite('WookyCreditNE', 'WookyCreditNE', -800, 400);
		doTweenX('composermove', 'WookyCreditNE', 0, 1, 'circOut');
		scaleObject('WookyCreditNE', 0.9, 0.9);
		addLuaSprite('WookyCreditNE', true);
		setObjectCamera('WookyCreditNE', 'other');
		runTimer('deletecomposer', 4);
end

function onTimerCompleted(tag, loops, loopsLeft)
if tag == 'deletecomposer' then
	doTweenX('composermove2', getProperty('WookyCreditNE'), -800, 1, 'circIn');
	runTimer('deletecomposer2', 1.2);
end
if tag == 'deletecomposer2' then
removeLuaSprite('WookyCreditNE');
end
end