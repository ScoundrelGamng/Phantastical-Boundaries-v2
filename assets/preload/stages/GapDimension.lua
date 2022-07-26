function onCreate()

    if not lowQuality then

        makeLuaSprite('Overhead', 'GapDimension/Overhead', -1250, -900);
        makeLuaSprite('Distant', 'GapDimension/Distant', -1250, -900);

    end

    makeLuaSprite('GFPlatform', 'GapDimension/GFPlatform', -1250, -900);
	makeLuaSprite('BFPlatform','GapDimension/BFPlatform', -300, -700);
    makeLuaSprite('YPlatform', 'GapDimension/YPlatform', -2150, -700);
    makeLuaSprite('Scenery', 'GapDimension/Scenery', -1250, -900);
    makeLuaSprite('Realm', 'GapDimension/Realm', -1250, -1100);

    addLuaSprite('Realm', false);
    addLuaSprite('Distant', false);
    addLuaSprite('Scenery', false);
    addLuaSprite('GFPlatform', false);
    addLuaSprite('YPlatform', false);
    addLuaSprite('BFPlatform', false);
    addLuaSprite('Overhead', true);

    setScrollFactor('Realm', 1, 1);
    setScrollFactor('Distant', 1.15, 1);
    setScrollFactor('Scenery', 1.15, 1);
    setScrollFactor('YPlatform', 1, 1);
    setScrollFactor('GFPlatform', 1, 1);
    setScrollFactor('BFPlatform', 1, 1);
    setScrollFactor('Overhead', 0.5, 1);

    setProperty('BFPlatform.scale.x', getProperty('BFPlatform.scale.x') -0.30);
    setProperty('BFPlatform.scale.y', getProperty('BFPlatform.scale.y') -0.30);
    setProperty('YPlatform.scale.x', getProperty('YPlatform.scale.x') -0.30);
    setProperty('YPlatform.scale.y', getProperty('YPlatform.scale.y') -0.30);
    setProperty('BFPlatform.angle', getProperty('BFPlatform.angle') +21.5);

end

local xx = 750;
local yy = 120;
local xx2 = 820;
local yy2 = 120;
local ofs = 30;
local followchars = true;
local del = 0;
local del2 = 0;

function onUpdate()
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