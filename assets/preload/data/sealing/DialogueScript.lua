local allowCountdown = false
function onStartCountdown()
	-- Block the first countdown and start a timer of 0.8 seconds to play the dialogue
	if not allowCountdown and isStoryMode and not seenCutscene then
		setProperty('inCutscene', true);
		runTimer('startDialogue', 2);
		makeLuaSprite('adam', 'cg/week2/adam', 0, 0);
		scaleObject('adam', 0.69, 0.69);
		addLuaSprite('adam', true);
		setObjectCamera('adam', 'hud');
		setObjectOrder('adam', 0);
		allowCountdown = true;
		return Function_Stop;
	end
	doTweenAlpha('CGtween2', 'CG1', 0, 0.4, 'linear');
	return Function_Continue;
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'startDialogue' then -- Timer completed, play dialogue
		startDialogue('dialogue', 'folklore');
		--credits
		makeLuaSprite('ScoundrelCreditFolklore', 'ScoundrelCreditFolklore', -840, 240);
		doTweenX('composermove', 'ScoundrelCreditFolklore', 0, 1, 'circOut');
		scaleObject('ScoundrelCreditFolklore', 0.9, 0.9);
		addLuaSprite('ScoundrelCreditFolklore', true);
		setObjectCamera('ScoundrelCreditFolklore', 'other');
		runTimer('deletefolklore', 4);
	end
	if tag == 'deletefolklore' then
	doTweenX('composermove2', getProperty('ScoundrelCreditFolklore'), -840, 1, 'circIn');
	runTimer('deletefolklore2', 1.2);
end
if tag == 'deletefolklore2' then
removeLuaSprite('ScoundrelCreditFolklore');
end
end

function onTweenCompleted(tag)
if tag == 'CGtween2' then
	removeLuaSprite('CG1');
end
end

-- Dialogue (When a dialogue is finished, it calls startCountdown again)
function onNextDialogue(count)	
	if count == 5 then
		removeLuaSprite('adam');
		makeLuaSprite('CG2', 'cg/week2/CG2', 0, 0);
		scaleObject('CG2', 0.69, 0.69);
		addLuaSprite('CG2', true);
		setObjectCamera('CG2', 'hud');
		setObjectOrder('CG2', 0);
	end
	if count == 10 then
		removeLuaSprite('CG2');
		addLuaSprite('adam', true);
	end
	-- triggered when the next dialogue line starts, 'line' starts with 1
end

function onSkipDialogue(count)
	-- triggered when you press Enter and skip a dialogue line that was still being typed, dialogue line starts with 1
	if getProperty('skippedDialogue') == true then
		if count < 5 then
			removeLuaSprite('adam');
		end
		if count >= 5 and count < 10 then
			removeLuaSprite('CG2');
		end
		if count >= 10 then
			removeLuaSprite('adam');
		end
	end
		
end