package brotherhood.states.gameplay.heroes 
{
	import brotherhood.states.gameplay.Target;
	import brotherhood.system.SystemService;
	import flash.display.Bitmap;
	import nemostein.framework.dragonfly.AnchorAlign;
	import nemostein.framework.dragonfly.Animation;
	import nemostein.framework.dragonfly.Core;
	import nemostein.io.Keys;
	
	public class Hero extends Core implements Target
	{
		static public const LOOK_LEFT:String = "lookLeft";
		static public const LOOK_MIDDLE:String = "lookMiddle";
		static public const LOOK_RIGHT:String = "lookRight";
		
		public var currentHP:Number = 100;
		public var totalHP:Number = 100;
		
		public var currentXP:Number = 100;
		
		public var level:int = 1;
		
		override protected function initialize():void 
		{
			super.initialize();
			
			draw(Bitmap(new Assets.ImageHeroes).bitmapData);
			
			frame.width = 50;
			frame.height = 50;
			
			alignAnchor(AnchorAlign.BOTTOM, AnchorAlign.CENTER);
			
			addAnimation(new Animation(LOOK_LEFT, [0], 150, false));
			addAnimation(new Animation(LOOK_MIDDLE, [1], 150, false));
			addAnimation(new Animation(LOOK_RIGHT, [2], 150, false));
		}
		
		public function addXP(xp:int):void
		{
			currentXP += xp;
			
			if (currentXP >= nextLevelXP(level))
			{
				levelUp();
			}
		}
		
		private function levelUp():void 
		{
			currentXP -= nextLevelXP(level++);
		}
		
		public function nextLevelXP(level:int):Number 
		{
			if (level == 1)
			{
				return 100;
			}
			
			return nextLevelXP(level - 1) * 1.2;
		}
		
		public function hit(power:Number):void 
		{
			currentHP -= power;
		}
		
		override protected function update():void 
		{
			if (currentHP <= 0)
			{
				currentHP = 0;
				SystemService.defeat();
			}
			
			if (input.justPressed(Controls.P1_GB))
			{
				playAnimation(LOOK_LEFT);
			}
			else if (input.justPressed(Controls.P1_BB))
			{
				playAnimation(LOOK_MIDDLE);
			}
			else if (input.justPressed(Controls.P1_RB))
			{
				playAnimation(LOOK_RIGHT);
			}
			
			super.update();
		}
	}
}