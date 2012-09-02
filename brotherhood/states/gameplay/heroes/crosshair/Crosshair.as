package brotherhood.states.gameplay.heroes.crosshair
{
	import brotherhood.states.gameplay.hud.HUD;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import nemostein.framework.dragonfly.AnchorAlign;
	import nemostein.framework.dragonfly.Core;
	
	public class Crosshair extends Core
	{
		static public const MAX_SPEED:int = 666;
		
		private var _heroType:String;
		
		public var speed:int;
		public var destination:Point;
		public var radius:Number;
		public var areaOfEffect:Rectangle;
		
		private var core:Core;
		
		public function Crosshair(heroType:String):void
		{
			super();
			
			_heroType = heroType;
		}
		
		override protected function initialize():void
		{
			super.initialize();
			
			destination = new Point();
			areaOfEffect = new Rectangle();
			
			if (_heroType == HUD.ARCHER)
			{
				draw(Bitmap(new Assets.ImageShotArea).bitmapData);
			}
			else
			{
				draw(Bitmap(new Assets.ImageShotArea).bitmapData);
			}
			
			alignAnchor(AnchorAlign.CENTER, AnchorAlign.CENTER);
			
			// DELETE: area of effect marker
			core = new Core();
			add(core);
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
			if (y < 200)
			{
				y = 200;
			}
			
			radius = y / 630;
			speed = MAX_SPEED * radius;
			
			scaleX = scaleY = radius + 0.1;
			
			areaOfEffect.width = radius * width;
			areaOfEffect.height = radius * height;
			
			areaOfEffect.x = x - areaOfEffect.width / 2;
			areaOfEffect.y = y - areaOfEffect.height / 2;
			
			core.draw(new BitmapData(areaOfEffect.width, areaOfEffect.height, true, 0x50000000));
			core.x = areaOfEffect.x;
			core.y = areaOfEffect.y;
			
			super.update();
		}
	}
}