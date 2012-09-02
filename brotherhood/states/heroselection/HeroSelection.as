package brotherhood.states.heroselection
{
	import brotherhood.states.endgame.defeat.Defeat;
	import brotherhood.states.gameplay.GamePlay;
	import brotherhood.states.gameplay.heroes.archer.Archer;
	import brotherhood.states.gameplay.heroes.wizard.Wizard;
	import brotherhood.states.gameplay.hud.HUD;
	import brotherhood.states.State;
	import brotherhood.system.EntityService;
	import brotherhood.system.SystemService;
	import flash.display.BitmapData;
	import nemostein.framework.dragonfly.AnchorAlign;
	import nemostein.framework.dragonfly.Core;
	import nemostein.io.Keys;
	
	public class HeroSelection extends State
	{
		private var _archerRight:Boolean;
		private var _archerAvatar:Core;
		private var _wizardAvatar:Core;
		
		override protected function initialize():void
		{
			super.initialize();
			
			draw(new BitmapData(1280, 720, false, 0xffababeb));
			
			var screenTitle:Core = new Core(new BitmapData(800, 100, true, 0xffdd8080));
			
			_archerAvatar = new Core(new BitmapData(400, 400, true, 0xaa008000));
			_wizardAvatar = new Core(new BitmapData(400, 400, true, 0xaa000080));
			
			var swapButton:Core = new Core(new BitmapData(250, 70, true, 0xffdd8080));
			var startButton:Core = new Core(new BitmapData(250, 70, true, 0xffdd8080));
			
			screenTitle.alignAnchor(AnchorAlign.TOP, AnchorAlign.CENTER);
			
			screenTitle.x = 1280 / 2;
			screenTitle.y = 35;
			
			swapButton.x = 300;
			swapButton.y = 615;
			
			startButton.x = 730;
			startButton.y = 615;
			
			_archerAvatar.x = 200;
			_archerAvatar.y = 175;
			
			_wizardAvatar.x = 680;
			_wizardAvatar.y = 175;
			
			add(screenTitle);
			add(_archerAvatar);
			add(_wizardAvatar);
			add(swapButton);
			add(startButton);
		}
		
		override protected function stateUpdate():void
		{
			if (input.justPressed(Keys.U) || input.justPressed(Keys.I) || input.justPressed(Keys.O)
			||  input.justPressed(Keys.J) || input.justPressed(Keys.K) || input.justPressed(Keys.L))
			{
				swap();
			}
			else if (input.justPressed(Keys.NUMBER_9))
			{
				EntityService.archer = new Archer();
				EntityService.wizard = new Wizard();
				
				HUD.archerRight = _archerRight;
				
				SystemService.changeState(GamePlay);
			}
			
			super.stateUpdate();
		}
		
		private function swap():void 
		{
			_archerRight = !_archerRight;
			
			var old:int = _archerAvatar.x;
			
			_archerAvatar.x = _wizardAvatar.x;
			_wizardAvatar.x = old;
		}
	}
}