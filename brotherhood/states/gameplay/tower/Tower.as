package brotherhood.states.gameplay.tower 
{
	import flash.display.BitmapData;
	import nemostein.framework.dragonfly.AnchorAlign;
	import nemostein.framework.dragonfly.Core;
	
	public class Tower extends Core 
	{
		private var strenght:Number;
		
		override protected function initialize():void 
		{
			super.initialize();
			
			draw(new BitmapData(130, 190, true, 0xff5f5f5f));
			
			alignAnchor(AnchorAlign.BOTTOM, AnchorAlign.CENTER);
			
			strenght = 100;
		}
	}
}