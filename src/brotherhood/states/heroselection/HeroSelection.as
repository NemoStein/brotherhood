package brotherhood.states.heroselection
{
	import brotherhood.states.endgame.defeat.Defeat;
	import brotherhood.states.gameplay.GamePlay;
	import brotherhood.states.gameplay.heroes.archer.Archer;
	import brotherhood.states.gameplay.heroes.wizard.Wizard;
	import brotherhood.states.gameplay.hud.HUD;
	import brotherhood.states.gameplay.tower.Gate;
	import brotherhood.states.gameplay.tower.Tower;
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
		private var _archerSlot:String;
		private var _wizardSlot:String;
		
		private var _archerAvatar:Core;
		private var _wizardAvatar:Core;
		
		override protected function initialize():void
		{
			super.initialize();
			
			draw(Bitmap(new Assets.ImageHeroSelectSelectHero).bitmapData);
			
			_wizardAvatar = new Core(Bitmap(new Assets.ImageHeroSelectMagician).bitmapData);
			_wizardAvatar.y = 300;
			
			_archerAvatar = new Core(Bitmap(new Assets.ImageHeroSelectArcher).bitmapData);
			_archerAvatar.y = 300;
			
			swap();
			
			add(_wizardAvatar);
			add(_archerAvatar);
		}
		
		override protected function stateUpdate():void
		{
			if (input.justPressed(Controls.Slot1Start))
			{
				var leftTower:Tower = new Tower();
				var rightTower:Tower = new Tower();
				
				EntityService.leftTower = leftTower;
				EntityService.rightTower = rightTower;
				EntityService.gate = new Gate(leftTower, rightTower);
				
				EntityService.wizard = new Wizard(_wizardSlot);
				EntityService.archer = new Archer(_archerSlot);
				
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
			if (_wizardSlot == HUD.RIGHT)
			{
				_wizardSlot = HUD.LEFT;
				_archerSlot = HUD.RIGHT;
				
				_wizardAvatar.x = 505;
				_archerAvatar.x = 650;
			}
			else
			{
				_wizardSlot = HUD.RIGHT;
				_archerSlot = HUD.LEFT;
				
				_wizardAvatar.x = 650;
				_archerAvatar.x = 505;
			}
		}
	}
}