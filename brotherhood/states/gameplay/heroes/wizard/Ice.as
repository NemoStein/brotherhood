package brotherhood.states.gameplay.heroes.wizard
{
	import brotherhood.system.EntityService;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.geom.Point;
	import nemostein.framework.dragonfly.Core;
	
	public class Ice extends Core
	{
		
		private var _destination:Point = new Point();
		
		public function Ice():void
		{
			super();
			
			_destination.x = EntityService.player1Crosshair.x;
			_destination.y = EntityService.player1Crosshair.y;
		}
		
		override protected function initialize():void
		{
			super.initialize();
			
			draw(Bitmap(new Assets.ImageCreepsFire).bitmapData);
			frame.width = 32;
			frame.height = 32;
			
			//draw( new BitmapData(8, 8, true, 0x80000070));
		}
		
		override protected function update():void
		{
			var maxMoveSpeed:int = 500;
			
			var distanceX:Number = _destination.x - x;
			var distanceY:Number = _destination.y - y;
			
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
				
				if (x == _destination.x)
				{
					parent.remove(this);
				}
			}
			
			super.update();
		}
	}
}