package brotherhood.states.gameplay 
{
	import brotherhood.states.gameplay.creeps.Creep;
	import brotherhood.states.gameplay.creeps.CreepService;
	import brotherhood.states.gameplay.heroes.archer.Archer;
	import brotherhood.states.gameplay.heroes.crosshair.Crosshair;
	import brotherhood.states.gameplay.heroes.wizard.Wizard;
	import brotherhood.states.gameplay.tower.Gate;
	import brotherhood.states.gameplay.tower.Tower;
	import brotherhood.states.gameplay.waves.Waves;
	import brotherhood.states.State;
	import brotherhood.system.EntityService;
	import brotherhood.system.SystemService;
	import flash.display.Bitmap;
	import flash.geom.Rectangle;
	import nemostein.framework.dragonfly.Core;

	
	public class GamePlay extends State 
	{
		private var _waves:Waves;
		private var _leftTower:Tower;
		private var _rightTower:Tower;
		
		private var _slot1Crosshair:Crosshair;
		private var _slot2Crosshair:Crosshair;
		
		public var creepsLayer:Core;
		public var skillsLayer:Core;
		
		override protected function initialize():void
		{
			super.initialize();
			
			draw(Bitmap(new Assets.ImageStatesGamePlay).bitmapData);
			
			var wizard:Wizard = EntityService.wizard;
			var archer:Archer = EntityService.archer;
			
			_leftTower = EntityService.leftTower;
			_rightTower = EntityService.rightTower;			
			
			creepsLayer = new Core();
			//skillsLayer = new Core();
			
			CreepService.container = creepsLayer;
			
			Creep.leftTowerBase = new Rectangle(340, 290, 125, 25);
			Creep.rightTowerBase = new Rectangle(815, 290, 125, 25);
			Creep.gateBase = new Rectangle(555, 265, 175, 20);
			
			add(creepsLayer);
			//add(skillsLayer);
			
			EntityService.slot2.crosshair.hide();
			
			add(wizard);
			add(archer);
			
			_waves = Waves.parse(new Assets.TextWavesTestLevel());
			_waves.startWaves(creepsLayer);
		}
		
		override protected function stateUpdate():void 
		{
			_waves.updateWaves(time);
			
			if (_leftTower.currentHP < 0 || _rightTower.currentHP < 0)
			{
				SystemService.defeat();
			}
			
			super.stateUpdate();
		}
	}
}