package brotherhood.states.gameplay.heroes 
{
	import nemostein.framework.dragonfly.Core;
	import nemostein.io.Keys;
	
	public class Hero extends Core 
	{
		public var currentHp:Number = 100;
		public var totalHp:Number = 100;
		
		public var currentXp:Number = 0;
		
		public var level:int = 1;
		
		override protected function initialize():void 
		{
			super.initialize();
		}
		
		public function addXp(xp:int):void
		{
			currentXp += xp;
			
			if (currentXp >= nextLevelXp(level))
			{
				levelUp();
			}
		}
		
		private function levelUp():void 
		{
			currentXp -= nextLevelXp(level++);
		}
		
		public function nextLevelXp(level:int):Number 
		{
			if (level == 1)
			{
				return 100;
			}
			
			return nextLevelXp(level - 1) * 1.2;
		}
	}
}