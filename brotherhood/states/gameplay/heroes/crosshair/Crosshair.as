package brotherhood.states.gameplay.heroes.crosshair 
{
	import brotherhood.states.gameplay.hud.HUD;
	import flash.display.Bitmap;
	import flash.geom.Point;
	import nemostein.framework.dragonfly.AnchorAlign;
	import nemostein.framework.dragonfly.Core;
	
	
	public class Crosshair extends Core 
	{
		static public const SPEED:int = 330;
		
		private var _heroType:String;
		
		public var destination:Point;
		
		public function Crosshair(heroType:String):void
		{
			super();
			
			_heroType = heroType;
		}
		
		override protected function initialize():void 
		{
			super.initialize();
			
			destination = new Point();
			
			if (_heroType == HUD.ARCHER)
			{
				draw(Bitmap(new Assets.ImageShotArea).bitmapData);
			}
			else
			{
				draw(Bitmap(new Assets.ImageShotArea).bitmapData);
			}
			
			alignAnchor(AnchorAlign.CENTER, AnchorAlign.CENTER);
		}
		
		override protected function update():void 
		{
			if (x > 1000)
			{
				x = 1000;
			}
			if (x < 300)
			{
				x = 300;
			}
			
			if (y > 670)
			{
				y = 670;
			}
			if (y < 220)
			{
				y = 220;
			}
			
			scaleY = y / 630 + 0.1;
			scaleX = y / 630 + 0.1;
			
			super.update();
		}
		
	}

}