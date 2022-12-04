local allowCountdown = false
function onStartCountdown()
	-- Block the first countdown and start a timer of 0.8 seconds to play the dialogue
	if not allowCountdown and isStoryMode and not seenCutscene then
		toggleHud(false);
		setProperty('inCutscene', true);
		runTimer('startDialogue', 2);
		makeLuaSprite('CG3', 'CG3', 0, 0);
		scaleObject('CG3', 0.67, 0.67);
		addLuaSprite('CG3', true);
		setObjectCamera('CG3', 'hud');
		setObjectOrder('CG3', 0);
		allowCountdown = true;
		return Function_Stop;
	end
	doTweenAlpha('CGTween2', 'CG7', 0, 0.4, 'linear');
	return Function_Continue;
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'startDialogue' then -- Timer completed, play dialogue
		startDialogue('dialogue', 'folklore');
		doTweenAlpha('GUItween', 'camHUD', 1, 0.5, 'linear');
	end
end

function onTweenCompleted(tag)
	if tag == 'CGTween2' then
	removeLuaSprite('CG7');
	toggleHud(true);
end
end
-- Dialogue (When a dialogue is finished, it calls startCountdown again)
function onNextDialogue(count)	
if count == 2  and not allowEndShit then
	makeLuaSprite('CG4', 'CG4', 0, 0);
		scaleObject('CG4', 0.67, 0.67);
		addLuaSprite('CG4', true);
		setObjectCamera('CG4', 'hud');	
		setObjectOrder('CG4', 0);
		removeLuaSprite('CG3');
	end
	
if count == 5 and not allowEndShit then
	makeLuaSprite('CG5', 'CG5', 0, 0);
		scaleObject('CG5', 0.67, 0.67);
		addLuaSprite('CG5', true);
		setObjectCamera('CG5', 'hud');
		setObjectOrder('CG5', 0);
		removeLuaSprite('CG4');
	end

	if count == 8 and not allowEndShit then
	makeLuaSprite('CG6', 'CG6', 0, 0);
		scaleObject('CG6', 0.67, 0.67);
		addLuaSprite('CG6', true);
		setObjectCamera('CG6', 'hud');	
		setObjectOrder('CG6', 0);
		playSound('laser', 1);
		removeLuaSprite('CG5');
	end
	if count == 9 and not allowEndShit then
		makeLuaSprite('CG7', 'CG7', 0, 0);
		scaleObject('CG7', 0.67, 0.67);
		addLuaSprite('CG7', true);
		setObjectCamera('CG7', 'hud');
		setObjectOrder('CG7', 0);
		playSound('partyhorn', 1);
	removeLuaSprite('CG6');
	end

if count == 55 then
	makeLuaSprite('CG8', 'CG8', 0, 0);
		scaleObject('CG8', 0.67, 0.67);
		addLuaSprite('CG8', true);
		setObjectCamera('CG8', 'hud');
		setObjectOrder('CG8', 0);
		removeLuaSprite('realmCG');
	end
	-- triggered when the next dialogue line starts, 'line' starts with 1
end

function onSkipDialogue(count)
	if getProperty('skippedDialogue') == true then
		setProperty('skippedDialogue', false);
			removeLuaSprite('CG3');
			removeLuaSprite('CG4');
			removeLuaSprite('CG5');
			removeLuaSprite('CG6');
			removeLuaSprite('CG7');
			removeLuaSprite('realmCG');
			removeLuaSprite('CG8');
			toggleHud(true);
	end
end

allowEndShit = false

function onEndSong()
 if not allowEndShit and isStoryMode and not seenCutscene then
  setProperty('inCutscene', true);
  startDialogue('dialogue2', 'folklore'); 
  	makeLuaSprite('realmCG', 'realmCG', 0, 0);
		scaleObject('realmCG', 0.67, 0.67);
		addLuaSprite('realmCG', true);
		setObjectCamera('realmCG', 'hud');	
		setObjectOrder('realmCG', 0);
  allowEndShit = true;
  return Function_Stop;
 end
 return Function_Continue;
end