package brotherhood.states.gameplay.heroes 
{
	import nemostein.framework.dragonfly.Core;
	
	public class Hero extends Core 
	{
		public var currentHp:Number = 100;
		public var totalHp:Number = 100;
		
		public var currentXp:Number = 0;
		public var nextLevelXp:Number = 100;
		
		override protected function initialize():void 
		{
			super.initialize();
		}
	}
}