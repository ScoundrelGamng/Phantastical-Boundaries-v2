local allowCountdown = false
function onStartCountdown()
	-- Block the first countdown and start a timer of 0.8 seconds to play the dialogue
	if not allowCountdown and isStoryMode and not seenCutscene and not allowEndShit then
		toggleHud(false);
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
	doTweenAlpha('CGtween2', 'CG3', 0, 0.4, 'linear');
	return Function_Continue;
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'startDialogue' then -- Timer completed, play dialogue
		startDialogue('dialogue', 'cutscene');
		--credits
		makeLuaSprite('WookyCreditDYS', 'WookyCreditDYS', -840, 240);
		doTweenX('composermove', 'WookyCreditDYS', 0, 1, 'circOut');
		scaleObject('WookyCreditDYS', 0.9, 0.9);
		addLuaSprite('WookyCreditDYS', true);
		setObjectCamera('WookyCreditDYS', 'other');
		runTimer('deletefolklore', 4);
	end
	if tag == 'deletefolklore' then
	doTweenX('composermove2', getProperty('WookyCreditDYS'), -840, 1, 'circIn');
	runTimer('deletefolklore2', 1.2);
end
if tag == 'deletefolklore2' then
removeLuaSprite('WookyCreditDYS');
end
end

function onTweenCompleted(tag)
if tag == 'CGtween2' then
	toggleHud(true);
	removeLuaSprite('CG3');
end
end

-- Dialogue (When a dialogue is finished, it calls startCountdown again)
function onNextDialogue(count)	
	if count == 9 and not allowEndShit then
		removeLuaSprite('adam');
		makeLuaSprite('CG3', 'cg/week2/CG3', 0, 0);
		scaleObject('CG3', 0.69, 0.69);
		addLuaSprite('CG3', true);
		setObjectCamera('CG3', 'hud');
		setObjectOrder('CG3', 0);
	end

	debugPrint(allowEndShit);
	if count == 7 and allowEndShit then
		removeLuaSprite('adam');
		makeLuaSprite('CG4', 'cg/week2/CG4', 0, 0);
		scaleObject('CG4', 0.69, 0.69);
		addLuaSprite('CG4', true);
		setObjectCamera('CG4', 'hud');
		setObjectOrder('CG4', 0);
	end

	if count == 8 and allowEndShit then
		removeLuaSprite('CG4');
		makeLuaSprite('black', 'cg/week2/black', 0, 0);
		scaleObject('black', 0.69, 0.69);
		addLuaSprite('black', true);
		setObjectCamera('black', 'hud');
		setObjectOrder('black', 0);
	end
	-- triggered when the next dialogue line starts, 'line' starts with 1
end

function onSkipDialogue(count)
	-- triggered when you press Enter and skip a dialogue line that was still being typed, dialogue line starts with 1
	if getProperty('skippedDialogue') == true then
		setProperty('skippedDialogue', false);
			removeLuaSprite('adam');
			removeLuaSprite('CG3');
			toggleHud(true);
	end
		
end

allowEndShit = false

function onEndSong()
 if not allowEndShit and isStoryMode and not seenCutscene then
	allowEndShit = true;
	toggleHud(false);
	setProperty('inCutscene', true);
	startDialogue('dialogue2', 'folklore');
	makeLuaSprite('adam', 'cg/week2/adam', 0, 0);
	scaleObject('adam', 0.69, 0.69);
	addLuaSprite('adam', true);
	setObjectCamera('adam', 'hud');
	setObjectOrder('adam', 0);
	debugPrint(allowEndShit);
  
  return Function_Stop;
 end
 return Function_Continue;
end