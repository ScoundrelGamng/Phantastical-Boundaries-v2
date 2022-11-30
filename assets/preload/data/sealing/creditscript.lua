function onSongStart()
		makeLuaSprite('WookyCreditSealing', 'WookyCreditSealing', -840, 400);
		doTweenX('composermove', 'WookyCreditSealing', 0, 1, 'circOut');
		scaleObject('WookyCreditSealing', 0.9, 0.9);
		addLuaSprite('WookyCreditSealing', true);
		setObjectCamera('WookyCreditSealing', 'other');
		runTimer('deletecomposer', 4);
end

function onTimerCompleted(tag, loops, loopsLeft)
if tag == 'deletecomposer' then
	doTweenX('composermove2', getProperty('WookyCreditSealing'), -840, 1, 'circIn');
	runTimer('deletecomposer2', 1.2);
end
if tag == 'deletecomposer2' then
removeLuaSprite('WookyCreditSealing');
end
end