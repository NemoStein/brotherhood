package brotherhood.states.gameplay.creeps.melee
{
	import brotherhood.states.gameplay.creeps.Creep;
	import flash.display.BitmapData;
	import flash.geom.Point;
	import nemostein.framework.dragonfly.AnchorAlign;
	import nemostein.framework.dragonfly.Core;
	
	internal class Melee extends Creep
	{
		override protected function initialize():void
		{
			super.initialize();
			
			draw(new BitmapData(15, 15, true, 0xffdf4030));
			alignAnchor(AnchorAlign.BOTTOM, AnchorAlign.CENTER);
		}
		
		override protected function update():void
		{
			if (!target)
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