package sprites;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxG;

/**
 * ...
 * @author ...
 */
class Enemy2 extends FlxSprite
{
	private var velocidad = 15;
	private var posYinicial:Float;
	private var timerDisparo:Int = 0;
	public  var sprite:FlxSprite;
	public var puedeDisparar:Bool = false;//Acceso publico para poder acceder desde el state y generar ahi una bala.
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		posYinicial = y;
		//loadGraphic(AssetPaths.)
		velocity.x = -velocidad;
		velocity.y = 20;
	}
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		if (y > posYinicial + 30)//Cuando el enemigo baje cierta cantidad de pixeles(con respecto a su posicion inicial)
		{
			velocity.y *= -1;//Invierte su velocity en y.
		}	
		if (y < posYinicial - 30)//Cuando el enemigo suba cierta cantidad de pixeles(con respecto a su posicion inicial)
		{
			velocity.y *= -1;//Invierte su velocity en y.
		}
		if (puedeDisparar)
		{	
			puedeDisparar = false;
		}
		timerDisparo++;
		if (timerDisparo > 5)
		{
			timerDisparo = 0;
			puedeDisparar = true;
			trace("enemigo 2 puede disparar");
		}
		if (puedeDisparar)
			puedeDisparar = false;
		//if (x < 0)//modificar esto al implementar la camara.
		
			//destroy();
		
			
	}
}