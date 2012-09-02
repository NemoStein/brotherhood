package brotherhood.states.gameplay.creeps.ranged
{
	import brotherhood.states.gameplay.creeps.Creep;
	import flash.display.BitmapData;
	import flash.geom.Point;
	import nemostein.framework.dragonfly.AnchorAlign;
	
	internal class Ranged extends Creep
	{
		protected var maxRange:Number;
		protected var minRange:Number;
		
		override protected function initialize():void
		{
			super.initialize();
			
			draw(new BitmapData(15, 15, true, 0xff4030df));
			alignAnchor(AnchorAlign.BOTTOM, AnchorAlign.CENTER);
			
			minRange = 100;
			maxRange = 150;
		}
		
		override protected function update():void
		{
			if (!target)
			{
				target = new Point();
				
				target.x = x;
				target.y = Math.random() * (maxRange - minRange) + maxRange + gateBase.bottom;
			}
			
			var distanceX:Number = target.x - x;
			var distanceY:Number = target.y - y;
			
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
			
			super.update();
		}
	}
}