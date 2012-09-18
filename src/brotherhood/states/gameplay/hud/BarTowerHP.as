package brotherhood.states.gameplay.hud 
{
	import brotherhood.states.gameplay.tower.Tower;
	
	public class BarTowerHP extends Bar 
	{
		private var _tower:Tower;
		
		public function BarTowerHP(tower:Tower) 
		{
			_tower = tower;
			
			super(16, 122, 0xFF800000, 0, true);
		}
		
		override protected function update():void 
		{
			value = _tower.currentHP;
			maxValue = _tower.totalHP;
			
			super.update();
		}
	}
}