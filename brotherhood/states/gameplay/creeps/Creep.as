package brotherhood.states.gameplay.creeps 
{
	import flash.display.BitmapData;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import nemostein.framework.dragonfly.AnchorAlign;
	import nemostein.framework.dragonfly.Core;

	public class Creep extends Core 
	{
		static public var leftTowerBase:Rectangle;
		static public var rightTowerBase:Rectangle;
		static public var gateBase:Rectangle;
		
		protected var moveSpeed:Number;
		protected var target:Point;
		
		override protected function initialize():void 
		{
			super.initialize();
			
			draw(new BitmapData(15, 15, true, 0xffdf4030));
			
			alignAnchor(AnchorAlign.BOTTOM, AnchorAlign.CENTER);
			
			moveSpeed = 50;
		}
		
		override protected function update():void 
		{
			if (target == null)
			{
				
			}
			
			super.update();
		}
	}
}