package brotherhood.states.gameplay.heroes.crosshair
{
	import air.update.states.HSM;
	import brotherhood.states.gameplay.heroes.archer.Archer;
	import brotherhood.states.gameplay.heroes.Hero;
	import brotherhood.states.gameplay.hud.HUD;
	import brotherhood.system.EntityService;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import nemostein.framework.dragonfly.AnchorAlign;
	import nemostein.framework.dragonfly.Core;
	
	public class Crosshair extends Core
	{
		static public const IDLE:String = "idle";
		static public const MAX_SPEED:int = 666;
		
		private var _KeyGreenA:int;
		private var _KeyGreenB:int;
		private var _KeyBlueA:int;
		private var _KeyBlueB:int;
		private var _KeyRedA:int;
		private var _KeyRedB:int;
		private var _KeyUp:int;
		private var _KeyDown:int;
		private var _KeyLeft:int;
		private var _KeyRight:int;
		private var _KeyStart:int;
		
		private var _hero:Hero;
		private var _lookingLeft:Boolean;
		
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
			
			relative = false;
			destination = new Point();
			areaOfEffect = new Rectangle();
			
			draw(Bitmap(new Assets.ImageHeroesCrosshairs).bitmapData);
			
			frame.width = 140;
			frame.height = 140;
			
			if (_hero is Archer)
			{
				frame.y = 140;
			}
			
			if (_hero.slot == HUD.LEFT)
			{
				_KeyGreenA = Controls.Slot1GreenA;
				_KeyGreenB = Controls.Slot1GreenB;
				_KeyBlueA = Controls.Slot1BlueA;
				_KeyBlueB = Controls.Slot1BlueB;
				_KeyRedA = Controls.Slot1RedA;
				_KeyRedB = Controls.Slot1RedB;
				_KeyUp = Controls.Slot1Up;
				_KeyDown = Controls.Slot1Down;
				_KeyLeft = Controls.Slot1Left;
				_KeyRight = Controls.Slot1Right;
				_KeyStart = Controls.Slot1Start;
			}
			else
			{
				_KeyGreenA = Controls.Slot2GreenA;
				_KeyGreenB = Controls.Slot2GreenB;
				_KeyBlueA = Controls.Slot2BlueA;
				_KeyBlueB = Controls.Slot2BlueB;
				_KeyRedA = Controls.Slot2RedA;
				_KeyRedB = Controls.Slot2RedB;
				_KeyUp = Controls.Slot2Up;
				_KeyDown = Controls.Slot2Down;
				_KeyLeft = Controls.Slot2Left;
				_KeyRight = Controls.Slot2Right;
				_KeyStart = Controls.Slot2Start;
			}
			
			alignAnchor(AnchorAlign.CENTER, AnchorAlign.CENTER);
			
			addAnimation(IDLE, [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23], 12);
			playAnimation(IDLE);
		}
		
		override protected function update():void
		{
			if (input.pressed(_KeyUp))
			{
				destination.y = -Infinity;
				
			}
			else if (input.pressed(_KeyDown))
			{
				destination.y = Infinity;
			}
			else
			{
				destination.y = y;
			}
			
			if (input.pressed(_KeyLeft))
			{
				destination.x = -Infinity;
			}
			else if (input.pressed(_KeyRight))
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
			
			if (!_lookingLeft && x < 640)
			{
				_lookingLeft = true;
				_hero.moveSpriteToFrame(_hero.lookLeft);
			}
			else if(_lookingLeft && x > 640)
			{
				_lookingLeft = false;
				_hero.moveSpriteToFrame(_hero.lookRight);
			}
			
			radius = y / 630;
			speed = MAX_SPEED * radius;
			
			scaleX = scaleY = radius + 0.1;
			alpha = 1 - radius * 0.75;
			
			areaOfEffect.width = radius * width;
			areaOfEffect.height = radius * height;
			
			areaOfEffect.x = x - areaOfEffect.width / 2;
			areaOfEffect.y = y - areaOfEffect.height / 2;
			
			if (input.pressed(_KeyGreenA))
			{
				_hero.useSkill(1);
			}
			
			super.update();
		}
	}
}