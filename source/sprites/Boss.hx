package sprites;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;

/**
 * ...
 * @author ...
 */
class Boss extends FlxSprite
{
    private var vidaboss:Int = 50;
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
	}
override public function update (elapsed:Float):Void
{
	super.update (elapsed);
	
	if (vidaboss == 0)
	{
		destroy();
	}
}
	public function dano (): Void
		{
			vidaboss --;
		}
		
	public function getVida ():Int
		{
			return vidaboss;
		}

	
}