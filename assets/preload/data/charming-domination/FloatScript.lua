local i = 0

function onUpdate(elapsed)
		daElapsed = elapsed * 30
	i = i + daElapsed

	daYvalue = 
	
	setProperty('dad.y', (math.sin(i/20)*40) - 100)
	yy = (math.sin(i/20)*40)
end