package sprites;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxG;

/**
 * ...
 * @author ...
 */
class Enemy1 extends FlxSprite
{
	public var velocidad = 100;
	public var velocidadY = 2;
	public var puedeDisparar:Bool = false;//Acceso publico para poder acceder desde el state y generar ahi una bala.
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		//loadGraphic(AssetPaths.)
		velocity.x = -velocidad;
	}
	override public function update (elapsed:Float) :Void
	{
		super.update(elapsed);
	}
	public function checkearJugador(altura:Float)
	{
		if (altura > y)//El enemigo se mueve hacia abajo si el jugador esta mas abajo.
			y += velocidadY;
		else if(altura < y)//El enemigo se mueve hacia arriba si el jugador esta mas arriba.
			y -= velocidadY;
		else//El enemigo se mantiene su altura si es la misma que la del jugador.
		{
			//velocity.y = 0;
			puedeDisparar = true;
			trace("enemigo 1 puede disparar");
		}
		if (puedeDisparar)
			puedeDisparar = false;
			
		if (x < 0)//modificar esto al implementar la camara.
			destroy();
			
		if (FlxG.collide (Player.bala, this))
			destroy();
	}
}