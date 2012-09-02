package brotherhood.states.gameplay.tower 
{
	import brotherhood.states.gameplay.Target;
	import brotherhood.system.SystemService;
	import flash.display.BitmapData;
	import nemostein.framework.dragonfly.AnchorAlign;
	import nemostein.framework.dragonfly.Core;
	
	public class Tower extends Core implements Target
	{
		public var currentHP:Number = 100;
		public var totalHP:Number = 100;
		
		override protected function initialize():void 
		{
			super.initialize();
			
			draw(new BitmapData(130, 190, true, 0xff5f5f5f));
			
			alignAnchor(AnchorAlign.BOTTOM, AnchorAlign.CENTER);
		}
		
		public function hit(power:Number):void 
		{
			currentHP -= power;
		}
		
		override protected function update():void 
		{
			if (currentHP <= 0)
			{
				currentHP = 0;
				SystemService.defeat();
			}
			
			super.update();
		}
	}
}