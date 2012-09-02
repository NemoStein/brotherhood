package brotherhood.states.gameplay.heroes.crosshair
{
	import brotherhood.states.gameplay.hud.HUD;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import nemostein.framework.dragonfly.AnchorAlign;
	import nemostein.framework.dragonfly.Core;
	
	public class Crosshair extends Core
	{
		static public const MAX_SPEED:int = 666;
		
		private var _heroType:String;
		
		public var speed:int;
		public var destination:Point;
		public var radius:Number;
		public var areaOfEffect:Rectangle;
		
		public function Crosshair(heroType:String):void
		{
			super();
			
			_heroType = heroType;
		}
		
		override protected function initialize():void
		{
			super.initialize();
			
			destination = new Point();
			areaOfEffect = new Rectangle();
			
			draw(Bitmap(new Assets.ImageArea).bitmapData);
			
			frame.width = 280;
			frame.height = 280;
			
			if (_heroType == HUD.ARCHER)
			{
				frame.y = 280;
			}
			
			alignAnchor(AnchorAlign.CENTER, AnchorAlign.CENTER);
		}
		
		override protected function update():void
		{
			if (input.pressed(Controls.P1_U))
			{
				destination.y = -Infinity;
				
			}
			else if(input.pressed(Controls.P1_D))
			{
				destination.y = Infinity;
			}
			else
			{
				destination.y = y;
			}
			
			if (input.pressed(Controls.P1_L))
			{
				destination.x = -Infinity;
			}
			else if(input.pressed(Controls.P1_R))
			{
				destination.x = Infinity;
			}
			else
			{
				destination.x = x;
			}
			
			var distanceX:Number = destination.x - x;
			var distanceY:Number = destination.y - y;
			
			if (distanceX || distanceY)
			{
				var moveSpeed:Number = MAX_SPEED * time;
				
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
			
			if (x > 1000)
			{
				x = 1000;
			}
			if (x < 300)
			{
				x = 300;
			}
			
			if (y > 670)
			{
				y = 670;
			}
			if (y < 200)
			{
				y = 200;
			}
			
			radius = y / 630;
			speed = MAX_SPEED * radius;
			
			scaleX = scaleY = radius + 0.1;
			
			areaOfEffect.width = radius * width;
			areaOfEffect.height = radius * height;
			
			areaOfEffect.x = x - areaOfEffect.width / 2;
			areaOfEffect.y = y - areaOfEffect.height / 2;
			
			super.update();
		}
	}
}