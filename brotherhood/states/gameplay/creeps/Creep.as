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
				target = new Point();
				
				// TODO: Ajust lanes here
				if (x < 500)
				{
					target.x = Math.random() * leftTowerBase.width + leftTowerBase.x;
					target.y = Math.random() * leftTowerBase.height + leftTowerBase.y;
				}
				else if (x < 800)
				{
					target.x = Math.random() * gateBase.width + gateBase.x;
					target.y = Math.random() * gateBase.height + gateBase.y;
				}
				else
				{
					target.x = Math.random() * rightTowerBase.width + rightTowerBase.x;
					target.y = Math.random() * rightTowerBase.height + rightTowerBase.y;
				}
			}
			
			var distanceX:Number = target.x - x;
			var distanceY:Number = target.y - y;
			
			var moveAngle:Number = Math.atan2(distanceY, distanceX);
			
			x += Math.cos(moveAngle) * moveSpeed * time;
			y += Math.sin(moveAngle) * moveSpeed * time;
			
			super.update();
		}
	}
}