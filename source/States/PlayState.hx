package states;

import flixel.FlxObject;
import flixel.group.FlxGroup;
import flixel.group.FlxSpriteGroup.FlxTypedSpriteGroup;
import sprites.Boss;
import sprites.Bullet1;
import sprites.Player;
import sprites.Powerup;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
import sprites.Enemy1;
import sprites.Enemy2;
import sprites.Enemy3;
import flixel.math.FlxRandom;
import flixel.addons.editors.ogmo.FlxOgmoLoader;
import flixel.tile.FlxTilemap;
import sprites.Powerup;

class PlayState extends FlxState
{
	public var tiempo_1:Int = 0;
	public var tiempo_2:Int = 0;
	public var tiempo_3:Int = 0;
	public var tiempo_4:Int = 0;
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
	private var balasP:FlxTypedGroup <Bullet1>;
	private var balasB:FlxTypedGroup <Bullet1>;
	private var balasE3:FlxTypedGroup <Bullet1>;
	private var enemigos1:FlxTypedGroup <Enemy1>;
	private var enemigos2:FlxTypedGroup <Enemy2>;
	private var enemigos3:FlxTypedGroup <Enemy3>;
	private var enemigo1:Enemy1;
	private var enemigo2:Enemy2;
	private var enemigo3:Enemy3;
	private var powerup:Powerup;
	private var boss:Boss;
	private var vidasP:Int = 3;
	private var cameraGuide:FlxSprite;
	override public function create():Void
	{
		enemigos1 = new FlxTypedGroup <Enemy1>();
		enemigos2 = new FlxTypedGroup <Enemy2>();
		enemigos3 = new FlxTypedGroup <Enemy3>();
		
		balasP = new FlxTypedGroup <Bullet1>();
		balasB = new FlxTypedGroup <Bullet1>();
		balasE3 = new FlxTypedGroup <Bullet1>();
		
		
		_map = new FlxOgmoLoader(AssetPaths.level1__oel);
		_mWalls = _map.loadTilemap(AssetPaths.Tiless__png, 16, 16, "tiles");
		_mWalls.follow();
		_mWalls.setTileProperties(1, FlxObject.ANY);
		_mWalls.setTileProperties(2, FlxObject.ANY);
		_mWalls.setTileProperties(3, FlxObject.NONE);
		_mWalls.setTileProperties(4, FlxObject.NONE);
		
		add(_mWalls);
		
		_map.loadEntities(placeEntities, "cosas");
		
		
		FlxG.camera.setScrollBounds(0, _mWalls.width, 0, _mWalls.height);
		FlxG.worldBounds.set(0, 0, _mWalls.width, _mWalls.height);
		
		cameraGuide = new FlxSprite(FlxG.width / 2, FlxG.height / 2);
		cameraGuide.makeGraphic(1, 1, 0x00000000);
		cameraGuide.velocity.x = 200;
		FlxG.camera.follow(cameraGuide);
		player.velocity.x = cameraGuide.velocity.x;
		
		
		
		add(_mWalls);
		add(cameraGuide);
		add(balasP);
		add(balasB);
		add(balasE3);
		add(enemigos1);
		add(enemigos2);
		add(enemigos3);
		
		
		
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
						player.loadGraphic(AssetPaths.Personaje__png, true, 32, 16);
						player.updateHitbox ();
						player.animation.add("mov", [0, 1], 2, true);
						player.animation.play("mov");
						add(player);
						
					case "Enemigo3":
						enemigo3 = new Enemy3 (x, y);
						enemigo3.loadGraphic(AssetPaths.Enemigo2__png, true, 32, 16);
						enemigo3.updateHitbox ();
						enemigo3.animation.add("mov", [0, 1], 2, true);
						enemigo3.animation.play("mov");
						enemigos3.add(enemigo3);
						add(enemigo3);
								
					case "Enemigo2":
						enemigo2 = new Enemy2 (x, y);
						enemigo2.loadGraphic(AssetPaths.Enemigo3__png, true, 32, 16);
						enemigo2.updateHitbox ();
						enemigo2.animation.add("mov", [0, 1], 2, true);
						enemigo2.animation.play("mov");
						enemigos2.add(enemigo2);
						add(enemigo2);
						
					case "Enemigo1":
						enemigo1 = new Enemy1 (x, y);
						enemigo1.loadGraphic(AssetPaths.Enemigoa__png, true, 32, 16);
						enemigo1.updateHitbox ();
						enemigo1.animation.add("mov", [0, 1], 2, true);
						enemigo1.animation.play("mov");
						enemigos1.add(enemigo1);
						add(enemigo1);
						
					case "Boss":
						boss = new Boss (x, y);
						boss.loadGraphic(AssetPaths.Boss__png, true, 32, 32);
						boss.updateHitbox ();
						boss.animation.add("mov", [0, 1], 2, true);
						boss.animation.play("mov");
						add(boss);
						
					case "Powerup":
						powerup = new Powerup (x, y);
						boss.loadGraphic(AssetPaths.Boss__png, true, 32, 32);
						boss.updateHitbox ();
						boss.animation.add("mov", [0, 1], 2, true);
						boss.animation.play("mov");
						add(powerup);
					
					
				}
				
			}

	override public function update(elapsed:Float):Void
	{
		tiempo_1 ++;
		
		forEachOfType  (Enemy1, chequeo);
		
		if (cameraGuide.x >= camera.maxScrollX - 150)
		{
			cameraGuide.velocity.x = 0;
			player.velocity.x = 0;
		}
		tiempo_2 ++;
			//disparo player
		
			if (FlxG.keys.pressed.SPACE && tiempo_2 >= 5)
			{
				var bala = new Bullet1(player.x + player.width / 2, player.y + player.height / 2);
				balasP.add (bala);
				tiempo_2 = 0;
			}
		tiempo_3 ++;
			//disparo boss
			if (tiempo_3 >= 120 && boss.exists)
			{
				var b1 = new Bullet1 (boss.x + boss.width / 2, boss.y + boss.height / 2);
				var b2 = new Bullet1 (boss.x + boss.width / 2, boss.y + boss.height / 2);
				var b3 = new Bullet1 (boss.x + boss.width / 2, boss.y + boss.height / 2);
				
				b1.velocity.x *= -1 / 2;
				b2.velocity.x *= -1 / 2;
				b3.velocity.x *= -1 / 2;
				
				b2.velocity.y = b2.velocity.x /5;
				b3.velocity.y = -b3.velocity.x /5;
				
				balasB.add (b1);
				balasB.add (b2);
				balasB.add (b3);
				
				tiempo_3 = 0;
			}
			tiempo_4 ++;
			//disparo enemigo
			for (i in 0...enemigos3.length)
			{
				if (tiempo_4 >= 20)
					{
						var b1 = new Bullet1 (enemigos3.members [i].x + enemigos3.members [i].width / 2, enemigos3.members [i].y + enemigos3.members [i].height / 2);
						balasE3.add (b1);
						b1.velocity.x = 0;
						b1.velocity.y = -200;
						tiempo_4 = 0;
					}
			}
			
		super.update(elapsed);
		
		
		/*if (FlxG.overlap (Player.bala, enemigo1))
		Player.bala.destroy();
		
		if (FlxG.overlap (Player.bala, enemigo2))
		Player.bala.destroy();
		
		if (FlxG.overlap (Player.bala, enemigo3))
		Player.bala.destroy();
		
		if (FlxG.overlap (Player.bala, boss))
		//Player.bala.destroy();
		*/
		//colision player-tileset
		if (FlxG.collide (player, _mWalls))
		{
			vidasP --;
			player.setVida (vidasP);
			player.x -= 20;
			player.y = FlxG.width / 2;
		}
		//colision player-enemigos
		for (i in 0...enemigos1.length)
		{
			if (FlxG.overlap (player, enemigos1.members [i]))
			{
				vidasP --;
				player.setVida (vidasP);
				player.x -= 20;
				player.y = FlxG.width / 2;
				
			}
		}
		
		for (i in 0...enemigos2.length)
		{
			if (FlxG.overlap (player, enemigos2.members [i]))
			{
				vidasP --;
				player.setVida (vidasP);
				player.x -= 20;
				player.y = FlxG.width / 2;
				
			}
		}
		
		for (i in 0...enemigos3.length)
		{
			if (FlxG.overlap (player, enemigos3.members [i]))
			{
				vidasP --;
				player.setVida (vidasP);
				player.x -= 20;
				player.y = FlxG.width / 2;
				
			}
		}
		
		if (FlxG.overlap (player, boss))
		{
			vidasP --;
			player.setVida (vidasP);
			player.x -= 20;
			player.y = FlxG.width / 2;
		}
		
		//colision balas-enemigo
		for (i in 0...enemigos1.length)
		{
			for (j in 0...balasP.length)
			{
				if (FlxG.overlap (balasP.members [j], enemigos1.members [i]))
				{
					balasP.members [j].destroy();
					enemigos1.members [i].destroy();
				}
			}
		}
		
		for (i in 0...enemigos2.length)
		{
			for (j in 0...balasP.length)
			{
				if (FlxG.overlap (balasP.members [j], enemigos2.members [i]))
				{
					balasP.members [j].destroy();
					enemigos2.members [i].destroy();
				}
			}
		}
		
		for (i in 0...enemigos3.length)
		{
			for (j in 0...balasP.length)
			{
				if (FlxG.overlap (balasP.members [j], enemigos3.members [i]))
				{
					balasP.members [j].destroy();
					enemigos3.members [i].destroy();
				}
			}
		}
		
		//colision bala-boss
		for (i in 0...balasP.length)
		{
			if (FlxG.overlap (boss, balasP.members [i]))
			{
				boss.dano ();
				balasP.members [i].destroy();
			}
		}
		//colision player-balaboss
		for (i in 0...balasB.length)
		{
			if (FlxG.overlap (player, balasB.members [i]))
			{
				vidasP --;
				player.setVida (vidasP);
				balasB.members [i].destroy();
			}
		}
		//colision player-balaenemigo
		for (i in 0...balasE3.length)
		{
			if (FlxG.overlap (player, balasE3.members [i]))
			{
				vidasP --;
				player.setVida (vidasP);
				balasE3.members [i].destroy();
			}
		}
		
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
		public function chequeo (enemigo1:Enemy1)
		{
			//enemigo1.checkearJugador (player.y);
		}
							
						
	}