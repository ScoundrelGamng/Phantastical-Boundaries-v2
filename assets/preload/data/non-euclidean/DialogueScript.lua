local allowCountdown = false
function onStartCountdown()
	-- Block the first countdown and start a timer of 0.8 seconds to play the dialogue
	if not allowCountdown and isStoryMode and not seenCutscene then
		setProperty('inCutscene', true);
		runTimer('startDialogue', 2);
		makeLuaSprite('realmCG', 'realmCG', 0, 0);
		scaleObject('realmCG', 0.67, 0.67);
		addLuaSprite('realmCG', true);
		setObjectCamera('realmCG', 'hud');
		setObjectOrder('realmCG', 0);
		allowCountdown = true;
		return Function_Stop;
	end
	doTweenAlpha('CGTween2', 'realmCG', 0, 0.4, 'linear');
	return Function_Continue;
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'startDialogue' then -- Timer completed, play dialogue
		startDialogue('dialogue', 'folklore');
	end
end

function onTweenCompleted(tag)
	if tag == 'CGTween2' then
	removeLuaSprite('realmCG');
end
end
-- Dialogue (When a dialogue is finished, it calls startCountdown again)
function onNextDialogue(count)	
	-- triggered when the next dialogue line starts, 'line' starts with 1
end

function onSkipDialogue(count)
	-- triggered when you press Enter and skip a dialogue line that was still being typed, dialogue line starts with 1
end