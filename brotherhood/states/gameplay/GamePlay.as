package brotherhood.states.gameplay 
{
	import brotherhood.states.gameplay.creeps.Creep;
	import brotherhood.states.gameplay.tower.Gate;
	import brotherhood.states.gameplay.tower.Tower;
	import brotherhood.states.gameplay.hud.HUD;
	import brotherhood.states.gameplay.waves.Waves;
	import brotherhood.states.State;
	import brotherhood.system.EntityService;
	import brotherhood.system.SystemService;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.geom.Rectangle;
	import nemostein.framework.dragonfly.AnchorAlign;
	import nemostein.framework.dragonfly.Core;
	
	public class GamePlay extends State 
	{
		private var _waves:Waves;
		
		public var crosshairsLayer:Core;
		public var creepsLayer:Core;
		public var skillsLayer:Core;
		
		override protected function initialize():void 
		{
			super.initialize();
			
			draw(Bitmap(new Assets.ImageBackground()).bitmapData);
			var controls:Controls = new Controls();
			
			crosshairsLayer = new Core();
			creepsLayer = new Core();
			skillsLayer = new Core();
			
			var leftTower:Tower = new Tower();
			var rightTower:Tower = new Tower();
			
			EntityService.leftTower = leftTower;
			EntityService.rightTower = rightTower;
			EntityService.gate = new Gate(leftTower, rightTower);
			
			Creep.leftTowerBase = new Rectangle(340, 250, 125, 25);
			Creep.rightTowerBase = new Rectangle(815, 250, 125, 25);
			Creep.gateBase = new Rectangle(555, 225, 175, 20);
			
			var hud:HUD = new HUD();
			
			add(controls);
			add(leftTower);
			add(rightTower);
			
			add(crosshairsLayer);
			add(creepsLayer);
			add(skillsLayer);
			
			add(hud);
			
			crosshairsLayer.add(EntityService.player1Crosshair);
			crosshairsLayer.add(EntityService.player2Crosshair);
			
			EntityService.player2Crosshair.visible = false;
			
			_waves = Waves.parse(new Assets.TextWavesTestLevel());
			_waves.startWaves(creepsLayer);
		}
		
		override protected function stateUpdate():void 
		{
			_waves.updateWaves(time);
			
			super.stateUpdate();
		}
	}
}