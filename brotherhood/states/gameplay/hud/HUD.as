package brotherhood.states.gameplay.hud
{
	import flash.display.BitmapData;
	import flash.geom.Point;
	import nemostein.framework.dragonfly.AnchorAlign;
	import nemostein.framework.dragonfly.Core;
	
	public class HUD extends Core
	{
		public static const ARCHER:String = "archer";
		static public const WIZARD:String = "wizard";
		
		private var _archerSkills:SkillSlot;
		private var _wizardSkills:SkillSlot;
		
		private var _archerStats:Hero;
		private var _wizardStats:Hero;
		
		private var player1:String;
		
		override protected function initialize():void
		{
			super.initialize();
			
			_archerSkills = new SkillSlot(ARCHER);
			_wizardSkills = new SkillSlot(WIZARD);
			
			_archerStats = new Hero();
			_wizardStats = new Hero();
			
			player1 = ARCHER;
			
			if (player1 == ARCHER)
			{
				_archerSkills.alignAnchor(AnchorAlign.TOP, AnchorAlign.LEFT);
				_wizardSkills.alignAnchor(AnchorAlign.TOP, AnchorAlign.RIGHT);
				
				_archerStats.alignAnchor(AnchorAlign.TOP, AnchorAlign.LEFT);
				_wizardStats.alignAnchor(AnchorAlign.TOP, AnchorAlign.RIGHT);
				
				_archerStats.x = 20;
				_archerStats.y = 0;
				
				_wizardStats.x = 960;
				_wizardStats.y = 0;
				
				_archerSkills.x = _archerSkills.y = 0;
				
				_wizardSkills.x = 1280;
				_wizardSkills.y = 0;
			}
			else
			{
				_archerSkills.alignAnchor(AnchorAlign.TOP, AnchorAlign.RIGHT);
				_wizardSkills.alignAnchor(AnchorAlign.TOP, AnchorAlign.LEFT);
				
				_archerStats.alignAnchor(AnchorAlign.TOP, AnchorAlign.RIGHT);
				_wizardStats.alignAnchor(AnchorAlign.TOP, AnchorAlign.LEFT);
				
				_wizardStats.x = 20;
				_wizardStats.y = 0;
				
				_archerStats.x = 960;
				_archerStats.y = 0;
				
				_wizardSkills.x = _wizardSkills.y = 0;
				_archerSkills.x = 1280;
				_archerSkills.y = 0;
			}
			
			add(_archerSkills);
			add(_wizardSkills);
			add(_archerStats);
			add(_wizardStats);
		}
	}

}