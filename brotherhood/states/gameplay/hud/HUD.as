package brotherhood.states.gameplay.hud
{
	import brotherhood.states.gameplay.GamePlay;
	import brotherhood.states.gameplay.heroes.archer.Archer;
	import brotherhood.states.gameplay.heroes.crosshair.Crosshair;
	import brotherhood.states.gameplay.heroes.Hero;
	import brotherhood.system.EntityService;
	import brotherhood.system.SystemService;
	import flash.geom.Point;
	import nemostein.framework.dragonfly.AnchorAlign;
	import nemostein.framework.dragonfly.Core;
	import nemostein.io.Keys;
	
	public class HUD extends Core
	{
		public static const ARCHER:String = "archer";
		static public const WIZARD:String = "wizard";
		
		static public const LEFT:String = "left";
		static public const RIGHT:String = "right";
		
		public static var archerRight:Boolean;
		
		private var _archerSkills:SkillSlot;
		private var _wizardSkills:SkillSlot;
		
		private var _archerStats:HeroSlot;
		private var _wizardStats:HeroSlot;
		
		private var _leftTowerStats:TowerSlot;
		private var _rightTowerStats:TowerSlot;
		
		
		override protected function initialize():void
		{
			super.initialize();
			
			_archerSkills = new SkillSlot(ARCHER);
			_wizardSkills = new SkillSlot(WIZARD);
			
			_archerStats = new HeroSlot(ARCHER);
			_wizardStats = new HeroSlot(WIZARD);
			
			_leftTowerStats = new TowerSlot(LEFT);
			_rightTowerStats = new TowerSlot(RIGHT);
			
			var wizard:Hero = EntityService.wizard;
			var archer:Hero = EntityService.archer;
			
			archer.y = 105;
			wizard.y = 105;
			
			if (!archerRight)
			{
				_archerSkills.alignAnchor(AnchorAlign.TOP, AnchorAlign.LEFT);
				_archerStats.alignAnchor(AnchorAlign.TOP, AnchorAlign.LEFT);
				
				_archerSkills.x = _archerSkills.y = 0;
				
				_archerStats.x = 300;
				_archerStats.y = 0;
				
				archer.x = 405;
				
				_wizardSkills.alignAnchor(AnchorAlign.TOP, AnchorAlign.RIGHT);
				_wizardStats.alignAnchor(AnchorAlign.TOP, AnchorAlign.RIGHT);
				
				_wizardSkills.x = 1280;
				_wizardSkills.y = 0;
				
				_wizardStats.x = 960;
				_wizardStats.y = 0;
				
				wizard.x = 880;
				
				EntityService.player1 = archer;
				EntityService.player2 = wizard;
				
				EntityService.player1Crosshair = new Crosshair(ARCHER);
				EntityService.player2Crosshair = new Crosshair(WIZARD);
			}
			else
			{
				_wizardSkills.alignAnchor(AnchorAlign.TOP, AnchorAlign.LEFT);
				_wizardStats.alignAnchor(AnchorAlign.TOP, AnchorAlign.LEFT);
				
				_wizardSkills.x = _wizardSkills.y = 0;
				
				_wizardStats.x = 320;
				_wizardStats.y = 0;
				
				wizard.x = 405;
				
				_archerSkills.alignAnchor(AnchorAlign.TOP, AnchorAlign.RIGHT);
				_archerStats.alignAnchor(AnchorAlign.TOP, AnchorAlign.RIGHT);
				
				_archerSkills.x = 1280;
				_archerSkills.y = 0;
				
				_archerStats.x = 960;
				_archerStats.y = 0;
				
				archer.x = 880;
				
				EntityService.player1 = wizard;
				EntityService.player2 = archer;
				
				EntityService.player1Crosshair = new Crosshair(WIZARD);
				EntityService.player2Crosshair = new Crosshair(ARCHER);
			}
			
			add(_archerSkills);
			add(_wizardSkills);
			
			add(_archerStats);
			add(_wizardStats);
			
			add(wizard);
			add(archer);
			
			add(_leftTowerStats);
			add(_rightTowerStats);
		}
		
		override protected function update():void 
		{
			super.update();
		}
	}

}