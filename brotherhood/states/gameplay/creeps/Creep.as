package brotherhood.states.gameplay.creeps
{
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import nemostein.framework.dragonfly.Core;
	
	public class Creep extends Core
	{
		static public var leftTowerBase:Rectangle;
		static public var rightTowerBase:Rectangle;
		static public var gateBase:Rectangle;
		
		protected var arivedAtDestination:Boolean;
		protected var maxMoveSpeed:Number;
		protected var destination:Point;
		
		override protected function initialize():void
		{
			super.initialize();
			
			maxMoveSpeed = 50;
		}
		
		protected function attackTarget():void
		{
		
		}
		
		override protected function update():void
		{
			var distanceX:Number = destination.x - x;
			var distanceY:Number = destination.y - y;
			
			if (distanceX || distanceY)
			{
				var moveSpeed:Number = maxMoveSpeed * time;
				
				var moveAngle:Number = Math.atan2(distanceY, distanceX);
				
				var moveX:Number = Math.cos(moveAngle) * moveSpeed;
				var moveY:Number = Math.sin(moveAngle) * moveSpeed;
				
				if (distanceX > 0 && distanceX < moveX || distanceX < 0 && distanceX > moveX)
				{
					moveX = distanceX;
				}
				
				if (distanceY > 0 && distanceY < moveY || distanceY < 0 && distanceY > moveY)
				{
					moveY = distanceY;
				}
				
				x += moveX;
				y += moveY;
			}
			else
			{
				arivedAtDestination = true;
			}
			
			super.update();
		}
	}
}