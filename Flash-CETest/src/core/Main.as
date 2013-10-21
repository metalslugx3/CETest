package core
{
	import citrus.core.CitrusEngine;
	import citrus.core.starling.StarlingCitrusEngine;
	import citrus.view.starlingview.StarlingCamera;
	import citrus.view.starlingview.StarlingTile;
	
	import flash.display.Sprite;
	import flash.display.StageScaleMode;
	import flash.geom.Rectangle;
	
	import starling.core.Starling;
	
	import states.GameState;
	
	[SWF(width="640", height="480", frameRate=45, backgroundColor="#505050")]
	public class Main extends StarlingCitrusEngine
	{
		public function Main()
		{
			super();
			
			trace(stage.stageWidth, stage.stageHeight);
			
			setUpStarling(true, 1);
			
			trace(stage.stageWidth, stage.stageHeight);
			
			state = new GameState();
		}
	}
}



































