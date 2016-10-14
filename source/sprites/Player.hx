package sprites;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxG;
import sprites.Bullet1;
import flixel.FlxState;

/**
 * ...
 * @author ...
 */
class Player extends FlxSprite
{
	private var key_right:Bool;
	private var key_left:Bool;
	private var key_up:Bool;
	private var key_down:Bool;
	private var moveX:Int;
	private var moveY:Int;
	private var velocidadX:Int = 2;
	private var velocidadY:Int = 2;
	public static var bala:Bullet1;
	private var tiempo_1:Int = 0;
	private var vidas:Int = 0;
    public var sprite:FlxSprite;


	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		sprite = new FlxSprite();
		sprite.x = 16;
	sprite.y =	112;
		sprite.loadGraphic(AssetPaths.Personaje__png,true,32,16);
		sprite.animation.add("mov", [0, 1], 2, true);
	    sprite.animation.play("mov");
	}
	
	override public function update(elapsed:Float):Void
		{	
			super.update(elapsed);
			
			//movimiento
			key_right = FlxG.keys.pressed.RIGHT;
			key_left  = FlxG.keys.pressed.LEFT;
			key_up    = FlxG.keys.pressed.UP;
			key_down  = FlxG.keys.pressed.DOWN;
			
			if(key_right && !key_left && x < FlxG.camera.width - width)
			   moveX = 1;
			else if (!key_right && key_left && x > 0)
					 moveX = -1;
			else
				moveX = 0;
				
			if(key_down && !key_up && y < FlxG.camera.height - height)
			   moveY = 1;
			else if (!key_down && key_up && y > 0)
					 moveY = -1;
			else
				moveY = 0;
			
			x += moveX * velocidadX;
			y += moveY * velocidadY;
			
			tiempo_1 ++;
			//disparo
			if (FlxG.keys.pressed.SPACE && tiempo_1 >= 5)
			{
				bala = new Bullet1(x + width / 2, y + height / 2);
				FlxG.state.add(bala);
				tiempo_1 = 0;
			}
			//destruccion
			if (vidas < 0)
			this.destroy();
		}
		
		public function setVida (v:Int): Void
		{
			vidas = v;
		}
		
		public function getVida ():Int
		{
			return vidas;
		}
	}
	
