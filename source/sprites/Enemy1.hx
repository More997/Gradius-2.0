package sprites;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;

/**
 * ...
 * @author ...
 */
class Enemy1 extends FlxSprite
{
	private var velocidad = 10;
	public var puedeDisparar:Bool = false;//Acceso publico para poder acceder desde el state y generar ahi una bala.
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		//loadGraphic(AssetPaths.)
		velocity.x = -velocidad;
	}
	public function checkearJugador(altura:Float)
	{
		if (altura > y)//El enemigo se mueve hacia abajo si el jugador esta mas abajo.
			velocity.y = velocidad*2/3;
		else if(altura < y)//El enemigo se mueve hacia arriba si el jugador esta mas arriba.
			velocity.y = -velocidad*2/3;
		else//El enemigo se mantiene su altura si es la misma que la del jugador.
		{
			velocity.y = 0;
			puedeDisparar = true;
			trace("enemigo 1 puede disparar");
		}
		if (puedeDisparar)
			puedeDisparar = false;
		if (x < 0)//modificar esto al implementar la camara.
			destroy();
	}
}