local allowCountdown = false
local splash = false
local cursplash = false
function onStartCountdown()
	-- Block the first countdown and start a timer of 0.67 seconds to play the dialogue
	if not allowCountdown and isStoryMode and not seenCutscene and splash then
		cursplash = true;
		debugPrint(cursplash);
		makeLuaSprite('splash1', 'splash1', 0, 0);
		scaleObject('splash1', 0.67, 0.67);
		addLuaSprite('splash1', true);
		setObjectCamera('splash1', 'other');
		runTimer('showSplash2', 6);
		return Function_Stop;
	elseif not allowCountdown and isStoryMode and not seenCutscene and not splash then
		splash = true;
		setProperty('inCutscene', true);
		runTimer('startDialogue', 2);
		makeLuaSprite('VillageCG', 'VillageCG', 0, 0);
		scaleObject('VillageCG', 0.67, 0.67);
		addLuaSprite('VillageCG', true);
		setObjectCamera('VillageCG', 'hud');
		setObjectOrder('VillageCG', 0);
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
	if count == 8 then
		makeLuaSprite('CG2', 'CG2', 0, 0);
		scaleObject('CG2', 0.67, 0.67);
		addLuaSprite('CG2', true);
		setObjectCamera('CG2', 'hud');	
		setObjectOrder('CG2', 0);
		removeLuaSprite('VillageCG');
	end
	if count == 9 then
		makeLuaSprite('realmCG', 'realmCG', 0, 0);
		scaleObject('realmCG', 0.67, 0.67);
		addLuaSprite('realmCG', true);
		setObjectCamera('realmCG', 'hud');
		setObjectOrder('realmCG', 0);
		removeLuaSprite('CG2');
		end
	-- triggered when the next dialogue line starts, 'line' starts with 1
end

function onUpdate(elapsed)
		if keyJustPressed('space') and cursplash then
			removeLuaSprite('splash1');
			seenCutscene = true;
			debugPrint('pressed');
			cursplash = false;
			startCountdown();
		end
	end

function onSkipDialogue(count)
	-- triggered when you press Enter and skip a dialogue line that was still being typed, dialogue line starts with 1
	if getProperty('skippedDialogue') == true then
		if count <= 7 and not allowEndShit then
			removeLuaSprite('VillageCG');
		end
		if count <= 8 and not allowEndShit then
			removeLuaSprite('CG2');
		end
		if count >= 9 and not allowEndShit then
			removeLuaSprite('realmCG');
		end
	end
end