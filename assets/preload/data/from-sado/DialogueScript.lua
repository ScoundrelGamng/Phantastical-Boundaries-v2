local allowCountdown = false
function onStartCountdown()
	-- Block the first countdown and start a timer of 0.8 seconds to play the dialogue
	if not allowCountdown and isStoryMode and not seenCutscene then
		toggleHud(false);
		setProperty('inCutscene', true);
		runTimer('startDialogue', 2);
		makeLuaSprite('shrine', 'cg/week3/shrine', 0, 0);
		addLuaSprite('shrine', true);
		setObjectCamera('shrine', 'hud');
		setObjectOrder('shrine', 0);
		allowCountdown = true;
		return Function_Stop;
	end
	doTweenAlpha('CGtween2', 'CG5', 0, 0.4, 'linear');
	return Function_Continue;
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'startDialogue' then -- Timer completed, play dialogue
		startDialogue('dialogue', 'gensokyo');
		--credits
		makeLuaSprite('ScoundrelCreditGensokyo', 'ScoundrelCreditGensokyo', -840, 240);
		doTweenX('composermove', 'ScoundrelCreditGensokyo', 0, 1, 'circOut');
		scaleObject('ScoundrelCreditGensokyo', 0.9, 0.9);
		addLuaSprite('ScoundrelCreditGensokyo', true);
		setObjectCamera('ScoundrelCreditGensokyo', 'other');
		runTimer('deletefolklore', 4);
	end
	if tag == 'deletefolklore' then
		doTweenX('composermove2', getProperty('ScoundrelCreditGensokyo'), -840, 1, 'circIn');
		runTimer('deletefolklore2', 1.2);
	end
	if tag == 'deletefolklore2' then
		removeLuaSprite('ScoundrelCreditGensokyo');
	end
end

function onTweenCompleted(tag)
	if tag == 'CGtween2' then
		removeLuaSprite('CG5');
		toggleHud(true);
	end
end

-- Dialogue (When a dialogue is finished, it calls startCountdown again)
function onNextDialogue(count)	
	-- triggered when the next dialogue line starts, 'line' starts with 1
	if count == 18 then
		removeLuaSprite('shrine');
		makeLuaSprite('CG4', 'cg/week3/CG4', 0, 0);
		addLuaSprite('CG4', true);
		setObjectCamera('CG4', 'hud');
		setObjectOrder('CG4', 0);
	end
	if count == 22 then
		removeLuaSprite('CG4');
		makeLuaSprite('village', 'cg/week3/village', 0, 0);
		addLuaSprite('village', true);
		setObjectCamera('village', 'hud');
		setObjectOrder('village', 0);
	end
	if count == 50 then
		removeLuaSprite('village');
		makeLuaSprite('CG5', 'cg/week3/CG5', 0, 0);
		addLuaSprite('CG5', true);
		setObjectCamera('CG5', 'hud');
		setObjectOrder('CG5', 0);
	end
end

function onSkipDialogue(count)
	-- triggered when you press Enter and skip a dialogue line that was still being typed, dialogue line starts with 1
	if getProperty('skippedDialogue') == true then
		setProperty('skippedDialogue', false);
		removeLuaSprite('CG4');
		removeLuaSprite('CG5');
		removeLuaSprite('village');
		removeLuaSprite('shrine');
		toggleHud(true);
		
	end
end