function onSongStart()
		makeLuaSprite('WookyCreditSakura', 'WookyCreditSakura', -840, 400);
		doTweenX('composermove', 'WookyCreditSakura', 0, 1, 'circOut');
		scaleObject('WookyCreditSakura', 0.9, 0.9);
		addLuaSprite('WookyCreditSakura', true);
		setObjectCamera('WookyCreditSakura', 'other');
		runTimer('deletecomposer', 4);
end

function onTimerCompleted(tag, loops, loopsLeft)
if tag == 'deletecomposer' then
	doTweenX('composermove2', getProperty('WookyCreditSakura'), -840, 1, 'circIn');
	runTimer('deletecomposer2', 1.2);
end
if tag == 'deletecomposer2' then
removeLuaSprite('WookyCreditSakura');
end
end