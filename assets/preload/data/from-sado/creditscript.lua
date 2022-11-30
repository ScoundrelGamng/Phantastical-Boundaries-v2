function onSongStart()
		makeLuaSprite('WookyCreditFS', 'WookyCreditFS', -840, 400);
		doTweenX('composermove', 'WookyCreditFS', 0, 1, 'circOut');
		scaleObject('WookyCreditFS', 0.9, 0.9);
		addLuaSprite('WookyCreditFS', true);
		setObjectCamera('WookyCreditFS', 'other');
		runTimer('deletecomposer', 4);
end

function onTimerCompleted(tag, loops, loopsLeft)
if tag == 'deletecomposer' then
	doTweenX('composermove2', getProperty('WookyCreditFS'), -840, 1, 'circIn');
	runTimer('deletecomposer2', 1.2);
end
if tag == 'deletecomposer2' then
removeLuaSprite('WookyCreditFS');
end
end