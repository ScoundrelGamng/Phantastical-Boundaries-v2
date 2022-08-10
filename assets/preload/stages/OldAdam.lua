function onCreate()

	makeLuaSprite('bg','OldAdam/bg', -1300, -850);
    addLuaSprite('bg',false);
    setScrollFactor('bg', 0.8, 0.8);
	
	makeLuaSprite('bg2','OldAdam/bg2', -1000, -850);
    addLuaSprite('bg2',false);
    setScrollFactor('bg2', 1, 1);
	
	makeLuaSprite('bgfore','OldAdam/bgfore', -1000, -850);
    addLuaSprite('bgfore',true);
    setScrollFactor('bgfore', 1.1, 1);
	
	makeLuaSprite('bgfore2','OldAdam/bgfore2', -1400, -850);
    addLuaSprite('bgfore2',true);
    setScrollFactor('bgfore2', 1.2, 1);
	
	makeLuaSprite('bggradient','OldAdam/bggradient', -1200, -850);
    addLuaSprite('bggradient', true);
    setScrollFactor('bggradient', 1, 1);
end