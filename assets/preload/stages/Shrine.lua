function onCreate()


	makeLuaSprite('Shrine','Shrine/1', -900, -700);
    addLuaSprite('Shrine',false);
    setScrollFactor('Shrine', 0.8, 0.8);
	
	makeLuaSprite('Shrine2','Shrine/2', -1000, -750);
    addLuaSprite('Shrine2',false);
    setScrollFactor('Shrine2', 1, 1);
	
	makeLuaSprite('Shrine3','Shrine/3', -1000, -800);
    addLuaSprite('Shrine3',true);
    setScrollFactor('Shrine3', 1, 1);

 scaleObject('Shrine', 0.9, 0.9);
 scaleObject('Shrine2', 0.9, 0.9);

 setBlendMode('3', 'overlay')
end

local xx = 600;
local yy = 330;
local xx2 = 680;
local yy2 = 330;
local ofs = 15;
local followchars = true;
local del = 0;
local del2 = 0;
local i = 0

function onUpdate(elapsed)

	if getProperty("health") <= 0 then
		playSound("death",0.7);
		end
	if del > 0 then
		del = del - 1
	end
	if del2 > 0 then
		del2 = del2 - 1
	end
    if followchars == true then
        if mustHitSection == false then
            if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singLEFT-alt' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT-alt' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP-alt' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN-alt' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle-alt' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
        else

            if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx2-ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx2+ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx2,yy2-ofs)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx2,yy2+ofs)
            end
	    if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
            end
        end
    else
        triggerEvent('Camera Follow Pos','','')
    end
    
end

function opponentNoteHit()
    health = getProperty('health')
    if getProperty('health') > 0.4 and difficulty == 3 then
        setProperty('health', health- 0.013);
    end
end