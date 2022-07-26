function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		--Check if the note is an Instakill Note
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Seal Note' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'NOTE_koishi2'); --Change texture
			setPropertyFromGroup('unspawnNotes', i, 'hitCausesMiss', true);

			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then --Doesn't let Dad/Opponent notes get ignored
			setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', true); --Miss has no penalties
			end
		end
	end
	--debugPrint('Script started!')
end

-- Function called when you hit a note (after note hit calculations)
-- id: The note member id, you can get whatever variable you want from this note, example: "getPropertyFromGroup('notes', id, 'strumTime')"
-- noteData: 0 = Left, 1 = Down, 2 = Up, 3 = Right
-- noteType: The note type string/tag
-- isSustainNote: If it's a hold note, can be either true or false
function goodNoteHit(id, noteData, noteType, isSustainNote)
end
function noteMiss(id, noteData, noteType, isSustainNote)
if noteType == 'Seal Note' then
	cameraFlash('game', '600070', 0.6, true)
	playSound('phone', 1)
	cameraShake('game', 0.01, 0.3)
	setProperty('boyfriend.stunned', true);
	runTimer('Freeze', 1)
	setBlendMode('boyfriend', 'add')
	
	if noteData == 0 then
			characterPlayAnim('dad', 'shootLEFT', true);
		else if noteData == 1 then
			characterPlayAnim('dad', 'shootDOWN', true);
		else if noteData == 2 then
			characterPlayAnim('dad', 'shootUP', true);
		else if noteData == 3 then
			characterPlayAnim('dad', 'shootRIGHT', true);
	end
	end
	end
	end
	end
	end

function onTimerCompleted(tag, loops, loopsleft)
	if tag == 'Freeze' then
		setProperty('boyfriend.stunned', false);
		setBlendMode('boyfriend', 'normal')
end
end

function onUpdate(elapsed)
	
		
	
end
