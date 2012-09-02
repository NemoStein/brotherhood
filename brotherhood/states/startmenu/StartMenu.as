package brotherhood.states.startmenu
{
	import brotherhood.states.heroselection.HeroSelection;
	import brotherhood.states.State;
	import brotherhood.system.SystemService;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import nemostein.framework.dragonfly.AnchorAlign;
	import nemostein.framework.dragonfly.Core;
	import nemostein.io.Keys;
	
	public class StartMenu extends State
	{
		private var _pressStart:Core;
		
		override protected function initialize():void
		{
			super.initialize();
			
			draw(Bitmap(new Assets.ImageStatesStartScreen).bitmapData);
			
			//var logo:Core = new Core(new BitmapData(400, 400, false, 0xFF800000));
			//var pressSomething:Core = new Core(new BitmapData(900, 100, false, 0xFF008000));
			//
			//logo.alignAnchor(AnchorAlign.TOP, AnchorAlign.CENTER);
			//pressSomething.alignAnchor(AnchorAlign.TOP, AnchorAlign.CENTER);
			//
			//logo.x = 1280 / 2;
			//logo.y = 50;
			//
			//pressSomething.x = 1280 / 2;
			//pressSomething.y = 500;
			//
			//add(logo);
			//add(pressSomething);
			//
			//setCurrentDescendentsAsRelative();
			
			_pressStart = new Core(Bitmap(new Assets.ImageHeroSelectPressStart).bitmapData);
			
			_pressStart.x = 573;
			_pressStart.y = 461;
			
			add(_pressStart)
		}
		
		override protected function stateUpdate():void
		{
			// TODO: Blink start button
			
			if (input.justPressed(Keys.ANY))
			{
				SystemService.changeState(HeroSelection);
			}
			
			super.stateUpdate();
		}
	}

}