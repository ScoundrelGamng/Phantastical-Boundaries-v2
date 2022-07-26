float = true;
stopfloat = false;
local i = 0

function onCreate()
	-- triggered when the lua file is started
	addCharacterToList('YuyukoZom', 'dad');
end

function onEvent(name, value1, value2)
if name == "OpponentAppear" then
		runTimer('delete', 7.5);
		runTimer('change', 1);
end
end

function onUpdatePost(elapsed)
--need to make the y values different to look smooth, cant really fix this with tweens because THEY WONT WORK
-- I HATE PSYCH ENGINE
daElapsed = elapsed * 30
	i = i + daElapsed
if stopfloat == true then
	setProperty('dad.y', -350)
	else
	setProperty('dad.y', (math.sin(i/20)*45) - 300)
end
if float == true then
	setProperty('dad.y', (math.sin(i/20)*45) - 50)
end
end

function onTimerCompleted(tag, loops, loopsLeft)
if tag == 'change' then
stopfloat = true;
float = false;
		setCharacterX('dad', 390)
		triggerEvent('Change Character', 1, 'YuyukoZom');
		setProperty('dad.alpha', 1);
		triggerEvent('Play Animation', 'appear', 'YuyukoZom');
end
if tag == 'delete' then
 stopfloat = false;
  doTweenX('dadtweenX','dad', -400, 2, 'circinout');
	   doTweenAlpha('dad2icontween','iconP2', 1, 1);
end
end