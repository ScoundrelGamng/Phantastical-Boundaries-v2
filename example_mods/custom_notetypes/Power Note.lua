function onCreate()
--initialize variables and preload stuff

	precacheImage('power');
	precacheImage('NOTE_power');
	precacheSound('powerdown');
	power = 0;
	powered = false;
	
--creates the counter and power icon
	makeLuaText('Counter',power,120,630,600)
	setTextSize('Counter', 36)
	addLuaText('Counter', true)
	setTextAlignment('Counter', 'left')
  	makeLuaSprite('power', 'power', 580, 600);
	setObjectCamera('power', 'hud');
	scaleLuaSprite('power', 0.3, 0.3);
	addLuaSprite('power', true); 

	setProperty('Counter.alpha', 0)
	setProperty('power.alpha', 0)

	if getPropertyFromClass('ClientPrefs', 'downScroll') == false then
		setProperty('Counter.y', 90)
		setProperty('power.y', 90)
	end
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		--Check if the note is an Instakill Note
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Power Note' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'NOTE_power'); --Change texture

			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then --Doesn't let Dad/Opponent notes get ignored
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', true); --Miss has no penalties
			end
		end
	end
	--debugPrint('Script started!')
end

function onCountdownTick(counter)
	doTweenAlpha('countertween', 'Counter', 1, 0.4, 'linear');
	doTweenAlpha('countertween2', 'power', 1, 0.4, 'linear');
	end

-- Function called when you hit a note (after note hit calculations)
-- id: The note member id, you can get whatever variable you want from this note, example: "getPropertyFromGroup('notes', id, 'strumTime')"
-- noteData: 0 = Left, 1 = Down, 2 = Up, 3 = Right
-- noteType: The note type string/tag
-- isSustainNote: If it's a hold note, can be either true or false
function goodNoteHit(id, noteData, noteType, isSustainNote)
	--increasing power health mult by increments of 0.5
	if power >= 0.5 and power < 1 then
	setProperty('health',getProperty('health') + 0.025);
	end
	if power >= 1 and power < 1.5 then
	setProperty('health',getProperty('health') + 0.035);
	end
	if power >= 1.5 and power < 2 then
	setProperty('health',getProperty('health') + 0.045);
	end
	if power >= 2 and power < 2.5 then
	setProperty('health',getProperty('health') + 0.055);
	end
	if power >= 2.5 and power < 3 then
	setProperty('health',getProperty('health') + 0.065);
	end
	--never go above three for even a frame
	if noteType == 'Power Note' and power < 3 then
			power = power + 0.1;
			setProperty('health',getProperty('health') - 0.01);
			characterDance('BF', true);
		end
		end

function onUpdate(elapsed)
--power counter
setTextString('Counter', power)
	if power > 0.9 and getProperty('health') <= 0 then
	power = (math.floor((power * 10 - 10)) / 10);
	playSound('powerdown', 1.2);
	setProperty('health',getProperty('health') + 1);
	powered = true;
	setBlendMode('boyfriend', 'add');
	runTimer('blend', 0.8);
	end
	if power <= 0 then
	power = 0
	end
end
function onUpdatePost()
--when bf dies, he respawn with less power
	if powered == true then
--spawns P sprites
	makeLuaSprite('p', 'power', getProperty('boyfriend.x'), getProperty('boyfriend.y'));
	setObjectCamera('p', 'game');
	scaleLuaSprite('p', 0.8, 0.8);
	addLuaSprite('p', true); 
	doTweenX('ptweenX', 'p', math.random(getProperty('boyfriend.x') - 500, getProperty('boyfriend.x') + 900), 1, 'circOut');
	doTweenY('ptweenY', 'p', math.random(getProperty('boyfriend.y') - 400, getProperty('boyfriend.y') + 200), 1, 'circOut');
	doTweenAngle('ptweenangle', 'p', math.random(50, 200), 1.4, 'circOut')
	doTweenAlpha('palphatween', 'p', 0, 0.8, 'circIn');
--spawns P sprites 2
makeLuaSprite('p2', 'power', getProperty('boyfriend.x'), getProperty('boyfriend.y'));
	setObjectCamera('p2', 'game');
	scaleLuaSprite('p2', 0.8, 0.8);
	addLuaSprite('p2', true); 
	doTweenX('p2tweenX', 'p2', math.random(getProperty('boyfriend.x') - 500, getProperty('boyfriend.x') + 900), 1, 'circOut');
	doTweenY('p2tweenY', 'p2', math.random(getProperty('boyfriend.y') - 400, getProperty('boyfriend.y') + 200), 1, 'circOut');
	doTweenAngle('p2tweenangle', 'p2', math.random(50, 200), 1.4, 'circOut')
	doTweenAlpha('p2alphatween', 'p2', 0, 0.8, 'circIn');
--spawns P sprites 3
	makeLuaSprite('p3', 'power', getProperty('boyfriend.x'), getProperty('boyfriend.y'));
	setObjectCamera('p3', 'game');
	scaleLuaSprite('p3', 0.8, 0.8);
	addLuaSprite('p3', true); 
	doTweenX('p3tweenX', 'p3', math.random(getProperty('boyfriend.x') - 500, getProperty('boyfriend.x') + 900), 1, 'circOut');
	doTweenY('p3tweenY', 'p3', math.random(getProperty('boyfriend.y') - 400, getProperty('boyfriend.y') + 200), 1, 'circOut');
	doTweenAngle('p3tweenangle', 'p3', math.random(50, 200), 1.4, 'circOut')
	doTweenAlpha('p3alphatween', 'p3', 0, 0.8, 'circIn');
--spawns P sprites 4
makeLuaSprite('p4', 'power', getProperty('boyfriend.x'), getProperty('boyfriend.y'));
	setObjectCamera('p4', 'game');
	scaleLuaSprite('p4', 0.8, 0.8);
	addLuaSprite('p4', true); 
	doTweenX('p4tweenX', 'p4', math.random(getProperty('boyfriend.x') - 500, getProperty('boyfriend.x') + 900), 1, 'circOut');
	doTweenY('p4tweenY', 'p4', math.random(getProperty('boyfriend.y') - 400, getProperty('boyfriend.y') + 200), 1, 'circOut');
	doTweenAngle('p4tweenangle', 'p4', math.random(50, 200), 1.4, 'circOut')
	doTweenAlpha('p4alphatween', 'p4', 0, 0.8, 'circIn');
--power false
powered = false;
runTimer('delete', 2);
end
end

function onTimerCompleted(tag, loops, loopsLeft)
if tag == 'delete' then
   removeLuaSprite('p');
   removeLuaSprite('p2');
   removeLuaSprite('p3');
   removeLuaSprite('p4');
end
if tag == 'blend' then
setBlendMode('boyfriend', 'normal');
end
end