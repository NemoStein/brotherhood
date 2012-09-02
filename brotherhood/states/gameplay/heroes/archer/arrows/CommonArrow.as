package brotherhood.states.gameplay.heroes.archer.arrows 
{
	import flash.display.BitmapData;
	import flash.geom.Rectangle;
	import nemostein.framework.dragonfly.Core;
	
	public class CommonArrow extends Core 
	{
		
		override protected function initialize():void 
		{
			super.initialize();
			
			frame.width = 15;
			frame.height = 3;
			
			sprite = new BitmapData(frame.width, frame.height, true, 0);
			sprite.fillRect(new Rectangle(4, 1, 10, 1), 0xff000000);
			sprite.fillRect(new Rectangle(1, 0, 2, 3), 0xff008000);
			sprite.fillRect(new Rectangle(0, 0, 1, 1), 0xff008000);
			sprite.fillRect(new Rectangle(0, 2, 1, 1), 0xff008000);
			sprite.fillRect(new Rectangle(3, 1, 1, 1), 0xff008000);
			sprite.fillRect(new Rectangle(12, 0, 2, 3), 0xff808080);
			sprite.fillRect(new Rectangle(14, 1, 1, 1), 0xff808080);
		}
	}
}