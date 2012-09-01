package brotherhood.states.heroselection
{
	import brotherhood.states.endgame.defeat.Defeat;
	import brotherhood.states.gameplay.GamePlay;
	import brotherhood.states.State;
	import brotherhood.system.SystemService;
	import flash.display.BitmapData;
	import nemostein.framework.dragonfly.AnchorAlign;
	import nemostein.framework.dragonfly.Core;
	import nemostein.io.Keys;
	
	public class HeroSelection extends State
	{
		
		override protected function initialize():void
		{
			super.initialize();
			
			draw(new BitmapData(1280, 720, false, 0xffababeb));
			
			var screenTitle:Core = new Core(new BitmapData(800, 100, true, 0xffdd8080));
			var archerAvatar:Core = new Core(new BitmapData(400, 400, true, 0xaaffffff));
			var wizardAvatar:Core = new Core(new BitmapData(400, 400, true, 0xaaffffff));
			var swapButton:Core = new Core(new BitmapData(250, 70, true, 0xffdd8080));
			var startButton:Core = new Core(new BitmapData(250, 70, true, 0xffdd8080));
			
			screenTitle.alignAnchor(AnchorAlign.TOP, AnchorAlign.CENTER);
			
			screenTitle.x = 1280 / 2;
			screenTitle.y = 35;
			
			swapButton.x = 300;
			swapButton.y = 615;
			
			startButton.x = 730;
			startButton.y = 615;
			
			archerAvatar.x = 200;
			archerAvatar.y = 175;
			
			wizardAvatar.x = 680;
			wizardAvatar.y = 175;
			
			add(screenTitle);
			add(archerAvatar);
			add(wizardAvatar);
			add(swapButton);
			add(startButton);
		}
		
		override protected function stateUpdate():void
		{
			if (input.justPressed(Keys.ANY))
			{
				SystemService.changeState(GamePlay);
			}
			
			super.stateUpdate();
		}
	}
}