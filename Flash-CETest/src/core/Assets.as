package core
{
	import spine.atlas.Atlas;
	
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;

	public class Assets
	{
		/**
		 * Embedded images.
		 * */
		[Embed(source="../media/images/atlas.png")]
		public static const AtlasPNG:Class;
		
		[Embed(source="../media/images/p1_walk01.png")]
		public static const PlayerPNG:Class;
		
		[Embed(source="../media/images/p2_walk01.png")]
		public static const EnemyPNG:Class;
		
		/*[Embed(source="../media/images/coinGold.png")]
		public static const Coin:Class;*/
		
		/**
		 * Embedded xml.
		 * */
		[Embed(source="../media/images/atlas.xml", mimeType="application/octet-stream")]
		public static const AtlasXML:Class;
		
		public static function GetTextureAtlas():TextureAtlas
		{
			var ta:TextureAtlas = new TextureAtlas(Texture.fromBitmap(new AtlasPNG()), XML(new AtlasXML()));
			return ta;
		}
		
	}
}



































