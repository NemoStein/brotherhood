package brotherhood.states.gameplay.hud 
{
	import brotherhood.states.gameplay.heroes.Hero;
	import brotherhood.system.HeroService;
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
			
			_xpBar.build(100, 15, 0xFF008080);
			_lifeBar.build(80, 20, 0xFF800000);
			
			_xpBar.x = 0;
			_xpBar.y = 0;
			
			if (_heroType == HUD.ARCHER)
			{
				draw( new BitmapData(190, 34, false, 0xFF008000 ));
				
				hero = HeroService.archer;
				
				if (HUD.archerRight)
				{
					_lifeBar.x = 0;
					_lifeBar.y = 34;
				}
				else
				{
					_lifeBar.x = 110;
					_lifeBar.y = 34;
					
					_lifeBar.reverse = true;
				}
			}
			else
			{
				draw( new BitmapData(190, 34, false, 0xFF000080 ));
				
				hero = HeroService.wizard;
				
				if (HUD.archerRight)
				{
					_lifeBar.x = 110;
					_lifeBar.y = 34;
					
					_lifeBar.reverse = true;
				}
				else
				{
					_lifeBar.x = 0;
					_lifeBar.y = 34;
				}
			}
			
			_lifeBar.setValues(hero.currentHp, hero.totalHp);
			_xpBar.setValues(hero.currentXp, hero.nextLevelXp(hero.level));
			
			_lvl = new Text("lvl: 1");
			
			add(_lifeBar);
			add(_xpBar);
			add(_lvl);
			
			setCurrentDescendentsAsRelative();
		}
		
		override protected function update():void 
		{
			_lifeBar.setValues(hero.currentHp, hero.totalHp);
			_xpBar.setValues(hero.currentXp, hero.nextLevelXp(hero.level));
			
			super.update();
		}
	}

}