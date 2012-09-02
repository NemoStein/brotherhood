package brotherhood.states.gameplay.creeps
{
	import brotherhood.states.gameplay.Target;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import nemostein.framework.dragonfly.Core;
	
	public class Creep extends Core implements Target
	{
		static public var leftTowerBase:Rectangle;
		static public var rightTowerBase:Rectangle;
		static public var gateBase:Rectangle;
		
		protected var target:Target;
		protected var arivedAtDestination:Boolean;
		protected var maxMoveSpeed:Number;
		protected var strenght:Number;
		protected var destination:Point;
		
		override protected function initialize():void
		{
			super.initialize();
			
			strenght = 1;
			maxMoveSpeed = 150;
		}
		
		protected function attackTarget():void
		{
			target.hit(strenght);
		}
		
		public function hit(power:Number):void
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