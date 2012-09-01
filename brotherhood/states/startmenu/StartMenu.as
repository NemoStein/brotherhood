package brotherhood.states.startmenu
{
	import brotherhood.states.heroselection.HeroSelection;
	import brotherhood.states.State;
	import brotherhood.system.SystemService;
	import flash.display.BitmapData;
	import nemostein.framework.dragonfly.AnchorAlign;
	import nemostein.framework.dragonfly.Core;
	import nemostein.io.Keys;
	
	public class StartMenu extends State
	{
		override protected function initialize():void
		{
			super.initialize();
			
			draw(new BitmapData(1280, 720, false, 0xFFCCCCCC));
			
			var logo:Core = new Core(new BitmapData(400, 400, false, 0xFF800000));
			var pressSomething:Core = new Core(new BitmapData(900, 100, false, 0xFF008000));
			
			logo.alignAnchor(AnchorAlign.TOP, AnchorAlign.CENTER);
			pressSomething.alignAnchor(AnchorAlign.TOP, AnchorAlign.CENTER);
			
			logo.x = 1280 / 2;
			logo.y = 50;
			
			pressSomething.x = 1280 / 2;
			pressSomething.y = 500;
			
			add(logo);
			add(pressSomething);
			
			setCurrentDescendentsAsRelative();
		}
		
		override protected function stateUpdate():void
		{
			if (input.justPressed(Keys.ANY))
			{
				SystemService.changeState(HeroSelection);
			}
			
			super.stateUpdate();
		}
	}

}