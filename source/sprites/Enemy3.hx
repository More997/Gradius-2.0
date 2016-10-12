package sprites;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;

/**
 * ...
 * @author ...
 */
class Enemy3 extends FlxSprite
{
	private var velocidad = 15;
	private var timerDisparo:Int = 0;
	public var puedeDisparar:Bool = false;
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset)//enemigo inmovil.
	{
		super(X, Y, SimpleGraphic);
		//loadGraphic(AssetPaths.)
		velocity.x = 0;
	}
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		timerDisparo++;
		if (timerDisparo > 90)
		{
			timerDisparo = 0;
			puedeDisparar = true;
			trace("enemigo 3 puede disparar");
		}
		if (puedeDisparar)
			puedeDisparar = false;
		if (x < 0)//modificar esto al implementar la camara.
			destroy();
	}
}