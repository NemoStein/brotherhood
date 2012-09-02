package brotherhood.states.gameplay.hud
{
	import brotherhood.states.gameplay.heroes.archer.Archer;
	import brotherhood.states.gameplay.heroes.Hero;
	import brotherhood.states.gameplay.heroes.wizard.Wizard;
	import brotherhood.system.EntityService;
	import nemostein.framework.dragonfly.AnchorAlign;
	import nemostein.framework.dragonfly.Core;
	
	public class HUD extends Core
	{
		public static const ARCHER:String = "archer";
		static public const WIZARD:String = "wizard";
		
		static public const P1_GA:String = "p1Ga";
		static public const P1_GB:String = "p1Gb";
		static public const P1_BA:String = "p1Ba";
		static public const P1_BB:String = "p1Bb";
		static public const P1_RA:String = "p1Ra";
		static public const P1_RB:String = "p1Rb";
		static public const P1_U:String = "p1U";
		static public const P1_D:String = "p1D";
		static public const P1_L:String = "p1L";
		static public const P1_R:String = "p1R";
		static public const P1_S:String = "p1S";
		
		static public const P2_GA:String = "p2Ga";
		static public const P2_GB:String = "p2Gb";
		static public const P2_BA:String = "p2Ba";
		static public const P2_BB:String = "p2Bb";
		static public const P2_RA:String = "p2Ra";
		static public const P2_RB:String = "p2Rb";
		static public const P2_U:String = "p2U";
		static public const P2_D:String = "p2D";
		static public const P2_L:String = "p2L";
		static public const P2_R:String = "p2R";
		static public const P2_S:String = "p2S";
		
		public static var archerRight:Boolean;
		
		private var _archerSkills:SkillSlot;
		private var _wizardSkills:SkillSlot;
		
		private var _archerStats:HeroSlot;
		private var _wizardStats:HeroSlot;
		
		private var _archerCrosshair:Core;
		private var _wizardCrosshair:Core;
		
		
		override protected function initialize():void
		{
			super.initialize();
			
			_archerSkills = new SkillSlot(ARCHER);
			_wizardSkills = new SkillSlot(WIZARD);
			
			_archerStats = new HeroSlot(ARCHER);
			_wizardStats = new HeroSlot(WIZARD);
			
			var wizard:Hero = EntityService.wizard;
			var archer:Hero = EntityService.archer;
			
			archer.y = 105;
			wizard.y = 105;
			
			if (archerRight)
			{
				_archerSkills.alignAnchor(AnchorAlign.TOP, AnchorAlign.LEFT);
				_wizardSkills.alignAnchor(AnchorAlign.TOP, AnchorAlign.RIGHT);
				
				_archerStats.alignAnchor(AnchorAlign.TOP, AnchorAlign.RIGHT);
				_wizardStats.alignAnchor(AnchorAlign.TOP, AnchorAlign.LEFT);
				
				_archerStats.x = 960;
				_archerStats.y = 0;
				
				_wizardStats.x = 320;
				_wizardStats.y = 0;
				
				_archerSkills.x = _archerSkills.y = 0;
				
				_wizardSkills.x = 1280;
				_wizardSkills.y = 0;
				
				wizard.x = 400;
				archer.x = 880;
				
				EntityService.player1 = wizard;
				EntityService.player2 = archer;
			}
			else
			{
				_archerSkills.alignAnchor(AnchorAlign.TOP, AnchorAlign.RIGHT);
				_wizardSkills.alignAnchor(AnchorAlign.TOP, AnchorAlign.LEFT);
				
				_archerStats.alignAnchor(AnchorAlign.TOP, AnchorAlign.LEFT);
				_wizardStats.alignAnchor(AnchorAlign.TOP, AnchorAlign.RIGHT);
				
				_wizardStats.x = 960;
				_wizardStats.y = 0;
				
				_archerStats.x = 320;
				_archerStats.y = 0;
				
				_wizardSkills.x = _wizardSkills.y = 0;
				
				_archerSkills.x = 1280;
				_archerSkills.y = 0;
				
				archer.x = 400;
				wizard.x = 880;
				
				EntityService.player1 = archer;
				EntityService.player2 = wizard;
			}
			
			add(_archerSkills);
			add(_wizardSkills);
			
			add(_archerStats);
			add(_wizardStats);
			
			add(wizard);
			add(archer);
		}
		
		override protected function update():void 
		{
			super.update();
		}
	}

}