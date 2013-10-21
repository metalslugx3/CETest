package states
{
	import Box2D.Dynamics.Contacts.b2Contact;
	
	import citrus.core.CitrusEngine;
	import citrus.core.starling.StarlingState;
	import citrus.objects.platformer.box2d.Coin;
	import citrus.objects.platformer.box2d.Enemy;
	import citrus.objects.platformer.box2d.Hero;
	import citrus.objects.platformer.box2d.MovingPlatform;
	import citrus.objects.platformer.box2d.Platform;
	import citrus.physics.box2d.Box2D;
	import citrus.view.starlingview.AnimationSequence;
	
	import core.Assets;
	
	import flash.display.Bitmap;
	
	import starling.display.Image;
	import starling.display.MovieClip;
	import starling.display.Quad;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.textures.Texture;
	
	public class GameState extends StarlingState
	{
		[Embed(source="../../media/images/coinGold.png")]
		public static const CoinPNG:Class;
		
		private var _hero:Hero;
		private var _heroWalk:MovieClip;
		private var _heroIdle:Image;
		private var _heroJump:Image;
		
		public function GameState()
		{
			super();
		}
		
		override public function initialize():void
		{
			super.initialize();
			
			// you can also pass an image to the view
			//var bitmap:Bitmap = new CoinPNG();
			//var image:Image = Image.fromBitmap(bitmap);
			//addChild(image);
			
			var physics:Box2D = new Box2D("box2d");
			physics.visible = false;
			add(physics);
			
			var floor:Platform = new Platform("floor", {x:320, y:460, width:640, height:40});
			floor.view = new Quad(640, 40, 0x00ff00);
			add(floor);
			
			var p1:Platform = new Platform("p1", {x:500, y:150, width:100, height:40});
			p1.view = new Quad(100, 40, 0xFF00FF);
			add(p1);
			
			var mp:MovingPlatform = new MovingPlatform("mp", {x:100, y:400, width:100, height:40, startX:100, startY:400, endX:400, endY:150});
			mp.view = new Quad(100, 40, 0xff0000);
			add(mp);
			
			_heroWalk = new MovieClip(Assets.GetTextureAtlas().getTextures("p1_walk"), 20);
			_heroIdle = new Image(Assets.GetTextureAtlas().getTexture("p1_front"));
			_heroJump = new Image(Assets.GetTextureAtlas().getTexture("p1_jump"));
			
			_hero = new Hero("hero", {x:100, y:50, width:72, height:97});
			//_hero.view = new AnimationSequence(Assets.GetTextureAtlas(), ["p1_walk"], "p1_walk");
			//_hero.view = new Assets.PlayerPNG();
			_hero.view = _heroIdle;
			_hero.onJump.add(heroJumps);
			_hero.jumpHeight = 9;
			trace(_hero.killVelocity)
			_hero.friction = 0.9;
			_hero.acceleration = 0.5;
			_hero.killVelocity = 0.1;
			
			add(_hero);
			
			var enemy:Enemy = new Enemy("enemy", {x:500, y:300, width:70, height:94, leftBound:10, rightBound:640});
			enemy.view = new Assets.EnemyPNG();
			add(enemy);
			
			var goal:Coin = new Coin("goal", {x:500, y:50, width:79, height:79, view:"../media/images/coinGold.png"});
			goal.onBeginContact.add(goalContact);
			add(goal);
			
			this.addEventListener(Event.ENTER_FRAME, loop);
		}
		
		private function loop():void
		{
			switch (_hero.animation)
			{
				case "idle":
					_hero.view = _heroIdle;
					break;
				case "walk":
					_hero.view = _heroWalk;
					break;
				case "jump":
					_hero.view = _heroJump;
					break;
			}
		}
		
		private function goalContact(c:b2Contact):void
		{
			trace(c);
		}
		
		private function heroJumps():void
		{
			
		}
	}
}



































