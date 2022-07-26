package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxSubState;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.effects.FlxFlicker;
import lime.app.Application;
import flixel.addons.transition.FlxTransitionableState;
import flixel.tweens.FlxTween;
import flixel.util.FlxTimer;

class FlashingState extends MusicBeatState
{
	public static var leftState:Bool = false;

	var warnText:FlxText;
	var BackgroundWarning:FlxSprite = new FlxSprite().loadGraphic(Paths.image('bgwarning'));
	override function create()
	{
		super.create();

		//var bg:FlxSprite = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);
		//add(bg);

		BackgroundWarning.screenCenter();
		BackgroundWarning.antialiasing = ClientPrefs.globalAntialiasing;
		add(BackgroundWarning);

		if (Sys.systemName() == "Windows")
		{
			warnText = new FlxText(0, 0, FlxG.width,
			"This mod is a derivative work of both Touhou Project and Friday Night Funkin’ \n
			Please support each series' respective creators.\n\n

			Also please be aware that this is a story driven mod.\n
			Expect long cutscenes and make sure you set aside a good amount of time.", 32);
		}
		else
		{
			warnText = new FlxText(0, 0, FlxG.width,
			"This mod is a derivative work of both Touhou Project and Friday Night Funkin' \n
			Please support each series' respective creators.\n\n

			Also please be aware that this is a story driven mod.\n
			Expect long cutscenes and make sure you set aside a good amount of time.", 32);
		}

		warnText.setFormat("Aroania", 30, FlxColor.WHITE, CENTER);

		warnText.screenCenter(Y);
		add(warnText);
	}

	override function update(elapsed:Float)
	{
		if(!leftState) {
			var back:Bool = controls.BACK;
			if (controls.ACCEPT || back) {
				leftState = true;
				FlxTransitionableState.skipNextTransIn = true;
				FlxTransitionableState.skipNextTransOut = true;
				if(!back) {
					FlxG.sound.play(Paths.sound('confirmMenu'));
					FlxTween.tween(BackgroundWarning, {alpha: 0}, 1, {
					});
					FlxFlicker.flicker(warnText, 1, 0.1, false, true, function(flk:FlxFlicker) {
						new FlxTimer().start(0.5, function (tmr:FlxTimer) {
							MusicBeatState.switchState(new TitleState());
						});
					});
				} else {
					FlxG.sound.play(Paths.sound('cancelMenu'));
					FlxTween.tween(BackgroundWarning, {alpha: 0}, 1, {
					});
					FlxFlicker.flicker(warnText, 1, 0.1, false, true, function(flk:FlxFlicker) {
						new FlxTimer().start(0.5, function (tmr:FlxTimer) {
							MusicBeatState.switchState(new TitleState());
						});
					});
				}
			}
		}
		super.update(elapsed);
	}
}
