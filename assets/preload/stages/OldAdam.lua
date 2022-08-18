local xx = 450;
local yy = 300;
local xx2 = 930;
local yy2 = 300;
local ofs = 30;
local followchars = true;
local del = 0;
local del2 = 0;
local i = 0

function onCreate()

	makeLuaSprite('bg','OldAdam/bg', -950, -850);
    addLuaSprite('bg',false);
    setScrollFactor('bg', 0.8, 0.95);
	
	makeLuaSprite('bg2','OldAdam/bg2', -1000, -850);
    addLuaSprite('bg2',false);
    setScrollFactor('bg2', 1, 1);
	
	makeLuaSprite('bgfore','OldAdam/bgfore', -1000, -850);
    addLuaSprite('bgfore',true);
	
	makeLuaSprite('bgfore2','OldAdam/bgfore2', -1300, -850);
    addLuaSprite('bgfore2',true);
    setScrollFactor('bgfore2', 1.1, 1);
	
	makeLuaSprite('bggradient','OldAdam/bggradient', -1200, -850);
    addLuaSprite('bggradient', true);
    setScrollFactor('bggradient', 1, 1);
end

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