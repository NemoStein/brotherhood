package brotherhood.states.endgame.defeat
{
	import assets.states.AssetEndGameDefeat;
	import brotherhood.states.endgame.victory.Victory;
	import brotherhood.states.State;
	import brotherhood.system.SystemService;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import nemostein.framework.dragonfly.AnchorAlign;
	import nemostein.framework.dragonfly.Core;
	import nemostein.io.Keys;
	
	public class Defeat extends State
	{
		override protected function initialize():void
		{
			super.initialize();
			
			draw(new AssetEndGameDefeat().bitmapData);
		}
		
		override protected function stateUpdate():void
		{
			if (input.justPressed(Keys.ANY))
			{
				SystemService.changeState(Victory);
			}
			
			super.stateUpdate();
		}
	}
}