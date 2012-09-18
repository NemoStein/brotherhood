package brotherhood.states.gameplay.hud
{
	import brotherhood.states.gameplay.heroes.Hero;
	import brotherhood.system.EntityService;
	import flash.display.BitmapData;
	import nemostein.framework.dragonfly.Core;
	import nemostein.framework.dragonfly.Text;
	
	public class HeroSlot extends Core
	{
		private var _heroType:String;
		
		private var _lifeBar:Bar;
		private var _xpBar:Bar;
		
		private var _lvl:Text;
		
		private var hero:Hero;
		
		public function HeroSlot(heroType:String):void
		{
			_heroType = heroType;
			
			super();
		}
		
		override protected function initialize():void
		{
			super.initialize();
			
			_lifeBar = new Bar();
			_xpBar = new Bar();
			
			_xpBar.build(189, 32, 0xFF008080);
			_lifeBar.build(69, 15, 0xFF800000);
			
			_xpBar.x = 11;
			_xpBar.y = 0;
			
			if (_heroType == HUD.ARCHER)
			{
				draw(new BitmapData(190, 34, true, 0x0008000));
				
				
				hero = EntityService.archer;
				
				if (HUD.archerRight)
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
			}
			else
			{
				draw(new BitmapData(190, 34, true, 0x00000080));
				
				hero = EntityService.wizard;
				
				if (HUD.archerRight)
				{
					_lifeBar.x = 131;
					_lifeBar.y = 44;
					
					_lifeBar.reverse = true;
				}
				else
				{
					_lifeBar.x = 11;
					_lifeBar.y = 44;
				}
			}
			
			_lifeBar.setValues(hero.currentHP, hero.totalHP);
			_xpBar.setValues(hero.currentXP, hero.nextLevelXP(hero.level));
			
			_lvl = new Text("lvl: 1");
			_lvl.x = 9;
			
			add(_lifeBar);
			add(_xpBar);
			add(_lvl);
		}
		
		override protected function update():void
		{
			if (_lvl.text != "lvl: " + hero.level)
			{
				_lvl.text = "lvl: " + hero.level;
			}
			
			_lifeBar.setValues(hero.currentHP, hero.totalHP);
			_xpBar.setValues(hero.currentXP, hero.nextLevelXP(hero.level));
			
			super.update();
		}
	}

}