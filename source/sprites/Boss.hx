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
	public  var sprite:FlxSprite;
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		sprite = new FlxSprite();
		sprite.loadGraphic(AssetPaths.Boss__png, true, 32, 32);
		sprite.animation.add("mov", [0, 1], 2, true);
	    sprite.animation.play("mov");
		  {   if (FlxG.overlap(this, Player.bala))
			   Player.bala.destroy();
			   vidaboss -= 1;
			   
		   }
			if (vidaboss < 0)
			this.destroy();
	}
	public function setVida (v:Int): Void
		{
			vidaboss = v;
		}
		
		public function getVida ():Int
		{
			return vidaboss;
		}

	
}