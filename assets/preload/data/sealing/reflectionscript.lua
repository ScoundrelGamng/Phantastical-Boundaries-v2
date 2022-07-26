-- Script by Shadow Mario
-- Customized for Simplicity by Kevin Kuntz
function onCreate()
	makeAnimationList();
	makeOffsets();
	
	-- boyfriend 2
	makeAnimatedLuaSprite('bf2', 'characters/BOYFRIEND', boyfriend.x, boyfriend.y + 300);
	addAnimationByPrefix('bf2', 'idle', 'bf2 idle', 24, false);
	addAnimationByPrefix('bf2', 'singLEFT', 'bf2 left note', 24, false);
	addAnimationByPrefix('bf2', 'singDOWN', 'bf2 down note', 24, false);
	addAnimationByPrefix('bf2', 'singUP', 'bf2 up note', 24, false);
	addAnimationByPrefix('bf2', 'singRIGHT', 'bf2 right note', 24, false);
	
	addLuaSprite('bf2', true);

	playAnimation('bf2', 0, true);
end

animationsList = {}
holdTimers = {bf2 = -1.0};
noteDatas = {bf2 = 0};
function makeAnimationList()
	animationsList[0] = 'idle';
	animationsList[1] = 'singLEFT';
	animationsList[2] = 'singDOWN';
	animationsList[3] = 'singUP';
	animationsList[4] = 'singRIGHT';
end

offsetsbf2 = {};
function makeOffsets()
	offsetsbf2[0] = {x = 0, y = 0}; --idle
	offsetsbf2[1] = {x = 30, y = -40}; --left
	offsetsbf2[2] = {x = 0, y = -20}; --down
	offsetsbf2[3] = {x = 0, y = 20}; --up
	offsetsbf2[4] = {x = -15, y = -20}; --right
end

function goodNoteHit(id, direction, noteType, isSustainNote)
		if not isSustainNote then
			noteDatas.bf2 = direction;
		end	
	characterToPlay = 'bf2'
	animToPlay = noteDatas.bf2;
	holdTimers.bf2 = 0;
			
	playAnimation(characterToPlay, animToPlay, true);
	end

function onUpdate(elapsed)
	holdCap = stepCrochet * 0.004;
	if holdTimers.bf2 >= 0 then
		holdTimers.bf2 = holdTimers.bf2 + elapsed;
		if holdTimers.bf2 >= holdCap then
			playAnimation('bf2', 0, false);
			holdTimers.bf2 = -1;
		end
	end
end

function onCountdownTick(counter)
	beatHitDance(counter);
end

function onBeatHit()
	beatHitDance(curBeat);
end

function beatHitDance(counter)
	if counter % 2 == 0 then
		if holdTimers.bf2 < 0 then
			playAnimation('bf2', 0, false);
		end
	end
end

function playAnimation(character, animId, forced)
	-- 0 = idle
	-- 1 = singLEFT
	-- 2 = singDOWN
	-- 3 = singUP
	-- 4 = singRIGHT
	animName = animationsList[animId];
	--debugPrint(animName);
	if character == 'bf2' then
		objectPlayAnimation('bf2', animName, forced); -- this part is easily broke if you use objectPlayAnim (I have no idea why its like this)
		setProperty('bf2.offset.x', offsetsbf2[animId].x);
		setProperty('bf2.offset.y', offsetsbf2[animId].y);
	end
end