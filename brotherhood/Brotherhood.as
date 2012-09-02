<<<<<<< .mine
package brotherhood
{
	import brotherhood.states.gameplay.GamePlay;
	import brotherhood.system.SystemService;
	import flash.display.BitmapData;
	import nemostein.framework.dragonfly.Core;
	import nemostein.framework.dragonfly.Game;
	
	public class Brotherhood extends Game
	{
		private var core1:Core;
		private var core2:Core;
		public function Brotherhood()
		{
			super(1280, 720);
		}
		
		override protected function initialize():void
		{	
			super.initialize();
			
			SystemService.registerGame(this);
			SystemService.changeState(GamePlay);
			
		}
	}
}
=======
package brotherhood
{
	import brotherhood.states.gameplay.GamePlay;
	import brotherhood.system.SystemService;
	import flash.display.BitmapData;
	import nemostein.framework.dragonfly.Core;
	import nemostein.framework.dragonfly.Game;
	
	public class Brotherhood extends Game
	{
		public function Brotherhood()
		{
			super(1280, 720);
		}
		
		override protected function initialize():void
		{	
			super.initialize();
			
			SystemService.registerGame(this);
			SystemService.changeState(GamePlay);
		}
	}
}



>>>>>>> .theirs
