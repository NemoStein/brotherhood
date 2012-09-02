package brotherhood.states.gameplay.heroes 
{
	import brotherhood.states.gameplay.Target;
	import brotherhood.system.SystemService;
	import nemostein.framework.dragonfly.Core;
	import nemostein.io.Keys;
	
	public class Hero extends Core implements Target
	{
		public var currentHP:Number = 100;
		public var totalHP:Number = 100;
		
		public var currentXP:Number = 0;
		
		public var level:int = 1;
		
		override protected function initialize():void 
		{
			super.initialize();
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
			
			super.update();
		}
	}
}