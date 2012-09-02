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
	import flash.display.BitmapData;
	import flash.geom.Rectangle;
	import nemostein.framework.dragonfly.AnchorAlign;
	import nemostein.framework.dragonfly.Core;
	
	public class GamePlay extends State 
	{
		private var _waves:Waves;
		
		override protected function initialize():void 
		{
			super.initialize();
			
			var leftTower:Tower = new Tower();
			var rightTower:Tower = new Tower();
			
			leftTower.alignAnchor(AnchorAlign.BOTTOM, AnchorAlign.CENTER);
			rightTower.alignAnchor(AnchorAlign.BOTTOM, AnchorAlign.CENTER);
			
			leftTower.x = 400;
			leftTower.y = 250;
			
			rightTower.x = 880;
			rightTower.y = 250;
			
			EntityService.leftTower = leftTower;
			EntityService.rightTower = rightTower;
			EntityService.gate = new Gate(leftTower, rightTower);
			
			Creep.leftTowerBase = new Rectangle(335, 240, 130, 20);
			Creep.rightTowerBase = new Rectangle(815, 240, 130, 20);
			Creep.gateBase = new Rectangle(540, 190, 200, 20);
			
			var hud:HUD = new HUD();
			
			add(leftTower);
			add(rightTower);
			
			add(hud);
			
			// DELETE: lane/base division
			/******************************/
			var ll:Core = new Core(new BitmapData(250, 470, true, 0x50000000));
			var ml:Core = new Core(new BitmapData(300, 470, true, 0x50ffffff));
			var rl:Core = new Core(new BitmapData(250, 470, true, 0x50000000));
			
			var lb:Core = new Core(new BitmapData(130, 20, true, 0x80ffffff));
			var rb:Core = new Core(new BitmapData(130, 20, true, 0x80ffffff));
			var gb:Core = new Core(new BitmapData(200, 20, true, 0x80000000));
			
			ll.x = 250;
			ml.x = 500;
			rl.x = 800;
			
			ll.y = 250;
			ml.y = 250;
			rl.y = 250;
			
			lb.x = 335;
			rb.x = 815;
			gb.x = 540;
			
			lb.y = 240;
			rb.y = 240;
			gb.y = 190;
			
			add(ll);
			add(ml);
			add(rl);
			
			add(lb);
			add(rb);
			add(gb);
			/******************************/
			
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