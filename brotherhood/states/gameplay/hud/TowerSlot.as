package brotherhood.states.gameplay.hud 
{
	import brotherhood.states.gameplay.tower.Tower;
	import brotherhood.system.EntityService;
	import nemostein.framework.dragonfly.Core;
	
	
	public class TowerSlot extends Core 
	{
		private var _side:String;
		private var _lifeBar:Bar;
		private var _tower:Tower;
		
		public function TowerSlot(side:String) 
		{
			_side = side;
			
			super();
		}
		
		override protected function initialize():void 
		{
			super.initialize();
			
			_lifeBar = new Bar();
			_lifeBar.build(15, 100, 0xFF800000);
			_lifeBar.y = 250;
			
			if(_side == HUD.LEFT)
			{
				_tower = EntityService.leftTower;
				
				_lifeBar.x = _tower.x + _tower.width;
				
				_lifeBar.setValues(_tower.currentHP,_tower.totalHP);
			}
			else
			{
				_tower = EntityService.rightTower;
				
				_lifeBar.x = _tower.x - _tower.width;
				
				_lifeBar.setValues(_tower.currentHP,_tower.totalHP);
			}
			
			add(_lifeBar);
		}
		
		override protected function update():void 
		{
			_lifeBar.setValues(_tower.currentHP, _tower.totalHP);
			
			super.update();
		}
		
	}

}