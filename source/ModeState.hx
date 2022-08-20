package;

#if desktop
import Discord.DiscordClient;
#end
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.FlxCamera;
import flixel.addons.transition.FlxTransitionableState;
import flixel.effects.FlxFlicker;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.math.FlxMath;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import lime.app.Application;
import openfl.display.Shader;
import Achievements;
import editors.MasterEditorMenu;
import flixel.input.keyboard.FlxKey;

import flixel.util.FlxTimer;


using StringTools;

// check out Eagle Ravi Rumble
//						- broster

class ModeState extends MusicBeatState
{
	public static var curSelected:Int = 0;

    var menuItems2:FlxTypedGroup<FlxSprite>;
	var menuTexts2:FlxTypedGroup<FlxText>;

	private var camGame:FlxCamera;
	private var camAchievement:FlxCamera;
	public var menuState:Int;
	public var optionY:Array<Float> = [];
	public var lastSelected:Int = 0;
    public var firstCheck:Array<Bool> = [];
	
	var logoSpr:FlxSprite;
    var versionShit:FlxText;
	
	var optionShit:Array<String> = ['danmaku', 'legacy'];
    var diffShit:Array<String> = ['easy', 'normal', 'hard', 'lunatic'];

	var magenta:FlxSprite;
	var camFollow:FlxObject;
	var camFollowPos:FlxObject;
	var debugKeys:Array<FlxKey>;

	override function create()
	{
		#if desktop
		// Updating Discord Rich Presence
		DiscordClient.changePresence("In the Menus", null);
		#end
        WeekData.reloadWeekFiles(true);
		menuState = 0;
		CoolUtil.difficulties = CoolUtil.defaultDifficulties.copy();


		debugKeys = ClientPrefs.copyKey(ClientPrefs.keyBinds.get('debug_2'));

		camGame = new FlxCamera();
		camAchievement = new FlxCamera();
		camAchievement.bgColor.alpha = 0;

		FlxG.cameras.reset(camGame);
		FlxG.cameras.add(camAchievement);
		FlxCamera.defaultCameras = [camGame];

		transIn = FlxTransitionableState.defaultTransIn;
		transOut = FlxTransitionableState.defaultTransOut;

		persistentUpdate = persistentDraw = true;

		var yScroll:Float = Math.max(0.25 - (0.05 * (diffShit.length - 4)), 0.1);
		var bg:FlxSprite = new FlxSprite(-80).loadGraphic(Paths.image('realmCG'));
		bg.scrollFactor.set(0, yScroll);
		bg.setGraphicSize(Std.int(bg.width * 1.175));
		bg.updateHitbox();
		bg.screenCenter();
		bg.antialiasing = ClientPrefs.globalAntialiasing;
		add(bg);

		camFollow = new FlxObject(0, 0, 1, 1);
		camFollowPos = new FlxObject(0, 0, 1, 1);
		add(camFollow);
		add(camFollowPos);

		magenta = new FlxSprite(-80).loadGraphic(Paths.image('realmCG'));
		magenta.scrollFactor.set(0, yScroll);
		magenta.setGraphicSize(Std.int(magenta.width * 1.175));
		magenta.updateHitbox();
		magenta.screenCenter();
		magenta.visible = false;
		magenta.antialiasing = ClientPrefs.globalAntialiasing;
		magenta.color = 0xFFfd719b;
		add(magenta);
		// magenta.scrollFactor.set();

        menuItems2 = new FlxTypedGroup<FlxSprite>();
		add(menuItems2);
		menuTexts2 = new FlxTypedGroup<FlxText>();
		add(menuTexts2);

        for (i in 0...diffShit.length)
            {
                var offset:Float = 100 - (Math.max(diffShit.length, 4) - 4) * 300; //original offset is 108
				var xoffset:Float = 200 - (Math.max(diffShit.length, 4) - 4) * 300;
                var menuItem:FlxSprite = new FlxSprite((FlxG.width / 8 * 3) - (i * 85), (i * 140)  + offset).loadGraphic(Paths.image('menudifficulties/' + diffShit[i]));

                menuItem.ID = i;
                menuItems2.add(menuItem);
                menuItem.centerOrigin();
                menuItem.setGraphicSize(Std.int(menuItem.width * 0.30));
                menuItem.updateHitbox();
				
                //optionY.push(menuItem.y);
                
                
                var scr:Float = (diffShit.length - 4) * 0.135;
                if(diffShit.length < 6) scr = 0;
                menuItem.scrollFactor.set(0, scr);
                menuItem.antialiasing = ClientPrefs.globalAntialiasing;
    
                var menuText = new FlxText(0, menuItem.y + menuItem.height, 0, "", 12);
                menuText.alpha = 0;
                
                menuText.setFormat(Paths.font("Aroania_R.otf"), 32, FlxColor.WHITE, CENTER, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
                //menuText.screenCenter(X);
                menuText.ID = i;
                switch (menuText.ID)
                {
                    case 0:
                        menuText.text = 'For players who have never played a rhythm game.';
                        case 1:
                            menuText.text = "For players who are familiar with Friday Night Funkin'";
                            case 2:
                            menuText.text = "For players who want a true taste of FNF's challenge";
							case 3:
								menuText.text = 'For players who are interested in a Touhou-like challenge';
                }
				menuText.text = '';
                menuText.x = FlxG.width / 3 - (i * 85);
                menuTexts2.add(menuText);

				if (curSelected == i)
					{
						menuItem.alpha = 1;
						menuText.alpha = 1;
					}
				else
					{
						menuItem.alpha = 0.6;
						menuText.alpha = 0.75;
					}

                
                
                menuItem.updateHitbox();
            }


        logoSpr = new FlxSprite(100, -5).loadGraphic(Paths.image('menudifficulties/rank_select'));
		add(logoSpr);
		logoSpr.setGraphicSize(Std.int(logoSpr.width * 0.75));
		logoSpr.updateHitbox();
		logoSpr.screenCenter(X);
		logoSpr.antialiasing = ClientPrefs.globalAntialiasing;

		versionShit = new FlxText(12, logoSpr.y + logoSpr.height - 35, 0, "Select a Difficulty", 12);
		versionShit.scrollFactor.set();
		versionShit.setFormat("VCR OSD Mono", 32, FlxColor.WHITE, CENTER, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		versionShit.setBorderStyle(FlxTextBorderStyle.OUTLINE, FlxColor.BLACK, 3, 1);
		versionShit.screenCenter(X);
		add(versionShit);

        changeItemDif();

		

		super.create();
	}

	

	var selectedSomethin:Bool = false;
    var selectedSomethin2:Bool = false;

	override function update(elapsed:Float)
	{
		if (FlxG.sound.music.volume < 0.8)
		{
			FlxG.sound.music.volume += 0.5 * FlxG.elapsed;
		}

		var lerpVal:Float = CoolUtil.boundTo(elapsed * 5.6, 0, 1);
		camFollowPos.setPosition(FlxMath.lerp(camFollowPos.x, camFollow.x, lerpVal), FlxMath.lerp(camFollowPos.y, camFollow.y, lerpVal));

		
		
			if (controls.UI_UP_P)
			{
                if (!selectedSomethin)
                    changeItemDif(-1);
			}

			if (controls.UI_DOWN_P)
			{
                if (!selectedSomethin)
                    changeItemDif(1);
			}

			if (controls.BACK)
			{
				
				FlxG.sound.play(Paths.sound('cancelMenu'));
				if (!selectedSomethin)
					{
						selectedSomethin = true;
						MusicBeatState.switchState(new MainMenuState());
					}
                    
				
			}

			if (controls.ACCEPT)
			{
                if (!selectedSomethin)
                    {

                        FlxG.sound.play(Paths.sound('confirmMenu'));

					    if(ClientPrefs.flashing) FlxFlicker.flicker(magenta, 1.1, 0.15, false);
                        menuItems2.forEach(function(spr:FlxSprite)
                            {
                                if (curSelected != spr.ID)
                                {
                                    FlxTween.tween(spr, {alpha: 0}, 0.4, {
                                        ease: FlxEase.quadOut,
                                        onComplete: function(twn:FlxTween)
                                        {
                                            //spr.kill();
                                        }
                                    });
                                }
                                else
                                {
                                    FlxFlicker.flicker(spr, 1, 0.06, false, false, function(flick:FlxFlicker)
                                    {
                                        
                                    });

    
									PlayState.storyDifficulty = curSelected;
                                    MusicBeatState.switchState(new StoryState());
                                        
                                }
                            });
                            selectedSomethin = true;
                    }
			}
			#if desktop
			else if (FlxG.keys.anyJustPressed(debugKeys) && !selectedSomethin)
			{
				selectedSomethin = true;
				MusicBeatState.switchState(new MasterEditorMenu());
			}
			#end
		

		super.update(elapsed);

        menuItems2.forEach(function(spr:FlxSprite)
            {
                // spr.screenCenter(X);
            });
	}

    function changeItemDif(huh:Int = 0)
        {
            
            curSelected += huh;
    
            if (firstCheck[1] == true)
            {
                if (curSelected >= 0 && curSelected <= menuItems2.length - 1)
                    FlxG.sound.play(Paths.sound('scrollMenu'));
            }
            firstCheck[1] = true;
    
            if (curSelected >= menuItems2.length)
                curSelected = menuItems2.length - 1;
            if (curSelected < 0)
                curSelected = 0;
    
            
    
            if (firstCheck[2] == true)
            {
            menuItems2.forEach(function(spr:FlxSprite)
            {
                spr.offset.y = 0;
                spr.updateHitbox();
    
                if (spr.ID == curSelected)
                {
                    //spr.shader = null;
                    spr.alpha = 1;
                    //spr.animation.play('selected');
                    //camFollow.setPosition(spr.getGraphicMidpoint().x, spr.getGraphicMidpoint().y);
                    //spr.offset.x = 0.15 * (spr.frameWidth / 2 + 180);
                    //spr.offset.y = 0.15 * spr.frameHeight;
                    FlxG.log.add(spr.frameWidth);
                }
                else
                    {
                        //spr.shader = invert;
                        spr.alpha = 0.6;
                    }
            });
            menuTexts2.forEach(function(spr:FlxText)
                {
    
                    if (spr.ID == curSelected)
                    {
                        //spr.shader = null;
                        spr.alpha = 1;
                        //spr.animation.play('selected');
                        //camFollow.setPosition(spr.getGraphicMidpoint().x, spr.getGraphicMidpoint().y);
                        //spr.offset.x = 0.15 * (spr.frameWidth / 2 + 180);
                        //spr.offset.y = 0.15 * spr.frameHeight;
                        FlxG.log.add(spr.frameWidth);
                    }
                    else
                        {
                            //spr.shader = invert;
                            spr.alpha = 0.75;
                        }
                });
            }
            firstCheck[2] = true;
        }

        function selectWeek(diff:Int = 0)
            {
                var songArray:Array<String> = [];
			var leWeek:Array<Dynamic> = WeekData.weeksLoaded.get(WeekData.weeksList[1]).songs;
			for (i in 0...leWeek.length) {
				songArray.push(leWeek[i][0]);
			}

			// Nevermind that's stupid lmao
			PlayState.storyPlaylist = songArray;
			PlayState.isStoryMode = true;
			//selectedWeek = true;

			var diffic = CoolUtil.oldDiffString(diff);
			if(diffic == null) diffic = '';
			trace(diff);

			PlayState.storyDifficulty = diff;
			trace(PlayState.storyDifficulty);

			PlayState.SONG = Song.loadFromJson(PlayState.storyPlaylist[0].toLowerCase() + diffic, PlayState.storyPlaylist[0].toLowerCase());
			PlayState.storyWeek = 0;
			PlayState.campaignScore = 0;
			PlayState.campaignMisses = 0;
			new FlxTimer().start(1, function(tmr:FlxTimer)
			{
				LoadingState.loadAndSwitchState(new PlayState(), true);
				FreeplayState.destroyFreeplayVocals();
			});
            }
}
