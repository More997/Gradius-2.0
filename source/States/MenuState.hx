package states;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
import states.PlayState;

class MenuState extends FlxState
{	
	override public function create():Void
	{
		FlxG.switchState(new PlayState());
		super.create();
	}
	
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
}
