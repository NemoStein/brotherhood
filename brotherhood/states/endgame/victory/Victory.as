package brotherhood.states.endgame.victory 
{
	import brotherhood.states.startmenu.StartMenu;
	import brotherhood.states.State;
	import brotherhood.system.SystemService;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import nemostein.framework.dragonfly.AnchorAlign;
	import nemostein.framework.dragonfly.Core;
	import nemostein.io.Keys;
	
	public class Victory extends State 
	{
		override protected function initialize():void 
		{
			super.initialize();
			
			draw(Bitmap(new Assets.ImageStatesEndGameVictory).bitmapData);
		}
		
		override protected function stateUpdate():void 
		{
			if (input.justPressed(Keys.ANY))
			{
				SystemService.changeState(StartMenu);
			}
			
			super.stateUpdate();
		}
	}
}