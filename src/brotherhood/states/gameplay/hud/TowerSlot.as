package brotherhood.states.gameplay.hud
{
	import brotherhood.states.gameplay.heroes.Hero;
	import brotherhood.states.gameplay.tower.Tower;
	import brotherhood.system.EntityService;
	import nemostein.framework.dragonfly.Core;
	
	public class TowerSlot extends Core
	{
		private var _slot:String;
		private var _lifeBar:Bar;
		private var _tower:Tower;
		
		public function TowerSlot(hero:Hero)
		{
			_slot = hero.slot;
			
			super();
		}
		
		override protected function initialize():void
		{
			super.initialize();
			
			if (_slot == HUD.LEFT)
			{
				_lifeBar = new BarTowerHP(EntityService.leftTower);
				_lifeBar.x = 513;
			}
			else
			{
				_lifeBar = new BarTowerHP(EntityService.rightTower);
				_lifeBar.x = 768;
			}
			
			_lifeBar.y = 230;
			
			add(_lifeBar);
		}
	}
}