function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		--Check if the note is an Knife Note
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Butterfly Hit' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'NOTE_butterflyhit'); --Change texture
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', false); --Miss has no penalties
		end
	end
	--debugPrint('Script started!')
	function noteMiss(id, i, noteType, isSustainNote)
		if noteType == 'Butterfly Hit' then
			setProperty('health', getProperty('health') - 0.85)
			characterPlayAnim('boyfriend', 'hurt', true);

	end
end
end

function goodNoteHit(id, noteData, noteType, isSustainNote)
	if noteType == 'Butterfly Hit' then
		characterPlayAnim('boyfriend', 'dodge', false);
		addScore(100);
	end
end