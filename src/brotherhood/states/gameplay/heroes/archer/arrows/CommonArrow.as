package brotherhood.states.gameplay.heroes.archer.arrows 
{
	import brotherhood.states.gameplay.heroes.Hero;
	import brotherhood.system.EntityService;
	import flash.display.BitmapData;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import nemostein.framework.dragonfly.AnchorAlign;
	import nemostein.framework.dragonfly.Core;
	
	public class CommonArrow extends Core 
	{
		private var _destination:Point = new Point();
		private var _hero:Hero;
		
		public function CommonArrow(hero:Hero) 
		{
			_hero = hero;
			
			super();
		}
		
		override protected function initialize():void 
		{
			super.initialize();
			
			frame.width = 15;
			frame.height = 3;
			
			sprite = new BitmapData(frame.width, frame.height, true, 0);
			sprite.fillRect(new Rectangle(4, 1, 10, 1), 0xff000000);
			sprite.fillRect(new Rectangle(1, 0, 2, 3), 0xff008000);
			sprite.fillRect(new Rectangle(0, 0, 1, 1), 0xff008000);
			sprite.fillRect(new Rectangle(0, 2, 1, 1), 0xff008000);
			sprite.fillRect(new Rectangle(3, 1, 1, 1), 0xff008000);
			sprite.fillRect(new Rectangle(12, 0, 2, 3), 0xff808080);
			sprite.fillRect(new Rectangle(14, 1, 1, 1), 0xff808080);
			
			alignAnchor(AnchorAlign.CENTER, AnchorAlign.CENTER);
			
			relative = false;
			
			x = _hero.x;
			y = _hero.y;
			
			_destination.x = _hero.crosshair.x;
			_destination.y = _hero.crosshair.y;
		}
		
		override protected function update():void 
		{
			var maxMoveSpeed:int = 500;
			
			var distanceX:Number = _destination.x - x;
			var distanceY:Number = _destination.y - y;
			
			if (distanceX || distanceY)
			{
				var moveSpeed:Number = maxMoveSpeed * time;
				
				angle = Math.atan2(distanceY, distanceX);
				
				var moveX:Number = Math.cos(angle) * moveSpeed;
				var moveY:Number = Math.sin(angle) * moveSpeed;
				
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