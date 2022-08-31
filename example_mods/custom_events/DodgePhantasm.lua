function onCreate()
    --initialize variables
	dodge = false;
    canDodge = false;
    DodgeTime = 0;
	--precache shit
    precacheImage('sign');
	precacheImage('yukaritrain');
	precacheSound('dodge');
	precacheSound('signbeep');
	precacheSound('train');
	precacheSound('KO');
end

function onEvent(name, value1, value2)
    if name == "DodgeEvent" then
    --Get Dodge time
    DodgeTime = (value1);

	--Play Sign Sound
	playSound('signbeep', 0.6);
	
	--Make Train Sprite
	makeLuaSprite('yukaritrain', 'yukaritrain', -16000, -460);
	setObjectCamera('yukaritrain', 'game');
	scaleLuaSprite('yukaritrain', 1.7, 1.7);
	addLuaSprite('yukaritrain', true); 

    --Make Sign Sprite
	makeAnimatedLuaSprite('sign','sign', 220, 50)addAnimationByPrefix('sign','dance','sign',24,true)
objectPlayAnimation('sign','dance', true);
	setObjectCamera('sign', 'other');
	scaleLuaSprite('sign', 0.4, 0.4); 
    addLuaSprite('sign', true); 
	
	--Set values so you can dodge
	canDodge = true;
	runTimer('Died', DodgeTime);
	
	end
end

function onUpdatePost()
--using onUpdatePost because doTween is fucked
   if canDodge == true and getPropertyFromClass('flixel.FlxG', 'keys.justPressed.SPACE') then
   triggerEvent('Screen Shake','0.8, 0.04','0.01, 0.00')
   dodge = true;
   doTweenX('moveright', ('yukaritrain'), 18000, 1.6, 'linear');
   playSound('train', 1);
   playSound('dodge', 1);
   characterPlayAnim('boyfriend', 'dodge', true);
   setProperty('boyfriend.specialAnim', true);
   removeLuaSprite('sign');
   canDodge = false
--if you're using botplay lMAO
   elseif getProperty('cpuControlled') == true and canDodge == true then
   triggerEvent('Screen Shake','0.8, 0.04','0.01, 0.00')
   dodge = true;
   doTweenX('moveright', ('yukaritrain'), 18000, 1.6, 'linear');
   playSound('train', 1);
   playSound('dodge', 1);
   characterPlayAnim('boyfriend', 'dodge', true);
   setProperty('boyfriend.specialAnim', true);
   removeLuaSprite('sign');
   canDodge = false
end
end

function onTimerCompleted(tag, loops, loopsLeft)
--when timer ends, you don't dodge and it's on easy
   if tag == 'Died' and dodge == false and difficulty == 0 then
   triggerEvent('Screen Shake','0.8, 0.04','0.01, 0.00')
   doTweenX('moveright', ('yukaritrain'), 18000, 1.6, 'linear');
   playSound('train', 1);
   runTimer('Traintimer', 2);
   runTimer('Hurttimer', 0.55);
   removeLuaSprite('sign');
   canDodge = false;
   
--when timer ends and you don't dodge
   elseif tag == 'Died' and dodge == false then
   triggerEvent('Screen Shake','0.8, 0.04','0.01, 0.00')
   doTweenX('moveright', ('yukaritrain'), 18000, 0.6, 'linear');
   playSound('train', 1);
   characterPlayAnim('boyfriend', 'hurt', true);
   setProperty('boyfriend.specialAnim', true);
   removeLuaSprite('sign');
   runTimer('deathtimer', 0.2);
   canDodge = false;
   
--when timer ends and you dodge
   elseif tag == 'Died' and dodge == true then
   dodge = false
   characterPlayAnim('boyfriend', 'dodge', true);
   setProperty('boyfriend.specialAnim', true);
   runTimer('Traintimer', 2);
   canDodge = false;
   end
--remove timer train sprite after a while
   if tag == 'Traintimer' then
   removeLuaSprite('yukaritrain');
   end
--kills bf
   if tag == 'deathtimer' then
   setProperty('train', true);
   setProperty('health', 0);
   addMisses(1);
	addScore(-2000);
   end
--damages bf (on easy)
   if tag == 'Hurttimer' then
   playSound('KO', 0.8);
   setProperty('health', getProperty('health') - 0.75);
   characterPlayAnim('boyfriend', 'hurt', true);
   setProperty('boyfriend.specialAnim', true);
   	addMisses(1);
	addScore(-2000);
   end
end