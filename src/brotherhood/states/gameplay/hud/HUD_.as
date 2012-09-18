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
	
	public class HUD_ extends Core
	{
		static public const LEFT:String = "left";
		static public const RIGHT:String = "right";
		
		private var _archerSkills:SkillSlot;
		private var _wizardSkills:SkillSlot;
		
		private var _archerStats:HeroSlot;
		private var _wizardStats:HeroSlot;
		
		private var _leftTowerStats:TowerSlot;
		private var _rightTowerStats:TowerSlot;
		
		override protected function initialize():void
		{
			super.initialize();
			
			var wizard:Hero = EntityService.wizard;
			var archer:Hero = EntityService.archer;
			
			_archerSkills = archer.skillSlot;
			_wizardSkills = wizard.skillSlot;
			
			_archerStats = archer.heroSlot;
			_wizardStats = wizard.heroSlot;
			
			if (wizard.slot == LEFT)
			{
				_leftTowerStats = wizard.towerSlot;
				_rightTowerStats = archer.towerSlot;
				
				_archerSkills.alignAnchor(AnchorAlign.TOP, AnchorAlign.LEFT);
				_archerStats.alignAnchor(AnchorAlign.TOP, AnchorAlign.LEFT);
				
				_archerSkills.x = _archerSkills.y = 0;
				
				_archerStats.x = 300;
				_archerStats.y = 0;
				
				wizard.x = 415;
				wizard.y = 104;
				
				/***/
				_wizardSkills.alignAnchor(AnchorAlign.TOP, AnchorAlign.RIGHT);
				_wizardStats.alignAnchor(AnchorAlign.TOP, AnchorAlign.RIGHT);
				
				_wizardSkills.x = 1280;
				_wizardSkills.y = 0;
				
				_wizardStats.x = 960;
				_wizardStats.y = 0;
				
				archer.x = 866;
				archer.y = 106;
				
				EntityService.slot1 = wizard;
				EntityService.slot2 = archer;
				
				EntityService.slot1Crosshair = new Crosshair(wizard);
				EntityService.slot2Crosshair = new Crosshair(archer);
			}
			else
			{
				_leftTowerStats = archer.towerSlot;
				_rightTowerStats = wizard.towerSlot;
				
				_wizardSkills.alignAnchor(AnchorAlign.TOP, AnchorAlign.LEFT);
				_wizardStats.alignAnchor(AnchorAlign.TOP, AnchorAlign.LEFT);
				
				_wizardSkills.x = _wizardSkills.y = 0;
				
				_wizardStats.x = 320;
				_wizardStats.y = 0;
				
				archer.x = 404;
				archer.y = 104;
				
				_archerSkills.alignAnchor(AnchorAlign.TOP, AnchorAlign.RIGHT);
				_archerStats.alignAnchor(AnchorAlign.TOP, AnchorAlign.RIGHT);
				
				_archerSkills.x = 1280;
				_archerSkills.y = 0;
				
				_archerStats.x = 960;
				_archerStats.y = 0;
				
				wizard.x = 877;
				wizard.y = 105;
				
				EntityService.slot1 = archer;
				EntityService.slot2 = wizard;
				
				EntityService.slot1Crosshair = new Crosshair(archer);
				EntityService.slot2Crosshair = new Crosshair(wizard);
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
	}

}