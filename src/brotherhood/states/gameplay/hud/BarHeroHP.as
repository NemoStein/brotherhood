package brotherhood.states.gameplay.hud 
{
	import brotherhood.states.gameplay.heroes.Hero;
	
	public class BarHeroHP extends Bar 
	{
		private var _hero:Hero;
		
		public function BarHeroHP(hero:Hero) 
		{
			_hero = hero;
			
			super(69, 15, 0xFF800000);
		}
		
		override protected function update():void 
		{
			value = _hero.currentHP;
			maxValue = _hero.totalHP;
			
			super.update();
		}
	}
}