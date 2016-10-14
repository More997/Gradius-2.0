package sprites;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.math.FlxRandom;
import flixel.FlxG;

/**
 * ...
 * @author ...
 */
class Powerup extends FlxSprite
{
	private var tipo:FlxRandom = new FlxRandom();
	
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		
	}
	override public function update (elapsed:Float) :Void
	{
		if (FlxG.overlap(this, Player))
		{
			var t:Int = tipo.int (0, 3);
			this.destroy ();
		}
	}
	public function getT () :Int
	{
		return t;
	}
	
	
}