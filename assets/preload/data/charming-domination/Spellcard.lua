function onCreate()
--initialize variables and preload stuff
invulnerable = false;

spellcard = true;
	precacheImage('SCBG');
	precacheImage('SCBF');
	precacheImage('SCG');
	precacheSound('spellcard');
end

function noteMiss()
	if invulnerable == true then
     setProperty('health', getProperty('health') + 0.043)
	 addMisses(-1);
	 addScore(10);
	 characterDance('BF', true);
   end
   end


function onUpdatePost()
if spellcard == true and getPropertyFromClass('flixel.FlxG', 'keys.justPressed.H') then
	spellcard = false;
	invulnerable = true;
	runTimer('invulnerable', 5);
	setProperty('health', 10);
	playSound('spellcard', 1.8);
	setBlendMode('boyfriend', 'add');
	
		makeLuaText('spellcardname','Sound Sign "Rapsody in Blue"', 1000, 1920 ,520)
		setTextSize('spellcardname', 36)
		addLuaText('spellcardname', true)
		setObjectCamera('spellcardname', 'hud');
		doTweenX('SCNameMove', 'spellcardname', 200, 1.5, 'circOut');
		runTimer('deletespellcardname', 2.6);
	
		makeLuaSprite('SCBG', 'SCBG', 1920, 0);
		scaleObject('SCBG', 0.69, 0.69);
		addLuaSprite('SCBG', false);
		setObjectCamera('SCBG', 'hud');
		doTweenX('SCBGMove', 'SCBG', 0, 1, 'circOut');
		runTimer('deleteSCBG', 2);
		
		makeLuaSprite('SCG', 'SCG', 1920, 0);
		scaleObject('SCG', 0.69, 0.69);
		addLuaSprite('SCG', false);
		setObjectCamera('SCG', 'hud');
		doTweenX('SCGMove', 'SCG', 0, 1, 'circOut');
		runTimer('deleteSCG', 2);
		
		makeLuaSprite('SCBF', 'SCBF', 1920, 0);
		scaleObject('SCBF', 0.69, 0.69);
		addLuaSprite('SCBF', false);
		setObjectCamera('SCBF', 'hud');
		doTweenX('SCBFMove', 'SCBF', -100, 1.2, 'circOut');
		runTimer('deleteSCBF', 2.4);
		
end
end

function onTimerCompleted(tag, loops, loopsLeft)
if tag == 'deleteSCBG' then
doTweenAlpha('fadeSCBG2', getProperty('SCBG'), 0, 1, 'circOut');
	runTimer('deleteSCBG2', 1.2);
end
if tag == 'deleteSCBG2' then
removeLuaSprite('SCBG');
end

if tag == 'deleteSCBF' then
doTweenAlpha('fadeSCBF2', getProperty('SCBF'), 0, 1, 'circOut');
	runTimer('deleteSCBF2', 1.2);
end
if tag == 'deleteSCBF2' then
removeLuaSprite('SCBF');
end

if tag == 'deleteSCG' then
doTweenAlpha('fadeSCG2', getProperty('SCG'), 0, 1, 'circOut');
	runTimer('deleteSCG2', 1.2);
end
if tag == 'deleteSCG2' then
removeLuaSprite('SCG');
end

if tag == 'deletespellcardname' then
doTweenAlpha('fadespellcardname2', getProperty('spellcardname'), 0, 1, 'circOut');
	runTimer('deletespellcardname2', 1.2);
end
if tag == 'deletespellcardname2' then
removeLuaSprite('spellcardname');
end
if tag == 'invulnerable' then
invulnerable = false;
setBlendMode('boyfriend', 'normal');
end
end