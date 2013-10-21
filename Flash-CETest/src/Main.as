package
{
	import citrus.core.starling.StarlingCitrusEngine;
	
	import flash.display.Sprite;
	
	import states.GameState;
	
	public class Main extends StarlingCitrusEngine
	{
		[SWF(width="1024", height="768", frameRate="60", backgroundColor="#505050")]
		public function Main()
		{
			setUpStarling();
			state = new GameState();
		}
	}
}



































