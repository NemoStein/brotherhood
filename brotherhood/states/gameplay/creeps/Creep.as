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
		protected var destination:Point;
		
		protected var strenght:Number;
		protected var rateOfFire:Number;
		protected var fireDelay:Number;
		
		override protected function initialize():void
		{
			super.initialize();
			
			strenght = 1;
			rateOfFire = 2;
			
			fireDelay = 0;
			
			maxMoveSpeed = 150;
		}
		
		protected function attackTarget():void
		{
			if (fireDelay <= 0)
			{
				target.hit(strenght);
				fireDelay += rateOfFire;
			}
		}
		
		public function hit(power:Number):void
		{
		
		}
		
		override protected function update():void
		{
			if (fireDelay <= 0)
			{
				fireDelay = 0;
			}
			else
			{
				fireDelay -= time;
			}
			
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