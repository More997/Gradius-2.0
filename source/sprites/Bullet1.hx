package sprites;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxG;


class Bullet1 extends FlxSprite
{
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		makeGraphic(4, 4);
		velocity.x = 350;
	}
	
	override public function update(elapsed:Float):Void
	{	
		super.update(elapsed);
		if (x <= FlxG.camera.scroll.x)
		destroy();
		if (x >= FlxG.camera.scroll.x + 256)
		destroy();
		
	}
}