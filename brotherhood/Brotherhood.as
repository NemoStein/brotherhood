package brotherhood
{
	import brotherhood.states.startmenu.StartMenu;
	import brotherhood.system.SystemService;
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
			SystemService.changeState(StartMenu);
			
			//var commonArrow:CommonArrow = new CommonArrow();
			//
			//commonArrow.x = 50;
			//commonArrow.y = 50;
			//
			//add(commonArrow);
		}
	}
}