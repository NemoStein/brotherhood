package brotherhood.states.gameplay.hud
{
	import brotherhood.states.gameplay.heroes.skills.Skill;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import nemostein.framework.dragonfly.Core;
	
	internal class SkillSlot extends Core
	{
		private var _heroType:String;
		
		public function SkillSlot(heroType:String):void
		{
			_heroType = heroType;
			
			if (heroType == HUD.ARCHER)
			{
				draw(Bitmap(new Assets.ImageSkillsArcher).bitmapData);
			}
			else
			{
				draw(Bitmap(new Assets.ImageSkillsWizard).bitmapData);
			}
		}
	}
}