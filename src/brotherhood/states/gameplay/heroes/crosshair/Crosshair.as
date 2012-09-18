package brotherhood.states.gameplay.heroes.crosshair
{
	import air.update.states.HSM;
	import brotherhood.states.gameplay.heroes.archer.Archer;
	import brotherhood.states.gameplay.heroes.Hero;
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
		
		static public var KeyGreenA:int;
		static public var KeyGreenB:int;
		static public var KeyBlueA:int;
		static public var KeyBlueB:int;
		static public var KeyRedA:int;
		static public var KeyRedB:int;
		static public var KeyUp:int;
		static public var KeyDown:int;
		static public var KeyLeft:int;
		static public var KeyRight:int;
		static public var KeyStart:int;
		
		private var _hero:Hero;
		
		public var speed:int;
		public var destination:Point;
		public var radius:Number;
		public var areaOfEffect:Rectangle;
		
		public function Crosshair(hero:Hero):void
		{
			_hero = hero;
			
			super();
		}
		
		override protected function initialize():void
		{
			super.initialize();
			
			destination = new Point();
			areaOfEffect = new Rectangle();
			
			draw(Bitmap(new Assets.ImageHeroesCrosshairs).bitmapData);
			
			frame.width = 280;
			frame.height = 280;
			
			if (_hero is Archer)
			{
				frame.y = 280;
			}
			
			if (_hero.slot == HUD.LEFT)
			{
				KeyGreenA = Controls.Slot1GreenA;
				KeyGreenB = Controls.Slot1GreenB;
				KeyBlueA = Controls.Slot1BlueA;
				KeyBlueB = Controls.Slot1BlueB;
				KeyRedA = Controls.Slot1RedA;
				KeyRedB = Controls.Slot1RedB;
				KeyUp = Controls.Slot1Up;
				KeyDown = Controls.Slot1Down;
				KeyLeft = Controls.Slot1Left;
				KeyRight = Controls.Slot1Right;
				KeyStart = Controls.Slot1Start;
			}
			else
			{
				KeyGreenA = Controls.Slot2GreenA;
				KeyGreenB = Controls.Slot2GreenB;
				KeyBlueA = Controls.Slot2BlueA;
				KeyBlueB = Controls.Slot2BlueB;
				KeyRedA = Controls.Slot2RedA;
				KeyRedB = Controls.Slot2RedB;
				KeyUp = Controls.Slot2Up;
				KeyDown = Controls.Slot2Down;
				KeyLeft = Controls.Slot2Left;
				KeyRight = Controls.Slot2RedA;
				KeyStart = Controls.Slot2Start;
			}
			
			alignAnchor(AnchorAlign.CENTER, AnchorAlign.CENTER);
		}
		
		override protected function update():void
		{
			if (input.pressed(KeyUp))
			{
				destination.y = -Infinity;
				
			}
			else if (input.pressed(KeyDown))
			{
				destination.y = Infinity;
			}
			else
			{
				destination.y = y;
			}
			
			if (input.pressed(KeyLeft))
			{
				destination.x = -Infinity;
			}
			else if (input.pressed(KeyRight))
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
				var moveSpeed:Number = Crosshair.MAX_SPEED * time;
				
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