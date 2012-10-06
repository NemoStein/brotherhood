package brotherhood.states.gameplay.hud
{
	import assets.skills.AssetArcher;
	import assets.skills.AssetWizard;
	import brotherhood.states.gameplay.heroes.archer.Archer;
	import brotherhood.states.gameplay.heroes.Hero;
	import brotherhood.states.gameplay.heroes.skills.Skill;
	import flash.display.Bitmap;
	import nemostein.framework.dragonfly.AnchorAlign;
	import nemostein.framework.dragonfly.Core;
	
	public class SkillSlot extends Core
	{
		private var _hero:Hero;
		private var _skillMeters:Vector.<SkillMeter>;
		
		public function SkillSlot(hero:Hero):void
		{
			_hero = hero;
			
			super();
		}
		
		public function buildMeters():void 
		{
			relative = false;
			
			_skillMeters = new Vector.<SkillMeter>(6, true);
			
			for (var i:int = 0; i < 6; ++i) 
			{
				var skillMeter:SkillMeter = new SkillMeter(_hero.skills[i], i);
				add(skillMeter);
			}
			
			var skills:Core;
			
			if (_hero is Archer)
			{
				skills = new Core(new AssetArcher().bitmapData);
			}
			else
			{
				skills = new Core(new AssetWizard().bitmapData);
			}
			
			add(skills);
			
			width = skills.width;
			
			if (_hero.slot == HUD.LEFT)
			{
				alignAnchor(AnchorAlign.TOP, AnchorAlign.RIGHT);
				x = 1280 - 9;
			}
			else
			{
				x = 1;
			}
		}
	}
}