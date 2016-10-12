package states;

import flixel.FlxObject;
import sprites.Boss;
import sprites.Player;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
import sprites.Enemy1;
import flixel.math.FlxRandom;
import flixel.addons.editors.ogmo.FlxOgmoLoader;
import flixel.tile.FlxTilemap;

class PlayState extends FlxState
{
	public var tiempo_1:Int = 0;
	private var _map:FlxOgmoLoader;
	private var _mWalls:FlxTilemap;
	
	/*private var player:Personaje;
	private var enemyArray = new Array<Enemigo>();
	private var enemigo:Enemigo;
	private var jefe:Jefe;
	private var casa1:Casas;
	private var casa2:Casas;
	private var casa3:Casas;
	private var totalenemigos:Int = 21;
	private var tiempo_1:Int = 0;
	private var tiempo_2:Int = 0;
	private var tiempo_3:Int = 0;
	private var tiempo_4:Int = 0;
	private var tiempo_5:Int = 0;
	private var balaRandom:FlxRandom = new FlxRandom();
	private var explosion:FlxSprite;
	*/
	private var player:Player;
	private var enemigo1:Enemy1;
	private var enemigo2:Enemy1;
	private var enemigo3:Enemy1;
	private var boss:Boss;
	override public function create():Void
	{
		_map = new FlxOgmoLoader(AssetPaths.level1__oel);
		_mWalls = _map.loadTilemap(AssetPaths.Tiless__png, 16, 16, "tiles");
		_mWalls.follow();
		_mWalls.setTileProperties(1, FlxObject.ANY);
		_mWalls.setTileProperties(2, FlxObject.ANY);
		_mWalls.setTileProperties(3, FlxObject.NONE);
		_mWalls.setTileProperties(4, FlxObject.NONE);
		
		add(_mWalls);
		
		player = new Player();
		_map.loadEntities(placeEntities, "cosas");
		
		
		//player.makeGraphic(32, 16, 0xFFFF0000);
		/*jefe = new Jefe();
		casa1 = new Casas(FlxG.width -(FlxG.width - 16), FlxG.height - 35);
		add (casa1);
		casa2 = new Casas(FlxG.width -(FlxG.width - 64), FlxG.height - 35);
		add (casa2);
		casa3 = new Casas(FlxG.width -(FlxG.width - 112), FlxG.height - 35);
		add (casa3);
		var f:Int = 10;
		var c:Int = 10;
		for (i in 0...totalenemigos)
		{
			enemigo = new Enemigo(f, c);
			if (f >= (FlxG.width - player.width -32))
				{
					f = 10;
					c += 20;
				}
			else
			f += 20;
		enemyArray.push(enemigo);
		add(enemyArray[i]);
	}*/
	super.create();
	
	}
	
	private function placeEntities(entityName:String, entityData:Xml):Void
			{
				var x:Int = Std.parseInt(entityData.get("x"));
				var y:Int = Std.parseInt(entityData.get("y"));
				switch entityName
				{
					case "Player":
						player = new Player  (x, y);
						add(player.sprite);
						
					case "Enempigo3":
						enemigo3 = new Enemy1 (x, y);
						add(enemigo3.sprite);
						
					case "Enemigo2":
						enemigo2 = new Enemy1 (x, y);
						add(enemigo2.sprite);
						
					case "Enemigo1":
						enemigo1 = new Enemy1 (x, y);
						add(enemigo1.sprite);
						
					case "Boss":
						boss = new Boss (x, y);
						add(boss.sprite);
					
					
				}
				
			}

	override public function update(elapsed:Float):Void
	{
		tiempo_1 ++;
		
		super.update(elapsed);
	/*
	//colision con bala de enemigo
		if (FlxG.overlap(Enemigo.bala, Personaje.bala))
		{
			explosion= new FlxSprite(Enemigo.bala.x, Enemigo.bala.y);
			explosion.loadGraphic(AssetPaths.explosionentredisparos__png, false);
			explosion.setGraphicSize (16, 16);
			Personaje.bala.destroy();
			Enemigo.bala.destroy();
			Personaje.balasEnPantalla = 0;
		}
		//CODIGO ENEMIGOS
		for (i in 0...enemyArray.length)
		{
			//colision enemigo/player
			if (FlxG.overlap(enemyArray[i], player))
				{
					player.destroy();
					enemyArray[i].destroy();
				}
		//cambio direccion cunado tocan bordes de pantalla
		if (Enemigo.orientacion)
		{
			enemyArray[i].x -= Enemigo.velocidadX;
		}
		else
		{
			enemyArray[i].x += Enemigo.velocidadX;
		}
	}
//disparan aleatoriamente los enemigos
tiempo_2++;
if (tiempo_2 == 60) //cada un intervalo de tiempo
											{
												var r:Int = balaRandom.int(0, enemyArray.length - 1);
												if (enemyArray[r].active == true)
												{
											        enemyArray[r].dispara();
												}
												tiempo_2 = 0;
											}
				//FIN CODIGO ENEMIGOS
											
				//CODIGO DE JEFE							
											//cada 10 segundos aparece jefe
											tiempo_3++;
											if (tiempo_3 == 60) 
											{
												jefe = new Jefe();
												add(jefe);
											}
											
											if (!jefe.active && tiempo_3 >= 60)//si se detruye reseteamos tiempo
											{
												
												tiempo_3 = 0;//¡¡¡igualmente no logro que respawnee!!!!
											}
										
											if (Jefe.orientacion)
									            {
									                jefe.x -= Jefe.velocidadX;
									            }
									             else
									             {
									                jefe.x += Jefe.velocidadX;
									             }
					//FIN CODIGO JEFE
											if (!player.exists)
											{
												
											}
						
											
							}*/
							}
							
						
						}