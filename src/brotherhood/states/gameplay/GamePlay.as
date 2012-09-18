package brotherhood.states.gameplay 
{
	import brotherhood.states.gameplay.creeps.Creep;
	import brotherhood.states.gameplay.heroes.archer.Archer;
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
		
		public var crosshairsLayer:Core;
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
			
			//crosshairsLayer = new Core();
			creepsLayer = new Core();
			//skillsLayer = new Core();
			
			Creep.leftTowerBase = new Rectangle(340, 250, 125, 25);
			Creep.rightTowerBase = new Rectangle(815, 250, 125, 25);
			Creep.gateBase = new Rectangle(555, 225, 175, 20);
			
			//add(controls);
			//add(EntityService.leftTower);
			//add(EntityService.rightTower);
			
			//add(crosshairsLayer);
			add(creepsLayer);
			//add(skillsLayer);
			
			//crosshairsLayer.add(EntityService.player1Crosshair);
			//crosshairsLayer.add(EntityService.player2Crosshair);
			
			//EntityService.player2Crosshair.visible = false;
			
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