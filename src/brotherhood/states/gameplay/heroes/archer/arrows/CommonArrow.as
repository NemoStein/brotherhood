package brotherhood.states.gameplay.heroes.archer.arrows 
{
	import assets.heroes.AssetArrow;
	import brotherhood.states.gameplay.creeps.CreepService;
	import brotherhood.states.gameplay.heroes.Hero;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import nemostein.framework.dragonfly.AnchorAlign;
	import nemostein.framework.dragonfly.Core;
	
	public class CommonArrow extends Core 
	{
		static public const FLYING:String = "flying";
		static public const MAX_MOVE_SPEED:int = 400;
		
		private var _destination:Point = new Point();
		private var _hero:Hero;
		private var _fading:Boolean;
		
		public function CommonArrow(hero:Hero) 
		{
			_hero = hero;
			
			super();
		}
		
		override protected function initialize():void
		{
			super.initialize();
			
			relative = false;
			
			draw(new AssetArrow().bitmapData);
			
			frame.width = 48;
			
			alignAnchor(AnchorAlign.CENTER, AnchorAlign.CENTER);
			
			x = _hero.x;
			y = _hero.y;
			
			//_destination.x = _hero.crosshair.x;
			//_destination.y = _hero.crosshair.y;
			
			var area:Rectangle = _hero.crosshair.areaOfEffect;
			
			_destination.x = Math.random() * area.width + area.x;
			_destination.y = Math.random() * area.height + area.y;
			
			var distanceX:Number = _destination.x - x;
			var distanceY:Number = _destination.y - y;
			var distance:Number = Math.sqrt(distanceX * distanceX + distanceY * distanceY);
			
			var frameRate:Number = MAX_MOVE_SPEED / (distance / 15);
			
			addAnimation(FLYING, [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], frameRate, false);
			playAnimation(FLYING);
		}
		
		override protected function update():void
		{
			if (!_fading)
			{
				var distanceX:Number = _destination.x - x;
				var distanceY:Number = _destination.y - y;
				
				if (distanceX || distanceY)
				{
					var moveSpeed:Number = MAX_MOVE_SPEED * time;
					
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
						CreepService.hitCreep(_destination);
						_fading = true;
					}
				}
			}
			else
			{
				alpha -= time; // 1 sec delay
				
				if (alpha <= 0)
				{
					parent.remove(this);
				}
			}
			
			super.update();
		}
	}
}