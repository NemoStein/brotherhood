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
	import flash.display.Bitmap;
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
			
			draw(Bitmap(new Assets.ImageHeroSelectSelectHero).bitmapData);
			
			_archerAvatar = new Core(Bitmap(new Assets.ImageHeroSelectArcher).bitmapData);
			_wizardAvatar = new Core(Bitmap(new Assets.ImageHeroSelectMagician).bitmapData);
			
			_wizardAvatar.x = 505;
			_wizardAvatar.y = 300;
			
			_archerAvatar.x = 650;
			_archerAvatar.y = 300;
			
			add(_archerAvatar);
			add(_wizardAvatar);
		}
		
		override protected function stateUpdate():void
		{
			if (input.justPressed(Controls.Slot1Start))
			{
				EntityService.archer = new Archer();
				EntityService.wizard = new Wizard();
				
				HUD.archerRight = _archerRight;
				
				SystemService.changeState(GamePlay);
			}
			else if (input.justPressed(Keys.ANY))
			{
				swap();
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