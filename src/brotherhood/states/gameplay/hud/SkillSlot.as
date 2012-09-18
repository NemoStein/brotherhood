package brotherhood.states.gameplay.hud
{
	import brotherhood.states.gameplay.heroes.archer.Archer;
	import brotherhood.states.gameplay.heroes.Hero;
	import brotherhood.states.gameplay.heroes.skills.Skill;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import nemostein.framework.dragonfly.AnchorAlign;
	import nemostein.framework.dragonfly.Core;
	
	public class SkillSlot extends Core
	{
		private var _hero:Hero;
		
		public function SkillSlot(hero:Hero):void
		{
			_hero = hero;
			
			super();
		}
		
		override protected function initialize():void 
		{
			super.initialize();
			
			relative = false;
			
			if (_hero is Archer)
			{
				draw(Bitmap(new Assets.ImageSkillsArcher).bitmapData);
			}
			else
			{
				draw(Bitmap(new Assets.ImageSkillsWizard).bitmapData);
			}
			
			if (_hero.slot == HUD.LEFT)
			{
				alignAnchor(AnchorAlign.TOP, AnchorAlign.RIGHT);
				x = 1280;
			}
		}
	}
}