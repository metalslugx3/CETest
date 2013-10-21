package states
{
	import citrus.core.starling.StarlingState;
	import citrus.physics.box2d.Box2D;
	
	public class GameState extends StarlingState
	{
		public function GameState()
		{
			super();
			
			
		}
		
		override public function initialize():void
		{
			super.initialize();
			
			var physics:Box2D = new Box2D("box2d");
			physics.visible = true;
			add(physics);
		}
	}
}



































