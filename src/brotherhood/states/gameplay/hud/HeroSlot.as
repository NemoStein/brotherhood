package brotherhood.states.gameplay.hud
{
	import brotherhood.states.gameplay.heroes.archer.Archer;
	import brotherhood.states.gameplay.heroes.Hero;
	import brotherhood.system.EntityService;
	import flash.display.BitmapData;
	import nemostein.framework.dragonfly.Core;
	import nemostein.framework.dragonfly.Text;
	
	public class HeroSlot extends Core
	{
		private var _hero:Hero;
		
		private var _lifeBar:Bar;
		private var _xpBar:Bar;
		
		private var _lvl:Text;
		
		public function HeroSlot(hero:Hero):void
		{
			_hero = hero;
			
			super();
		}
		
		override protected function initialize():void
		{
			super.initialize();
			
			_lifeBar = new BarHeroHP(_hero);
			_xpBar = new BarHeroXP(_hero);
			
			_xpBar.x = 11;
			_xpBar.y = 0;
			
			draw(new BitmapData(190, 34, true, (_hero is Archer ? 0x0008000 : 0x00000080)));
			
			if (_hero.slot == HUD.LEFT)
			{
				_lifeBar.x = 11;
				_lifeBar.y = 44;
			}
			else
			{
				_lifeBar.x = 131;
				_lifeBar.y = 44;
				
				_lifeBar.reverse = true;
			}
			
			_lvl = new Text("lvl: 1");
			_lvl.x = 9;
			
			add(_lifeBar);
			add(_xpBar);
			add(_lvl);
		}
		
		override protected function update():void
		{
			if (_lvl.text != "lvl: " + _hero.level)
			{
				_lvl.text = "lvl: " + _hero.level;
			}
			
			super.update();
		}
	}

}