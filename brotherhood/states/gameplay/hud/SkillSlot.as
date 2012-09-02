package brotherhood.states.gameplay.hud 
{
	import brotherhood.states.gameplay.heroes.skills.Skill;
	import flash.display.BitmapData;
	import nemostein.framework.dragonfly.Core;
	
	
	internal class SkillSlot extends Core 
	{
		private var _heroType:String;
		
		public function SkillSlot(heroType:String):void
		{
			_heroType = heroType;
			
			if (_heroType == HUD.ARCHER)
			{
				draw( new BitmapData(300, 200, false, 0xFF000080));
			}
			else
			{
				draw( new BitmapData(300, 200, false, 0xFF008000));
			}
		}
	}
}