package brotherhood.states.gameplay.hud
{
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
		
		static public var P1_GA:int = Keys.U;
		static public var P1_GB:int = Keys.J;
		static public var P1_BA:int = Keys.I;
		static public var P1_BB:int = Keys.K;
		static public var P1_RA:int = Keys.O;
		static public var P1_RB:int = Keys.L;
		static public var P1_U:int = Keys.W;
		static public var P1_D:int = Keys.S;
		static public var P1_L:int = Keys.A;
		static public var P1_R:int = Keys.D;
		static public var P1_S:int = Keys.NUMBER_9;
		
		/*static public var P2_GA:String = Keys.2Ga";
		static public var P2_GB:String = Keys.2Gb";
		static public var P2_BA:String = Keys.2Ba";
		static public var P2_BB:String = Keys.2Bb";
		static public var P2_RA:String = Keys.2Ra";
		static public var P2_RB:String = Keys.2Rb";
		static public var P2_U:String = Keys.2U";
		static public var P2_D:String = Keys.2D";
		static public var P2_L:String = Keys.2L";
		static public var P2_R:String = Keys.2R";
		static public var P2_S:String = Keys.2S";*/
		
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
				
				EntityService.player1Crosshair = new Crosshair(WIZARD);
				EntityService.player2Crosshair = new Crosshair(ARCHER);
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
			
			SystemService.crosshairLayer.add(EntityService.player1Crosshair);
			SystemService.crosshairLayer.add(EntityService.player2Crosshair);
		}
		
		override protected function update():void 
		{
			var p1Crosshair:Crosshair = EntityService.player1Crosshair;
			var p1CrosshairDestination:Point = p1Crosshair.destination;
			
			if (input.pressed(P1_U))
			{
				p1CrosshairDestination.y = -Infinity;
				
			}
			else if(input.pressed(P1_D))
			{
				p1CrosshairDestination.y = Infinity;
			}
			else
			{
				p1CrosshairDestination.y = EntityService.player1Crosshair.y;
			}
			
			if (input.pressed(P1_L))
			{
				p1CrosshairDestination.x = -Infinity;
			}
			else if(input.pressed(P1_R))
			{
				p1CrosshairDestination.x = Infinity;
			}
			else
			{
				p1CrosshairDestination.x = EntityService.player1Crosshair.x;
			}
			
			var distanceX:Number = p1CrosshairDestination.x - EntityService.player1Crosshair.x;
			var distanceY:Number = p1CrosshairDestination.y - EntityService.player1Crosshair.y;
			
			if (distanceX || distanceY)
			{
				var moveSpeed:Number = p1Crosshair.speed * time;
				
				var moveAngle:Number = Math.atan2(distanceY, distanceX);
				
				var moveX:Number = Math.cos(moveAngle) * moveSpeed;
				var moveY:Number = Math.sin(moveAngle) * moveSpeed;
				
				if (distanceX > 0 && distanceX < moveX || distanceX < 0 && distanceX > moveX)
				{
					moveX = distanceX;
				}
				
				if (distanceY > 0 && distanceY < moveY || distanceY < 0 && distanceY > moveY)
				{
					moveY = distanceY;
				}
				
				EntityService.player1Crosshair.x += moveX;
				EntityService.player1Crosshair.y += moveY;
			}
			
			super.update();
		}
	}

}