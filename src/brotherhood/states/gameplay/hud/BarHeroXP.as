package brotherhood.states.gameplay.hud 
{
	import brotherhood.states.gameplay.heroes.Hero;
	
	public class BarHeroXP extends Bar 
	{
		private var _hero:Hero;
		
		public function BarHeroXP(hero:Hero) 
		{
			_hero = hero;
			
			super(189, 32, 0xFF008080);
		}
		
		override protected function update():void 
		{
			value = _hero.currentXP;
			maxValue = _hero.experienceToLevel();
			
			super.update();
		}
	}
}