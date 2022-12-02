local allowCountdown = false
function onStartCountdown()
	-- Block the first countdown and start a timer of 0.8 seconds to play the dialogue
	if not allowCountdown and isStoryMode and not seenCutscene then
		toggleHud(false);
		setProperty('inCutscene', true);
		runTimer('startDialogue', 2);
		makeLuaSprite('CG7', 'cg/week4/CG7', 0, 0);
		addLuaSprite('CG7', true);
		setObjectCamera('CG7', 'hud');
		setObjectOrder('CG7', 0);
		allowCountdown = true;
		return Function_Stop;
	end
	doTweenAlpha('CGtween2', 'netherworld', 0, 0.4, 'linear');
	return Function_Continue;
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'startDialogue' then -- Timer completed, play dialogue
		startDialogue('dialogue', 'chouka');
		--credits
		makeLuaSprite('WookyCreditChouka', 'WookyCreditChouka', -840, 240);
		doTweenX('composermove', 'WookyCreditChouka', 0, 1, 'circOut');
		scaleObject('WookyCreditChouka', 0.9, 0.9);
		addLuaSprite('WookyCreditChouka', true);
		setObjectCamera('WookyCreditChouka', 'other');
		runTimer('deletefolklore', 4);
	end
	if tag == 'deletefolklore' then
		doTweenX('composermove2', getProperty('WookyCreditChouka'), -840, 1, 'circIn');
		runTimer('deletefolklore2', 1.2);
	end
	if tag == 'deletefolklore2' then
		removeLuaSprite('WookyCreditChouka');
	end
end

function onTweenCompleted(tag)
	if tag == 'CGtween2' then
		removeLuaSprite('netherworld');
		toggleHud(true);
	end
end

-- Dialogue (When a dialogue is finished, it calls startCountdown again)
function onNextDialogue(count)	
	-- triggered when the next dialogue line starts, 'line' starts with 1
	if count == 16 then
		removeLuaSprite('CG7');
		makeLuaSprite('CG8', 'cg/week4/CG8', 0, 0);
		addLuaSprite('CG8', true);
		setObjectCamera('CG8', 'hud');
		setObjectOrder('CG8', 0);
	end
	if count == 32 then
		removeLuaSprite('CG8');
		makeLuaSprite('netherworld', 'cg/week4/netherworld', 0, 0);
		addLuaSprite('netherworld', true);
		setObjectCamera('netherworld', 'hud');
		setObjectOrder('netherworld', 0);
	end
end

function onSkipDialogue(count)
	-- triggered when you press Enter and skip a dialogue line that was still being typed, dialogue line starts with 1
	if getProperty('skippedDialogue') == true then
		setProperty('skippedDialogue', false);
		removeLuaSprite('CG7');
		removeLuaSprite('CG8');
		removeLuaSprite('netherworld');
		toggleHud(true);
		
	end
end