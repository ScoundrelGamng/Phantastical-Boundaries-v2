function onSongStart()
		makeLuaSprite('WookyCreditGreenwich', 'WookyCreditGreenwich', -840, 400);
		doTweenX('composermove', 'WookyCreditGreenwich', 0, 1, 'circOut');
		scaleObject('WookyCreditGreenwich', 0.9, 0.9);
		addLuaSprite('WookyCreditGreenwich', true);
		setObjectCamera('WookyCreditGreenwich', 'other');
		runTimer('deletecomposer', 4);
end

function onTimerCompleted(tag, loops, loopsLeft)
if tag == 'deletecomposer' then
	doTweenX('composermove2', getProperty('WookyCreditGreenwich'), -840, 1, 'circIn');
	runTimer('deletecomposer2', 1.2);
end
if tag == 'deletecomposer2' then
removeLuaSprite('WookyCreditGreenwich');
end
end