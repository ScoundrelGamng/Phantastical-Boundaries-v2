function onCreate()


	makeLuaSprite('Netherworld','Netherworld/Netherworld', -1300, -850);
    addLuaSprite('Netherworld',false);
    setScrollFactor('Netherworld', 1, 1);
	
	makeLuaSprite('Netherworld2','Netherworld/Netherworld2', -1300, -850);
    addLuaSprite('Netherworld2',true);
    setScrollFactor('Netherworld2', 1, 1);

 scaleObject('Netherworld', 1, 1);
 scaleObject('Netherworld2', 1, 1);

	makeAnimatedLuaSprite('Spirit1','Spirit1',-1000,350)addAnimationByPrefix('Spirit1','dance','Spirit1',12,true)
	objectPlayAnimation('Spirit1','dance', true);
	scaleObject('Spirit1', 1, 1);
	setScrollFactor('Spirit1', 0.95, 0.95);
	addLuaSprite('Spirit1', false);
end

local xx = 550;
local yy = 420;
local xx2 = 620;
local yy2 = 340;
local ofs = 25;
local followchars = true;
local del = 0;
local del2 = 0;
local i = 0

function onUpdate(elapsed)
		daElapsed = elapsed * 30
	i = i + daElapsed

	daYvalue = 
	
	setProperty('dad.y', (math.sin(i/20)*45) + 50)
	yy = (math.sin(i/20)*45) + 200

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