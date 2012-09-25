package brotherhood.states.gameplay.hud
{
	import brotherhood.states.gameplay.heroes.skills.Skill;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import nemostein.framework.dragonfly.AnchorAlign;
	import nemostein.framework.dragonfly.Core;
	
	public class SkillMeter extends Core
	{
		private var _skill:Skill;
		private var _index:int;
		
		private var _readySignal:Core;
		private var _progressBar:Core;
		private var _ready:Boolean;
		
		public function SkillMeter(skill:Skill, index:int)
		{
			_skill = skill;
			_index = index;
			
			super();
		}
		
		override protected function initialize():void 
		{
			super.initialize();
			
			_ready = true;
			
			var row:int = _index % 2;
			var col:int = _index % 3;
			
			var signal:Class;
			var colour:uint;
			
			if (col == 0)
			{
				signal = Assets.ImageSkillsBackgroundGreen;
				colour = 0x80008f0c;
				x = 0;
			}
			else if (col == 1)
			{
				signal = Assets.ImageSkillsBackgroundBlue;
				colour = 0x802e3192;
				x = 102;
			}
			else
			{
				signal = Assets.ImageSkillsBackgroundRed;
				colour = 0x809f1200;
				x = 206;
			}
			
			if (row == 0)
			{
				y = 0;
			}
			else
			{
				y = 104;
			}
			
			_readySignal = new Core(Bitmap(new signal).bitmapData);
			_progressBar = new Core(new BitmapData(93, 95, true, colour));
			_progressBar.alignAnchor(AnchorAlign.BOTTOM, AnchorAlign.LEFT);
			
			_progressBar.y = 95;
			
			add(_readySignal);
			add(_progressBar);
			
			_progressBar.hide();
		}
		
		override protected function update():void
		{
			var readiness:Number = _skill.readiness();
			
			if (_ready)
			{
				if (readiness < 1)
				{
					_ready = false;
					
					_readySignal.hide();
					_progressBar.show();
				}
			}
			else
			{
				if (readiness < 1)
				{
					_progressBar.scaleY = readiness;
				}
				else
				{
					_ready = true;
					
					_readySignal.show();
					_progressBar.hide();
					
					_progressBar.scaleY = 0;
				}
			}
			
			super.update();
		}
	}
}