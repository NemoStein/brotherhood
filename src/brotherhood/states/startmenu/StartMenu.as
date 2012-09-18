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
		private var _pressStartVisibleTime:Number;
		private var _pressStartVisibleDelay:Number;
		private var _pressStartHiddenTime:Number;
		private var _pressStartHiddedDelay:Number;
		
		override protected function initialize():void
		{
			super.initialize();
			
			draw(Bitmap(new Assets.ImageStatesStartScreen).bitmapData);
			
			_pressStart = new Core(Bitmap(new Assets.ImageHeroSelectPressStart).bitmapData);
			
			_pressStart.x = 573;
			_pressStart.y = 461;
			
			_pressStartVisibleTime = 0;
			_pressStartVisibleDelay = 0.6;
			_pressStartHiddenTime = 0;
			_pressStartHiddedDelay = 0.4;
			
			add(_pressStart)
		}
		
		override protected function stateUpdate():void
		{
			// TODO: Blink start button
			if (_pressStart.visible)
			{
				_pressStartVisibleTime += time;
				
				if(_pressStartVisibleTime > _pressStartVisibleDelay)
				{
					_pressStartVisibleTime -= _pressStartVisibleDelay;
					_pressStart.hide();
				}
			}
			else
			{
				_pressStartHiddenTime += time;
				
				if(_pressStartHiddenTime > _pressStartHiddedDelay)
				{
					_pressStartHiddenTime -= _pressStartHiddedDelay;
					_pressStart.show();
				}
			}
			
			if (input.justPressed(Keys.ANY))
			{
				SystemService.changeState(HeroSelection);
			}
			
			super.stateUpdate();
		}
	}

}