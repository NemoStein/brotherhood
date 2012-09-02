package brotherhood
{
	import brotherhood.states.gameplay.GamePlay;
	import brotherhood.states.heroselection.HeroSelection;
	import brotherhood.system.SystemService;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import nemostein.framework.dragonfly.Animation;
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
			SystemService.changeState(HeroSelection);
		}
	}
}